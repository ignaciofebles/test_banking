class Bank
    attr_accessor :bank_code, :bank_name
    
    def initialize(bank_code, bank_name)
      @bank_code, @bank_name = bank_code, bank_name             
    end

end

class Account < Bank
    def initialize(bank_code, bank_name, account_code, account_type, customer_name, balance)
        super(bank_code, bank_name)
        @account_code = account_code
        @account_type = account_type
        @customer_name = customer_name
        @balance = balance
    end

    def show
        puts "La cuenta es -> Cód Banco: #{bank_code}, Banco: #{bank_name}, #Cuenta: #{@account_code}, Tipo Cta: #{@account_type}, Cliente: #{@customer_name}, Saldo: #{@balance}"
    end
end

class Transfer < Account
    def initialize(bank_code, bank_name, account_code, account_type, customer_name, balance, transfer_amount, transfer_type, origin_destiny, date)
        super(bank_code, bank_name, account_code, account_type, customer_name, balance)
        @transfer_amount = transfer_amount
        @transfer_type = transfer_type
        @origin_destiny = origin_destiny
        @date = date
    end

    def show         
        puts "Cuenta Origen -> #{@account_code}" if @origin_destiny == "ORIGIN"
        puts "Cuenta Destino -> #{@account_code}" if @origin_destiny == "DESTINY"
        puts "Cliente -> #{@customer_name}"
        puts "#Cuenta -> #{@account_code}"
        puts "Balance -> #{@balance}"
        puts "Monto a Transferir -> #{@transfer_amount}" if @origin_destiny == "ORIGIN"
        puts "Monto a Recibir -> #{@transfer_amount}" if @origin_destiny == "DESTINY"
        puts "Fecha -> #{@date}"
        puts "Tipo Transferencia -> #{@transfer_type}"
    end

    def transfer_type
        @transfer_type
    end

    def transfer_amount
        @transfer_amount
    end

    def validate_balance
        if @balance >= @transfer_amount
            return true
        end
        return false
    end

    def validate_limit
        if @transfer_amount > 1000
            return false
        end
        return true
    end 

end

def try_transfer(transfer1_origin, transfer1_destiny)
    if transfer1_origin.validate_balance
        if transfer1_origin.transfer_type == "INTERBANCARIA"
            if transfer1_origin.validate_limit
                puts "Validado límite"
                #SE EJECUTA LA TRANSFERENCIA
                execute_tranfer(transfer1_origin, transfer1_destiny)
                return
            else
                puts "Transferencia sobrepasa los 1000 euros...(TRANSFERENCIA NO EXITOSA)"
                return
            end    
        end
        #SE EJECUTA LA TRANSFERENCIA
        execute_tranfer(transfer1_origin, transfer1_destiny)
    else
        puts "Saldo Insuficiente para la transferencia...(TRANSFERENCIA NO EXITOSA)"    
    end
end

def execute_tranfer(transfer1_origin, transfer1_destiny)    
    if transfer1_origin.transfer_type == "INTERBANCARIA"
        transfer_commission = transfer1_origin.transfer_amount * 5 / 100
    else
        transfer_commission = 0
    end
    puts "TRANSFERENCIA EXITOSA - NUEVOS SALDOS"
    account_origin = Account.new("3081","Caja Rural de Castilla-La Mancha","123456","Ahorro","Jim",(30000 - transfer1_origin.transfer_amount - transfer_commission))
    account_destiny = Account.new("2100","CaixaBank","789012","Corriente","Emma",(40000 + transfer1_origin.transfer_amount))
    account_origin.show
    account_destiny.show
end


bank1 = Bank.new("3081","Caja Rural de Castilla-La Mancha")
bank2 = Bank.new("2100","CaixaBank")

puts "Banco 1 -> #{bank1.bank_name}"
puts "Banco 2 -> #{bank2.bank_name}"

account1 = Account.new("3081","Caja Rural de Castilla-La Mancha","123456","Ahorro","Jim",30000)
account2 = Account.new("2100","CaixaBank","789012","Corriente","Emma",40000)
account3 = Account.new("3081","Caja Rural de Castilla-La Mancha","943573","Ahorro","Ignacio",50000)
account4 = Account.new("2100","CaixaBank","946698","Corriente","Yndira",60000)

puts "Cuenta 1"
puts "#{account1.show}"
puts "-----"
puts "Cuenta 2"
puts "#{account2.show}"
puts "-----"
puts "Cuenta 3"
puts "#{account3.show}"
puts "-----"
puts "Cuenta 4"
puts "#{account4.show}"
puts "-----"

transfer1_origin = Transfer.new("3081","Caja Rural de Castilla-La Mancha","123456","Ahorro","Jim",30000,20000,"INTERBANCARIA","ORIGIN","24/04/2022")
transfer1_destiny = Transfer.new("2100","CaixaBank","789012","Corriente","Emma",40000,20000,"INTERBANCARIA","DESTINY","24/04/2022")
puts "**********************************************************************************"
puts "PRIMERA TRANSFERENCIA**********"
puts transfer1_origin.show
puts transfer1_destiny.show
#INTENTA EJECUTAR LA TRANSFERENCIA
try_transfer(transfer1_origin, transfer1_destiny)

transfer1_origin = Transfer.new("3081","Caja Rural de Castilla-La Mancha","123456","Ahorro","Jim",30000,20000,"INTRABANCARIA","ORIGIN","24/04/2022")
transfer1_destiny = Transfer.new("2100","CaixaBank","789012","Corriente","Emma",40000,20000,"INTRABANCARIA","DESTINY","24/04/2022")
puts "**********************************************************************************"
puts "SEGUNDA TRANSFERENCIA**********"
puts transfer1_origin.show
puts transfer1_destiny.show
#INTENTA EJECUTAR LA TRANSFERENCIA
try_transfer(transfer1_origin, transfer1_destiny)

transfer1_origin = Transfer.new("3081","Caja Rural de Castilla-La Mancha","123456","Ahorro","Jim",30000,200,"INTERBANCARIA","ORIGIN","24/04/2022")
transfer1_destiny = Transfer.new("2100","CaixaBank","789012","Corriente","Emma",40000,20000,"INTERBANCARIA","DESTINY","24/04/2022")
puts "**********************************************************************************"
puts "TERCERA TRANSFERENCIA**********"
puts transfer1_origin.show
puts transfer1_destiny.show
#INTENTA EJECUTAR LA TRANSFERENCIA
try_transfer(transfer1_origin, transfer1_destiny)

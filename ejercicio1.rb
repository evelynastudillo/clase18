      class Table
        attr_reader :mesa, :dinero
        def initialize(mesa, *dinero)
          @mesa = mesa
          @dinero = dinero.map(&:to_i)
        end

      def Table.build(file)
        tables = []
      File.readlines(file).each do |line|
      data = line.split(', ').map(&:chomp)
      mesa, dinero = data.shift, data
      tables << Table.new(mesa, *dinero)
      end
      return tables
      end

    def Table.max_val(file)
     tables =  build(file)
     best_day = {}
     tables.each do |table|
     best_day[table.mesa] = [table.max, table.max_day]
    end
    best_day
    end

    def Table.average(file)
      tables = build(file)
      prom = {}
      tables.each do |tab|
        prom[tab.mesa] = [tab.avg]
      end
      prom

    end
    def avg
      @dinero.inject(&:+) / @dinero.size.to_f
    end

     def max
       dinero.max
    end

    def max_day
      dinero.index(max) + 1
      end
  end

     p Table.max_val('casino.txt')
     p Table.average('casino.txt')

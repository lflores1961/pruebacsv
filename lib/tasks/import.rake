namespace :import do
  desc "Import Family Data"
  task :family_data, [:file_path] => :environment do |t, args|
    require "csv"
    puts "Importing Family Data"
    model = Family
    # model.transaction do
    #   CSV.foreach(args[:file_path], headers: true) do |row|
    #     family = model.new(row.to_hash)
    #     family.save!
    #   end
    # end
    records = []
    CSV.foreach(args[:file_path], headers: true) do |row|
      # pp row.to_hash
      records << model.new(row.to_hash)
      # family = model.new(row.to_hash)
      # family.save!
    end
    pp records
    puts "#{records.count} records to import"
    model.import!(records)
    puts "Imported #{model.count} #{model.name.pluralize}"

  end

end

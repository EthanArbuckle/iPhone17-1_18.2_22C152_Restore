@interface StockDataSource
- (NSString)localizedSourceDescription;
- (NSString)name;
- (NSString)sourceDescription;
- (StockDataSource)initWithDictionary:(id)a3;
- (id)archiveDictionary;
- (id)description;
- (int64_t)identifier;
- (void)setIdentifier:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setSourceDescription:(id)a3;
@end

@implementation StockDataSource

- (StockDataSource)initWithDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)StockDataSource;
  v5 = [(StockDataSource *)&v16 init];
  if (!v5) {
    goto LABEL_11;
  }
  v6 = [v4 objectForKey:@"id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[StockDataSource setIdentifier:](v5, "setIdentifier:", [v6 integerValue]);
  }
  v7 = [v4 objectForKey:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(StockDataSource *)v5 setName:v7];
  }
  v8 = [v4 objectForKey:@"text"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(StockDataSource *)v5 setSourceDescription:v8];
  }
  v9 = [(StockDataSource *)v5 name];
  if ([v9 length])
  {
    v10 = [(StockDataSource *)v5 sourceDescription];
    uint64_t v11 = [v10 length];

    if (v11)
    {

LABEL_11:
      v12 = v5;
      goto LABEL_16;
    }
  }
  else
  {
  }
  v13 = StocksLogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(StockDataSource *)v5 identifier];
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v14;
    _os_log_impl(&dword_222ED9000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring data source ID %llu with empty name or description", buf, 0xCu);
  }

  v12 = 0;
LABEL_16:

  return v12;
}

- (NSString)localizedSourceDescription
{
  v3 = (void *)localizedSourceDescription_dataSourceMap;
  if (!localizedSourceDescription_dataSourceMap)
  {
    localizedSourceDescription_dataSourceMap = (uint64_t)&unk_26D5E90C0;

    v3 = &unk_26D5E90C0;
  }
  id v4 = [(StockDataSource *)self name];
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    v6 = +[StocksBundles getBundle:1];
    v7 = [v6 localizedStringForKey:v5 value:&stru_26D5DA820 table:@"Localizable"];
  }
  else
  {
    v7 = [(StockDataSource *)self sourceDescription];
  }

  return (NSString *)v7;
}

- (id)archiveDictionary
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"id";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[StockDataSource identifier](self, "identifier"));
  v9[0] = v3;
  v8[1] = @"name";
  id v4 = [(StockDataSource *)self name];
  v9[1] = v4;
  v8[2] = @"text";
  v5 = [(StockDataSource *)self sourceDescription];
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(StockDataSource *)self identifier];
  v5 = [(StockDataSource *)self name];
  v6 = [(StockDataSource *)self sourceDescription];
  v7 = [v3 stringWithFormat:@"<StockDataSource: %p, %i, %@, %@>", self, v4, v5, v6];

  return v7;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)sourceDescription
{
  return self->_sourceDescription;
}

- (void)setSourceDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDescription, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
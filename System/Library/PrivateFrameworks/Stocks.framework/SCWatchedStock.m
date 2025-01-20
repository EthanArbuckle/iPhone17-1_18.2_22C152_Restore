@interface SCWatchedStock
+ (id)watchedStockWithSymbol:(id)a3 name:(id)a4 exchange:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)displaySymbol;
- (NSString)exchange;
- (NSString)name;
- (NSString)shortName;
- (NSString)symbol;
- (SCWatchedStock)initWithName:(id)a3 shortName:(id)a4 symbol:(id)a5 exchange:(id)a6;
- (SCWatchedStock)initWithName:(id)a3 shortName:(id)a4 symbol:(id)a5 exchange:(id)a6 displaySymbol:(id)a7;
- (id)description;
- (unint64_t)hash;
@end

@implementation SCWatchedStock

+ (id)watchedStockWithSymbol:(id)a3 name:(id)a4 exchange:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v8 shortName:0 symbol:v9 exchange:v7 displaySymbol:0];

  return v10;
}

- (SCWatchedStock)initWithName:(id)a3 shortName:(id)a4 symbol:(id)a5 exchange:(id)a6 displaySymbol:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SCWatchedStock;
  v17 = [(SCWatchedStock *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_shortName, a4);
    objc_storeStrong((id *)&v18->_symbol, a5);
    objc_storeStrong((id *)&v18->_exchange, a6);
    objc_storeStrong((id *)&v18->_displaySymbol, a7);
  }

  return v18;
}

- (SCWatchedStock)initWithName:(id)a3 shortName:(id)a4 symbol:(id)a5 exchange:(id)a6
{
  return [(SCWatchedStock *)self initWithName:a3 shortName:a4 symbol:a5 exchange:a6 displaySymbol:0];
}

- (id)description
{
  v3 = NSString;
  v4 = [(SCWatchedStock *)self symbol];
  v5 = [v3 stringWithFormat:@"<SCWatchedStock %p, symbol=%@>", self, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SCWatchedStock *)self symbol];
    id v7 = [v5 symbol];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(SCWatchedStock *)self exchange];
      id v9 = [v5 exchange];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(SCWatchedStock *)self symbol];
  uint64_t v4 = [v3 hash];
  id v5 = [(SCWatchedStock *)self exchange];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (NSString)exchange
{
  return self->_exchange;
}

- (NSString)displaySymbol
{
  return self->_displaySymbol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaySymbol, 0);
  objc_storeStrong((id *)&self->_exchange, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_shortName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
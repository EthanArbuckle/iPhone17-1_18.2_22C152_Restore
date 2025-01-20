@interface STShowStockOverviewRequest
+ (BOOL)supportsSecureCoding;
- (STShowStockOverviewRequest)initWithCoder:(id)a3;
- (id)_initWithName:(id)a3 symbol:(id)a4 exchange:(id)a5 price:(id)a6 high:(id)a7 low:(id)a8 change:(id)a9 changePercent:(id)a10 chartData:(id)a11;
- (id)change;
- (id)changePercent;
- (id)chartData;
- (id)createResponse;
- (id)exchange;
- (id)high;
- (id)low;
- (id)name;
- (id)price;
- (id)symbol;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowStockOverviewRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartData, 0);
  objc_storeStrong((id *)&self->_changePercent, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_low, 0);
  objc_storeStrong((id *)&self->_high, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_exchange, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (STShowStockOverviewRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)STShowStockOverviewRequest;
  v5 = [(AFSiriRequest *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_symbol"];
    symbol = v5->_symbol;
    v5->_symbol = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_exchange"];
    exchange = v5->_exchange;
    v5->_exchange = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_price"];
    price = v5->_price;
    v5->_price = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_high"];
    high = v5->_high;
    v5->_high = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_low"];
    low = v5->_low;
    v5->_low = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_change"];
    change = v5->_change;
    v5->_change = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_changePercent"];
    changePercent = v5->_changePercent;
    v5->_changePercent = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_chartData"];
    chartData = v5->_chartData;
    v5->_chartData = (NSString *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowStockOverviewRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"_name", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_symbol forKey:@"_symbol"];
  [v4 encodeObject:self->_exchange forKey:@"_exchange"];
  [v4 encodeObject:self->_price forKey:@"_price"];
  [v4 encodeObject:self->_high forKey:@"_high"];
  [v4 encodeObject:self->_low forKey:@"_low"];
  [v4 encodeObject:self->_change forKey:@"_change"];
  [v4 encodeObject:self->_changePercent forKey:@"_changePercent"];
  [v4 encodeObject:self->_chartData forKey:@"_chartData"];
}

- (id)chartData
{
  return self->_chartData;
}

- (id)changePercent
{
  return self->_changePercent;
}

- (id)change
{
  return self->_change;
}

- (id)low
{
  return self->_low;
}

- (id)high
{
  return self->_high;
}

- (id)price
{
  return self->_price;
}

- (id)exchange
{
  return self->_exchange;
}

- (id)symbol
{
  return self->_symbol;
}

- (id)name
{
  return self->_name;
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (id)_initWithName:(id)a3 symbol:(id)a4 exchange:(id)a5 price:(id)a6 high:(id)a7 low:(id)a8 change:(id)a9 changePercent:(id)a10 chartData:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)STShowStockOverviewRequest;
  v19 = [(AFSiriRequest *)&v30 init];
  p_isa = (id *)&v19->super.super.isa;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_name, a3);
    objc_storeStrong(p_isa + 6, a4);
    objc_storeStrong(p_isa + 7, a5);
    objc_storeStrong(p_isa + 8, a6);
    objc_storeStrong(p_isa + 9, a7);
    objc_storeStrong(p_isa + 10, a8);
    objc_storeStrong(p_isa + 11, a9);
    objc_storeStrong(p_isa + 12, a10);
    objc_storeStrong(p_isa + 13, a11);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
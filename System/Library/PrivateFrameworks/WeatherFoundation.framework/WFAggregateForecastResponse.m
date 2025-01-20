@interface WFAggregateForecastResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)responseWasFromCache;
- (NSArray)forecasts;
- (WFAggregateForecastResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setForecasts:(id)a3;
- (void)setResponseWasFromCache:(BOOL)a3;
@end

@implementation WFAggregateForecastResponse

- (WFAggregateForecastResponse)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFAggregateForecastResponse;
  v5 = [(WFResponse *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
    v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"WFAggregateForecastResponseHourlyForecastsKey"];
    [(WFAggregateForecastResponse *)v5 setForecasts:v9];

    -[WFAggregateForecastResponse setResponseWasFromCache:](v5, "setResponseWasFromCache:", [v4 decodeBoolForKey:@"WFAggregateForecastResponseWasFromCacheKey"]);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFAggregateForecastResponse;
  id v4 = a3;
  [(WFResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFAggregateForecastResponse *)self forecasts];
  [v4 encodeObject:v5 forKey:@"WFAggregateForecastResponseHourlyForecastsKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFAggregateForecastResponse responseWasFromCache](self, "responseWasFromCache"), @"WFAggregateForecastResponseWasFromCacheKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  id v5 = objc_alloc(MEMORY[0x263EFF8C0]);
  objc_super v6 = [(WFAggregateForecastResponse *)self forecasts];
  v7 = (void *)[v5 initWithArray:v6 copyItems:1];
  [v4 setForecasts:v7];

  return v4;
}

- (NSArray)forecasts
{
  return self->_forecasts;
}

- (void)setForecasts:(id)a3
{
}

- (BOOL)responseWasFromCache
{
  return self->_responseWasFromCache;
}

- (void)setResponseWasFromCache:(BOOL)a3
{
  self->_responseWasFromCache = a3;
}

- (void).cxx_destruct
{
}

@end
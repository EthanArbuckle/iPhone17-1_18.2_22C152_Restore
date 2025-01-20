@interface WFDailyForecastRequest
+ (BOOL)supportsSecureCoding;
- (NSLocale)locale;
- (WFDailyForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4;
- (id)description;
- (void)setLocale:(id)a3;
- (void)startWithService:(id)a3;
@end

@implementation WFDailyForecastRequest

- (WFDailyForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)WFDailyForecastRequest;
    v10 = [(WFTask *)&v15 init];
    v11 = v10;
    if (v10)
    {
      [(WFAggregateForecastRequest *)v10 setLocation:v6];
      [(WFAggregateForecastRequest *)v11 setCompletionHandler:v8];
      uint64_t v12 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
      locale = v11->_locale;
      v11->_locale = (NSLocale *)v12;
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(WFAggregateForecastRequest *)self location];
  id v6 = [v3 stringWithFormat:@"<%@: %p, location = %@>", v4, self, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)startWithService:(id)a3
{
  id v4 = a3;
  id v7 = [(WFAggregateForecastRequest *)self location];
  v5 = [(WFDailyForecastRequest *)self locale];
  id v6 = [(WFTask *)self identifier];
  [v4 dailyForecastForLocation:v7 locale:v5 taskIdentifier:v6];
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
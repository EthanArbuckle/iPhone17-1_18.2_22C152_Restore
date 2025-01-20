@interface WFForecastRequest
+ (id)forecastRequestForLocation:(id)a3 completionHandler:(id)a4;
+ (id)forecastRequestForLocation:(id)a3 date:(id)a4 completionHandler:(id)a5;
+ (id)forecastRequestForLocation:(id)a3 onDate:(id)a4 completionHandler:(id)a5;
- (BOOL)attachRawAPIData;
- (NSData)rawAPIData;
- (NSDate)onDate;
- (NSDateComponents)date;
- (NSLocale)locale;
- (NSString)trackingParameter;
- (WFForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4;
- (WFForecastRequest)initWithLocation:(id)a3 date:(id)a4 completionHandler:(id)a5;
- (WFForecastRequest)initWithLocation:(id)a3 onDate:(id)a4 completionHandler:(id)a5;
- (WFLocation)location;
- (id)completionHandler;
- (id)description;
- (unint64_t)forecastType;
- (void)cleanup;
- (void)handleCancellation;
- (void)handleError:(id)a3 forResponseIdentifier:(id)a4;
- (void)handleResponse:(id)a3;
- (void)setAttachRawAPIData:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDate:(id)a3;
- (void)setForecastType:(unint64_t)a3;
- (void)setLocale:(id)a3;
- (void)setLocation:(id)a3;
- (void)setRawAPIData:(id)a3;
- (void)setTrackingParameter:(id)a3;
- (void)startWithService:(id)a3;
@end

@implementation WFForecastRequest

+ (id)forecastRequestForLocation:(id)a3 onDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithLocation:v10 onDate:v9 completionHandler:v8];

  return v11;
}

+ (id)forecastRequestForLocation:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithLocation:v7 completionHandler:v6];

  return v8;
}

- (WFForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 date];
  id v10 = [(WFForecastRequest *)self initWithLocation:v8 onDate:v9 completionHandler:v7];

  return v10;
}

- (WFForecastRequest)initWithLocation:(id)a3 onDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (!v10) {
    goto LABEL_10;
  }
  if (!v8)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = 4;
LABEL_9:
    v21 = objc_msgSend(v19, "wf_errorWithCode:", v20);
    v10[2](v10, 0, v21);

LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  if (!v9)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = 2;
    goto LABEL_9;
  }
  v23.receiver = self;
  v23.super_class = (Class)WFForecastRequest;
  v11 = [(WFTask *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    location = v11->_location;
    v11->_location = (WFLocation *)v12;

    objc_storeStrong((id *)&v11->_onDate, a4);
    uint64_t v14 = MEMORY[0x21D4B3DE0](v10);
    id completionHandler = v11->_completionHandler;
    v11->_id completionHandler = (id)v14;

    uint64_t v16 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    locale = v11->_locale;
    v11->_locale = (NSLocale *)v16;
  }
  self = v11;
  v18 = self;
LABEL_11:

  return v18;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateFormat:@"yyy-MM-dd'T'hh:mm:ss"];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  id v6 = [(WFForecastRequest *)self onDate];
  id v7 = [v3 stringFromDate:v6];
  id v8 = [(WFForecastRequest *)self location];
  id v9 = [v4 stringWithFormat:@"<%@: %p, date = %@, location = %@>", v5, self, v7, v8];

  return v9;
}

- (void)startWithService:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFForecastRequest *)self location];
  id v6 = [(WFForecastRequest *)self locale];
  id v7 = [(WFForecastRequest *)self onDate];
  v11 = @"WFForecastRequestAttachRawAPIOptionsKey";
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[WFForecastRequest attachRawAPIData](self, "attachRawAPIData"));
  v12[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v10 = [(WFTask *)self identifier];
  [v4 forecastForLocation:v5 locale:v6 onDate:v7 options:v9 taskIdentifier:v10];
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFForecastRequest *)self completionHandler];

  if (v5)
  {
    uint64_t v6 = [v4 rawAPIData];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [v4 forecast];

      if (v8)
      {
        id v9 = [v4 rawAPIData];
        [(WFForecastRequest *)self setRawAPIData:v9];
      }
    }
    id v10 = [v4 forecast];
    v11 = (void *)[v10 copy];

    uint64_t v12 = [(WFForecastRequest *)self locale];

    if (!v12)
    {
      v13 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
      [(WFForecastRequest *)self setLocale:v13];
    }
    uint64_t v14 = [(WFForecastRequest *)self trackingParameter];

    if (!v14) {
      [(WFForecastRequest *)self setTrackingParameter:@"apple_TWC"];
    }
    v15 = [(WFForecastRequest *)self locale];
    uint64_t v16 = [(WFForecastRequest *)self trackingParameter];
    [v11 editLinksWithLocale:v15 trackingParameter:v16];

    v17 = [(WFForecastRequest *)self completionHandler];
    v18 = [v4 error];
    ((void (**)(void, void *, void *))v17)[2](v17, v11, v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)WFForecastRequest;
  [(WFTask *)&v19 handleResponse:v4];
}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFForecastRequest *)self completionHandler];
  ((void (**)(void, void, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFForecastRequest;
  [(WFTask *)&v9 handleError:v7 forResponseIdentifier:v6];
}

- (void)handleCancellation
{
  id v3 = [(WFForecastRequest *)self completionHandler];

  if (v3)
  {
    id v4 = [(WFForecastRequest *)self completionHandler];
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 13);
    ((void (**)(void, void, void *))v4)[2](v4, 0, v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)WFForecastRequest;
  [(WFTask *)&v6 handleCancellation];
}

- (void)cleanup
{
  [(WFForecastRequest *)self setCompletionHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)WFForecastRequest;
  [(WFTask *)&v3 cleanup];
}

+ (id)forecastRequestForLocation:(id)a3 date:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithLocation:v10 date:v9 completionHandler:v8];

  return v11;
}

- (WFForecastRequest)initWithLocation:(id)a3 date:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 date];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v13 = [v14 dateFromComponents:v8];
  }
  v15 = [(WFForecastRequest *)self initWithLocation:v10 onDate:v13 completionHandler:v9];

  [(WFForecastRequest *)v15 setDate:v8];
  return v15;
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSDate)onDate
{
  return self->_onDate;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSDateComponents)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)forecastType
{
  return self->_forecastType;
}

- (void)setForecastType:(unint64_t)a3
{
  self->_forecastType = a3;
}

- (BOOL)attachRawAPIData
{
  return self->_attachRawAPIData;
}

- (void)setAttachRawAPIData:(BOOL)a3
{
  self->_attachRawAPIData = a3;
}

- (NSData)rawAPIData
{
  return self->_rawAPIData;
}

- (void)setRawAPIData:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)trackingParameter
{
  return self->_trackingParameter;
}

- (void)setTrackingParameter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingParameter, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_rawAPIData, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_onDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
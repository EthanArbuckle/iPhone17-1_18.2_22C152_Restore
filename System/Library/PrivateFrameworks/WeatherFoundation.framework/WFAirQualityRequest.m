@interface WFAirQualityRequest
+ (id)airQualityRequestForLocation:(id)a3 locale:(id)a4 completionHandler:(id)a5;
- (BOOL)attachRawAPIData;
- (NSLocale)locale;
- (WFAirQualityRequest)initWithLocation:(id)a3 locale:(id)a4 completionHandler:(id)a5;
- (WFLocation)location;
- (id)completionHandler;
- (id)options;
- (void)cleanup;
- (void)handleError:(id)a3 forResponseIdentifier:(id)a4;
- (void)handleResponse:(id)a3;
- (void)setAttachRawAPIData:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLocation:(id)a3;
- (void)startWithService:(id)a3;
@end

@implementation WFAirQualityRequest

+ (id)airQualityRequestForLocation:(id)a3 locale:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocation:v9 locale:v8 completionHandler:v7];

  return v10;
}

- (WFAirQualityRequest)initWithLocation:(id)a3 locale:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFAirQualityRequest;
  v11 = [(WFTask *)&v15 initWithResponseRequired:1];
  v12 = v11;
  if (v11)
  {
    if (v9)
    {
      [(WFAirQualityRequest *)v11 setLocale:v9];
    }
    else
    {
      v13 = [MEMORY[0x263EFF960] currentLocale];
      [(WFAirQualityRequest *)v12 setLocale:v13];
    }
    [(WFAirQualityRequest *)v12 setLocation:v8];
    [(WFAirQualityRequest *)v12 setCompletionHandler:v10];
  }

  return v12;
}

- (id)options
{
  v5[1] = *MEMORY[0x263EF8340];
  if ([(WFAirQualityRequest *)self attachRawAPIData])
  {
    v4 = @"WFAirQualityRequestAttachRawAPIOptionsKey";
    v5[0] = MEMORY[0x263EFFA88];
    v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x263EFFA78];
  }
  return v2;
}

- (void)startWithService:(id)a3
{
  id v4 = a3;
  id v8 = [(WFAirQualityRequest *)self location];
  v5 = [(WFAirQualityRequest *)self locale];
  v6 = [(WFAirQualityRequest *)self options];
  id v7 = [(WFTask *)self identifier];
  [v4 airQualityForLocation:v8 locale:v5 options:v6 taskIdentifier:v7];
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = [(WFAirQualityRequest *)self completionHandler];

  if (v5)
  {
    v6 = [(WFAirQualityRequest *)self completionHandler];
    id v7 = [v4 airQualityConditions];
    id v8 = [v4 error];
    ((void (**)(void, void *, void *))v6)[2](v6, v7, v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)WFAirQualityRequest;
  [(WFTask *)&v9 handleResponse:v4];
}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFAirQualityRequest *)self completionHandler];
  ((void (**)(void, void, id))v8)[2](v8, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFAirQualityRequest;
  [(WFTask *)&v9 handleError:v7 forResponseIdentifier:v6];
}

- (void)cleanup
{
  [(WFAirQualityRequest *)self setCompletionHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)WFAirQualityRequest;
  [(WFTask *)&v3 cleanup];
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)attachRawAPIData
{
  return self->_attachRawAPIData;
}

- (void)setAttachRawAPIData:(BOOL)a3
{
  self->_attachRawAPIData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
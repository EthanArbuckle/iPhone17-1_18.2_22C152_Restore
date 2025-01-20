@interface WFAggregateCommonRequest
- (NSLocale)locale;
- (NSString)trackingParameter;
- (WFAggregateCommonRequest)initWithLocation:(id)a3 types:(unint64_t)a4 trackingParameter:(id)a5 completionHandler:(id)a6;
- (WFAggregateCommonRequest)initWithLocation:(id)a3 types:(unint64_t)a4 units:(int)a5 requestOptions:(id)a6 trackingParameter:(id)a7 completionHandler:(id)a8;
- (WFAggregateCommonRequest)initWithLocation:(id)a3 types:(unint64_t)a4 units:(int)a5 trackingParameter:(id)a6 completionHandler:(id)a7;
- (WFLocation)location;
- (WFRequestOptions)requestOptions;
- (id)completionHandler;
- (id)description;
- (int)units;
- (unint64_t)_supportedForecastTypes:(unint64_t)a3;
- (unint64_t)types;
- (void)cleanup;
- (void)handleCancellation;
- (void)handleError:(id)a3 forResponseIdentifier:(id)a4;
- (void)handleResponse:(id)a3;
- (void)setLocale:(id)a3;
- (void)startWithService:(id)a3;
@end

@implementation WFAggregateCommonRequest

- (WFAggregateCommonRequest)initWithLocation:(id)a3 types:(unint64_t)a4 trackingParameter:(id)a5 completionHandler:(id)a6
{
  return [(WFAggregateCommonRequest *)self initWithLocation:a3 types:a4 units:0 trackingParameter:a5 completionHandler:a6];
}

- (WFAggregateCommonRequest)initWithLocation:(id)a3 types:(unint64_t)a4 units:(int)a5 trackingParameter:(id)a6 completionHandler:(id)a7
{
  return [(WFAggregateCommonRequest *)self initWithLocation:a3 types:a4 units:*(void *)&a5 requestOptions:0 trackingParameter:a6 completionHandler:a7];
}

- (WFAggregateCommonRequest)initWithLocation:(id)a3 types:(unint64_t)a4 units:(int)a5 requestOptions:(id)a6 trackingParameter:(id)a7 completionHandler:(id)a8
{
  id v29 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  unint64_t v18 = [(WFAggregateCommonRequest *)self _supportedForecastTypes:a4];
  v30.receiver = self;
  v30.super_class = (Class)WFAggregateCommonRequest;
  v19 = [(WFTask *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_location, a3);
    v20->_types = v18;
    p_trackingParameter = (void **)&v20->_trackingParameter;
    objc_storeStrong((id *)&v20->_trackingParameter, a7);
    v20->_units = a5;
    objc_storeStrong((id *)&v20->_requestOptions, a6);
    uint64_t v22 = MEMORY[0x21D4B3DE0](v17);
    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = (id)v22;

    uint64_t v24 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    locale = v20->_locale;
    v20->_locale = (NSLocale *)v24;

    v26 = [(WFAggregateCommonRequest *)v20 trackingParameter];

    if (!v26)
    {
      v27 = *p_trackingParameter;
      *p_trackingParameter = @"apple_TWC";
    }
  }

  return v20;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(WFAggregateCommonRequest *)self location];
  v6 = [v3 stringWithFormat:@"<%@: %p, location = %@, types = %lu>", v4, self, v5, -[WFAggregateCommonRequest types](self, "types")];

  return v6;
}

- (unint64_t)_supportedForecastTypes:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v9 = 0;
  v10[0] = &v9;
  v10[1] = 0x2020000000;
  v10[2] = a3;
  v3 = WFAggregateCommonRequestSupportedForecastTypes();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__WFAggregateCommonRequest__supportedForecastTypes___block_invoke;
  v8[3] = &unk_264432550;
  v8[4] = &v9;
  v8[5] = &v11;
  [v3 enumerateIndexesUsingBlock:v8];

  if (*(void *)(v10[0] + 24))
  {
    uint64_t v4 = WFLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      -[WFAggregateCommonRequest _supportedForecastTypes:](v5, (uint64_t)v10, (uint64_t)v15, v4);
    }
  }
  unint64_t v6 = v12[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __52__WFAggregateCommonRequest__supportedForecastTypes___block_invoke(uint64_t result, uint64_t a2)
{
  if ((a2 & ~*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24)) == 0)
  {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) |= a2;
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) &= ~a2;
  }
  return result;
}

- (void)cleanup
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFAggregateCommonRequest;
  [(WFTask *)&v4 cleanup];
}

- (void)handleCancellation
{
  v3 = [(WFAggregateCommonRequest *)self completionHandler];
  objc_super v4 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 13);
  ((void (**)(void, void, void, void *))v3)[2](v3, 0, 0, v4);

  v5.receiver = self;
  v5.super_class = (Class)WFAggregateCommonRequest;
  [(WFTask *)&v5 handleCancellation];
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  unint64_t v6 = [v4 airQualityObservations];
  [v5 setAirQualityObservations:v6];

  v7 = [v4 currentObservations];
  [v5 setCurrentObservations:v7];

  v8 = [v4 lastTwentyFourHoursOfObservations];
  [v5 setLastTwentyFourHoursOfObservations:v8];

  uint64_t v9 = [v4 hourlyForecastedConditions];
  [v5 setHourlyForecastedConditions:v9];

  v10 = [v4 dailyForecastedConditions];
  [v5 setDailyForecastedConditions:v10];

  uint64_t v11 = [v4 dailyPollenForecastedConditions];
  [v5 setDailyPollenForecastedConditions:v11];

  v12 = [v4 severeWeatherEvents];
  [v5 setSevereWeatherEvents:v12];

  uint64_t v13 = [v4 changeForecasts];
  [v5 setChangeForecasts:v13];

  uint64_t v14 = [v4 nextHourPrecipitation];
  [v5 setNextHourPrecipitation:v14];

  id v15 = [v5 currentObservations];
  uint64_t v16 = [(WFAggregateCommonRequest *)self locale];
  id v17 = [(WFAggregateCommonRequest *)self trackingParameter];
  [v15 editLinksWithLocale:v16 trackingParameter:v17];

  unint64_t v18 = [(WFAggregateCommonRequest *)self completionHandler];
  v19 = [v4 rawAPIData];
  ((void (**)(void, void *, void *, void))v18)[2](v18, v5, v19, 0);

  v20.receiver = self;
  v20.super_class = (Class)WFAggregateCommonRequest;
  [(WFTask *)&v20 handleResponse:v4];
}

- (void)handleError:(id)a3 forResponseIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFAggregateCommonRequest *)self completionHandler];
  ((void (**)(void, void, void, id))v8)[2](v8, 0, 0, v7);

  v9.receiver = self;
  v9.super_class = (Class)WFAggregateCommonRequest;
  [(WFTask *)&v9 handleError:v7 forResponseIdentifier:v6];
}

- (void)startWithService:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(WFAggregateCommonRequest *)self types];
  id v10 = [(WFAggregateCommonRequest *)self location];
  uint64_t v6 = [(WFAggregateCommonRequest *)self units];
  id v7 = [(WFAggregateCommonRequest *)self locale];
  v8 = [(WFTask *)self identifier];
  objc_super v9 = [(WFAggregateCommonRequest *)self requestOptions];
  [v4 forecast:v5 forLocation:v10 withUnits:v6 locale:v7 taskIdentifier:v8 requestOptions:v9];
}

- (WFLocation)location
{
  return self->_location;
}

- (unint64_t)types
{
  return self->_types;
}

- (int)units
{
  return self->_units;
}

- (WFRequestOptions)requestOptions
{
  return self->_requestOptions;
}

- (NSString)trackingParameter
{
  return self->_trackingParameter;
}

- (id)completionHandler
{
  return self->_completionHandler;
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
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_trackingParameter, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (void)_supportedForecastTypes:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v6 = *(void *)(*(void *)a2 + 24);
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2048;
  *(void *)(a3 + 14) = v6;
  id v7 = a1;
  _os_log_error_impl(&dword_21C988000, a4, OS_LOG_TYPE_ERROR, "Unhandled %{public}@ request types: %lu", (uint8_t *)a3, 0x16u);
}

@end
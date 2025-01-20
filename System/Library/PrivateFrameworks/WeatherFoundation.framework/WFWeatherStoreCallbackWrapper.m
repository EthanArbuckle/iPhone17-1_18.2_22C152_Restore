@interface WFWeatherStoreCallbackWrapper
- (BOOL)executedCompletionBlock;
- (WFWeatherStoreCallbackWrapper)initWithAQIScaleRetrievalBlock:(id)a3;
- (WFWeatherStoreCallbackWrapper)initWithForecastRetrievalBlock:(id)a3;
- (id)aqiScaleRetrievalCompletionBlock;
- (id)forecastRetrievalCompletionBlock;
- (os_unfair_lock_s)lock;
- (unint64_t)requestType;
- (void)executeCallbackwithResponse:(id)a3 error:(id)a4;
- (void)setAqiScaleRetrievalCompletionBlock:(id)a3;
- (void)setForecastRetrievalCompletionBlock:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setRequestType:(unint64_t)a3;
@end

@implementation WFWeatherStoreCallbackWrapper

- (WFWeatherStoreCallbackWrapper)initWithForecastRetrievalBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWeatherStoreCallbackWrapper;
  v5 = [(WFWeatherStoreCallbackWrapper *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_requestType = 0;
    uint64_t v7 = MEMORY[0x21D4B3DE0](v4);
    id forecastRetrievalCompletionBlock = v6->_forecastRetrievalCompletionBlock;
    v6->_id forecastRetrievalCompletionBlock = (id)v7;

    v6->_executedCompletionBlock = 0;
  }

  return v6;
}

- (WFWeatherStoreCallbackWrapper)initWithAQIScaleRetrievalBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWeatherStoreCallbackWrapper;
  v5 = [(WFWeatherStoreCallbackWrapper *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_requestType = 1;
    uint64_t v7 = MEMORY[0x21D4B3DE0](v4);
    id aqiScaleRetrievalCompletionBlock = v6->_aqiScaleRetrievalCompletionBlock;
    v6->_id aqiScaleRetrievalCompletionBlock = (id)v7;

    v6->_executedCompletionBlock = 0;
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)executeCallbackwithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_executedCompletionBlock)
  {
    v8 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21C988000, v8, OS_LOG_TYPE_DEFAULT, "Duplicate execution of a forecast request completion block", v16, 2u);
    }
    goto LABEL_16;
  }
  self->_executedCompletionBlock = 1;
  unint64_t v9 = [(WFWeatherStoreCallbackWrapper *)self requestType];
  if (v9 == 1)
  {
    if (v6)
    {
      uint64_t v13 = [v6 requestType];
      if (v13 == [(WFWeatherStoreCallbackWrapper *)self requestType])
      {
        v11 = [v6 aqiScale];
        uint64_t v12 = [(WFWeatherStoreCallbackWrapper *)self aqiScaleRetrievalCompletionBlock];
        goto LABEL_12;
      }
    }
    uint64_t v15 = [(WFWeatherStoreCallbackWrapper *)self aqiScaleRetrievalCompletionBlock];
LABEL_15:
    v8 = v15;
    (*(void (**)(uint64_t, void, void))(v15 + 16))(v15, 0, 0);
LABEL_16:

    goto LABEL_17;
  }
  if (!v9)
  {
    if (v6)
    {
      uint64_t v10 = [v6 requestType];
      if (v10 == [(WFWeatherStoreCallbackWrapper *)self requestType])
      {
        v11 = [v6 forecastData];
        uint64_t v12 = [(WFWeatherStoreCallbackWrapper *)self forecastRetrievalCompletionBlock];
LABEL_12:
        v14 = (void *)v12;
        (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v11, v7);

        goto LABEL_17;
      }
    }
    uint64_t v15 = [(WFWeatherStoreCallbackWrapper *)self forecastRetrievalCompletionBlock];
    goto LABEL_15;
  }
LABEL_17:
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (id)forecastRetrievalCompletionBlock
{
  return self->_forecastRetrievalCompletionBlock;
}

- (void)setForecastRetrievalCompletionBlock:(id)a3
{
}

- (id)aqiScaleRetrievalCompletionBlock
{
  return self->_aqiScaleRetrievalCompletionBlock;
}

- (void)setAqiScaleRetrievalCompletionBlock:(id)a3
{
}

- (BOOL)executedCompletionBlock
{
  return self->_executedCompletionBlock;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_aqiScaleRetrievalCompletionBlock, 0);
  objc_storeStrong(&self->_forecastRetrievalCompletionBlock, 0);
}

@end
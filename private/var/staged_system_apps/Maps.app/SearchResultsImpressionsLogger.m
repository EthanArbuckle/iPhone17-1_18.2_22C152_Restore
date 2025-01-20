@interface SearchResultsImpressionsLogger
- (SearchResultsImpressionsLogger)init;
- (void)logImpressionElementDidEnter:(id)a3 onDate:(id)a4;
- (void)logImpressionElementDidExit:(id)a3 usingEnterDate:(id)a4 exitDate:(id)a5;
@end

@implementation SearchResultsImpressionsLogger

- (SearchResultsImpressionsLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)SearchResultsImpressionsLogger;
  v2 = [(SearchResultsImpressionsLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    impressionsLoggingQueue = v2->_impressionsLoggingQueue;
    v2->_impressionsLoggingQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)logImpressionElementDidEnter:(id)a3 onDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  impressionsLoggingQueue = self->_impressionsLoggingQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A89318;
  v11[3] = &unk_1012E5D58;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(impressionsLoggingQueue, v11);
}

- (void)logImpressionElementDidExit:(id)a3 usingEnterDate:(id)a4 exitDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  impressionsLoggingQueue = self->_impressionsLoggingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A89598;
  block[3] = &unk_1012E66E0;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(impressionsLoggingQueue, block);
}

- (void).cxx_destruct
{
}

@end
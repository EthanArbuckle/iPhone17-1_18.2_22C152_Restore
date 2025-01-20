@interface WDSURLSessionTaskDelegate
- (_TtC13WeatherDaemon25WDSURLSessionTaskDelegate)init;
- (void)URLSession:(id)a3 didCreateTask:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation WDSURLSessionTaskDelegate

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1A9452490((uint64_t)v11, v9, v10);
}

- (void)URLSession:(id)a3 didCreateTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1A9452D04((uint64_t)v8, v7);
}

- (_TtC13WeatherDaemon25WDSURLSessionTaskDelegate)init
{
}

@end
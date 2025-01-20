@interface GKInstrumentedURLSessionDelegate
- (_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate)init;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation GKInstrumentedURLSessionDelegate

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10018C7BC((uint64_t)v11, (uint64_t)v9, (uint64_t)v10);
}

- (_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate)init
{
  return (_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate *)ScopedIDsUtils.init()();
}

@end
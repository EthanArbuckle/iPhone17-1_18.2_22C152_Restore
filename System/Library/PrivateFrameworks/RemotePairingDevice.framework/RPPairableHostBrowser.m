@interface RPPairableHostBrowser
- (RPPairableHostBrowser)init;
- (void)cancel;
- (void)registerHostDiscoveredHandlerOnQueue:(id)a3 handler:(id)a4;
- (void)registerInvalidationHandlerOnQueue:(id)a3 handler:(id)a4;
- (void)startBrowsing;
@end

@implementation RPPairableHostBrowser

- (RPPairableHostBrowser)init
{
  return (RPPairableHostBrowser *)sub_1D761FD24();
}

- (void)registerInvalidationHandlerOnQueue:(id)a3 handler:(id)a4
{
}

- (void)registerHostDiscoveredHandlerOnQueue:(id)a3 handler:(id)a4
{
}

- (void)startBrowsing
{
  v2 = self;
  RPPairableHostBrowser.startBrowsing()();
}

- (void)cancel
{
  v2 = self;
  RPPairableHostBrowser.cancel()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
@interface BKDownloadPurchaseMonitor
- (BKDownloadPurchaseMonitor)init;
- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4;
- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4;
- (void)downloadQueue:(id)a3 purchasedDidFailWithResponse:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation BKDownloadPurchaseMonitor

- (BKDownloadPurchaseMonitor)init
{
  return (BKDownloadPurchaseMonitor *)DownloadPurchaseMonitor.init()();
}

- (void)start
{
}

- (void)stop
{
}

- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_10071E400(a4);
}

- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_10071E850(a4);
}

- (void)downloadQueue:(id)a3 purchasedDidFailWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10071F0C4(a4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
@interface PXGHostingControllerNextFrameObserver
- (OS_dispatch_queue)hostingControllerObservationQueue;
- (void)hostingController:(id)a3 didRenderFrame:(id)a4;
@end

@implementation PXGHostingControllerNextFrameObserver

- (OS_dispatch_queue)hostingControllerObservationQueue
{
  sub_1A9B21070(0, (unint64_t *)&qword_1E98212D0);
  v2 = (void *)sub_1AB23B3EC();
  return (OS_dispatch_queue *)v2;
}

- (void)hostingController:(id)a3 didRenderFrame:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1AB22F8DC();
  sub_1A9FFD4B0(v5);

  swift_release();
}

@end
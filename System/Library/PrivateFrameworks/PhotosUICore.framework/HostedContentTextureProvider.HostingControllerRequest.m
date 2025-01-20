@interface HostedContentTextureProvider.HostingControllerRequest
- (OS_dispatch_queue)hostingControllerObservationQueue;
- (void)hostingController:(id)a3 didRenderFrame:(id)a4;
@end

@implementation HostedContentTextureProvider.HostingControllerRequest

- (OS_dispatch_queue)hostingControllerObservationQueue
{
  return (OS_dispatch_queue *)*(id *)&self->requestQueue[4];
}

- (void)hostingController:(id)a3 didRenderFrame:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1AB22F8DC();
  sub_1A9FD789C(v6);

  swift_release();
}

@end
@interface UVBSEndpointMonitor
- (_TtC17PreviewsInjection19UVBSEndpointMonitor)init;
- (void)monitor:(id)a3 didReceiveEndpoint:(id)a4;
@end

@implementation UVBSEndpointMonitor

- (_TtC17PreviewsInjection19UVBSEndpointMonitor)init
{
  return (_TtC17PreviewsInjection19UVBSEndpointMonitor *)sub_228731408();
}

- (void)monitor:(id)a3 didReceiveEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  UVBSEndpointMonitor.monitor(_:didReceive:)(v6, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PreviewsInjection19UVBSEndpointMonitor_controlAgentMonitor));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PreviewsInjection19UVBSEndpointMonitor_jitBootstrapAgentMonitor));

  swift_release();
}

@end
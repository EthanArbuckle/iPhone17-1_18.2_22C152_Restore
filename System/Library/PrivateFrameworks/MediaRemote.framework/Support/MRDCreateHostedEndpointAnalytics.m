@interface MRDCreateHostedEndpointAnalytics
- (MRDCreateHostedEndpointAnalytics)init;
- (MRDCreateHostedEndpointAnalytics)initWithRequestID:(id)a3;
- (MRDTimingEvent)createHostedEndpoint;
- (MRDTimingEvent)createRemoteHostedEndpoint;
- (MRDTimingEvent)modifyOutputContext;
- (MRDTimingEvent)searchForBuddy;
- (MRDTimingEvent)searchForGroupUID;
- (NSString)requestID;
- (void)setCreateHostedEndpoint:(id)a3;
- (void)setCreateRemoteHostedEndpoint:(id)a3;
- (void)setModifyOutputContext:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setSearchForBuddy:(id)a3;
- (void)setSearchForGroupUID:(id)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDCreateHostedEndpointAnalytics

- (NSString)requestID
{
  return (NSString *)sub_10027068C();
}

- (void)setRequestID:(id)a3
{
}

- (MRDTimingEvent)searchForBuddy
{
  v2 = self;
  id v3 = sub_10026C16C();

  return (MRDTimingEvent *)v3;
}

- (void)setSearchForBuddy:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___searchForBuddy);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___searchForBuddy) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createRemoteHostedEndpoint
{
  v2 = self;
  id v3 = sub_10026C1F4();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateRemoteHostedEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___createRemoteHostedEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___createRemoteHostedEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createHostedEndpoint
{
  v2 = self;
  id v3 = sub_10026C27C();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateHostedEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___createHostedEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___createHostedEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)modifyOutputContext
{
  v2 = self;
  id v3 = sub_10026C304();

  return (MRDTimingEvent *)v3;
}

- (void)setModifyOutputContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___modifyOutputContext);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___modifyOutputContext) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)searchForGroupUID
{
  v2 = self;
  id v3 = sub_10026C38C();

  return (MRDTimingEvent *)v3;
}

- (void)setSearchForGroupUID:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___searchForGroupUID);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___searchForGroupUID) = (Class)a3;
  id v3 = a3;
}

- (MRDCreateHostedEndpointAnalytics)initWithRequestID:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (MRDCreateHostedEndpointAnalytics *)sub_10026C824(v3, v4);
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDCreateHostedEndpointAnalytics)init
{
  result = (MRDCreateHostedEndpointAnalytics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___searchForBuddy));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___createRemoteHostedEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___createHostedEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___modifyOutputContext));
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateHostedEndpointAnalytics____lazy_storage___searchForGroupUID);
}

@end
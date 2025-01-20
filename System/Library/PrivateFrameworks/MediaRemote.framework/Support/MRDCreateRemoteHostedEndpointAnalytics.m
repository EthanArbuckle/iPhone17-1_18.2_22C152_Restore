@interface MRDCreateRemoteHostedEndpointAnalytics
- (MRDCreateRemoteHostedEndpointAnalytics)init;
- (MRDCreateRemoteHostedEndpointAnalytics)initWithRequestID:(id)a3;
- (MRDTimingEvent)connectToTransientExternalDevice;
- (MRDTimingEvent)createHostedEndpoint;
- (MRDTimingEvent)createTransientExternalDevice;
- (MRDTimingEvent)searchForGroupUID;
- (NSString)requestID;
- (void)setConnectToTransientExternalDevice:(id)a3;
- (void)setCreateHostedEndpoint:(id)a3;
- (void)setCreateTransientExternalDevice:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setSearchForGroupUID:(id)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDCreateRemoteHostedEndpointAnalytics

- (NSString)requestID
{
  return (NSString *)sub_10027068C();
}

- (void)setRequestID:(id)a3
{
}

- (MRDTimingEvent)createTransientExternalDevice
{
  v2 = self;
  id v3 = sub_10026B950();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateTransientExternalDevice:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createTransientExternalDevice);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createTransientExternalDevice) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)connectToTransientExternalDevice
{
  v2 = self;
  id v3 = sub_10026B9D8();

  return (MRDTimingEvent *)v3;
}

- (void)setConnectToTransientExternalDevice:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___connectToTransientExternalDevice);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___connectToTransientExternalDevice) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createHostedEndpoint
{
  v2 = self;
  id v3 = sub_10026BA60();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateHostedEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createHostedEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createHostedEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)searchForGroupUID
{
  v2 = self;
  id v3 = sub_10026BAE8();

  return (MRDTimingEvent *)v3;
}

- (void)setSearchForGroupUID:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___searchForGroupUID);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___searchForGroupUID) = (Class)a3;
  id v3 = a3;
}

- (MRDCreateRemoteHostedEndpointAnalytics)initWithRequestID:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics_eventName);
  void *v6 = 0xD000000000000030;
  v6[1] = 0x80000001003B7A80;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics_tracked) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createTransientExternalDevice) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___connectToTransientExternalDevice) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createHostedEndpoint) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___searchForGroupUID) = 0;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics_requestID);
  uint64_t *v7 = v5;
  v7[1] = v8;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return [(MRDCreateRemoteHostedEndpointAnalytics *)&v10 init];
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDCreateRemoteHostedEndpointAnalytics)init
{
  result = (MRDCreateRemoteHostedEndpointAnalytics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createTransientExternalDevice));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___connectToTransientExternalDevice));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createHostedEndpoint));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___searchForGroupUID);
}

@end
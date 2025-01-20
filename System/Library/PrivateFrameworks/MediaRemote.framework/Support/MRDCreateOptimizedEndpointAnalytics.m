@interface MRDCreateOptimizedEndpointAnalytics
- (BOOL)requestContainsLocal;
- (MRDCreateOptimizedEndpointAnalytics)init;
- (MRDCreateOptimizedEndpointAnalytics)initWithRequestID:(id)a3;
- (MRDTimingEvent)createEndpoint;
- (MRDTimingEvent)discoverOutputDevices;
- (MRDTimingEvent)followupOutputContextModification;
- (MRDTimingEvent)removeUndesiredDevicesOutputContextModification;
- (MRDTimingEvent)searchEndpointsForLocalDevice;
- (MRDTimingEvent)waitForCompletion;
- (NSString)requestID;
- (int64_t)numberOfDevicesOnLocal;
- (int64_t)numberOfUndesiredDevices;
- (void)setCreateEndpoint:(id)a3;
- (void)setDiscoverOutputDevices:(id)a3;
- (void)setFollowupOutputContextModification:(id)a3;
- (void)setNumberOfDevicesOnLocal:(int64_t)a3;
- (void)setNumberOfUndesiredDevices:(int64_t)a3;
- (void)setRemoveUndesiredDevicesOutputContextModification:(id)a3;
- (void)setRequestContainsLocal:(BOOL)a3;
- (void)setRequestID:(id)a3;
- (void)setSearchEndpointsForLocalDevice:(id)a3;
- (void)setWaitForCompletion:(id)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDCreateOptimizedEndpointAnalytics

- (NSString)requestID
{
  return (NSString *)sub_10027068C();
}

- (void)setRequestID:(id)a3
{
}

- (BOOL)requestContainsLocal
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics_requestContainsLocal;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestContainsLocal:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics_requestContainsLocal;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)numberOfUndesiredDevices
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics_numberOfUndesiredDevices);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfUndesiredDevices:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics_numberOfUndesiredDevices);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfDevicesOnLocal
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics_numberOfDevicesOnLocal);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfDevicesOnLocal:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics_numberOfDevicesOnLocal);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (MRDTimingEvent)discoverOutputDevices
{
  v2 = self;
  id v3 = sub_10026D688();

  return (MRDTimingEvent *)v3;
}

- (void)setDiscoverOutputDevices:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___discoverOutputDevices);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___discoverOutputDevices) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)searchEndpointsForLocalDevice
{
  v2 = self;
  id v3 = sub_10026D710();

  return (MRDTimingEvent *)v3;
}

- (void)setSearchEndpointsForLocalDevice:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___searchEndpointsForLocalDevice);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___searchEndpointsForLocalDevice) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createEndpoint
{
  v2 = self;
  id v3 = sub_10026D798();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___createEndpoint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___createEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)waitForCompletion
{
  v2 = self;
  id v3 = sub_10026D820();

  return (MRDTimingEvent *)v3;
}

- (void)setWaitForCompletion:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___waitForCompletion);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___waitForCompletion) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)removeUndesiredDevicesOutputContextModification
{
  v2 = self;
  id v3 = sub_10026D8A8();

  return (MRDTimingEvent *)v3;
}

- (void)setRemoveUndesiredDevicesOutputContextModification:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___removeUndesiredDevicesOutputContextModification);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___removeUndesiredDevicesOutputContextModification) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)followupOutputContextModification
{
  v2 = self;
  id v3 = sub_10026D930();

  return (MRDTimingEvent *)v3;
}

- (void)setFollowupOutputContextModification:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___followupOutputContextModification);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___followupOutputContextModification) = (Class)a3;
  id v3 = a3;
}

- (MRDCreateOptimizedEndpointAnalytics)initWithRequestID:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (MRDCreateOptimizedEndpointAnalytics *)sub_10026DF40(v3, v4);
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDCreateOptimizedEndpointAnalytics)init
{
  result = (MRDCreateOptimizedEndpointAnalytics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___discoverOutputDevices));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___searchEndpointsForLocalDevice));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___createEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___waitForCompletion));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___removeUndesiredDevicesOutputContextModification));
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateOptimizedEndpointAnalytics____lazy_storage___followupOutputContextModification);
}

@end
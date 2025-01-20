@interface MRDCreateEndpointWithCurrentTopologyAnalytics
- (BOOL)airplayActive;
- (BOOL)containsLeaderInfo;
- (BOOL)undiscoverableGroupLeader;
- (MRDCreateEndpointWithCurrentTopologyAnalytics)init;
- (MRDCreateEndpointWithCurrentTopologyAnalytics)initWithRequestID:(id)a3;
- (MRDTimingEvent)createEndpoint;
- (MRDTimingEvent)createOptimizedEndpoint;
- (MRDTimingEvent)discoverGroup;
- (MRDTimingEvent)findMyGroupLeader;
- (NSString)requestID;
- (void)setAirplayActive:(BOOL)a3;
- (void)setContainsLeaderInfo:(BOOL)a3;
- (void)setCreateEndpoint:(id)a3;
- (void)setCreateOptimizedEndpoint:(id)a3;
- (void)setDiscoverGroup:(id)a3;
- (void)setFindMyGroupLeader:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setUndiscoverableGroupLeader:(BOOL)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDCreateEndpointWithCurrentTopologyAnalytics

- (NSString)requestID
{
  return (NSString *)sub_10027068C();
}

- (void)setRequestID:(id)a3
{
}

- (BOOL)undiscoverableGroupLeader
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics_undiscoverableGroupLeader;
  swift_beginAccess();
  return *v2;
}

- (void)setUndiscoverableGroupLeader:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics_undiscoverableGroupLeader;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)containsLeaderInfo
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics_containsLeaderInfo;
  swift_beginAccess();
  return *v2;
}

- (void)setContainsLeaderInfo:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics_containsLeaderInfo;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)airplayActive
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics_airplayActive;
  swift_beginAccess();
  return *v2;
}

- (void)setAirplayActive:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics_airplayActive;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (MRDTimingEvent)findMyGroupLeader
{
  v2 = self;
  id v3 = sub_10026E44C();

  return (MRDTimingEvent *)v3;
}

- (void)setFindMyGroupLeader:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___findMyGroupLeader);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___findMyGroupLeader) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createOptimizedEndpoint
{
  v2 = self;
  id v3 = sub_10026E4D4();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateOptimizedEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___createOptimizedEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___createOptimizedEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createEndpoint
{
  v2 = self;
  id v3 = sub_10026E55C();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___createEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___createEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)discoverGroup
{
  v2 = self;
  id v3 = sub_10026E5E4();

  return (MRDTimingEvent *)v3;
}

- (void)setDiscoverGroup:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___discoverGroup);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___discoverGroup) = (Class)a3;
  id v3 = a3;
}

- (MRDCreateEndpointWithCurrentTopologyAnalytics)initWithRequestID:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (MRDCreateEndpointWithCurrentTopologyAnalytics *)sub_10026EB2C(v3, v4);
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDCreateEndpointWithCurrentTopologyAnalytics)init
{
  result = (MRDCreateEndpointWithCurrentTopologyAnalytics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___findMyGroupLeader));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___createOptimizedEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___createEndpoint));
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateEndpointWithCurrentTopologyAnalytics____lazy_storage___discoverGroup);
}

@end
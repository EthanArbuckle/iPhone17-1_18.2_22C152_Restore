@interface MRDNowPlayingAirPlaySessionEvents
- (BOOL)discoverableGroupLeader;
- (MRDNowPlayingAirPlaySessionEvents)init;
- (MRDNowPlayingAirPlaySessionEvents)initWithClusterType:(unsigned int)a3 modelID:(id)a4;
- (MRDTimingEvent)addLocalDevice;
- (MRDTimingEvent)findEndpoint;
- (MRDTimingEvent)interruptions;
- (MRDTimingEvent)originForward;
- (MRDTimingEvent)reloadDeviceInfo;
- (MRDTimingEvent)removeLocalDevice;
- (MRDTimingEvent)sourceOutputContext;
- (NSString)modelID;
- (unsigned)clusterType;
- (void)setAddLocalDevice:(id)a3;
- (void)setClusterType:(unsigned int)a3;
- (void)setDiscoverableGroupLeader:(BOOL)a3;
- (void)setFindEndpoint:(id)a3;
- (void)setInterruptions:(id)a3;
- (void)setModelID:(id)a3;
- (void)setOriginForward:(id)a3;
- (void)setReloadDeviceInfo:(id)a3;
- (void)setRemoveLocalDevice:(id)a3;
- (void)setSourceOutputContext:(id)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDNowPlayingAirPlaySessionEvents

- (BOOL)discoverableGroupLeader
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_discoverableGroupLeader;
  swift_beginAccess();
  return *v2;
}

- (void)setDiscoverableGroupLeader:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_discoverableGroupLeader;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (unsigned)clusterType
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_clusterType);
  swift_beginAccess();
  return *v2;
}

- (void)setClusterType:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_clusterType);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (NSString)modelID
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setModelID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_modelID);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (MRDTimingEvent)sourceOutputContext
{
  NSString v2 = self;
  id v3 = sub_10024E7D8();

  return (MRDTimingEvent *)v3;
}

- (void)setSourceOutputContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___sourceOutputContext);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___sourceOutputContext) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)removeLocalDevice
{
  NSString v2 = self;
  id v3 = sub_10024E860();

  return (MRDTimingEvent *)v3;
}

- (void)setRemoveLocalDevice:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___removeLocalDevice);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___removeLocalDevice) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)addLocalDevice
{
  NSString v2 = self;
  id v3 = sub_10024E8E8();

  return (MRDTimingEvent *)v3;
}

- (void)setAddLocalDevice:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___addLocalDevice);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___addLocalDevice) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)reloadDeviceInfo
{
  NSString v2 = self;
  id v3 = sub_10024E970();

  return (MRDTimingEvent *)v3;
}

- (void)setReloadDeviceInfo:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___reloadDeviceInfo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___reloadDeviceInfo) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)originForward
{
  NSString v2 = self;
  id v3 = sub_10024E9F8();

  return (MRDTimingEvent *)v3;
}

- (void)setOriginForward:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___originForward);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___originForward) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)findEndpoint
{
  NSString v2 = self;
  id v3 = sub_10024EA80();

  return (MRDTimingEvent *)v3;
}

- (void)setFindEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___findEndpoint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___findEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)interruptions
{
  NSString v2 = self;
  id v3 = sub_10024EB08();

  return (MRDTimingEvent *)v3;
}

- (void)setInterruptions:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___interruptions);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___interruptions) = (Class)a3;
  id v3 = a3;
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDNowPlayingAirPlaySessionEvents)initWithClusterType:(unsigned int)a3 modelID:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (MRDNowPlayingAirPlaySessionEvents *)sub_10024F2FC(a3, v5, v6);
}

- (MRDNowPlayingAirPlaySessionEvents)init
{
  result = (MRDNowPlayingAirPlaySessionEvents *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___sourceOutputContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___removeLocalDevice));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___addLocalDevice));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___reloadDeviceInfo));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___originForward));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___findEndpoint));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___interruptions);
}

@end
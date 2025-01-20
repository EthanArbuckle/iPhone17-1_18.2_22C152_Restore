@interface SecureLocationsStewieManager
- (_TtC12searchpartyd28SecureLocationsStewieManager)init;
- (void)connectedServicesChanged:(int64_t)a3;
- (void)messageReceived:(id)a3 withMetadata:(id)a4 completionBlock:(id)a5;
- (void)stateChanged:(id)a3;
- (void)stewieSupportChanged;
@end

@implementation SecureLocationsStewieManager

- (_TtC12searchpartyd28SecureLocationsStewieManager)init
{
  result = (_TtC12searchpartyd28SecureLocationsStewieManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_clientQueue));
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_coreTelephonyClient));
  swift_release();
  swift_release();
  swift_release();
  sub_10001DAB4((uint64_t)self + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_location, &qword_101669310);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10001DAB4((uint64_t)self + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_lastAvailabilityDate, (uint64_t *)&unk_10163AC90);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_locationMonitorDistanceThreshold));
  sub_10001DAB4((uint64_t)self + OBJC_IVAR____TtC12searchpartyd28SecureLocationsStewieManager_lastPublishedLocation, &qword_101669310);
}

- (void)messageReceived:(id)a3 withMetadata:(id)a4 completionBlock:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_unknownObjectRetain();
  v9 = self;
  sub_10109996C((uint64_t)a3);
  _Block_release(v8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)stateChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_101092420(v4);
}

- (void)connectedServicesChanged:(int64_t)a3
{
  char v3 = a3;
  id v4 = self;
  sub_1010927CC(v3);
}

- (void)stewieSupportChanged
{
  v2 = self;
  sub_101092D24();
}

@end
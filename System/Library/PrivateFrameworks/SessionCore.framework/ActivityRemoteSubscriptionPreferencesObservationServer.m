@interface ActivityRemoteSubscriptionPreferencesObservationServer
- (_TtC11SessionCore54ActivityRemoteSubscriptionPreferencesObservationServer)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation ActivityRemoteSubscriptionPreferencesObservationServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C7CEDDF4(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore54ActivityRemoteSubscriptionPreferencesObservationServer)init
{
  result = (_TtC11SessionCore54ActivityRemoteSubscriptionPreferencesObservationServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore54ActivityRemoteSubscriptionPreferencesObservationServer_requestProcessingQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore54ActivityRemoteSubscriptionPreferencesObservationServer_listener));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
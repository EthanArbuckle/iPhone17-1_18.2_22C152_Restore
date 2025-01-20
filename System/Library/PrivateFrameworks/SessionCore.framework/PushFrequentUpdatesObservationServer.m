@interface PushFrequentUpdatesObservationServer
- (_TtC11SessionCore36PushFrequentUpdatesObservationServer)init;
- (id)activitiesExceedingReducedPushBudget;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation PushFrequentUpdatesObservationServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C7CE15EC(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore36PushFrequentUpdatesObservationServer)init
{
  result = (_TtC11SessionCore36PushFrequentUpdatesObservationServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore36PushFrequentUpdatesObservationServer_requestProcessingQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore36PushFrequentUpdatesObservationServer_listener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore36PushFrequentUpdatesObservationServer_pushServer));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (id)activitiesExceedingReducedPushBudget
{
  v2 = self;
  uint64_t v3 = sub_1C7D32520();
  sub_1C7CE1248(v3);

  swift_bridgeObjectRelease();
  v4 = (void *)sub_1C7D32EC0();
  swift_bridgeObjectRelease();
  return v4;
}

@end
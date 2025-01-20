@interface IntelligentRoutingManager
- (NSArray)topOfListRoutesUniqueIdentifiers;
- (_TtC13callservicesd25IntelligentRoutingManager)init;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateContext:(id)a4;
- (void)session:(id)a3 suspendedWithReason:(int64_t)a4;
- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5;
- (void)updateStateWithCurrentCalls:(id)a3;
@end

@implementation IntelligentRoutingManager

- (NSArray)topOfListRoutesUniqueIdentifiers
{
  v2 = self;
  sub_10031B514();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)updateStateWithCurrentCalls:(id)a3
{
  sub_1001F6204(0, (unint64_t *)&qword_1005855B0);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_10031B58C(v4);

  swift_bridgeObjectRelease();
}

- (void)session:(id)a3 didUpdateContext:(id)a4
{
  sub_1001F6204(0, &qword_100589C60);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  sub_10031D96C();

  swift_bridgeObjectRelease();
}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_10031E1F0(v5);
}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  id v8 = a3;
  v9 = self;
  sub_10031E3A4(v8, a4, a5);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_10031E5A0();
}

- (_TtC13callservicesd25IntelligentRoutingManager)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd25IntelligentRoutingManager_recommendationsObservers));

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd25IntelligentRoutingManager_lockStateObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd25IntelligentRoutingManager_irServiceToken));

  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd25IntelligentRoutingManager_intelligentRoutingInitializationBlock));
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13callservicesd25IntelligentRoutingManager_resetTokenBlock));

  swift_bridgeObjectRelease();
}

@end
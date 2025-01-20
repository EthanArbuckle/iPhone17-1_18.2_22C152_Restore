@interface RDSharedInlineTagAutoConvertEngine.BabysitTarget
- (_TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget)init;
- (id)waiterID;
@end

@implementation RDSharedInlineTagAutoConvertEngine.BabysitTarget

- (id)waiterID
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (_TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget)init
{
  NSString v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget_babysitterOperationDidLaunch);
  *NSString v2 = 0xD00000000000001CLL;
  v2[1] = 0x80000001007CDEA0;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget_babysitterOperationStoreDidChange);
  void *v3 = 0xD000000000000021;
  v3[1] = 0x80000001007CDEC0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC7remindd34RDSharedInlineTagAutoConvertEngineP33_5B5B2EA781175C6DB341AB3D5E32460613BabysitTarget_analyticsCrashDetected);
  void *v4 = 0xD000000000000042;
  v4[1] = 0x80000001007CDF30;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RDSharedInlineTagAutoConvertEngine.BabysitTarget();
  return [(RDSharedInlineTagAutoConvertEngine.BabysitTarget *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
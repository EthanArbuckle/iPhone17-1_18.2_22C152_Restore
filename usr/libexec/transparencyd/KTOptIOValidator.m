@interface KTOptIOValidator
- (_TtC13transparencyd16KTOptIOValidator)init;
- (_TtC13transparencyd16KTOptIOValidator)initWithOptInRecords:(id)a3 uriToSMT:(id)a4;
- (id)evaluateCloudDataWithApplication:(id)a3 error:(id *)a4;
- (id)evaluateLogDataWithApplication:(id)a3 error:(id *)a4;
- (id)urisNeedOptInApplication:(id)a3 error:(id *)a4;
- (void)setIntendedStateWithState:(BOOL)a3;
@end

@implementation KTOptIOValidator

- (_TtC13transparencyd16KTOptIOValidator)initWithOptInRecords:(id)a3 uriToSMT:(id)a4
{
  sub_100106FA4();
  v5 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100080E08(&qword_1003214D8);
  v6 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (char *)self + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_intendedState;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_intendedState) = 2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_optInRecords) = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd16KTOptIOValidator_uriToSMT) = v6;
  swift_beginAccess();
  unsigned char *v7 = 2;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for KTOptIOValidator();
  return [(KTOptIOValidator *)&v9 init];
}

- (void)setIntendedStateWithState:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = *(void (**)(BOOL))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v5 = self;
  v4(v3);
}

- (id)evaluateLogDataWithApplication:(id)a3 error:(id *)a4
{
  return sub_100102DD0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))KTOptIOValidator.evaluateLogData(application:));
}

- (id)evaluateCloudDataWithApplication:(id)a3 error:(id *)a4
{
  return sub_100102DD0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))KTOptIOValidator.evaluateCloudData(application:));
}

- (id)urisNeedOptInApplication:(id)a3 error:(id *)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  KTOptIOValidator.urisNeedOptIn(application:)();
  swift_bridgeObjectRelease();

  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (_TtC13transparencyd16KTOptIOValidator)init
{
  result = (_TtC13transparencyd16KTOptIOValidator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
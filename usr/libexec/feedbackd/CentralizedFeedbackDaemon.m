@interface CentralizedFeedbackDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC9feedbackd25CentralizedFeedbackDaemon)init;
- (void)donateWithDonationJSON:(id)a3 completion:(id)a4;
- (void)fetchDonationIDsWithCount:(unsigned int)a3 fromLatest:(BOOL)a4 excludingEvaluationIDs:(id)a5 completion:(id)a6;
- (void)fetchDonationWithDonationID:(id)a3 completion:(id)a4;
- (void)fetchDonationsWithCount:(unsigned int)a3 fromLatest:(BOOL)a4 completion:(id)a5;
- (void)fetchDonationsWithCount:(unsigned int)a3 fromLatest:(BOOL)a4 excludingEvaluationIDs:(id)a5 completion:(id)a6;
- (void)fetchEvaluationWithEvaluationID:(id)a3 completion:(id)a4;
- (void)invalidateDonationWithDonationJSON:(id)a3 completion:(id)a4;
- (void)presentedDonationWithEvaluationID:(id)a3 completion:(id)a4;
- (void)presentedInteractionWithInteractionJSON:(id)a3 completion:(id)a4;
- (void)recordEvaluationWithEvaluationJSON:(id)a3 completion:(id)a4;
- (void)remoteEvaluateWithRequest:(id)a3 completion:(id)a4;
@end

@implementation CentralizedFeedbackDaemon

- (_TtC9feedbackd25CentralizedFeedbackDaemon)init
{
  uint64_t v3 = OBJC_IVAR____TtC9feedbackd25CentralizedFeedbackDaemon_biomeReader;
  type metadata accessor for CFBBiomeReader();
  v4 = (objc_class *)swift_allocObject();
  v5 = self;
  swift_defaultActor_initialize();
  *(Class *)((char *)&self->super.isa + v3) = v4;
  uint64_t v6 = OBJC_IVAR____TtC9feedbackd25CentralizedFeedbackDaemon_biomeDonator;
  type metadata accessor for CFBBiomeDonator();
  swift_allocObject();
  *(Class *)((char *)&v5->super.isa + v6) = (Class)CFBBiomeDonator.init()();
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC9feedbackd25CentralizedFeedbackDaemon_listener) = 0;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CentralizedFeedbackDaemon();
  return [(CentralizedFeedbackDaemon *)&v8 init];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  char v9 = sub_10006BAAC(v7);

  return v9 & 1;
}

- (void)invalidateDonationWithDonationJSON:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  sub_10005B50C(v8, v10, (uint64_t)sub_10006D308, v11);
  swift_release();
  sub_1000185C0(v8, v10);
}

- (void)donateWithDonationJSON:(id)a3 completion:(id)a4
{
}

- (void)presentedDonationWithEvaluationID:(id)a3 completion:(id)a4
{
}

- (void)presentedInteractionWithInteractionJSON:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  sub_10006C530(v8, v10, (uint64_t)sub_10006D100, v11);
  swift_release();
  sub_1000185C0(v8, v10);
}

- (void)recordEvaluationWithEvaluationJSON:(id)a3 completion:(id)a4
{
}

- (void)fetchEvaluationWithEvaluationID:(id)a3 completion:(id)a4
{
}

- (void)fetchDonationWithDonationID:(id)a3 completion:(id)a4
{
}

- (void)fetchDonationsWithCount:(unsigned int)a3 fromLatest:(BOOL)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  unint64_t v10 = self;
  sub_100062890(a3, a4, (uint64_t)sub_10006D30C, v9);
  swift_release();
}

- (void)fetchDonationsWithCount:(unsigned int)a3 fromLatest:(BOOL)a4 excludingEvaluationIDs:(id)a5 completion:(id)a6
{
}

- (void)fetchDonationIDsWithCount:(unsigned int)a3 fromLatest:(BOOL)a4 excludingEvaluationIDs:(id)a5 completion:(id)a6
{
}

- (void)remoteEvaluateWithRequest:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = a3;
  v13 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  if (v6)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v6;
    v12 = sub_100059C6C;
  }
  else
  {
    v12 = 0;
    uint64_t v11 = 0;
  }
  sub_1000644A4(v8, v10, v12, v11);
  sub_100059E30((uint64_t)v12);
  sub_1000185C0(v8, v10);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9feedbackd25CentralizedFeedbackDaemon_listener);
}

@end
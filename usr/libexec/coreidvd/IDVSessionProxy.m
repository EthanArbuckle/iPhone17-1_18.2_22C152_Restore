@interface IDVSessionProxy
- (_TtC8coreidvd15IDVSessionProxy)init;
- (void)concludeVerification:(id)a3;
- (void)configure:(id)a3 completion:(id)a4;
- (void)confirmVerificationCompletedWithFeedback:(id)a3;
- (void)dealloc;
- (void)getVerificationResultWithOptions:(id)a3 completion:(id)a4;
- (void)performVerificationWithAttributes:(id)a3 completion:(id)a4;
- (void)shareVerificationResultWithOptions:(id)a3 completion:(id)a4;
@end

@implementation IDVSessionProxy

- (void)dealloc
{
  v2 = self;
  sub_1001897A0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000C6CC((uint64_t)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__inoKey, &qword_100726528);
  sub_10000C6CC((uint64_t)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__spKey, &qword_100726528);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__inoKeyCreationDispatchSignal));

  sub_1001D59E4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData), *(void *)&self->conversation[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData], *(void *)&self->conversation[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData + 8], *(void *)&self->topekaWebService[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData], *(void *)&self->assessmentWebService[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData], *(void *)&self->spWebService[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData], *(void *)&self->_connection[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData], *(void *)&self->_context[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData]);
  v3 = (char *)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__authRetrier;
  uint64_t v4 = type metadata accessor for DIPRetrier();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__nonceRetrier, v4);
  swift_release();
  swift_release();
  sub_1001D6E40(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__clientGUIDFactory));

  swift_bridgeObjectRelease();
  sub_10000C6CC((uint64_t)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__augmentedProfile, &qword_100726688);
  sub_10000C6CC((uint64_t)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__verificationResultDate, &qword_1007239B0);

  swift_bridgeObjectRelease();
}

- (void)configure:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v8 = a3;
  v7 = self;
  sub_1001C209C(v8, (uint64_t)v7, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)performVerificationWithAttributes:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v8 = a3;
  v7 = self;
  sub_1001CCCD0(a3, v7, (char *)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)shareVerificationResultWithOptions:(id)a3 completion:(id)a4
{
}

- (void)getVerificationResultWithOptions:(id)a3 completion:(id)a4
{
}

- (void)concludeVerification:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  v7 = self;
  sub_1001A2B5C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)confirmVerificationCompletedWithFeedback:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_1001A3290(v4);
}

- (_TtC8coreidvd15IDVSessionProxy)init
{
  result = (_TtC8coreidvd15IDVSessionProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
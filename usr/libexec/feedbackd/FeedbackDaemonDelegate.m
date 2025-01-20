@interface FeedbackDaemonDelegate
- (void)clearCachedUserSessionWithCompletion:(id)a3;
- (void)collectFeedbackWithFormData:(id)a3 launchConfigurationData:(id)a4 completion:(id)a5;
- (void)didFinishSubmissionWithFormIdentifier:(id)a3 feedbackId:(id)a4 isSurvey:(BOOL)a5 error:(id)a6 completion:(id)a7;
- (void)fetchCountsForFormWithIdentifier:(id)a3 completion:(id)a4;
- (void)reportFailureToLaunchFormWithFormIdentifier:(id)a3 completion:(id)a4;
- (void)resetDaemonWithCompletion:(id)a3;
@end

@implementation FeedbackDaemonDelegate

- (void)collectFeedbackWithFormData:(id)a3 launchConfigurationData:(id)a4 completion:(id)a5
{
  v7 = (void (*)(void))_Block_copy(a5);
  id v8 = a3;
  id v9 = a4;
  swift_retain();
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  if (v7)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v7;
    v7 = (void (*)(void))sub_100059E40;
  }
  else
  {
    uint64_t v16 = 0;
  }
  sub_100051860(v10, v12, v13, v15, v7, (void (*)(void))v16);
  sub_100059E30((uint64_t)v7);
  sub_1000185C0(v13, v15);
  sub_1000185C0(v10, v12);

  swift_release();
}

- (void)fetchCountsForFormWithIdentifier:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  _Block_copy(v5);
  swift_retain();
  sub_100058A30(v6, v8, (uint64_t)self, (void (**)(void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)reportFailureToLaunchFormWithFormIdentifier:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;
  _Block_copy(v4);
  swift_retain();
  sub_100058EC0(v5, v7, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)didFinishSubmissionWithFormIdentifier:(id)a3 feedbackId:(id)a4 isSurvey:(BOOL)a5 error:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  uint64_t v10 = _Block_copy(a7);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;
  _Block_copy(v10);
  id v14 = a4;
  id v15 = a6;
  swift_retain();
  sub_1000591BC(v11, v13, a4, v8, a6, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)resetDaemonWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  sub_100059638((uint64_t)sub_100059E40, v4, 0xD000000000000018, 0x800000010007E8D0, (uint64_t)&unk_10008E7E0, (uint64_t)&unk_100093F88);
  swift_release();

  swift_release();
}

- (void)clearCachedUserSessionWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  sub_100059638((uint64_t)sub_100058A28, v4, 0xD000000000000023, 0x800000010007E8A0, (uint64_t)&unk_10008E790, (uint64_t)&unk_100093F78);
  swift_release();

  swift_release();
}

@end
@interface Transcript
- (_TtC10LinkDaemon10Transcript)init;
- (void)deleteAllRecordsWithReply:(id)a3;
- (void)deleteRecordsWithMatchingPredicate:(id)a3 reply:(id)a4;
- (void)donateActionRecordData:(id)a3 bundleIdentifier:(id)a4 timestamp:(double)a5 writeImmediately:(BOOL)a6 reply:(id)a7;
- (void)donateActionRecordData:(id)a3 writeImmediately:(BOOL)a4 reply:(id)a5;
- (void)donateWithActionRecord:(id)a3 reply:(id)a4;
- (void)requestReadAccessForStream:(id)a3 reply:(id)a4;
- (void)requestReadAccessWithReply:(id)a3;
- (void)startObservingNextActionStreamWithCompletion:(id)a3;
- (void)stopObservingNextActionStreamWithConnectionUUID:(id)a3 completion:(id)a4;
@end

@implementation Transcript

- (_TtC10LinkDaemon10Transcript)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)donateWithActionRecord:(id)a3 reply:(id)a4
{
}

- (void)donateActionRecordData:(id)a3 writeImmediately:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  v8 = _Block_copy(a5);
  id v9 = a3;
  v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  _Block_copy(v8);
  sub_100039140(v10, v12, v5, &v13->super, v8);
  _Block_release(v8);
  sub_10000DA10(v10, (unint64_t)v12);
}

- (void)requestReadAccessWithReply:(id)a3
{
}

- (void)deleteAllRecordsWithReply:(id)a3
{
}

- (void)deleteRecordsWithMatchingPredicate:(id)a3 reply:(id)a4
{
}

- (void)donateActionRecordData:(id)a3 bundleIdentifier:(id)a4 timestamp:(double)a5 writeImmediately:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  v11 = _Block_copy(a7);
  id v12 = a3;
  id v13 = a4;
  v20 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v19 = v18;

  _Block_copy(v11);
  sub_10003CE7C(v14, v16, v17, v19, v7, v20, v11);
  _Block_release(v11);
  swift_bridgeObjectRelease();
  sub_10000DA10(v14, v16);
}

- (void)requestReadAccessForStream:(id)a3 reply:(id)a4
{
  BOOL v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  _Block_copy(v5);
  id v9 = self;
  sub_10003D63C(v6, v8, (uint64_t)v9, (void (**)(void, void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)startObservingNextActionStreamWithCompletion:(id)a3
{
}

- (void)stopObservingNextActionStreamWithConnectionUUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v10);
  v11 = self;
  sub_10003E2C8((uint64_t)v9, (uint64_t)v11, (void (**)(void, void))v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
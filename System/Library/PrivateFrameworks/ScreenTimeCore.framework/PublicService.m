@interface PublicService
- (void)deleteAllWebApplicationHistory:(id)a3 clientBundleURLWrapper:(id)a4 replyHandler:(id)a5;
- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6;
- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6;
- (void)requestConfigurationWithReplyHandler:(id)a3;
@end

@implementation PublicService

- (void)requestConfigurationWithReplyHandler:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_copy(v3);
  uint64_t v4 = swift_retain();
  sub_1000D1188(v4, v3);
  _Block_release(v3);
  _Block_release(v3);
  swift_release();
}

- (void)deleteWebHistoryForURL:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6
{
}

- (void)deleteWebHistoryDuringInterval:(id)a3 webApplication:(id)a4 clientBundleURLWrapper:(id)a5 replyHandler:(id)a6
{
}

- (void)deleteAllWebApplicationHistory:(id)a3 clientBundleURLWrapper:(id)a4 replyHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a4;
  swift_retain();
  sub_1000D1618(v8, v10, a4, (uint64_t)self, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_release();
  swift_bridgeObjectRelease();
}

@end
@interface LinkPreviewLoadingOperation
- (void)linkPreviewDidFinishLoadingWithNotification:(id)a3;
@end

@implementation LinkPreviewLoadingOperation

- (void)linkPreviewDidFinishLoadingWithNotification:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  LinkPreviewLoadingOperation.linkPreviewDidFinishLoading(notification:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
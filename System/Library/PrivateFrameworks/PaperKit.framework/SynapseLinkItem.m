@interface SynapseLinkItem
- (_TtC8PaperKit15SynapseLinkItem)init;
- (void)linkPreviewDidFinishLoadingWithNotification:(id)a3;
@end

@implementation SynapseLinkItem

- (void)linkPreviewDidFinishLoadingWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  SynapseLinkItem.linkPreviewDidFinishLoading(notification:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC8PaperKit15SynapseLinkItem)init
{
  result = (_TtC8PaperKit15SynapseLinkItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit15SynapseLinkItem_delegate;
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)v3);
}

@end
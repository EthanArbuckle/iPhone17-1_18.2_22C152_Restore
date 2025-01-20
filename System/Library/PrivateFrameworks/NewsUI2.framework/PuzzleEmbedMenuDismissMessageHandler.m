@interface PuzzleEmbedMenuDismissMessageHandler
- (_TtC7NewsUI236PuzzleEmbedMenuDismissMessageHandler)init;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
@end

@implementation PuzzleEmbedMenuDismissMessageHandler

- (_TtC7NewsUI236PuzzleEmbedMenuDismissMessageHandler)init
{
  result = (_TtC7NewsUI236PuzzleEmbedMenuDismissMessageHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI236PuzzleEmbedMenuDismissMessageHandler_delegate;
  sub_1DEB1DDEC((uint64_t)v3);
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  uint64_t v5 = MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI236PuzzleEmbedMenuDismissMessageHandler_delegate, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v7 = self;
    sub_1DF02E598(v6);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

@end
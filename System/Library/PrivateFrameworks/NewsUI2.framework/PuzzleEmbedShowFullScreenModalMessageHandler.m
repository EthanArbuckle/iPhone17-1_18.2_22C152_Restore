@interface PuzzleEmbedShowFullScreenModalMessageHandler
- (_TtC7NewsUI244PuzzleEmbedShowFullScreenModalMessageHandler)init;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
@end

@implementation PuzzleEmbedShowFullScreenModalMessageHandler

- (_TtC7NewsUI244PuzzleEmbedShowFullScreenModalMessageHandler)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC7NewsUI244PuzzleEmbedShowFullScreenModalMessageHandler_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PuzzleEmbedShowFullScreenModalMessageHandler();
  return [(PuzzleEmbedShowFullScreenModalMessageHandler *)&v4 init];
}

- (void).cxx_destruct
{
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_1DFC01068(a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
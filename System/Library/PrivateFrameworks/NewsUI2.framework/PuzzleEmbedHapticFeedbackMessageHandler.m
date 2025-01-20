@interface PuzzleEmbedHapticFeedbackMessageHandler
- (_TtC7NewsUI239PuzzleEmbedHapticFeedbackMessageHandler)init;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
@end

@implementation PuzzleEmbedHapticFeedbackMessageHandler

- (_TtC7NewsUI239PuzzleEmbedHapticFeedbackMessageHandler)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC7NewsUI239PuzzleEmbedHapticFeedbackMessageHandler_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PuzzleEmbedHapticFeedbackMessageHandler();
  return [(PuzzleEmbedHapticFeedbackMessageHandler *)&v4 init];
}

- (void).cxx_destruct
{
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_1DEE527C0(a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
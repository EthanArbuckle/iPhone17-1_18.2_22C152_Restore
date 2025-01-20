@interface PuzzleProgressMessageHandler
- (_TtC8NewsFeed28PuzzleProgressMessageHandler)init;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
@end

@implementation PuzzleProgressMessageHandler

- (_TtC8NewsFeed28PuzzleProgressMessageHandler)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->delegate[OBJC_IVAR____TtC8NewsFeed28PuzzleProgressMessageHandler_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(PuzzleProgressMessageHandler *)&v5 init];
}

- (void).cxx_destruct
{
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_1C01D9C0C(a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
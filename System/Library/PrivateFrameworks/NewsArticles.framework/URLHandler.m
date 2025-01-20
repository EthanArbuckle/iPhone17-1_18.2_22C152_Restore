@interface URLHandler
- (_TtC12NewsArticles10URLHandler)init;
- (void)openNewWindowWithURL:(id)a3;
- (void)openURL:(id)a3;
@end

@implementation URLHandler

- (_TtC12NewsArticles10URLHandler)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles10URLHandler_closures) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles10URLHandler_newWindowClosures) = v4;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(URLHandler *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)openURL:(id)a3
{
}

- (void)openNewWindowWithURL:(id)a3
{
}

@end
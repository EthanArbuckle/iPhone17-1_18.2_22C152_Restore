@interface NotifyOnDeinit
- (_TtC12NewsArticlesP33_C03E0B959E775327989EE4DDE248085F14NotifyOnDeinit)init;
- (void)dealloc;
@end

@implementation NotifyOnDeinit

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12NewsArticlesP33_C03E0B959E775327989EE4DDE248085F14NotifyOnDeinit_onDeinit);
  v5 = self;
  uint64_t v6 = swift_retain();
  v4(v6);
  swift_release();
  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(NotifyOnDeinit *)&v7 dealloc];
}

- (void).cxx_destruct
{
}

- (_TtC12NewsArticlesP33_C03E0B959E775327989EE4DDE248085F14NotifyOnDeinit)init
{
  result = (_TtC12NewsArticlesP33_C03E0B959E775327989EE4DDE248085F14NotifyOnDeinit *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
@interface BooksEngagementPluginProvider
+ (void)performRequestWithObject:(id)a3 completion:(id)a4;
- (_TtC24BooksEngagementExtension29BooksEngagementPluginProvider)init;
@end

@implementation BooksEngagementPluginProvider

+ (void)performRequestWithObject:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  swift_unknownObjectRetain();
  sub_10000DCC8();
  swift_unknownObjectRelease();
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_100009998(v6, ObjCClassMetadata, (void (**)(void, void, void))v4);
  _Block_release(v4);
  sub_10000AB00((uint64_t)v6);
}

- (_TtC24BooksEngagementExtension29BooksEngagementPluginProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BooksEngagementPluginProvider();
  return [(BooksEngagementPluginProvider *)&v3 init];
}

@end
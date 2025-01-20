@interface NewsEngagementPluginProvider
+ (void)performRequestWithObject:(id)a3 completion:(id)a4;
- (_TtC23NewsEngagementExtension28NewsEngagementPluginProvider)init;
@end

@implementation NewsEngagementPluginProvider

+ (void)performRequestWithObject:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  swift_unknownObjectRetain();
  sub_100009F98();
  swift_unknownObjectRelease();
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1000082BC(v6, ObjCClassMetadata, (void (**)(void, void, void))v4);
  _Block_release(v4);
  sub_1000054FC((uint64_t)v6);
}

- (_TtC23NewsEngagementExtension28NewsEngagementPluginProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(NewsEngagementPluginProvider *)&v3 init];
}

@end
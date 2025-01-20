@interface EngagementExtensionProvider
+ (void)performRequestWithObject:(id)a3 completion:(id)a4;
- (_TtC26SeymourEngagementExtension27EngagementExtensionProvider)init;
@end

@implementation EngagementExtensionProvider

+ (void)performRequestWithObject:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  swift_unknownObjectRetain();
  sub_100006FA0();
  swift_unknownObjectRelease();
  sub_100004F74((uint64_t)v5, v4);
  _Block_release(v4);
  sub_100006398((uint64_t)v5);
}

- (_TtC26SeymourEngagementExtension27EngagementExtensionProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EngagementExtensionProvider();
  return [(EngagementExtensionProvider *)&v3 init];
}

@end
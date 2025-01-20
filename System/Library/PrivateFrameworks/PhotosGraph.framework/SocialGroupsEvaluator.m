@interface SocialGroupsEvaluator
+ (int64_t)defaultNumberOfElectedSocialGroups;
- (_TtC11PhotosGraph21SocialGroupsEvaluator)init;
@end

@implementation SocialGroupsEvaluator

+ (int64_t)defaultNumberOfElectedSocialGroups
{
  return 100;
}

- (_TtC11PhotosGraph21SocialGroupsEvaluator)init
{
  result = (_TtC11PhotosGraph21SocialGroupsEvaluator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph21SocialGroupsEvaluator_photoLibrary);
}

@end
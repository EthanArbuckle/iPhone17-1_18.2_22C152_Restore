@interface PGSocialGroupsElector
+ (int64_t)defaultNumberOfElectedSocialGroups;
- (PGSocialGroupsElector)init;
- (id)electedSocialGroupsMaxNumberOfElectedSocialGroups:(int64_t)a3 progressReporter:(id)a4 error:(id *)a5;
@end

@implementation PGSocialGroupsElector

+ (int64_t)defaultNumberOfElectedSocialGroups
{
  return 100;
}

- (id)electedSocialGroupsMaxNumberOfElectedSocialGroups:(int64_t)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = self;
  SocialGroupsElector.electSocialGroups(maxNumberOfElectedSocialGroups:progressReporter:)(a3, (uint64_t)v7);

  type metadata accessor for ElectedSocialGroup();
  v9 = (void *)sub_1D1EBE190();
  swift_bridgeObjectRelease();
  return v9;
}

- (PGSocialGroupsElector)init
{
  result = (PGSocialGroupsElector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGSocialGroupsElector_photoLibrary);
}

@end
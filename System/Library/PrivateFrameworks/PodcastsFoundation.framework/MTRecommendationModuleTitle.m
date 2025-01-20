@interface MTRecommendationModuleTitle
- (MTRecommendationModuleTitle)init;
- (NSString)stringForDisplay;
- (void)setStringForDisplay:(id)a3;
@end

@implementation MTRecommendationModuleTitle

- (NSString)stringForDisplay
{
  v2 = (char *)self + OBJC_IVAR___MTRecommendationModuleTitle_stringForDisplay;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setStringForDisplay:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1ACE761B8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MTRecommendationModuleTitle_stringForDisplay);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (MTRecommendationModuleTitle)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___MTRecommendationModuleTitle_stringForDisplay);
  *uint64_t v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(MTRecommendationModuleTitle *)&v6 init];
}

- (void).cxx_destruct
{
}

@end
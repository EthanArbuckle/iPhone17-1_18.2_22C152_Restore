@interface MTRecommendationModuleAttributes
- (MTRecommendationModuleAttributes)init;
- (MTRecommendationModuleTitle)title;
- (void)setTitle:(id)a3;
@end

@implementation MTRecommendationModuleAttributes

- (MTRecommendationModuleTitle)title
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MTRecommendationModuleAttributes_title);
  swift_beginAccess();
  return (MTRecommendationModuleTitle *)*v2;
}

- (void)setTitle:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MTRecommendationModuleAttributes_title);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (MTRecommendationModuleAttributes)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTRecommendationModuleAttributes_title) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTRecommendationModuleAttributes_resourceTypes) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(MTRecommendationModuleAttributes *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
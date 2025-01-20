@interface MTRecommendationModule
- (MTRecommendationModuleAttributes)attributes;
- (NSString)id;
- (NSString)type;
- (void)setId:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MTRecommendationModule

- (NSString)id
{
  return (NSString *)sub_1ACBCB784();
}

- (void)setId:(id)a3
{
}

- (NSString)type
{
  return (NSString *)sub_1ACBCB784();
}

- (void)setType:(id)a3
{
}

- (MTRecommendationModuleAttributes)attributes
{
  return (MTRecommendationModuleAttributes *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___MTRecommendationModule_attributes));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
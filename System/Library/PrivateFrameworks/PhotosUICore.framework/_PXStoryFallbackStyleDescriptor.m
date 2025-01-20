@interface _PXStoryFallbackStyleDescriptor
+ (_PXStoryFallbackStyleDescriptor)defaultFallbackStyleDescriptor;
- (BOOL)isCustomized;
- (NSString)originalColorGradeCategory;
- (PXStoryAutoEditDecisionList)autoEditDecisionList;
- (PXStorySongResource)songResource;
- (int64_t)customColorGradeKind;
@end

@implementation _PXStoryFallbackStyleDescriptor

- (BOOL)isCustomized
{
  return 0;
}

- (PXStoryAutoEditDecisionList)autoEditDecisionList
{
  return 0;
}

- (PXStorySongResource)songResource
{
  return 0;
}

- (int64_t)customColorGradeKind
{
  return 1;
}

- (NSString)originalColorGradeCategory
{
  return 0;
}

+ (_PXStoryFallbackStyleDescriptor)defaultFallbackStyleDescriptor
{
  if (defaultFallbackStyleDescriptor_onceToken != -1) {
    dispatch_once(&defaultFallbackStyleDescriptor_onceToken, &__block_literal_global_526);
  }
  v2 = (void *)defaultFallbackStyleDescriptor_defaultFallbackStyleDescriptor;
  return (_PXStoryFallbackStyleDescriptor *)v2;
}

@end
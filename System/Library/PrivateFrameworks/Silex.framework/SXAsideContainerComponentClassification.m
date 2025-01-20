@interface SXAsideContainerComponentClassification
+ (id)roleString;
+ (int)role;
- (unint64_t)contentRelevance;
@end

@implementation SXAsideContainerComponentClassification

+ (int)role
{
  return 8;
}

+ (id)roleString
{
  return @"aside";
}

- (unint64_t)contentRelevance
{
  return 3;
}

@end
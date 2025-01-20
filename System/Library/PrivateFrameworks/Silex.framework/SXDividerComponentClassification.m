@interface SXDividerComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (unint64_t)contentRelevance;
@end

@implementation SXDividerComponentClassification

+ (id)typeString
{
  return @"line";
}

+ (int)role
{
  return 9;
}

+ (id)roleString
{
  return @"divider";
}

- (unint64_t)contentRelevance
{
  return 3;
}

@end
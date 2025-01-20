@interface SXSectionComponentClassification
+ (id)roleString;
+ (int)role;
@end

@implementation SXSectionComponentClassification

+ (int)role
{
  return 30;
}

+ (id)roleString
{
  return @"section";
}

@end
@interface SXContainerComponentClassification
+ (id)roleString;
+ (int)role;
@end

@implementation SXContainerComponentClassification

+ (int)role
{
  return 7;
}

+ (id)roleString
{
  return @"container";
}

@end
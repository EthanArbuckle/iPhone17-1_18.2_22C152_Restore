@interface THMPVideoViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation THMPVideoViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"MPVideoView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end
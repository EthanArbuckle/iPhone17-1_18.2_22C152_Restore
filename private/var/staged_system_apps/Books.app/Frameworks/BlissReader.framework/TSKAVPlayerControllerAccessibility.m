@interface TSKAVPlayerControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxIsPlaying;
@end

@implementation TSKAVPlayerControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSKAVPlayerController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)tsaxIsPlaying
{
  return [(TSKAVPlayerControllerAccessibility *)self tsaxBoolValueForKey:@"isPlaying"];
}

@end
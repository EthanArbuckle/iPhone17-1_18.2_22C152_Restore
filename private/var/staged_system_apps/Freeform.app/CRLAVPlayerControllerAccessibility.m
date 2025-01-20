@interface CRLAVPlayerControllerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsPlaying;
- (void)crlaxTogglePlayback;
@end

@implementation CRLAVPlayerControllerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLAVPlayerController";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (BOOL)crlaxIsPlaying
{
  return [(CRLAVPlayerControllerAccessibility *)self crlaxBoolValueForKey:@"isPlaying"];
}

- (void)crlaxTogglePlayback
{
  id v3 = [(CRLAVPlayerControllerAccessibility *)self crlaxTarget];
  [v3 setPlaying:[self crlaxIsPlaying] ^ 1];
}

@end
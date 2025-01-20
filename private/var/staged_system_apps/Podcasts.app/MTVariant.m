@interface MTVariant
+ (BOOL)isInternalUIBuild;
@end

@implementation MTVariant

+ (BOOL)isInternalUIBuild
{
  return _os_variant_has_internal_ui("com.apple.podcasts", a2);
}

@end
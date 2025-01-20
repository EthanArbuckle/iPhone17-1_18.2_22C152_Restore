@interface UITraitCollection(MobileSafariExtras)
+ (id)safari_traitsAffectingTextAppearance;
+ (id)safari_traitsAffectingVisualEffects;
+ (void)safari_removeAllCustomTraits:()MobileSafariExtras;
- (BOOL)sf_usesSidebarPresentation;
- (BOOL)sf_usesVibrantAppearance;
- (id)sf_traitCollectionWithAlternateUserInterfaceColorAsPrimary;
- (uint64_t)safari_barTintStyle;
- (uint64_t)sf_alternateTintColor;
- (uint64_t)sf_alternateUserInterfaceStyle;
- (uint64_t)sf_backgroundBlurEffect;
@end

@implementation UITraitCollection(MobileSafariExtras)

- (id)sf_traitCollectionWithAlternateUserInterfaceColorAsPrimary
{
  uint64_t v2 = objc_msgSend(a1, "sf_alternateUserInterfaceStyle");
  if (v2)
  {
    id v3 = [a1 traitCollectionByReplacingNSIntegerValue:v2 forTrait:objc_opt_class()];
  }
  else
  {
    id v3 = a1;
  }

  return v3;
}

- (uint64_t)sf_alternateUserInterfaceStyle
{
  uint64_t v2 = objc_opt_class();

  return [a1 valueForNSIntegerTrait:v2];
}

- (uint64_t)sf_alternateTintColor
{
  uint64_t v2 = objc_opt_class();

  return [a1 objectForTrait:v2];
}

- (uint64_t)sf_backgroundBlurEffect
{
  uint64_t v2 = objc_opt_class();

  return [a1 objectForTrait:v2];
}

- (BOOL)sf_usesVibrantAppearance
{
  return [a1 valueForNSIntegerTrait:objc_opt_class()] != 0;
}

+ (void)safari_removeAllCustomTraits:()MobileSafariExtras
{
  id v3 = a3;
  [v3 removeTrait:objc_opt_class()];
  [v3 removeTrait:objc_opt_class()];
  [v3 removeTrait:objc_opt_class()];
  [v3 removeTrait:objc_opt_class()];
}

+ (id)safari_traitsAffectingTextAppearance
{
  if (safari_traitsAffectingTextAppearance_onceToken != -1) {
    dispatch_once(&safari_traitsAffectingTextAppearance_onceToken, &__block_literal_global_35);
  }
  v0 = (void *)safari_traitsAffectingTextAppearance_traits;

  return v0;
}

+ (id)safari_traitsAffectingVisualEffects
{
  if (safari_traitsAffectingVisualEffects_onceToken != -1) {
    dispatch_once(&safari_traitsAffectingVisualEffects_onceToken, &__block_literal_global_62);
  }
  v0 = (void *)safari_traitsAffectingVisualEffects_traits;

  return v0;
}

- (uint64_t)safari_barTintStyle
{
  uint64_t v2 = objc_opt_class();

  return [a1 valueForNSIntegerTrait:v2];
}

- (BOOL)sf_usesSidebarPresentation
{
  return [a1 valueForNSIntegerTrait:objc_opt_class()] != 0;
}

@end
@interface UITraitCollection
@end

@implementation UITraitCollection

void __77__UITraitCollection_MobileSafariExtras__safari_traitsAffectingTextAppearance__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)safari_traitsAffectingTextAppearance_traits;
  safari_traitsAffectingTextAppearance_traits = v0;
}

void __76__UITraitCollection_MobileSafariExtras__safari_traitsAffectingVisualEffects__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)safari_traitsAffectingVisualEffects_traits;
  safari_traitsAffectingVisualEffects_traits = v0;
}

@end
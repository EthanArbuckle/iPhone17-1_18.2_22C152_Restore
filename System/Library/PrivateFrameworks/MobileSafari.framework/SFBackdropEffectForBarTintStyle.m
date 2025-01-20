@interface SFBackdropEffectForBarTintStyle
@end

@implementation SFBackdropEffectForBarTintStyle

void ___SFBackdropEffectForBarTintStyle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB14C8] effectWithStyle:15];
  v1 = (void *)_SFBackdropEffectForBarTintStyle_lightEffect;
  _SFBackdropEffectForBarTintStyle_lightEffect = v0;

  uint64_t v2 = [MEMORY[0x1E4FB14C8] effectWithStyle:20];
  v3 = (void *)_SFBackdropEffectForBarTintStyle_darkEffect;
  _SFBackdropEffectForBarTintStyle_darkEffect = v2;
}

@end
@interface NSSymbolContentTransition(UIKitAdditions)
- (id)ui_animationConfigurationFromSymbolImage:()UIKitAdditions toSymbolImage:options:completion:;
- (uint64_t)ui_isSupportedByImageView;
@end

@implementation NSSymbolContentTransition(UIKitAdditions)

- (uint64_t)ui_isSupportedByImageView
{
  unint64_t v1 = [a1 _effectType];
  return (v1 < 0xC) & (0x980u >> v1);
}

- (id)ui_animationConfigurationFromSymbolImage:()UIKitAdditions toSymbolImage:options:completion:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v16 = [a1 _effectType];
  if (v16 == 7)
  {
    id v18 = a1;
    if ([v18 _style] || (dyld_program_sdk_at_least() & 1) == 0)
    {
      int v19 = 96;
      goto LABEL_11;
    }
LABEL_10:
    int v19 = 0;
LABEL_11:
    uint64_t v20 = [v18 _layerBehavior];
    uint64_t v21 = [v18 _style];
    unsigned int v22 = v19 | 3;
    int v23 = v19 | 2;
    if (v21 != 1) {
      int v23 = v19;
    }
    if (v21 != 2) {
      unsigned int v22 = v23;
    }
    if (v21 == 3) {
      uint64_t v24 = v19 | 4u;
    }
    else {
      uint64_t v24 = v22;
    }
    v25 = [NSNumber numberWithUnsignedInt:v24];
    [v15 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F96090]];

    if (v20 == 2)
    {
      uint64_t v26 = *MEMORY[0x1E4F96070];
      uint64_t v27 = MEMORY[0x1E4F1CC28];
    }
    else
    {
      if (v20 != 1)
      {
LABEL_24:
        uint64_t v17 = 6;
        goto LABEL_25;
      }
      uint64_t v26 = *MEMORY[0x1E4F96070];
      uint64_t v27 = MEMORY[0x1E4F1CC38];
    }
    [v15 setObject:v27 forKeyedSubscript:v26];
    goto LABEL_24;
  }
  if (v16 == 11)
  {
    id v18 = [a1 _fallback];
    goto LABEL_10;
  }
  if (v16 != 8)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:a1 file:@"NSSymbolEffect+UIKitAdditions.m" lineNumber:543 description:@"Unsupported content transition type added to image view"];

    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_25;
  }
  if ([v11 _isSameSymbolImageExceptVariableValue:v12])
  {
    uint64_t v17 = 0;
LABEL_25:
    [v13 _speed];
    v30 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(fmin(v29, 2.0), 0.5));
    [v15 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F960A0]];

    if (v14)
    {
      v31 = _Block_copy(v14);
      [v15 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F96078]];
    }
    v32 = objc_opt_new();
    [v32 setAnimation:v17];
    [v32 setOptions:v15];
    goto LABEL_28;
  }
  if (qword_1EB264DF0 != -1) {
    dispatch_once(&qword_1EB264DF0, &__block_literal_global_619);
  }
  v32 = objc_msgSend((id)_MergedGlobals_1302, "ui_animationConfigurationFromSymbolImage:toSymbolImage:options:completion:", v11, v12, v13, v14);
LABEL_28:

  return v32;
}

@end
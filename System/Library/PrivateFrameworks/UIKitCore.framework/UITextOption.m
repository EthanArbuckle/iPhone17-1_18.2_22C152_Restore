@interface UITextOption
@end

@implementation UITextOption

uint64_t __53___UITextOption_setLightingEffectEnabled_atPosition___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setEffect:0];
}

void __55___UITextOption_insetMultiplierForContentSizeCategory___block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UICTContentSizeCategoryXL";
  v2[1] = @"UICTContentSizeCategoryXXL";
  v3[0] = &unk_1ED3F1D28;
  v3[1] = &unk_1ED3F1D38;
  v2[2] = @"UICTContentSizeCategoryXXXL";
  v2[3] = @"UICTContentSizeCategoryAccessibilityM";
  v3[2] = &unk_1ED3F1D48;
  v3[3] = &unk_1ED3F1D58;
  v2[4] = @"UICTContentSizeCategoryAccessibilityL";
  v2[5] = @"UICTContentSizeCategoryAccessibilityXL";
  v3[4] = &unk_1ED3F1D68;
  v3[5] = &unk_1ED3F1D78;
  v2[6] = @"UICTContentSizeCategoryAccessibilityXXL";
  v2[7] = @"UICTContentSizeCategoryAccessibilityXXXL";
  v3[6] = &unk_1ED3F1D88;
  v3[7] = &unk_1ED3F1D98;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)_MergedGlobals_23_1;
  _MergedGlobals_23_1 = v0;
}

void __31___UITextOption_baseSymbolSize__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UICTContentSizeCategoryXL";
  v2[1] = @"UICTContentSizeCategoryXXL";
  v3[0] = &unk_1ED3F4158;
  v3[1] = &unk_1ED3F4170;
  v2[2] = @"UICTContentSizeCategoryXXXL";
  v2[3] = @"UICTContentSizeCategoryAccessibilityM";
  v3[2] = &unk_1ED3F4188;
  v3[3] = &unk_1ED3F1DA8;
  v2[4] = @"UICTContentSizeCategoryAccessibilityL";
  v2[5] = @"UICTContentSizeCategoryAccessibilityXL";
  v3[4] = &unk_1ED3F1DA8;
  v3[5] = &unk_1ED3F1DA8;
  v2[6] = @"UICTContentSizeCategoryAccessibilityXXL";
  v2[7] = @"UICTContentSizeCategoryAccessibilityXXXL";
  v3[6] = &unk_1ED3F1DA8;
  v3[7] = &unk_1ED3F1DA8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)qword_1EB25E738;
  qword_1EB25E738 = v0;
}

@end
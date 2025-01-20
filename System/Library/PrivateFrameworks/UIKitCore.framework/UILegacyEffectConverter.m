@interface UILegacyEffectConverter
@end

@implementation UILegacyEffectConverter

void __43___UILegacyEffectConverter_sharedConverter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_954;
  _MergedGlobals_954 = v0;
}

uint64_t __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addFilterEntry:a2];
}

uint64_t __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addViewEffect:a2];
}

void __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_3(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_4;
  v6[3] = &unk_1E52DD6A8;
  uint64_t v3 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  v6[5] = v3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_5;
  v4[3] = &unk_1E52DD680;
  id v5 = *(id *)(a1 + 40);
  _UILegacyEffectConvertLayerConfig(a2, v6, v4);
}

void __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  [v2 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"_UILegacyEffectSupport.m" lineNumber:165 description:@"Filter effects are not supported on underlay layer configs"];
}

uint64_t __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addUnderlay:a2];
}

@end
@interface PAE
@end

@implementation PAE

uint64_t __26__PAE_HLG_OETF_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:67584];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:591872];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:3];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], @"PixelTransformSupport", v1, @"PixelIndependent", v2, @"PositionIndependent", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", v6, @"SDRWorkingSpace", v7, @"HDRWorkingSpace", v8,
             @"AutoColorProcessingSupport",
             0);
  -[PAE_HLG_OETF properties]::sPropertiesDict = result;
  return result;
}

uint64_t __34__PAE_HLG_Inverse_OETF_properties__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v1 = [NSNumber numberWithBool:1];
  uint64_t v2 = [NSNumber numberWithBool:1];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:67584];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:591872];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:3];
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], @"PixelTransformSupport", v1, @"PixelIndependent", v2, @"PositionIndependent", v3, @"MayRemapTime", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", v6, @"SDRWorkingSpace", v7, @"HDRWorkingSpace", v8,
             @"AutoColorProcessingSupport",
             0);
  -[PAE_HLG_Inverse_OETF properties]::sPropertiesDict = result;
  return result;
}

@end
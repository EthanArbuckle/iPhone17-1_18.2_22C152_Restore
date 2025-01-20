@interface NURAWToneCurveProperties
@end

@implementation NURAWToneCurveProperties

void __53___NURAWToneCurveProperties__generateGainMapExposure__block_invoke()
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _synthGainInput(float y) \n{ \n  return vec4(y,y,y,1.0);\n}\n"];
  v1 = (void *)_generateGainMapExposure_s_synthGainInputKernel;
  _generateGainMapExposure_s_synthGainInputKernel = v0;

  v2 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v3 = *MEMORY[0x1E4F1E208];
  v7[0] = *MEMORY[0x1E4F1E1E0];
  v7[1] = v3;
  v8[0] = MEMORY[0x1E4F1CC28];
  v8[1] = @"SyntheticGainMapSearch";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v5 = [v2 contextWithOptions:v4];
  v6 = (void *)_generateGainMapExposure_ctx;
  _generateGainMapExposure_ctx = v5;
}

@end
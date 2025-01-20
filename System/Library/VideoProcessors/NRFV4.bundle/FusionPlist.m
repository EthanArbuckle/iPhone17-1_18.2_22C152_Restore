@interface FusionPlist
+ (void)initialize;
- (FusionPlist)init;
- (void)applyOverrides;
@end

@implementation FusionPlist

+ (void)initialize
{
  motionDetectionOverride = 2;
  preWarpInputsOverride = 2;
  lowLightHybridRegOverride = -1;
}

- (FusionPlist)init
{
  v8.receiver = self;
  v8.super_class = (Class)FusionPlist;
  v2 = [(FusionPlist *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    bands = v2->bands;
    v2->bands = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    toneMapSmoothingBands = v2->toneMapSmoothingBands;
    v2->toneMapSmoothingBands = v5;
  }
  return v2;
}

- (void)applyOverrides
{
  if (motionDetectionOverride <= 1) {
    self->enableMotionDetection = motionDetectionOverride == 1;
  }
  if (preWarpInputsOverride <= 1) {
    self->preWarpInputs = preWarpInputsOverride == 1;
  }
  if ((lowLightHybridRegOverride & 0x80000000) == 0) {
    self->hybridRegistrationMode = lowLightHybridRegOverride;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->patchBasedFusionParametersLUTs, 0);
  objc_storeStrong((id *)&self->nonShadowDenseBlendStrength, 0);
  objc_storeStrong((id *)&self->shadowDenseBlendStrength, 0);
  objc_storeStrong((id *)&self->lensShadingFactorLUT, 0);
  objc_storeStrong((id *)&self->toneMapSmoothingBands, 0);

  objc_storeStrong((id *)&self->bands, 0);
}

@end
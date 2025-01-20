@interface BandDataFusion
- (BandDataFusion)init;
@end

@implementation BandDataFusion

- (BandDataFusion)init
{
  v10.receiver = self;
  v10.super_class = (Class)BandDataFusion;
  v2 = [(BandDataFusion *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    diffWeight = v2->diffWeight;
    v2->diffWeight = (PerReferenceBandata *)v3;

    uint64_t v5 = objc_opt_new();
    lumaFusionStrength = v2->lumaFusionStrength;
    v2->lumaFusionStrength = (PerReferenceBandata *)v5;

    uint64_t v7 = objc_opt_new();
    chromaFusionStrength = v2->chromaFusionStrength;
    v2->chromaFusionStrength = (PerReferenceBandata *)v7;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->chromaFusionStrength, 0);
  objc_storeStrong((id *)&self->lumaFusionStrength, 0);
  objc_storeStrong((id *)&self->diffWeight, 0);
  objc_storeStrong((id *)&self->decayEdgeBoost, 0);
  objc_storeStrong((id *)&self->chromaBlackThreshold, 0);
  objc_storeStrong((id *)&self->lumaBlackThreshold, 0);

  objc_storeStrong((id *)&self->adaptive_blur, 0);
}

@end
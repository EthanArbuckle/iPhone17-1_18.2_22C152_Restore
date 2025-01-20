@interface BandDataDAS
@end

@implementation BandDataDAS

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->blueBoost, 0);
  objc_storeStrong((id *)&self->radialSharpnessBoost, 0);
  objc_storeStrong((id *)&self->radialFlatnessBoost, 0);
  objc_storeStrong((id *)&self->gdTexturenessShadingFactor, 0);
  objc_storeStrong((id *)&self->gdTexturenessThresholdHigh, 0);
  objc_storeStrong((id *)&self->gdTexturenessThresholdLow, 0);
  objc_storeStrong((id *)&self->gdFlatnessBoostHighlight, 0);
  objc_storeStrong((id *)&self->gdFlatnessBoostShadow, 0);
  objc_storeStrong((id *)&self->gdFlatnessMidtoneValue, 0);
  objc_storeStrong((id *)&self->gdFlatnessBoostMidtone, 0);
  objc_storeStrong((id *)&self->flatnessThreshold, 0);
  objc_storeStrong((id *)&self->flatnessBoost, 0);
  objc_storeStrong((id *)&self->haloStrength, 0);
  objc_storeStrong((id *)&self->lumaLowVarDetailsLevelStaticScene, 0);
  objc_storeStrong((id *)&self->lumaLowVarSharpeningStrengthStaticScene, 0);
  objc_storeStrong((id *)&self->luma3x3SharpeningStrengthStaticScene, 0);
  objc_storeStrong((id *)&self->lumaDenoisingScalingOnSkinStaticScene, 0);
  objc_storeStrong((id *)&self->lumaSharpeningScalingOnSkinStaticScene, 0);
  objc_storeStrong((id *)&self->lumaDenoiseMixingCoeffStaticScene, 0);
  objc_storeStrong((id *)&self->lumaDenoiseThresholdGainStaticScene, 0);
  objc_storeStrong((id *)&self->lumaLowVarDetailsLevel, 0);
  objc_storeStrong((id *)&self->lumaLowVarSharpeningStrength, 0);
  objc_storeStrong((id *)&self->luma3x3SharpeningStrength, 0);
  objc_storeStrong((id *)&self->lumaDenoisingScalingOnSky, 0);
  objc_storeStrong((id *)&self->lumaSharpeningScalingOnSky, 0);
  objc_storeStrong((id *)&self->lumaDenoisingScalingOnSkin, 0);
  objc_storeStrong((id *)&self->lumaSharpeningScalingOnSkin, 0);
  objc_storeStrong((id *)&self->lumaDenoiseMixingCoeff, 0);
  objc_storeStrong((id *)&self->lumaDenoiseThresholdGain, 0);
  objc_storeStrong((id *)&self->chromaDenoiseMixingCoeff, 0);
  objc_storeStrong((id *)&self->chromaDenoiseChromaThresholdGain, 0);

  objc_storeStrong((id *)&self->chromaDenoiseLumaThresholdGain, 0);
}

@end
@interface NRFPlist
@end

@implementation NRFPlist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->outputNoiseModel, 0);
  objc_storeStrong((id *)&self->miwbPlist, 0);
  objc_storeStrong((id *)&self->quadraLearnedNRTuning, 0);
  objc_storeStrong((id *)&self->learnedNRTuning, 0);
  objc_storeStrong((id *)&self->postDemosaicTuning, 0);
  objc_storeStrong((id *)&self->zimmerDEMTuning, 0);
  objc_storeStrong((id *)&self->qdemTuning, 0);
  objc_storeStrong((id *)&self->lumaSharpenTuning, 0);
  objc_storeStrong((id *)&self->powerBlurTuning, 0);
  objc_storeStrong((id *)&self->greenGhostLowLightTuning, 0);
  objc_storeStrong((id *)&self->greenGhostBrightLightTuning, 0);
  objc_storeStrong((id *)&self->semanticStyles, 0);
  objc_storeStrong((id *)&self->defringingTuningParameters, 0);
  objc_storeStrong((id *)&self->gainMap, 0);
  objc_storeStrong((id *)&self->frameSelection, 0);
  objc_storeStrong((id *)&self->proxyAssetEVMRefDenoising, 0);
  objc_storeStrong((id *)&self->proxyAssetEV0RefDenoising, 0);
  objc_storeStrong((id *)&self->syntheticReference, 0);
  objc_storeStrong((id *)&self->toneMapping, 0);
  objc_storeStrong((id *)&self->noiseModel, 0);
  objc_storeStrong((id *)&self->fusion, 0);
  objc_storeStrong((id *)&self->denoiseAndSharpening, 0);

  objc_storeStrong((id *)&self->common, 0);
}

@end
@interface DFPlist
@end

@implementation DFPlist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->outputNoiseModel, 0);
  objc_storeStrong((id *)&self->miwbPlist, 0);
  objc_storeStrong((id *)&self->quadraDenoiseAndSharpening, 0);
  objc_storeStrong((id *)&self->quadraNoiseModel, 0);
  objc_storeStrong((id *)&self->quadraToneMapping, 0);
  objc_storeStrong((id *)&self->quadraLearnedNRTuning, 0);
  objc_storeStrong((id *)&self->postDemosaicTuning, 0);
  objc_storeStrong((id *)&self->gainMap, 0);
  objc_storeStrong((id *)&self->zimmerDEMTuning, 0);
  objc_storeStrong((id *)&self->qdemTuning, 0);
  objc_storeStrong((id *)&self->lumaSharpenTuning, 0);
  objc_storeStrong((id *)&self->powerBlurTuning, 0);
  objc_storeStrong((id *)&self->rawDFNetworkStageParameters, 0);
  objc_storeStrong((id *)&self->greenGhostBrightLightTuning, 0);
  objc_storeStrong((id *)&self->defringingTuningParameters, 0);
  objc_storeStrong((id *)&self->deferredProcessing, 0);
  objc_storeStrong((id *)&self->denoiseAndSharpening, 0);
  objc_storeStrong((id *)&self->noiseModel, 0);
  objc_storeStrong((id *)&self->syntheticReference, 0);
  objc_storeStrong((id *)&self->syntheticLong, 0);
  objc_storeStrong((id *)&self->semanticStyles, 0);

  objc_storeStrong((id *)&self->toneMapping, 0);
}

@end
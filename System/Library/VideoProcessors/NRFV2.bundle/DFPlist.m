@interface DFPlist
@end

@implementation DFPlist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->defringingTuningParameters, 0);
  objc_storeStrong((id *)&self->deferredProcessing, 0);
  objc_storeStrong((id *)&self->denoiseAndSharpening, 0);
  objc_storeStrong((id *)&self->noiseModel, 0);
  objc_storeStrong((id *)&self->syntheticLong, 0);
  objc_storeStrong((id *)&self->semanticStyles, 0);

  objc_storeStrong((id *)&self->toneMapping, 0);
}

@end
@interface ToneMappingBuffers
- (ToneMappingBuffers)init;
@end

@implementation ToneMappingBuffers

- (ToneMappingBuffers)init
{
  v3.receiver = self;
  v3.super_class = (Class)ToneMappingBuffers;
  result = [(ToneMappingBuffers *)&v3 init];
  if (result) {
    result->inputLumaPedestal = 0.0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->curves, 0);
  objc_storeStrong((id *)&self->faceLandmarks, 0);
  objc_storeStrong((id *)&self->maskConfidences, 0);
  objc_storeStrong((id *)&self->skinToneClassification, 0);
  for (uint64_t i = 96; i != 64; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->skyMask, 0);
  objc_storeStrong((id *)&self->personMask, 0);
  objc_storeStrong((id *)&self->skinMask, 0);
  objc_storeStrong((id *)&self->outChromaTex, 0);
  objc_storeStrong((id *)&self->outLumaTex, 0);
  objc_storeStrong((id *)&self->localGainMapTex, 0);
  objc_storeStrong((id *)&self->inChromaTex, 0);

  objc_storeStrong((id *)&self->inLumaTex, 0);
}

@end
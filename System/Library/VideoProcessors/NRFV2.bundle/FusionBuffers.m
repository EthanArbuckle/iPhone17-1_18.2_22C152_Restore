@interface FusionBuffers
@end

@implementation FusionBuffers

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ggMaxFusionWeights, 0);
  objc_storeStrong((id *)&self->fusedChromaTex, 0);
  objc_storeStrong((id *)&self->fusedLumaTex, 0);
  objc_storeStrong((id *)&self->noiseMapChromaTex, 0);
  objc_storeStrong((id *)&self->noiseMapLumaTex, 0);

  objc_storeStrong((id *)&self->simMapTex, 0);
}

@end
@interface GreenGhostBuffers
@end

@implementation GreenGhostBuffers

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ggMaxFusionWeights, 0);
  objc_storeStrong((id *)&self->_fusedChroma, 0);

  objc_storeStrong((id *)&self->_fusedLuma, 0);
}

@end
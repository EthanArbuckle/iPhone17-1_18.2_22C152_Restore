@interface DeepFusionChromaBoostMaskBandData
@end

@implementation DeepFusionChromaBoostMaskBandData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->edgeMatchEnd, 0);
  objc_storeStrong((id *)&self->edgeMatchStart, 0);
  objc_storeStrong((id *)&self->colorMatchEnd, 0);

  objc_storeStrong((id *)&self->colorMatchStart, 0);
}

@end
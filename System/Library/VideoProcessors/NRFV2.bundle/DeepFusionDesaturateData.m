@interface DeepFusionDesaturateData
@end

@implementation DeepFusionDesaturateData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->strength, 0);
  objc_storeStrong((id *)&self->sigma, 0);

  objc_storeStrong((id *)&self->yThresh, 0);
}

@end
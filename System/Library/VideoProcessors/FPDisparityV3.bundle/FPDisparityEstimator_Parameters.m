@interface FPDisparityEstimator_Parameters
- (FPDisparityEstimator_CostParameters)FPcostParameters;
- (FPDisparityEstimator_PostprocessingParameters)FPpostprocessingParameters;
- (FPDisparityEstimator_PreprocessingParameters)FPpreprocessingParameters;
- (NSArray)levelsParameters;
- (void)setFPcostParameters:(id)a3;
- (void)setFPpostprocessingParameters:(id)a3;
- (void)setFPpreprocessingParameters:(id)a3;
- (void)setLevelsParameters:(id)a3;
@end

@implementation FPDisparityEstimator_Parameters

- (FPDisparityEstimator_CostParameters)FPcostParameters
{
  return self->_FPcostParameters;
}

- (void)setFPcostParameters:(id)a3
{
}

- (FPDisparityEstimator_PreprocessingParameters)FPpreprocessingParameters
{
  return self->_FPpreprocessingParameters;
}

- (void)setFPpreprocessingParameters:(id)a3
{
}

- (NSArray)levelsParameters
{
  return self->_levelsParameters;
}

- (void)setLevelsParameters:(id)a3
{
}

- (FPDisparityEstimator_PostprocessingParameters)FPpostprocessingParameters
{
  return self->_FPpostprocessingParameters;
}

- (void)setFPpostprocessingParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_FPpostprocessingParameters, 0);
  objc_storeStrong((id *)&self->_levelsParameters, 0);
  objc_storeStrong((id *)&self->_FPpreprocessingParameters, 0);

  objc_storeStrong((id *)&self->_FPcostParameters, 0);
}

@end
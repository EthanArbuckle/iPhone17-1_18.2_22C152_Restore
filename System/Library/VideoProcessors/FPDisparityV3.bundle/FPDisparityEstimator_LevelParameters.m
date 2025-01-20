@interface FPDisparityEstimator_LevelParameters
- (FPDisparityEstimator_CostLevelParameters)costParameters;
- (FPDisparityEstimator_RegularizationParameters)regularizationParameters;
- (HBFGPUParameters)hbfParameters;
- (TVL1_v3_SolverParameters)solverParameters;
- (void)setCostParameters:(id)a3;
- (void)setHbfParameters:(id)a3;
- (void)setRegularizationParameters:(id)a3;
- (void)setSolverParameters:(id)a3;
@end

@implementation FPDisparityEstimator_LevelParameters

- (FPDisparityEstimator_RegularizationParameters)regularizationParameters
{
  return self->_regularizationParameters;
}

- (void)setRegularizationParameters:(id)a3
{
}

- (TVL1_v3_SolverParameters)solverParameters
{
  return self->_solverParameters;
}

- (void)setSolverParameters:(id)a3
{
}

- (HBFGPUParameters)hbfParameters
{
  return self->_hbfParameters;
}

- (void)setHbfParameters:(id)a3
{
}

- (FPDisparityEstimator_CostLevelParameters)costParameters
{
  return self->_costParameters;
}

- (void)setCostParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_costParameters, 0);
  objc_storeStrong((id *)&self->_hbfParameters, 0);
  objc_storeStrong((id *)&self->_solverParameters, 0);

  objc_storeStrong((id *)&self->_regularizationParameters, 0);
}

@end
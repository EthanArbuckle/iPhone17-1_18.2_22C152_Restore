@interface TRIActiveFactorProvidersParserGuardedData
@end

@implementation TRIActiveFactorProvidersParserGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->targetedExperimentFactorPackDeploymentMap, 0);
  objc_storeStrong((id *)&self->targetedRolloutDeploymentMap, 0);
  objc_storeStrong((id *)&self->plplist, 0);
}

@end
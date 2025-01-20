@interface TRINamespaceResolverGuardedData
@end

@implementation TRINamespaceResolverGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->targetedBMLTDeploymentMap, 0);
  objc_storeStrong((id *)&self->targetedExperimentNamespaceDescriptorDeploymentMap, 0);
}

@end
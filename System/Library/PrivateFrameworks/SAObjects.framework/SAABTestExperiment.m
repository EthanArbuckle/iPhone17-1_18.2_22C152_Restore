@interface SAABTestExperiment
- (NSString)deploymentId;
- (NSString)experimentId;
- (NSString)treatmentId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDeploymentId:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setTreatmentId:(id)a3;
@end

@implementation SAABTestExperiment

- (id)groupIdentifier
{
  return @"com.apple.ace.experimentation";
}

- (id)encodedClassName
{
  return @"Experiment";
}

- (NSString)deploymentId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deploymentId"];
}

- (void)setDeploymentId:(id)a3
{
}

- (NSString)experimentId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"experimentId"];
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)treatmentId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"treatmentId"];
}

- (void)setTreatmentId:(id)a3
{
}

@end
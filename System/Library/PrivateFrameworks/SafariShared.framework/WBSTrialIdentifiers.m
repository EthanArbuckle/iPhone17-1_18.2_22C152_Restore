@interface WBSTrialIdentifiers
- (NSString)experimentId;
- (NSString)namespaceName;
- (NSString)treatmentId;
- (void)setExperimentId:(id)a3;
- (void)setNamespaceName:(id)a3;
- (void)setTreatmentId:(id)a3;
@end

@implementation WBSTrialIdentifiers

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (void)setNamespaceName:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

@end
@interface PHACurareShadowEvaluationRecipeOptions
- (NSArray)modelInfoArray;
- (NSString)trialDeploymentID;
- (NSString)trialExperimentID;
- (NSString)trialTreatmentID;
- (PHACurareShadowEvaluationRecipeOptions)init;
- (void)setModelInfoArray:(id)a3;
- (void)setTrialDeploymentID:(id)a3;
- (void)setTrialExperimentID:(id)a3;
- (void)setTrialTreatmentID:(id)a3;
@end

@implementation PHACurareShadowEvaluationRecipeOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelInfoArray, 0);
  objc_storeStrong((id *)&self->_trialTreatmentID, 0);
  objc_storeStrong((id *)&self->_trialExperimentID, 0);

  objc_storeStrong((id *)&self->_trialDeploymentID, 0);
}

- (void)setModelInfoArray:(id)a3
{
}

- (NSArray)modelInfoArray
{
  return self->_modelInfoArray;
}

- (void)setTrialTreatmentID:(id)a3
{
}

- (NSString)trialTreatmentID
{
  return self->_trialTreatmentID;
}

- (void)setTrialExperimentID:(id)a3
{
}

- (NSString)trialExperimentID
{
  return self->_trialExperimentID;
}

- (void)setTrialDeploymentID:(id)a3
{
}

- (NSString)trialDeploymentID
{
  return self->_trialDeploymentID;
}

- (PHACurareShadowEvaluationRecipeOptions)init
{
  v10.receiver = self;
  v10.super_class = (Class)PHACurareShadowEvaluationRecipeOptions;
  v2 = [(PHAPrivateFederatedLearningRecipeOptions *)&v10 init];
  v3 = v2;
  if (v2)
  {
    trialDeploymentID = v2->_trialDeploymentID;
    v2->_trialDeploymentID = 0;

    trialExperimentID = v3->_trialExperimentID;
    v3->_trialExperimentID = 0;

    trialTreatmentID = v3->_trialTreatmentID;
    v3->_trialTreatmentID = 0;

    v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    modelInfoArray = v3->_modelInfoArray;
    v3->_modelInfoArray = v7;
  }
  return v3;
}

@end
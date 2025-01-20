@interface SiriTTSTrainerTaskInternal
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrentTrainingStageDone;
- (NSString)agentInferenceAssetPath;
- (NSString)agentTrainingAssetPath;
- (SiriTTSTrainer)currentTrainer;
- (SiriTTSTrainerTaskInternal)initWithCoder:(id)a3;
- (id)getSuperTask;
- (void)encodeWithCoder:(id)a3;
- (void)setAgentInferenceAssetPath:(id)a3;
- (void)setAgentTrainingAssetPath:(id)a3;
- (void)setCurrentTrainer:(id)a3;
@end

@implementation SiriTTSTrainerTaskInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriTTSTrainerTaskInternal;
  id v4 = a3;
  [(SiriTTSTrainerTaskInternal *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_agentTrainingAssetPath, @"agentTrainingAssetPath", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_agentInferenceAssetPath forKey:@"agentInferenceAssetPath"];
}

- (SiriTTSTrainerTaskInternal)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SiriTTSTrainerTaskInternal;
  id v3 = a3;
  id v4 = [(SiriTTSTrainerTaskInternal *)&v10 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"agentTrainingAssetPath", v10.receiver, v10.super_class);
  agentTrainingAssetPath = v4->_agentTrainingAssetPath;
  v4->_agentTrainingAssetPath = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"agentInferenceAssetPath"];

  agentInferenceAssetPath = v4->_agentInferenceAssetPath;
  v4->_agentInferenceAssetPath = (NSString *)v7;

  return v4;
}

- (id)getSuperTask
{
  id v3 = objc_alloc_init((Class)SiriTTSTrainerTask);
  id v4 = [(SiriTTSTrainerTaskInternal *)self taskId];
  [v3 setTaskId:v4];

  uint64_t v5 = [(SiriTTSTrainerTaskInternal *)self trainingAssetPath];
  [v3 setTrainingAssetPath:v5];

  v6 = [(SiriTTSTrainerTaskInternal *)self dataAssetPath];
  [v3 setDataAssetPath:v6];

  uint64_t v7 = [(SiriTTSTrainerTaskInternal *)self inferenceAssetPath];
  [v3 setInferenceAssetPath:v7];

  objc_msgSend(v3, "setForceToStart:", -[SiriTTSTrainerTaskInternal forceToStart](self, "forceToStart"));
  objc_msgSend(v3, "setTaskStatus:", -[SiriTTSTrainerTaskInternal taskStatus](self, "taskStatus"));
  objc_msgSend(v3, "setTaskMode:", -[SiriTTSTrainerTaskInternal taskMode](self, "taskMode"));
  objc_msgSend(v3, "setTrainingStatus:", -[SiriTTSTrainerTaskInternal trainingStatus](self, "trainingStatus"));
  objc_msgSend(v3, "setCurrentTaskStatusProgressValue:", -[SiriTTSTrainerTaskInternal currentTaskStatusProgressValue](self, "currentTaskStatusProgressValue"));
  objc_msgSend(v3, "setTotalTaskStatusProgressValue:", -[SiriTTSTrainerTaskInternal totalTaskStatusProgressValue](self, "totalTaskStatusProgressValue"));
  [(SiriTTSTrainerTaskInternal *)self normalizedProgressValue];
  objc_msgSend(v3, "setNormalizedProgressValue:");
  objc_msgSend(v3, "setAssetVersion:", -[SiriTTSTrainerTaskInternal assetVersion](self, "assetVersion"));

  return v3;
}

- (BOOL)isCurrentTrainingStageDone
{
  BOOL result = 0;
  if ((uint64_t)[(SiriTTSTrainerTaskInternal *)self totalTaskStatusProgressValue] >= 1)
  {
    id v3 = [(SiriTTSTrainerTaskInternal *)self currentTaskStatusProgressValue];
    if (v3 == [(SiriTTSTrainerTaskInternal *)self totalTaskStatusProgressValue]) {
      return 1;
    }
  }
  return result;
}

- (NSString)agentTrainingAssetPath
{
  return self->_agentTrainingAssetPath;
}

- (void)setAgentTrainingAssetPath:(id)a3
{
}

- (NSString)agentInferenceAssetPath
{
  return self->_agentInferenceAssetPath;
}

- (void)setAgentInferenceAssetPath:(id)a3
{
}

- (SiriTTSTrainer)currentTrainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTrainer);

  return (SiriTTSTrainer *)WeakRetained;
}

- (void)setCurrentTrainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentTrainer);
  objc_storeStrong((id *)&self->_agentInferenceAssetPath, 0);

  objc_storeStrong((id *)&self->_agentTrainingAssetPath, 0);
}

@end
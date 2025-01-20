@interface TTSVBSiriTTSTrainerTask
- (BOOL)isUnfinishedOrPending;
- (NSString)taskID;
- (SiriTTSTrainerTask)task;
- (TTSVBSiriTTSTrainerTask)initWithSiriTTSTrainerTask:(id)a3;
- (TTSVBSiriTTSTrainerTask)initWithTaskID:(id)a3 localeID:(id)a4 trainingAssetURL:(id)a5 dataAssetURL:(id)a6 inferenceAssetURL:(id)a7 trainingMode:(int64_t)a8 startImmediately:(BOOL)a9;
- (double)normalizedProgressValue;
- (id)description;
- (int64_t)_ttsvbStatusForSiriTaskStatus:(int64_t)a3;
- (int64_t)_ttsvbStatusForSiriTrainingStatus:(int64_t)a3;
- (int64_t)currentTaskTotal;
- (int64_t)currentTaskValue;
- (int64_t)status;
- (int64_t)trainingStatus;
- (void)setTask:(id)a3;
@end

@implementation TTSVBSiriTTSTrainerTask

- (TTSVBSiriTTSTrainerTask)initWithTaskID:(id)a3 localeID:(id)a4 trainingAssetURL:(id)a5 dataAssetURL:(id)a6 inferenceAssetURL:(id)a7 trainingMode:(int64_t)a8 startImmediately:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v28.receiver = self;
  v28.super_class = (Class)TTSVBSiriTTSTrainerTask;
  v20 = [(TTSVBSiriTTSTrainerTask *)&v28 init];
  if (v20)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v21 = (void *)getSiriTTSTrainerTaskClass_softClass_0;
    uint64_t v33 = getSiriTTSTrainerTaskClass_softClass_0;
    if (!getSiriTTSTrainerTaskClass_softClass_0)
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __getSiriTTSTrainerTaskClass_block_invoke_0;
      v29[3] = &unk_265539178;
      v29[4] = &v30;
      __getSiriTTSTrainerTaskClass_block_invoke_0((uint64_t)v29);
      v21 = (void *)v31[3];
    }
    v22 = v21;
    _Block_object_dispose(&v30, 8);
    v23 = (void *)[[v22 alloc] initWithLanguage:v16 name:@"default"];
    [v23 setTaskId:v15];
    v24 = [v17 path];
    [v23 setTrainingAssetPath:v24];

    v25 = [v18 path];
    [v23 setDataAssetPath:v25];

    v26 = [v19 path];
    [v23 setInferenceAssetPath:v26];

    [v23 setTaskMode:a8];
    [v23 setForceToStart:a9];
    [(TTSVBSiriTTSTrainerTask *)v20 setTask:v23];
  }
  return v20;
}

- (id)description
{
  unint64_t v3 = [(TTSVBSiriTTSTrainerTask *)self status];
  if (v3 > 7) {
    v4 = @"Unknown";
  }
  else {
    v4 = *(&off_265539210 + v3);
  }
  unint64_t v5 = [(TTSVBSiriTTSTrainerTask *)self trainingStatus];
  if (v5 > 4) {
    v6 = @"Unknown";
  }
  else {
    v6 = *(&off_265539250 + v5);
  }
  v7 = NSString;
  v8 = [(TTSVBSiriTTSTrainerTask *)self taskID];
  v9 = [(TTSVBSiriTTSTrainerTask *)self task];
  v10 = [v7 stringWithFormat:@"TTSVBSiriTTSTrainerTask<%p> ID=%@ status=%@ trainingStatus=%@ [underlying Siri=%@]", self, v8, v4, v6, v9];

  return v10;
}

- (NSString)taskID
{
  v2 = [(TTSVBSiriTTSTrainerTask *)self task];
  unint64_t v3 = [v2 taskId];

  return (NSString *)v3;
}

- (int64_t)status
{
  unint64_t v3 = [(TTSVBSiriTTSTrainerTask *)self task];
  int64_t v4 = -[TTSVBSiriTTSTrainerTask _ttsvbStatusForSiriTaskStatus:](self, "_ttsvbStatusForSiriTaskStatus:", [v3 taskStatus]);

  return v4;
}

- (int64_t)trainingStatus
{
  unint64_t v3 = [(TTSVBSiriTTSTrainerTask *)self task];
  int64_t v4 = -[TTSVBSiriTTSTrainerTask _ttsvbStatusForSiriTrainingStatus:](self, "_ttsvbStatusForSiriTrainingStatus:", [v3 trainingStatus]);

  return v4;
}

- (int64_t)currentTaskValue
{
  v2 = [(TTSVBSiriTTSTrainerTask *)self task];
  int64_t v3 = [v2 currentTaskStatusProgressValue];

  return v3;
}

- (int64_t)currentTaskTotal
{
  v2 = [(TTSVBSiriTTSTrainerTask *)self task];
  int64_t v3 = [v2 totalTaskStatusProgressValue];

  return v3;
}

- (double)normalizedProgressValue
{
  v2 = [(TTSVBSiriTTSTrainerTask *)self task];
  [v2 normalizedProgressValue];
  double v4 = v3;

  return v4;
}

- (BOOL)isUnfinishedOrPending
{
  unint64_t v2 = [(TTSVBSiriTTSTrainerTask *)self status];
  return (v2 > 7) | (0x4Fu >> v2) & 1;
}

- (int64_t)_ttsvbStatusForSiriTaskStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_25F3F8330[a3 - 1];
  }
}

- (int64_t)_ttsvbStatusForSiriTrainingStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (SiriTTSTrainerTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (void).cxx_destruct
{
}

- (TTSVBSiriTTSTrainerTask)initWithSiriTTSTrainerTask:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TTSVBSiriTTSTrainerTask;
  unint64_t v5 = [(TTSVBSiriTTSTrainerTask *)&v8 init];
  v6 = v5;
  if (v5) {
    [(TTSVBSiriTTSTrainerTask *)v5 setTask:v4];
  }

  return v6;
}

@end
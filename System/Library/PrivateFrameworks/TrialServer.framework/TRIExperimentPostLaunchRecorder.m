@interface TRIExperimentPostLaunchRecorder
+ (id)recorderFromContext:(id)a3;
- (TRIExperimentPostLaunchLogging)logger;
- (TRIExperimentPostLaunchRecorder)initWithStorage:(id)a3 logger:(id)a4;
- (TRIExperimentPostLaunchStoring)storage;
- (void)recordEvent:(id)a3;
@end

@implementation TRIExperimentPostLaunchRecorder

- (TRIExperimentPostLaunchRecorder)initWithStorage:(id)a3 logger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIExperimentPostLaunchRecorder;
  v9 = [(TRIExperimentPostLaunchRecorder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    objc_storeStrong((id *)&v10->_logger, a4);
  }

  return v10;
}

+ (id)recorderFromContext:(id)a3
{
  id v3 = a3;
  v4 = [TRIExperimentPostLaunchLogger alloc];
  v5 = [v3 client];
  v6 = [(TRIExperimentPostLaunchLogger *)v4 initWithClient:v5];

  id v7 = [TRIExperimentPostLaunchRecorder alloc];
  id v8 = [v3 experimentHistoryDatabase];

  v9 = [(TRIExperimentPostLaunchRecorder *)v7 initWithStorage:v8 logger:v6];
  return v9;
}

- (void)recordEvent:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  v5 = [(TRIExperimentPostLaunchRecorder *)self storage];
  int v6 = [v5 storeExperimentEvent:v4 wasNewEvent:&v8];

  if (v6 && v8)
  {
    id v7 = [(TRIExperimentPostLaunchRecorder *)self logger];
    [v7 logExperimentPostLaunchEvent:v4];
  }
}

- (TRIExperimentPostLaunchStoring)storage
{
  return self->_storage;
}

- (TRIExperimentPostLaunchLogging)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
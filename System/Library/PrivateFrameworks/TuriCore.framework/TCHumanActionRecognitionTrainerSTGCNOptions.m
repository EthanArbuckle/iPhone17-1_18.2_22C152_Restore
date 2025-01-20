@interface TCHumanActionRecognitionTrainerSTGCNOptions
- (TCHumanActionRecognitionTrainerSTGCNOptions)init;
- (float)dropoutProbability;
- (int64_t)batchSize;
- (int64_t)numClasses;
- (int64_t)numFrames;
- (int64_t)numKeypoints;
- (void)setBatchSize:(int64_t)a3;
- (void)setDropoutProbability:(float)a3;
- (void)setNumClasses:(int64_t)a3;
- (void)setNumFrames:(int64_t)a3;
- (void)setNumKeypoints:(int64_t)a3;
- (void)validate;
@end

@implementation TCHumanActionRecognitionTrainerSTGCNOptions

- (TCHumanActionRecognitionTrainerSTGCNOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)TCHumanActionRecognitionTrainerSTGCNOptions;
  result = [(TCHumanActionRecognitionTrainerSTGCNOptions *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_batchSize = xmmword_2246BA0C0;
    *(_OWORD *)&result->_numKeypoints = xmmword_2246BA0D0;
    result->_dropoutProbability = 0.1;
  }
  return result;
}

- (void)validate
{
  if ([(TCHumanActionRecognitionTrainerSTGCNOptions *)self batchSize] <= 0)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"TCHumanActionRecognitionTrainer.mm" lineNumber:31 description:@"Batch size must be positive"];
  }
  if ([(TCHumanActionRecognitionTrainerSTGCNOptions *)self numFrames] <= 0)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"TCHumanActionRecognitionTrainer.mm" lineNumber:32 description:@"Number of frames must be positive"];
  }
  if ([(TCHumanActionRecognitionTrainerSTGCNOptions *)self numKeypoints] <= 0)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"TCHumanActionRecognitionTrainer.mm" lineNumber:33 description:@"Number of keypoints must be positive"];
  }
  if ([(TCHumanActionRecognitionTrainerSTGCNOptions *)self numClasses] <= 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"TCHumanActionRecognitionTrainer.mm" lineNumber:34 description:@"Number of classes must be positive"];
  }
  [(TCHumanActionRecognitionTrainerSTGCNOptions *)self dropoutProbability];
  if (v4 < 0.0)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"TCHumanActionRecognitionTrainer.mm" lineNumber:35 description:@"Dropout probability must be non-negative"];
  }
  [(TCHumanActionRecognitionTrainerSTGCNOptions *)self dropoutProbability];
  if (v5 > 1.0)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"TCHumanActionRecognitionTrainer.mm" lineNumber:36 description:@"Dropout probability must not exceed 1.0"];
  }
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (int64_t)numFrames
{
  return self->_numFrames;
}

- (void)setNumFrames:(int64_t)a3
{
  self->_numFrames = a3;
}

- (int64_t)numKeypoints
{
  return self->_numKeypoints;
}

- (void)setNumKeypoints:(int64_t)a3
{
  self->_numKeypoints = a3;
}

- (int64_t)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(int64_t)a3
{
  self->_numClasses = a3;
}

- (float)dropoutProbability
{
  return self->_dropoutProbability;
}

- (void)setDropoutProbability:(float)a3
{
  self->_dropoutProbability = a3;
}

@end
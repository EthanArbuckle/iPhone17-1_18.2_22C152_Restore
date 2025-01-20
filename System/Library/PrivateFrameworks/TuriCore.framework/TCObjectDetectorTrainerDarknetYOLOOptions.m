@interface TCObjectDetectorTrainerDarknetYOLOOptions
- (Config)config;
- (TCObjectDetectorTrainerDarknetYOLOOptions)init;
- (int64_t)batchSize;
- (int64_t)maxIterations;
- (int64_t)numClasses;
- (int64_t)outputHeight;
- (int64_t)outputWidth;
- (int64_t)randomSeed;
- (void)setBatchSize:(int64_t)a3;
- (void)setMaxIterations:(int64_t)a3;
- (void)setNumClasses:(int64_t)a3;
- (void)setOutputHeight:(int64_t)a3;
- (void)setOutputWidth:(int64_t)a3;
- (void)setRandomSeed:(int64_t)a3;
@end

@implementation TCObjectDetectorTrainerDarknetYOLOOptions

- (TCObjectDetectorTrainerDarknetYOLOOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)TCObjectDetectorTrainerDarknetYOLOOptions;
  result = [(TCObjectDetectorTrainerDarknetYOLOOptions *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_maxIterations = xmmword_2246C6890;
    *(_OWORD *)&result->_numClasses = xmmword_2246C68A0;
    *(_OWORD *)&result->_outputWidth = xmmword_2246C68B0;
  }
  return result;
}

- (Config)config
{
  *(_OWORD *)&retstr->var0 = xmmword_2246C68C0;
  retstr->var4 = -1;
  retstr->var0 = [(TCObjectDetectorTrainerDarknetYOLOOptions *)self maxIterations];
  retstr->var1 = [(TCObjectDetectorTrainerDarknetYOLOOptions *)self batchSize];
  retstr->var2 = [(TCObjectDetectorTrainerDarknetYOLOOptions *)self outputHeight];
  retstr->var3 = [(TCObjectDetectorTrainerDarknetYOLOOptions *)self outputWidth];
  result = [(TCObjectDetectorTrainerDarknetYOLOOptions *)self numClasses];
  retstr->var4 = (int)result;
  return result;
}

- (int64_t)maxIterations
{
  return self->_maxIterations;
}

- (void)setMaxIterations:(int64_t)a3
{
  self->_maxIterations = a3;
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (int64_t)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(int64_t)a3
{
  self->_numClasses = a3;
}

- (int64_t)outputHeight
{
  return self->_outputHeight;
}

- (void)setOutputHeight:(int64_t)a3
{
  self->_outputHeight = a3;
}

- (int64_t)outputWidth
{
  return self->_outputWidth;
}

- (void)setOutputWidth:(int64_t)a3
{
  self->_outputWidth = a3;
}

- (int64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(int64_t)a3
{
  self->_randomSeed = a3;
}

@end
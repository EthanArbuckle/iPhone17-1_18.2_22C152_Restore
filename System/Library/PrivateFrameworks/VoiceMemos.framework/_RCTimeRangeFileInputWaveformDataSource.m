@interface _RCTimeRangeFileInputWaveformDataSource
- (BOOL)isDecomposedFragment;
- (void)saveGeneratedWaveformIfNecessary;
- (void)setIsDecomposedFragment:(BOOL)a3;
@end

@implementation _RCTimeRangeFileInputWaveformDataSource

- (void)saveGeneratedWaveformIfNecessary
{
  if (!self->_isDecomposedFragment) {
    goto LABEL_3;
  }
  v3 = [(RCWaveformDataSource *)self generatedWaveformOutputURL];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if ((v6 & 1) == 0)
  {
LABEL_3:
    v7.receiver = self;
    v7.super_class = (Class)_RCTimeRangeFileInputWaveformDataSource;
    [(RCFileInputWaveformDataSource *)&v7 saveGeneratedWaveformIfNecessary];
  }
}

- (BOOL)isDecomposedFragment
{
  return self->_isDecomposedFragment;
}

- (void)setIsDecomposedFragment:(BOOL)a3
{
  self->_isDecomposedFragment = a3;
}

@end
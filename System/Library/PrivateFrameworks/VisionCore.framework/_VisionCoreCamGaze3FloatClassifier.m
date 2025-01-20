@interface _VisionCoreCamGaze3FloatClassifier
- (BOOL)getGazeClassification:(int64_t *)a3 fromGazeProbabilitiesOutputData:(id)a4 error:(id *)a5;
@end

@implementation _VisionCoreCamGaze3FloatClassifier

- (BOOL)getGazeClassification:(int64_t *)a3 fromGazeProbabilitiesOutputData:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [v8 length];
  unint64_t v10 = [(VisionCoreTensorDescriptor *)self->super._gazeProbabilitiesOutputDescriptor storageByteCount];
  if (v9 == v10)
  {
    v11 = (float *)[v8 bytes];
    float v12 = *v11;
    float v13 = v11[1];
    float v14 = v11[2];
    BOOL v15 = *v11 <= v14 || v12 <= v13;
    int64_t v16 = 3;
    if (v15) {
      int64_t v16 = 0;
    }
    if (v13 > v14 && v13 > v12) {
      int64_t v16 = 2;
    }
    if (v14 > v13 && v14 > v12) {
      int64_t v16 = 1;
    }
    *a3 = v16;
  }
  else if (a5)
  {
    v19 = (void *)[[NSString alloc] initWithFormat:@"the gaze probabilities output data length is %lu, not the expected %lu for %@", v9, v10, self->super._gazeProbabilitiesOutputDescriptor];
    *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v19];
  }
  return v9 == v10;
}

@end
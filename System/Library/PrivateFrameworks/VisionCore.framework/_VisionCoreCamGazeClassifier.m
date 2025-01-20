@interface _VisionCoreCamGazeClassifier
+ (void)classifierForGazeProbabilitiesOutputDescriptor:(void *)a3 error:;
- (BOOL)getGazeClassification:(int64_t *)a3 fromGazeProbabilitiesOutputData:(id)a4 error:(id *)a5;
- (id)_initWithGazeProbabilitiesOutputDescriptor:(id)a3;
@end

@implementation _VisionCoreCamGazeClassifier

- (void).cxx_destruct
{
}

- (BOOL)getGazeClassification:(int64_t *)a3 fromGazeProbabilitiesOutputData:(id)a4 error:(id *)a5
{
  v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  v9 = +[VisionCoreRuntimeUtilities signatureForItem:self selector:a2];
  [v8 handleFailureInMethod:a2, self, @"VisionCoreCamGazeNetworkDescriptor.m", 90, @"%@ must be implemented", v9 object file lineNumber description];

  if (a5)
  {
    *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForFailedOperationWithLocalizedDescription:@"could not validate the gaze probabilities data shape"];
  }
  return 0;
}

- (id)_initWithGazeProbabilitiesOutputDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VisionCoreCamGazeClassifier;
  v6 = [(_VisionCoreCamGazeClassifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_gazeProbabilitiesOutputDescriptor, a3);
  }

  return v7;
}

+ (void)classifierForGazeProbabilitiesOutputDescriptor:(void *)a3 error:
{
  id v4 = a2;
  self;
  id v5 = [v4 shape];
  if ([v4 dataType] == 65568
    && [v5 elementCount] == 3
    && (v6 = (objc_class *)objc_opt_class()) != 0)
  {
    a3 = (void *)[[v6 alloc] _initWithGazeProbabilitiesOutputDescriptor:v4];
  }
  else if (a3)
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"A gaze probabilties output of %@ is not supported", v4];
    *a3 = [MEMORY[0x263F087E8] VisionCoreErrorForFailedOperationWithLocalizedDescription:v7];

    a3 = 0;
  }

  return a3;
}

@end
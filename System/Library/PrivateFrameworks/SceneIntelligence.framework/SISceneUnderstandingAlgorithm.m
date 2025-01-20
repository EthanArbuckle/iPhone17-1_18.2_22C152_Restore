@interface SISceneUnderstandingAlgorithm
+ (CGSize)outputResolution;
- (SISceneUnderstandingAlgorithm)initWithInputResolution:(CGSize)a3;
- (SISceneUnderstandingAlgorithm)initWithInputResolution:(CGSize)a3 andComputeEngine:(int64_t)a4;
- (void)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 confidenceOutput:(__IOSurface *)a5 normalsOutput:(__IOSurface *)a6;
- (void)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 confidenceOutput:(__IOSurface *)a5 normalsOutput:(__IOSurface *)a6 orientation:(int64_t)a7;
@end

@implementation SISceneUnderstandingAlgorithm

+ (CGSize)outputResolution
{
  +[SISceneUnderstandingResult outputDimensions];
  result.height = v3;
  result.width = v2;
  return result;
}

- (SISceneUnderstandingAlgorithm)initWithInputResolution:(CGSize)a3
{
  return -[SISceneUnderstandingAlgorithm initWithInputResolution:andComputeEngine:](self, "initWithInputResolution:andComputeEngine:", 0, a3.width, a3.height);
}

- (SISceneUnderstandingAlgorithm)initWithInputResolution:(CGSize)a3 andComputeEngine:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)SISceneUnderstandingAlgorithm;
  v5 = [(SISceneUnderstandingAlgorithm *)&v15 init];
  if (v5
    && (v6 = [[SISceneUnderstanding alloc] initWithComputeEngine:a4], segmentation = v5->_segmentation, v5->_segmentation = v6, segmentation, v5->_segmentation))
  {
    v8 = [[SISceneUnderstandingResult alloc] initWithModel:v5->_segmentation];
    v9 = v5->_result;
    v5->_CGSize result = v8;

    v10 = [SIScaler alloc];
    +[SISceneUnderstanding inputResolution];
    uint64_t v11 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v10, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", 1111970369, 0, @"SceneUnderstanding");
    scalerOne = v5->_scalerOne;
    v5->_scalerOne = (SIScaler *)v11;

    v13 = v5;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 confidenceOutput:(__IOSurface *)a5 normalsOutput:(__IOSurface *)a6
{
}

- (void)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 confidenceOutput:(__IOSurface *)a5 normalsOutput:(__IOSurface *)a6 orientation:(int64_t)a7
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  kdebug_trace();
  v13 = [(SIScaler *)self->_scalerOne createScaledImage:a3];
  int64_t v14 = [(SISceneUnderstanding *)self->_segmentation evaluateImage:v13 results:self->_result];
  CVPixelBufferRelease(v13);
  kdebug_trace();
  if (v14)
  {
    objc_super v15 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstandingAlgorithm.m";
      __int16 v24 = 1025;
      int v25 = 92;
      _os_log_impl(&dword_21B697000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to run scene understanding on image input ***", buf, 0x12u);
    }
  }
  else
  {
    CVPixelBufferRef pixelBufferOut = 0;
    if (CVPixelBufferCreateWithIOSurface(0, a4, 0, &pixelBufferOut))
    {
      v16 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUndersta"
              "ndingAlgorithm.m";
        __int16 v24 = 1025;
        int v25 = 100;
        _os_log_impl(&dword_21B697000, v16, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unable to create semantic pixel buffer from Surface ***", buf, 0x12u);
      }
    }
    else
    {
      [(SISceneUnderstandingResult *)self->_result writeLabels:pixelBufferOut];
    }
    CVPixelBufferRef texture = 0;
    if (CVPixelBufferCreateWithIOSurface(0, a5, 0, &texture))
    {
      v17 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUndersta"
              "ndingAlgorithm.m";
        __int16 v24 = 1025;
        int v25 = 110;
        _os_log_impl(&dword_21B697000, v17, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unable to create probabilities pixel buffer from Surface ***", buf, 0x12u);
      }
    }
    else
    {
      [(SISceneUnderstandingResult *)self->_result writeProbabilities:texture];
    }
    CVPixelBufferRef v19 = 0;
    if (CVPixelBufferCreateWithIOSurface(0, a6, 0, &v19))
    {
      v18 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUndersta"
              "ndingAlgorithm.m";
        __int16 v24 = 1025;
        int v25 = 120;
        _os_log_impl(&dword_21B697000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unable to create normals pixel buffer from Surface ***", buf, 0x12u);
      }
    }
    else
    {
      [(SISceneUnderstandingResult *)self->_result writeNormals:v19 orientation:a7];
    }
    CVPixelBufferRelease(pixelBufferOut);
    CVPixelBufferRelease(texture);
    CVPixelBufferRelease(v19);
    kdebug_trace();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalerOne, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_segmentation, 0);
}

@end
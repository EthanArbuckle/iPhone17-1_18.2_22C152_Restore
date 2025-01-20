@interface SISceneSegmentation
- (CGSize)getInputResolution;
- (CGSize)getOutputResolution;
- (SISceneSegmentation)initWithNetworkConfiguration:(id)a3;
- (id)subLoggers;
- (int64_t)evaluateSemanticForImage:(__CVBuffer *)a3 semanticOutput:(__CVBuffer *)a4 confidenceOutput:(__CVBuffer *)a5 uncertaintyOutput:(__CVBuffer *)a6;
- (int64_t)evaluateSemanticForImageData:(id)a3 output:(id)a4;
- (int64_t)postprocessingIOSSemanticOutput:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 uncertaintyOutput:(__CVBuffer *)a5;
- (int64_t)postprocessingOutput:(id)a3;
- (void)_initializeUncertaintyThresholds:(float)a3;
- (void)dealloc;
@end

@implementation SISceneSegmentation

- (SISceneSegmentation)initWithNetworkConfiguration:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SISceneSegmentation;
  v6 = [(SIModel *)&v15 initWithNetworkConfiguration:v5];
  if (v6)
  {
    uint64_t v18 = kSIMLSceneSegmentationInputTensorName;
    v7 = [[SIPixelBuffer alloc] initWithCVPixelBuffer:0];
    v19[0] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [(SIModel *)v6 setInputs:v8];

    v16[0] = kSIMLSceneSegmentationOutputLabelsTensorName;
    v9 = [[SIPixelBuffer alloc] initWithCVPixelBuffer:0];
    v17[0] = v9;
    v16[1] = kSIMLSceneSegmentationOutputExponentiatedLogitsTensorName;
    v10 = [[SIPixelBuffer alloc] initWithCVPixelBuffer:0];
    v17[1] = v10;
    v16[2] = kSIMLSceneSegmentationOutputNormalizationTensorName;
    v11 = [[SIPixelBuffer alloc] initWithCVPixelBuffer:0];
    v17[2] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    [(SIModel *)v6 setOutputs:v12];

    [v5 uncertaintyThreshold];
    -[SISceneSegmentation _initializeUncertaintyThresholds:](v6, "_initializeUncertaintyThresholds:");
    objc_storeStrong((id *)&v6->_configuration, a3);
    v13 = v6;
  }

  return v6;
}

- (void)_initializeUncertaintyThresholds:(float)a3
{
  id v5 = [(SIModel *)self network];
  uint64_t v6 = [v5 getOutputChannels:kSIMLSceneSegmentationOutputExponentiatedLogitsTensorName];

  self->_uncertaintyThresholds = (float *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  v7 = (float *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  self->_probabilityThresholds = v7;
  if (v6)
  {
    uncertaintyThresholds = self->_uncertaintyThresholds;
    do
    {
      *uncertaintyThresholds++ = a3;
      float v9 = 1.0 / (2.0 - a3);
      *v7++ = v9;
      --v6;
    }
    while (v6);
  }
}

- (CGSize)getInputResolution
{
  v3 = [(SIModel *)self network];
  unint64_t v4 = [v3 getInputWidth:kSIMLSceneSegmentationInputTensorName];
  id v5 = [(SIModel *)self network];
  double v6 = (double)(unint64_t)[v5 getInputHeight:kSIMLSceneSegmentationInputTensorName];

  double v7 = (double)v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)getOutputResolution
{
  v3 = [(SIModel *)self network];
  unint64_t v4 = [v3 getOutputWidth:kSIMLSceneSegmentationOutputLabelsTensorName];
  id v5 = [(SIModel *)self network];
  double v6 = (double)(unint64_t)[v5 getOutputHeight:kSIMLSceneSegmentationOutputLabelsTensorName];

  double v7 = (double)v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)dealloc
{
  uncertaintyThresholds = self->_uncertaintyThresholds;
  if (uncertaintyThresholds) {
    free(uncertaintyThresholds);
  }
  probabilityThresholds = self->_probabilityThresholds;
  if (probabilityThresholds) {
    free(probabilityThresholds);
  }
  v5.receiver = self;
  v5.super_class = (Class)SISceneSegmentation;
  [(SISceneSegmentation *)&v5 dealloc];
}

- (int64_t)evaluateSemanticForImageData:(id)a3 output:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[SISceneSegmentation evaluateSemanticForImage:semanticOutput:confidenceOutput:uncertaintyOutput:](self, "evaluateSemanticForImage:semanticOutput:confidenceOutput:uncertaintyOutput:", [v6 inputImageBuffer], objc_msgSend(v7, "semantic"), objc_msgSend(v7, "confidence"), objc_msgSend(v7, "uncertainty"));

  return v8;
}

- (int64_t)evaluateSemanticForImage:(__CVBuffer *)a3 semanticOutput:(__CVBuffer *)a4 confidenceOutput:(__CVBuffer *)a5 uncertaintyOutput:(__CVBuffer *)a6
{
  float v9 = [(SIModel *)self inputs];
  v10 = [v9 objectForKeyedSubscript:kSIMLSceneSegmentationInputTensorName];
  [v10 setPixelBuffer:a3];

  v11 = [(SIModel *)self outputs];
  v12 = [v11 objectForKeyedSubscript:kSIMLSceneSegmentationOutputLabelsTensorName];
  [v12 setPixelBuffer:a4];

  v13 = [(SIModel *)self inputs];
  v14 = [(SIModel *)self outputs];
  [(SIModel *)self evaluateWithInput:v13 outputs:v14];

  return 0;
}

- (int64_t)postprocessingOutput:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[SISceneSegmentation postprocessingSemanticOutput:confidenceOutput:uncertaintyOutput:](self, "postprocessingSemanticOutput:confidenceOutput:uncertaintyOutput:", [v4 semantic], objc_msgSend(v4, "confidence"), objc_msgSend(v4, "uncertainty"));

  return v5;
}

- (int64_t)postprocessingIOSSemanticOutput:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 uncertaintyOutput:(__CVBuffer *)a5
{
  float v9 = [(SIModel *)self network];
  v10 = (__IOSurface *)[v9 getOutputSurface:kSIMLSceneSegmentationOutputExponentiatedLogitsTensorName];

  v11 = [(SIModel *)self network];
  buffer = (__IOSurface *)[v11 getOutputSurface:kSIMLSceneSegmentationOutputNormalizationTensorName];

  v12 = [(SIModel *)self network];
  unint64_t v13 = [v12 getOutputChannels:kSIMLSceneSegmentationOutputExponentiatedLogitsTensorName];

  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  size_t v52 = CVPixelBufferGetBytesPerRow(a4);
  size_t v51 = CVPixelBufferGetBytesPerRow(a5);
  size_t v16 = IOSurfaceGetBytesPerRow(buffer);
  kdebug_trace();
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  CVPixelBufferLockBaseAddress(a5, 0);
  IOSurfaceLock(v10, 0, 0);
  IOSurfaceLock(buffer, 0, 0);
  CVPixelBufferRef v48 = a4;
  v17 = v10;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
  CVPixelBufferRef v49 = a5;
  v19 = (char *)CVPixelBufferGetBaseAddress(a5);
  CVPixelBufferRef pixelBuffer = a3;
  v20 = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a3);
  v21 = (char *)IOSurfaceGetBaseAddress(buffer);
  v22 = (__int16 *)IOSurfaceGetBaseAddress(v17);
  if (Height)
  {
    uint64_t v23 = 0;
    v24 = v22;
    do
    {
      if (Width)
      {
        uint64_t v25 = 0;
        v26 = &v19[v23 * v51];
        probabilityThresholds = self->_probabilityThresholds;
        v28 = v24;
        do
        {
          uint64_t v29 = v20[v23 * BytesPerRow + v25];
          _H1 = v22[v25 + v23 * Width + Height * Width * v29];
          _H2 = *(_WORD *)&v21[2 * v25 + v23 * v16];
          __asm
          {
            FCVT            S1, H1
            FCVT            S2, H2
          }
          float v37 = _S1 / _S2;
          *(float *)&BaseAddress[4 * v25 + v23 * v52] = v37;
          if (v37 >= probabilityThresholds[v29])
          {
            *(_DWORD *)&v26[4 * v25] = 1065353216;
          }
          else
          {
            if (v13)
            {
              int v38 = 0;
              float v39 = 0.0;
              v40 = v28;
              do
              {
                _H3 = *v40;
                __asm { FCVT            S3, H3 }
                if (v39 < _S3 && v39 != _S1) {
                  float v39 = _S3;
                }
                ++v38;
                v40 += Width * Height;
              }
              while (v13 > v38);
            }
            else
            {
              float v39 = 0.0;
            }
            float v44 = 1.0 - (float)(v39 / _S1);
            if (v44 >= self->_uncertaintyThresholds[v29]) {
              *(float *)&v26[4 * v25] = v44;
            }
            else {
              *(_DWORD *)&v26[4 * v25] = 0;
            }
          }
          ++v25;
          ++v28;
        }
        while (v25 != Width);
      }
      ++v23;
      v24 += Width;
    }
    while (v23 != Height);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  CVPixelBufferUnlockBaseAddress(v48, 0);
  CVPixelBufferUnlockBaseAddress(v49, 0);
  IOSurfaceUnlock(v17, 0, 0);
  IOSurfaceUnlock(buffer, 0, 0);
  kdebug_trace();
  return 0;
}

- (id)subLoggers
{
  v4.receiver = self;
  v4.super_class = (Class)SISceneSegmentation;
  v2 = [(SIModel *)&v4 subLoggers];
  return v2;
}

- (void).cxx_destruct
{
}

@end
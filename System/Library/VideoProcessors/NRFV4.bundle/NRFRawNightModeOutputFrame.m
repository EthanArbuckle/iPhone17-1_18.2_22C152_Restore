@interface NRFRawNightModeOutputFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts;
- (BOOL)allCommandBuffersEnqueued;
- (MTLCommandBuffer)commandBuffer;
- (NRFRawNightModeOutputFrame)initWithFrameID:(id)a3 pts:(id *)a4 parentProcessor:(id)a5;
- (NSArray)inferenceTextures;
- (NSArray)noiseMapTextures;
- (NSArray)textures;
- (NSMutableDictionary)metadata;
- (__CVBuffer)inferenceInputPixelBuffer;
- (__CVBuffer)noiseMapPixelBuffer;
- (__CVBuffer)pixelBuffer;
- (int)bindTexturesForConfig:(id)a3 metalContext:(id)a4;
- (int)error;
- (int)numberOfCalledCompletionHandlers;
- (int)numberOfCompletionHandlers;
- (void)addCompletionHandlerToCommandBuffer:(id)a3;
- (void)dealloc;
- (void)setCommandBuffer:(id)a3;
- (void)setError:(int)a3;
- (void)setInferenceInputPixelBuffer:(__CVBuffer *)a3;
- (void)setMetadata:(id)a3;
- (void)setNoiseMapPixelBuffer:(__CVBuffer *)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)signalAllCommandBuffersEnqueued;
@end

@implementation NRFRawNightModeOutputFrame

- (NRFRawNightModeOutputFrame)initWithFrameID:(id)a3 pts:(id *)a4 parentProcessor:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NRFRawNightModeOutputFrame;
  v7 = [(NRFRawNightModeOutputFrame *)&v12 init];
  v8 = v7;
  if (v7 && a5)
  {
    int64_t var3 = a4->var3;
    *(_OWORD *)&v7->_pts.value = *(_OWORD *)&a4->var0;
    v7->_pts.epoch = var3;
    v7->_error = 0;
    v10 = v7;
  }
  else
  {
    FigDebugAssert3();
    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_inferenceInputPixelBuffer);
  CVPixelBufferRelease(self->_pixelBuffer);
  CVPixelBufferRelease(self->_noiseMapPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)NRFRawNightModeOutputFrame;
  [(NRFRawNightModeOutputFrame *)&v3 dealloc];
}

- (int)bindTexturesForConfig:(id)a3 metalContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6) {
    goto LABEL_29;
  }
  if (!v7) {
    goto LABEL_29;
  }
  if (self->_textures) {
    goto LABEL_29;
  }
  CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
  if (FigCaptureUncompressedPixelFormatForPixelFormat() != 1751527984) {
    goto LABEL_29;
  }
  pixelBuffer = self->_pixelBuffer;
  if (!pixelBuffer)
  {
    FigSignalErrorAt();
    int v23 = 0;
    goto LABEL_30;
  }
  CVPixelBufferGetPixelFormatType(pixelBuffer);
  if (FigCaptureUncompressedPixelFormatForPixelFormat() != 1751527984)
  {
LABEL_29:
    int v23 = FigSignalErrorAt();
LABEL_30:
    v18 = 0;
    v10 = 0;
LABEL_36:
    v15 = 0;
    goto LABEL_26;
  }
  v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  if (!v10) {
    goto LABEL_35;
  }
  uint64_t v11 = [v8 bindPixelBufferToMTL2DTexture:self->_pixelBuffer pixelFormat:25 usage:23 plane:0];
  if (!v11) {
    goto LABEL_35;
  }
  objc_super v12 = (void *)v11;
  [v10 addObject:v11];
  v13 = [v8 bindPixelBufferToMTL2DTexture:self->_pixelBuffer pixelFormat:65 usage:23 plane:1];

  if (!v13) {
    goto LABEL_35;
  }
  [v10 addObject:v13];

  if ([v10 count] != 2) {
    goto LABEL_35;
  }
  objc_storeStrong((id *)&self->_textures, v10);
  noiseMapPixelBuffer = self->_noiseMapPixelBuffer;
  if (!noiseMapPixelBuffer)
  {
    FigDebugAssert3();
    goto LABEL_35;
  }
  CVPixelBufferGetPixelFormatType(noiseMapPixelBuffer);
  if (FigCaptureUncompressedPixelFormatForPixelFormat() != 1751527984)
  {
LABEL_35:
    int v23 = FigSignalErrorAt();
    v18 = 0;
    goto LABEL_36;
  }
  v15 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  if (!v15) {
    goto LABEL_40;
  }
  uint64_t v16 = [v8 bindPixelBufferToMTL2DTexture:self->_noiseMapPixelBuffer pixelFormat:25 usage:23 plane:0];
  if (!v16) {
    goto LABEL_40;
  }
  v17 = (void *)v16;
  [v15 addObject:v16];
  v18 = [v8 bindPixelBufferToMTL2DTexture:self->_noiseMapPixelBuffer pixelFormat:65 usage:23 plane:1];

  if (!v18)
  {
LABEL_41:
    int v23 = FigSignalErrorAt();
    goto LABEL_26;
  }
  [v15 addObject:v18];
  if ([v15 count] != 2)
  {
    int v23 = FigSignalErrorAt();

    goto LABEL_25;
  }
  objc_storeStrong((id *)&self->_noiseMapTextures, v15);

  inferenceInputPixelBuffer = self->_inferenceInputPixelBuffer;
  if (!inferenceInputPixelBuffer)
  {
    int v23 = 0;
LABEL_25:
    v18 = 0;
    goto LABEL_26;
  }
  CVPixelBufferGetPixelFormatType(inferenceInputPixelBuffer);
  if (FigCaptureUncompressedPixelFormatForPixelFormat() != 875704422)
  {
LABEL_40:
    int v23 = FigSignalErrorAt();
    goto LABEL_25;
  }
  v18 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  if (!v18) {
    goto LABEL_41;
  }
  uint64_t v20 = [v8 bindPixelBufferToMTL2DTexture:self->_inferenceInputPixelBuffer pixelFormat:10 usage:23 plane:0];
  if (!v20) {
    goto LABEL_41;
  }
  v21 = (void *)v20;
  [v18 addObject:v20];
  v22 = [v8 bindPixelBufferToMTL2DTexture:self->_inferenceInputPixelBuffer pixelFormat:30 usage:23 plane:1];

  if (!v22) {
    goto LABEL_41;
  }
  [v18 addObject:v22];
  if ([v18 count] == 2)
  {
    objc_storeStrong((id *)&self->_inferenceTextures, v18);

    int v23 = 0;
  }
  else
  {
    int v23 = FigSignalErrorAt();
  }
LABEL_26:

  return v23;
}

- (void)addCompletionHandlerToCommandBuffer:(id)a3
{
  id v5 = a3;
  int v6 = self->_numberOfCompletionHandlers + 1;
  self->_numberOfCompletionHandlers = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__NRFRawNightModeOutputFrame_addCompletionHandlerToCommandBuffer___block_invoke;
  v9[3] = &unk_2655C7338;
  v9[4] = self;
  int v10 = v6;
  id v7 = (void *)MEMORY[0x263E64CF0](v9);
  if (v5)
  {
    p_commandBuffer = &self->_commandBuffer;
    objc_storeStrong((id *)p_commandBuffer, a3);
    [(MTLCommandBuffer *)*p_commandBuffer addCompletedHandler:v7];
  }
}

void __66__NRFRawNightModeOutputFrame_addCompletionHandlerToCommandBuffer___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = a2;
  objc_sync_enter(v4);
  ++*(_DWORD *)(*(void *)(a1 + 32) + 28);
  int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
  objc_sync_exit(v4);

  uint64_t v7 = [v5 status];
  if (v6) {
    BOOL v8 = v7 == 4;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    [v9 numberOfCompletionHandlers];
  }
}

- (void)signalAllCommandBuffersEnqueued
{
  obj = self;
  objc_sync_enter(obj);
  obj->_allCommandBuffersEnqueued = 1;
  objc_sync_exit(obj);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
}

- (NSArray)noiseMapTextures
{
  return self->_noiseMapTextures;
}

- (__CVBuffer)noiseMapPixelBuffer
{
  return self->_noiseMapPixelBuffer;
}

- (void)setNoiseMapPixelBuffer:(__CVBuffer *)a3
{
}

- (NSMutableDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (__CVBuffer)inferenceInputPixelBuffer
{
  return self->_inferenceInputPixelBuffer;
}

- (void)setInferenceInputPixelBuffer:(__CVBuffer *)a3
{
}

- (NSArray)inferenceTextures
{
  return self->_inferenceTextures;
}

- (NSArray)textures
{
  return self->_textures;
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (MTLCommandBuffer)commandBuffer
{
  return self->_commandBuffer;
}

- (void)setCommandBuffer:(id)a3
{
}

- (int)numberOfCompletionHandlers
{
  return self->_numberOfCompletionHandlers;
}

- (int)numberOfCalledCompletionHandlers
{
  return self->_numberOfCalledCompletionHandlers;
}

- (BOOL)allCommandBuffersEnqueued
{
  return self->_allCommandBuffersEnqueued;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_textures, 0);
  objc_storeStrong((id *)&self->_inferenceTextures, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_noiseMapTextures, 0);
}

@end
@interface CRTextDetectorModelV3E5MLExecutionContext
- (id)predictionFromImage:(__CVBuffer *)a3 error:(id *)a4;
- (id)predictionFromPreboundInputsWithError:(id *)a3;
- (void)prebindInputImageSurface:(__IOSurface *)a3 error:(id *)a4;
- (void)predictOutputFromPreboundInputsAsync:(id)a3;
- (void)unbindPreboundInputImageSurface;
@end

@implementation CRTextDetectorModelV3E5MLExecutionContext

- (id)predictionFromImage:(__CVBuffer *)a3 error:(id *)a4
{
  v5 = a3;
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface)
  {
    v8 = CROSLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1DD733000, v8, OS_LOG_TYPE_DEBUG, "CRTextDetectorModelV3E5ML input pixel buffer is not IOSurface backed, creating IOSurface backing. Consider passing in an IOSurface-backed pixel buffer to avoid this overhead.", v16, 2u);
    }

    v5 = CRCreateIOSurfacePixelBufferFromPixelBuffer(v5);
  }
  v9 = [(CRE5MLExecutionContext *)self functionDescriptor];
  id v10 = +[CRE5MLUtilities newImageInputsForFunctionDescriptor:v9 croppedPixelBuffer:v5 error:a4];

  if (!IOSurface) {
    CVPixelBufferRelease(v5);
  }
  v11 = [(CRE5MLExecutionContext *)self predictionFromInputObjects:v10 error:a4];
  if (v11)
  {
    v12 = [CRTextDetectorModelV3OutputLazy alloc];
    v13 = [(CRE5MLExecutionContext *)self functionDescriptor];
    v14 = [(CRTextDetectorModelV3OutputLazy *)v12 initWithVisionCoreNamedObjects:v11 fromFunctionDescriptor:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)prebindInputImageSurface:(__IOSurface *)a3 error:(id *)a4
{
  if (a3)
  {
    if (self->_preboundSurface != a3)
    {
      self->_preboundSurface = a3;
      v7 = [(CRE5MLExecutionContext *)self functionDescriptor];
      id v8 = +[CRE5MLUtilities newInputsForFunctionDescriptor:v7 surface:a3 isImage:1 error:a4];

      [(CRE5MLExecutionContext *)self prebindInputs:v8];
    }
  }
  else if (a4)
  {
    *a4 = +[CRImageReader errorWithErrorCode:-8];
  }
}

- (void)unbindPreboundInputImageSurface
{
  self->_preboundSurface = 0;
  [(CRE5MLExecutionContext *)self unbindInputs];
}

- (id)predictionFromPreboundInputsWithError:(id *)a3
{
  if ([(CRE5MLExecutionContext *)self predictFromPreboundInputsWithError:a3])
  {
    v4 = [CRTextDetectorModelV3OutputLazy alloc];
    v5 = [(CRE5MLExecutionContext *)self preboundOutputObjects];
    v6 = [(CRE5MLExecutionContext *)self functionDescriptor];
    v7 = [(CRTextDetectorModelV3OutputLazy *)v4 initWithVisionCoreNamedObjects:v5 fromFunctionDescriptor:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)predictOutputFromPreboundInputsAsync:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__CRTextDetectorModelV3E5MLExecutionContext_predictOutputFromPreboundInputsAsync___block_invoke;
  v6[3] = &unk_1E6CDC140;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRE5MLExecutionContext *)self predictFromPreboundInputsAsync:v6];
}

void __82__CRTextDetectorModelV3E5MLExecutionContext_predictOutputFromPreboundInputsAsync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [CRTextDetectorModelV3OutputLazy alloc];
  id v8 = [*(id *)(a1 + 32) functionDescriptor];
  v9 = [(CRTextDetectorModelV3OutputLazy *)v7 initWithVisionCoreNamedObjects:v6 fromFunctionDescriptor:v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end
@interface VKCRemoveBackgroundVideoPreviewResult
- ($0FD61D44AD30C1CDCD15B60AC4039C90)timeRange;
- (BOOL)successful;
- (CGRect)normalizedCropRect;
- (NSError)error;
- (VKCRemoveBackgroundVideoPreviewResult)initWithMADVideoPreviewResult:(id)a3 error:(id)a4;
- (id)subjectMatteAtCompositionTime:(id *)a3;
- (id)subjectMatteForImage:(id)a3 atCompositionTime:(id *)a4;
- (void)setError:(id)a3;
- (void)setSuccessful:(BOOL)a3;
@end

@implementation VKCRemoveBackgroundVideoPreviewResult

- (VKCRemoveBackgroundVideoPreviewResult)initWithMADVideoPreviewResult:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VKCRemoveBackgroundVideoPreviewResult;
  v9 = [(VKCRemoveBackgroundVideoPreviewResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_madResult, a3);
    v10->_successful = v7 != 0;
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- ($0FD61D44AD30C1CDCD15B60AC4039C90)timeRange
{
  result = ($0FD61D44AD30C1CDCD15B60AC4039C90 *)self->_madResult;
  if (result) {
    return ($0FD61D44AD30C1CDCD15B60AC4039C90 *)[($0FD61D44AD30C1CDCD15B60AC4039C90 *)result timeRange];
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- (CGRect)normalizedCropRect
{
  if (objc_opt_respondsToSelector())
  {
    [(_MADVideoRemoveBackgroundPreviewResult *)self->_madResult normalizedCropRect];
  }
  else
  {
    double v3 = 0.0;
    double v4 = 0.0;
    double v5 = 1.0;
    double v6 = 1.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)subjectMatteAtCompositionTime:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  memset(&v25, 0, sizeof(v25));
  madResult = self->_madResult;
  if (madResult)
  {
    [(_MADVideoRemoveBackgroundPreviewResult *)madResult timeRange];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
  }
  *(_OWORD *)&rhs.value = v21;
  rhs.epoch = v22;
  CMTime lhs = (CMTime)*a3;
  CMTimeSubtract(&v25, &lhs, &rhs);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v6 = [(_MADVideoRemoveBackgroundPreviewResult *)self->_madResult frames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
LABEL_6:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v6);
      }
      objc_super v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      if (v12) {
        [*(id *)(*((void *)&v16 + 1) + 8 * v11) presentationTimeStamp];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      CMTime lhs = v25;
      if (CMTimeCompare(&time1, &lhs) == 1) {
        break;
      }
      uint64_t v9 = [v12 pixelBuffer];
      if (v8 == ++v11)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
        if (v8) {
          goto LABEL_6;
        }
        break;
      }
    }

    if (v9)
    {
      v13 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v9];
      goto LABEL_19;
    }
  }
  else
  {
  }
  v13 = 0;
LABEL_19:
  return v13;
}

- (id)subjectMatteForImage:(id)a3 atCompositionTime:(id *)a4
{
  id v6 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a4;
  uint64_t v7 = [(VKCRemoveBackgroundVideoPreviewResult *)self subjectMatteAtCompositionTime:&v17];
  if (v7)
  {
    [v6 extent];
    double v9 = v8;
    double v11 = v10;
    [v7 extent];
    if (v12 != 0.0 && v13 != 0.0)
    {
      CGAffineTransformMakeScale(&v16, v9 / v12, v11 / v13);
      uint64_t v14 = [v7 imageByApplyingTransform:&v16];

      uint64_t v7 = (void *)v14;
    }
  }

  return v7;
}

- (BOOL)successful
{
  return self->_successful;
}

- (void)setSuccessful:(BOOL)a3
{
  self->_successful = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_madResult, 0);
}

@end
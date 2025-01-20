@interface _NUVisionForegroundIsolationSegmentationResult
- (NUImageBuffer)maskBuffer;
- (_NUVisionForegroundIsolationSegmentationResult)initWithMaskBuffer:(id)a3;
@end

@implementation _NUVisionForegroundIsolationSegmentationResult

- (void).cxx_destruct
{
}

- (NUImageBuffer)maskBuffer
{
  return self->_maskBuffer;
}

- (_NUVisionForegroundIsolationSegmentationResult)initWithMaskBuffer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_NUVisionForegroundIsolationSegmentationResult;
  v6 = [(_NUVisionForegroundIsolationSegmentationResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_maskBuffer, a3);
  }

  return v7;
}

@end
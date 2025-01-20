@interface VUIPlistMediaEntityImageLoadOperation
- (VUIPlistMediaEntityImageLoadOperation)initWithParams:(id)a3;
- (VUIPlistMediaEntityImageLoadOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5;
- (void)executionDidBegin;
@end

@implementation VUIPlistMediaEntityImageLoadOperation

- (VUIPlistMediaEntityImageLoadOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  v8 = NSStringFromSelector(a2);
  [v6 raise:v7, @"The %@ initializer is not available.", v8 format];

  return 0;
}

- (VUIPlistMediaEntityImageLoadOperation)initWithParams:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIPlistMediaEntityImageLoadOperation;
  return -[VUIImageLoadParamsOperation initWithParams:scaleToSize:cropToFit:](&v4, sel_initWithParams_scaleToSize_cropToFit_, a3, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (void)executionDidBegin
{
  v3 = [(VUIPlistMediaEntityImageLoadOperation *)self _plistMediaEntityImageLoadParams];
  objc_super v4 = [v3 imageURL];
  if ([v4 isFileURL])
  {
    v5 = [v4 absoluteString];
    if (v5)
    {
      id v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
    }
    else
    {
      id v8 = 0;
    }

    v6 = v8;
  }
  else
  {
    v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
  }
  id v9 = v6;
  if ([v6 length])
  {
    uint64_t v7 = [MEMORY[0x1E4FA9C88] imageWithData:v9];
    [(VUIImageLoadParamsOperation *)self setImage:v7];
  }
  [(VUIImageLoadParamsOperation *)self setScalingResult:0];
  [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
}

@end
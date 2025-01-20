@interface VUIMPMediaEntityImageLoadOperation
- (VUIMPMediaEntityImageLoadOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4;
- (VUIMPMediaEntityImageLoadOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5;
- (void)_finishWithImage:(id)a3;
- (void)executionDidBegin;
@end

@implementation VUIMPMediaEntityImageLoadOperation

- (VUIMPMediaEntityImageLoadOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  v8 = NSStringFromSelector(a2);
  [v6 raise:v7, @"The %@ initializer is not available.", v8 format];

  return 0;
}

- (VUIMPMediaEntityImageLoadOperation)initWithParams:(id)a3 scaleToSize:(CGSize)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VUIMPMediaEntityImageLoadOperation;
  return -[VUIImageLoadParamsOperation initWithParams:scaleToSize:cropToFit:](&v5, sel_initWithParams_scaleToSize_cropToFit_, a3, 0, a4.width, a4.height);
}

- (void)executionDidBegin
{
  v3 = [(VUIMPMediaEntityImageLoadOperation *)self _MPMediaEntityImageLoadParams];
  v4 = [v3 artworkCatalog];
  objc_super v5 = v4;
  if (v4)
  {
    if ([v4 hasImageOnDisk])
    {
      v6 = [v5 bestImageFromDisk];
      [(VUIMPMediaEntityImageLoadOperation *)self _finishWithImage:v6];
    }
    else
    {
      objc_msgSend(v5, "setFittingSize:", *MEMORY[0x1E4F31290], *(double *)(MEMORY[0x1E4F31290] + 8));
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __55__VUIMPMediaEntityImageLoadOperation_executionDidBegin__block_invoke;
      v7[3] = &unk_1E6DF5B48;
      objc_copyWeak(&v8, &location);
      [v5 requestImageWithCompletion:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(VUIMPMediaEntityImageLoadOperation *)self _finishWithImage:0];
  }
}

void __55__VUIMPMediaEntityImageLoadOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _finishWithImage:v3];
}

- (void)_finishWithImage:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4FA9C88], "imageWithCGImageRef:preserveAlpha:", objc_msgSend(a3, "CGImage"), 1);
    [(VUIImageLoadParamsOperation *)self setImage:v4];
  }
  [(VUIImageLoadParamsOperation *)self setScalingResult:0];
  [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
}

@end
@interface VUISidebandMediaEntityImageLoadOperation
- (void)_finishWithImage:(id)a3;
- (void)executionDidBegin;
@end

@implementation VUISidebandMediaEntityImageLoadOperation

- (void)executionDidBegin
{
  v3 = [(VUIImageLoadParamsOperation *)self params];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(VUIImageLoadParamsOperation *)self params];
    v6 = [v5 imageInfo];
    if (v6)
    {
      objc_initWeak(&location, self);
      v7 = [v6 managedObjectContext];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke;
      v8[3] = &unk_1E6DF5490;
      objc_copyWeak(&v10, &location);
      id v9 = v6;
      [v7 performBlock:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      [(VUISidebandMediaEntityImageLoadOperation *)self _finishWithImage:0];
    }
  }
  else
  {
    [(VUISidebandMediaEntityImageLoadOperation *)self _finishWithImage:0];
  }
}

void __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [*(id *)(a1 + 32) imageData];
  v4 = [v3 data];
  v5 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke_2;
  block[3] = &unk_1E6DF45D8;
  id v9 = v4;
  id v10 = v3;
  id v11 = WeakRetained;
  id v6 = v3;
  id v7 = v4;
  dispatch_async(v5, block);
}

void __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke_2(id *a1)
{
  if ([a1[4] length])
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:a1[4]];
    id v3 = a1[5];
    if (v3)
    {
      v4 = [v3 managedObjectContext];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke_3;
      v6[3] = &unk_1E6DF3D58;
      id v7 = a1[5];
      [v4 performBlock:v6];
    }
    [a1[6] _finishWithImage:v2];
  }
  else
  {
    id v5 = a1[6];
    [v5 _finishWithImage:0];
  }
}

void __61__VUISidebandMediaEntityImageLoadOperation_executionDidBegin__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  [v2 refreshObject:*(void *)(a1 + 32) mergeChanges:0];
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
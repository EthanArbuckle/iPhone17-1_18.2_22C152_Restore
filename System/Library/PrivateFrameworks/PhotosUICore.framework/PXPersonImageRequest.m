@interface PXPersonImageRequest
- (NSTimer)imageLoadInvalidationTimer;
- (PXPerson)person;
- (PXPersonImageRequest)initWithPerson:(id)a3;
- (unint64_t)imageRequestTag;
- (void)cancel;
- (void)dealloc;
- (void)requestFaceCropWithOptions:(id)a3 timeout:(double)a4 resultHandler:(id)a5;
- (void)setImageLoadInvalidationTimer:(id)a3;
- (void)setImageRequestTag:(unint64_t)a3;
@end

@implementation PXPersonImageRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoadInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)setImageRequestTag:(unint64_t)a3
{
  self->_imageRequestTag = a3;
}

- (unint64_t)imageRequestTag
{
  return self->_imageRequestTag;
}

- (void)setImageLoadInvalidationTimer:(id)a3
{
}

- (NSTimer)imageLoadInvalidationTimer
{
  return self->_imageLoadInvalidationTimer;
}

- (PXPerson)person
{
  return self->_person;
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(PXPersonImageRequest *)obj imageLoadInvalidationTimer];
  [v2 invalidate];

  [(PXPersonImageRequest *)obj setImageLoadInvalidationTimer:0];
  [(PXPersonImageRequest *)obj setImageRequestTag:[(PXPersonImageRequest *)obj imageRequestTag] + 1];
  objc_sync_exit(obj);
}

- (void)requestFaceCropWithOptions:(id)a3 timeout:(double)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(PXPersonImageRequest *)self imageLoadInvalidationTimer];

  if (v10) {
    [(PXPersonImageRequest *)self cancel];
  }
  v11 = [(PXPersonImageRequest *)self imageRequestTag];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1E4F1CB00];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__PXPersonImageRequest_requestFaceCropWithOptions_timeout_resultHandler___block_invoke;
  v22[3] = &unk_1E5DB2520;
  objc_copyWeak(v25, &location);
  v24 = v27;
  id v13 = v9;
  id v23 = v13;
  v25[1] = v11;
  v14 = [v12 timerWithTimeInterval:0 repeats:v22 block:a4];
  [(PXPersonImageRequest *)self setImageLoadInvalidationTimer:v14];
  v15 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v15 addTimer:v14 forMode:*MEMORY[0x1E4F1C3A0]];

  v16 = +[PXPeopleFaceCropManager sharedManager];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__PXPersonImageRequest_requestFaceCropWithOptions_timeout_resultHandler___block_invoke_2;
  v18[3] = &unk_1E5DB2548;
  objc_copyWeak(v21, &location);
  v20 = v27;
  id v17 = v13;
  id v19 = v17;
  v21[1] = v11;
  [v16 requestFaceCropForOptions:v8 resultHandler:v18];

  objc_destroyWeak(v21);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(v27, 8);
}

void __73__PXPersonImageRequest_requestFaceCropWithOptions_timeout_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_sync_enter(v3);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v4 + 24))
  {
    *(unsigned char *)(v4 + 24) = 1;
    if (*(void *)(a1 + 32))
    {
      uint64_t v5 = *(void *)(a1 + 56);
      if (v5 == [v3 imageRequestTag]) {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
    [v3 cancel];
  }
  objc_sync_exit(v3);
}

void __73__PXPersonImageRequest_requestFaceCropWithOptions_timeout_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_sync_enter(v7);
  id v8 = [v6 objectForKeyedSubscript:@"PXPeopleErrorKey"];
  id v9 = v8;
  if (v5 || [v8 code] || (uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8), *(unsigned char *)(v10 + 24)))
  {
    v11 = [v7 imageLoadInvalidationTimer];
    [v11 invalidate];

    [v7 setImageLoadInvalidationTimer:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if (*(void *)(a1 + 32))
    {
      uint64_t v12 = *(void *)(a1 + 56);
      if (v12 == [v7 imageRequestTag]) {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
  else
  {
    *(unsigned char *)(v10 + 24) = 1;
    if (*(void *)(a1 + 32))
    {
      uint64_t v13 = *(void *)(a1 + 56);
      if (v13 == [v7 imageRequestTag])
      {
        uint64_t v14 = *(void *)(a1 + 32);
        v16 = @"PXPeopleErrorKey";
        v17[0] = v9;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
        (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
      }
    }
    [v7 cancel];
  }

  objc_sync_exit(v7);
}

- (void)dealloc
{
  id v3 = [(PXPersonImageRequest *)self imageLoadInvalidationTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)PXPersonImageRequest;
  [(PXPersonImageRequest *)&v4 dealloc];
}

- (PXPersonImageRequest)initWithPerson:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPersonImageRequest;
  id v6 = [(PXPersonImageRequest *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_person, a3);
    v7->_imageRequestTag = 0;
  }

  return v7;
}

@end
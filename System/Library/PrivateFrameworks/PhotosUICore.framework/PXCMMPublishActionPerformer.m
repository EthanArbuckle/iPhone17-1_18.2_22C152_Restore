@interface PXCMMPublishActionPerformer
- (BOOL)isCancellable;
- (NSURL)publishedURL;
- (id)createActionProgress;
- (id)performPublishActionWithSession:(id)a3 shareOrigin:(int64_t)a4 completionHandler:(id)a5;
- (void)_completePublishActionWithSuccess:(BOOL)a3 error:(id)a4 shareOrigin:(int64_t)a5 completionHandler:(id)a6;
- (void)cancelActionWithCompletionHandler:(id)a3;
- (void)setPublishedURL:(id)a3;
@end

@implementation PXCMMPublishActionPerformer

- (void).cxx_destruct
{
}

- (void)setPublishedURL:(id)a3
{
}

- (NSURL)publishedURL
{
  return self->_publishedURL;
}

- (void)cancelActionWithCompletionHandler:(id)a3
{
  id v8 = a3;
  if (![(PXCMMPublishActionPerformer *)self isCancellable])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXCMMActionManager.m", 187, @"Invalid parameter not satisfying: %@", @"self.isCancellable" object file lineNumber description];
  }
  v5 = [(PXCMMActionPerformer *)self progress];
  [v5 cancel];

  v6 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v6 = v8;
  }
}

- (BOOL)isCancellable
{
  v2 = [(PXCMMActionPerformer *)self progress];
  char v3 = [v2 isCancellable];

  return v3;
}

- (void)_completePublishActionWithSuccess:(BOOL)a3 error:(id)a4 shareOrigin:(int64_t)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v11 = (void (**)(id, void *, void))a6;
  v12 = [(PXCMMActionPerformer *)self progress];
  if (([v12 isCancelled] & 1) == 0) {
    objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "totalUnitCount"));
  }
  if (v8)
  {
    v13 = [(PXCMMPublishActionPerformer *)self publishedURL];

    if (v13)
    {
      v14 = [(PXCMMPublishActionPerformer *)self publishedURL];
      [(PXCMMPublishActionPerformer *)self setPublishedURL:0];
      v11[2](v11, v14, 0);
      v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      v17 = (void *)v16;
      v18 = 0;
      if ((unint64_t)a5 <= 4) {
        v18 = off_1E5DC1780[a5];
      }
      v19 = (void *)MEMORY[0x1E4F56658];
      uint64_t v22 = *MEMORY[0x1E4F56560];
      v23[0] = v16;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      [v19 sendEvent:v18 withPayload:v20];

      if (objc_msgSend(MEMORY[0x1E4F22488], "px_allowsDonationsForCurrentProcess"))
      {
        v21 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.mobileslideshow.cmm.publish"];
        [v21 becomeCurrent];
      }
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1004, @"Publish \"succeeded\" with no URL");
      ((void (**)(id, void *, void *))v11)[2](v11, 0, v14);
    }
  }
  else
  {
    ((void (**)(id, void *, id))v11)[2](v11, 0, v10);
  }
}

- (id)performPublishActionWithSession:(id)a3 shareOrigin:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__PXCMMPublishActionPerformer_performPublishActionWithSession_shareOrigin_completionHandler___block_invoke;
  v13[3] = &unk_1E5DC1760;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a4;
  id v10 = v9;
  id v14 = v10;
  v11 = [(PXCMMActionPerformer *)self performActionWithSession:v8 completionHandler:v13];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v11;
}

void __93__PXCMMPublishActionPerformer_performPublishActionWithSession_shareOrigin_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _completePublishActionWithSuccess:a2 error:v6 shareOrigin:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 32)];
}

- (id)createActionProgress
{
  return (id)[MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
}

@end
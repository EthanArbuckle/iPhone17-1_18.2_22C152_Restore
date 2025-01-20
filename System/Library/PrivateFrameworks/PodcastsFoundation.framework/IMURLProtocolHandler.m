@interface IMURLProtocolHandler
- (BOOL)followsRedirects;
- (void)handleCompletionWithTask:(id)a3 metrics:(id)a4 decodedObject:(id)a5 completionHandler:(id)a6;
- (void)setFollowsRedirects:(BOOL)a3;
@end

@implementation IMURLProtocolHandler

- (void)handleCompletionWithTask:(id)a3 metrics:(id)a4 decodedObject:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__IMURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke;
  v16[3] = &unk_1E5E62FB8;
  objc_copyWeak(&v18, &location);
  id v14 = v13;
  id v17 = v14;
  v15.receiver = self;
  v15.super_class = (Class)IMURLProtocolHandler;
  [(AMSURLProtocolHandler *)&v15 handleCompletionWithTask:v10 metrics:v11 decodedObject:v12 completionHandler:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __89__IMURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    char v5 = [WeakRetained followsRedirects];
    if ([v8 actionType] == 1 && (v5 & 1) == 0)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = +[IMIgnoreRedirectURLAction ignoreRedirectAction];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }
  else
  {
    [v8 actionType];
  }
}

- (BOOL)followsRedirects
{
  return self->_followsRedirects;
}

- (void)setFollowsRedirects:(BOOL)a3
{
  self->_followsRedirects = a3;
}

@end
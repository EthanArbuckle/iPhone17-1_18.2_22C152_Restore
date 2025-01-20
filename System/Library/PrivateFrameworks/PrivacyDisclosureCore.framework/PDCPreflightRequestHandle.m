@interface PDCPreflightRequestHandle
+ (id)alreadyCompletedRequestHandle;
- (PDCPreflightRequestHandle)initWithQueue:(id)a3 completionHandler:(id)a4;
- (void)cancel;
- (void)completeRequestWithResponse:(unint64_t)a3;
@end

@implementation PDCPreflightRequestHandle

+ (id)alreadyCompletedRequestHandle
{
  if (alreadyCompletedRequestHandle_once != -1) {
    dispatch_once(&alreadyCompletedRequestHandle_once, &__block_literal_global_1);
  }
  v2 = (void *)alreadyCompletedRequestHandle_result;

  return v2;
}

void __58__PDCPreflightRequestHandle_alreadyCompletedRequestHandle__block_invoke()
{
  v0 = [[PDCPreflightRequestHandle alloc] initWithQueue:0 completionHandler:0];
  v1 = (void *)alreadyCompletedRequestHandle_result;
  alreadyCompletedRequestHandle_result = (uint64_t)v0;

  atomic_exchange((atomic_uchar *volatile)(alreadyCompletedRequestHandle_result + 8), 1u);
}

- (PDCPreflightRequestHandle)initWithQueue:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PDCPreflightRequestHandle;
  v9 = [(PDCPreflightRequestHandle *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_isComplete._Value = 0;
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [v8 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (void)completeRequestWithResponse:(unint64_t)a3
{
  if ((atomic_exchange(&self->_isComplete._Value, 1u) & 1) == 0)
  {
    v5 = (void *)MEMORY[0x261141090](self->_completionHandler, a2);
    queue = self->_queue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__PDCPreflightRequestHandle_completeRequestWithResponse___block_invoke;
    v10[3] = &unk_265479E68;
    id v11 = v5;
    unint64_t v12 = a3;
    id v7 = v5;
    dispatch_async(queue, v10);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    v9 = self->_queue;
    self->_queue = 0;
  }
}

uint64_t __57__PDCPreflightRequestHandle_completeRequestWithResponse___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)cancel
{
  v3 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_25A653000, v3, OS_LOG_TYPE_INFO, "Disclosure alert cancelled by client.", v5, 2u);
  }
  v4 = +[PDCPrivacyAlertPresenter sharedPresenter];
  [v4 didCancelRequestHandle:self];

  [(PDCPreflightRequestHandle *)self completeRequestWithResponse:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
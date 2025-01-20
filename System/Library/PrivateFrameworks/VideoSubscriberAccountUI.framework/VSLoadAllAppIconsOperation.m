@interface VSLoadAllAppIconsOperation
- (BOOL)shouldPrecomposeIcon;
- (CGSize)preferredSize;
- (NSArray)appDescriptions;
- (NSError)error;
- (NSOperationQueue)privateQueue;
- (VSLoadAllAppIconsOperation)init;
- (VSLoadAllAppIconsOperation)initWithApps:(id)a3 shouldPrecomposeIcon:(BOOL)a4;
- (VSLoadAllAppIconsOperation)initWithApps:(id)a3 shouldPrecomposeIcon:(BOOL)a4 preferredSize:(CGSize)a5;
- (id)resultCompletionBlock;
- (void)cancel;
- (void)executionDidBegin;
- (void)setAppDescriptions:(id)a3;
- (void)setError:(id)a3;
- (void)setPreferredSize:(CGSize)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setResultCompletionBlock:(id)a3;
- (void)setShouldPrecomposeIcon:(BOOL)a3;
@end

@implementation VSLoadAllAppIconsOperation

- (VSLoadAllAppIconsOperation)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSLoadAllAppIconsOperation)initWithApps:(id)a3 shouldPrecomposeIcon:(BOOL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VSLoadAllAppIconsOperation;
  v7 = [(VSLoadAllAppIconsOperation *)&v10 init];
  v8 = v7;
  if (v7) {
    commonInit_1((id *)&v7->super.super.super.isa, v6, a4, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }

  return v8;
}

- (VSLoadAllAppIconsOperation)initWithApps:(id)a3 shouldPrecomposeIcon:(BOOL)a4 preferredSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSLoadAllAppIconsOperation;
  objc_super v10 = [(VSLoadAllAppIconsOperation *)&v13 init];
  v11 = v10;
  if (v10) {
    commonInit_1((id *)&v10->super.super.super.isa, v9, a4, width, height);
  }

  return v11;
}

- (void)setResultCompletionBlock:(id)a3
{
  self->_resultCompletionBlock = (id)MEMORY[0x2455D84D0](a3, a2);
  MEMORY[0x270F9A758]();
}

- (void)executionDidBegin
{
  v7 = [a2 displayName];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_23F9AB000, a4, OS_LOG_TYPE_ERROR, "No icon URL for %@", a1, 0xCu);
}

uint64_t __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) appDescriptions];
    int v9 = 134217984;
    uint64_t v10 = [v3 count];
    _os_log_impl(&dword_23F9AB000, v2, OS_LOG_TYPE_DEFAULT, "Finished Loading %lu Images", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 32) resultCompletionBlock];

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = v5[36];
    v7 = [v5 error];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  return [*(id *)(a1 + 32) finishExecutionIfPossible];
}

void __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_11(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 48));
  objc_copyWeak(&location, (id *)(a1 + 56));
  id v2 = objc_loadWeakRetained(&location);
  v3 = [v2 result];
  uint64_t v4 = [v3 forceUnwrapObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_2;
  v6[3] = &unk_265077708;
  objc_copyWeak(&v7, &to);
  v6[4] = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_3;
  v5[3] = &unk_265076EB8;
  v5[4] = *(void *)(a1 + 40);
  [v4 unwrapObject:v6 error:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  objc_destroyWeak(&to);
}

void __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained shouldPrecomposeIcon];

  if (v4)
  {
    uint64_t v5 = [v7 _applicationIconImageForFormat:0 precomposed:1];

    id v6 = (id)v5;
  }
  else
  {
    id v6 = v7;
  }
  id v8 = v6;
  [*(id *)(a1 + 32) setIcon:v6];
}

void __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_3_cold_1((uint64_t)v3, v4);
  }

  [*(id *)(a1 + 32) setError:v3];
}

- (void)cancel
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)VSLoadAllAppIconsOperation;
  [(VSAsyncOperation *)&v6 cancel];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(VSLoadAllAppIconsOperation *)self appDescriptions];
    uint64_t v5 = [v4 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v5;
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling Loading %lu Images", buf, 0xCu);
  }
  [(VSAsyncOperation *)self finishExecutionIfPossible];
}

- (BOOL)shouldPrecomposeIcon
{
  return self->_shouldPrecomposeIcon;
}

- (void)setShouldPrecomposeIcon:(BOOL)a3
{
  self->_shouldPrecomposeIcon = a3;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (NSArray)appDescriptions
{
  return self->_appDescriptions;
}

- (void)setAppDescriptions:(id)a3
{
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (id)resultCompletionBlock
{
  return self->_resultCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultCompletionBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_appDescriptions, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
}

void __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Failed to set App Icon: %@", (uint8_t *)&v2, 0xCu);
}

@end
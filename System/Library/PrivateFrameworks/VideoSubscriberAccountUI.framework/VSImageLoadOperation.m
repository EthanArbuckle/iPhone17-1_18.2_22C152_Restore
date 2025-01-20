@interface VSImageLoadOperation
- (BOOL)isNonAppInitiated;
- (CGSize)preferredImageSize;
- (NSItemProvider)itemProvider;
- (NSURLSessionTask)task;
- (VSAuditToken)auditToken;
- (VSImageLoadOperation)init;
- (VSImageLoadOperation)initWithItemProvider:(id)a3 preferredImageSize:(CGSize)a4;
- (VSOptional)result;
- (void)_beginFetchingDataFromURL:(id)a3;
- (void)_finishWithImageData:(id)a3 orError:(id)a4;
- (void)cancel;
- (void)executionDidBegin;
- (void)setAuditToken:(id)a3;
- (void)setNonAppInitiated:(BOOL)a3;
- (void)setResult:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation VSImageLoadOperation

- (VSImageLoadOperation)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSImageLoadOperation)initWithItemProvider:(id)a3 preferredImageSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSImageLoadOperation;
  v9 = [(VSImageLoadOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemProvider, a3);
    v10->_preferredImageSize.CGFloat width = width;
    v10->_preferredImageSize.CGFloat height = height;
    v11 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    v12 = v10->_result;
    v10->_result = v11;
  }
  return v10;
}

- (void)_finishWithImageData:(id)a3 orError:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Did load image data %@", (uint8_t *)&v21, 0xCu);
    }

    id v9 = v6;
    v10 = [MEMORY[0x263F1C6B0] imageWithData:v9];
    if (v10)
    {
      v11 = (void *)MEMORY[0x263F1E250];
      v12 = [MEMORY[0x263F1E208] failableWithObject:v10];
      v13 = [v11 optionalWithObject:v12];
      [(VSImageLoadOperation *)self setResult:v13];
    }
    else
    {
      v18 = VSErrorLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[VSImageLoadOperation _finishWithImageData:orError:](v18);
      }

      v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:256 userInfo:0];
      v19 = (void *)MEMORY[0x263F1E250];
      v13 = [MEMORY[0x263F1E208] failableWithError:v12];
      v20 = [v19 optionalWithObject:v13];
      [(VSImageLoadOperation *)self setResult:v20];
    }
  }
  else
  {
    objc_super v14 = VSErrorLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[VSImageLoadOperation _finishWithImageData:orError:]((uint64_t)v7, v14);
    }

    if (!v7) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The errorOrNil parameter must not be nil."];
    }
    v15 = (void *)MEMORY[0x263F1E250];
    v16 = (void *)MEMORY[0x263F1E208];
    id v17 = v7;
    id v9 = [v16 failableWithError:v17];
    v10 = [v15 optionalWithObject:v9];

    [(VSImageLoadOperation *)self setResult:v10];
  }

  [(VSAsyncOperation *)self finishExecutionIfPossible];
}

- (void)_beginFetchingDataFromURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F08C00];
  id v6 = [(VSImageLoadOperation *)self auditToken];
  id v7 = objc_msgSend(v5, "vs_defaultSessionConfigurationForSourceAppWithAuditToken:", v6);

  objc_initWeak(&location, self);
  id v8 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v7];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v4];
  objc_msgSend(v9, "_setNonAppInitiated:", -[VSImageLoadOperation isNonAppInitiated](self, "isNonAppInitiated"));
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __50__VSImageLoadOperation__beginFetchingDataFromURL___block_invoke;
  objc_super v14 = &unk_265077CD8;
  objc_copyWeak(&v15, &location);
  v10 = [v8 dataTaskWithRequest:v9 completionHandler:&v11];
  -[VSImageLoadOperation setTask:](self, "setTask:", v10, v11, v12, v13, v14);
  [v10 resume];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __50__VSImageLoadOperation__beginFetchingDataFromURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _finishWithImageData:v7 orError:v6];
}

- (void)executionDidBegin
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = (void *)MEMORY[0x263F08D40];
  [(VSImageLoadOperation *)self preferredImageSize];
  v5 = objc_msgSend(v4, "valueWithCGSize:");
  [v3 setObject:v5 forKey:*MEMORY[0x263F081A0]];

  [v3 setObject:*MEMORY[0x263F08190] forKey:*MEMORY[0x263F08198]];
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __41__VSImageLoadOperation_executionDidBegin__block_invoke;
  v16 = &unk_265077D00;
  objc_copyWeak(&v17, &location);
  id v6 = (void *)MEMORY[0x2455D84D0](&v13);
  v10 = (void *)MEMORY[0x2455D84D0](v6, v7, v8, v9);
  uint64_t v11 = VSDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = self;
    _os_log_impl(&dword_23F9AB000, v11, OS_LOG_TYPE_DEFAULT, "Will load image %@", buf, 0xCu);
  }

  uint64_t v12 = [(VSImageLoadOperation *)self itemProvider];
  [v12 loadItemForTypeIdentifier:*MEMORY[0x263F01A68] options:v3 completionHandler:v10];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __41__VSImageLoadOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v11)
    {
      [WeakRetained _beginFetchingDataFromURL:v11];
    }
    else
    {
      if (!v5) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The errorOrNil parameter must not be nil."];
      }
      uint64_t v8 = (void *)MEMORY[0x263F1E250];
      uint64_t v9 = [MEMORY[0x263F1E208] failableWithError:v5];
      v10 = [v8 optionalWithObject:v9];
      [v7 setResult:v10];

      [v7 finishExecutionIfPossible];
    }
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VSImageLoadOperation;
  [(VSAsyncOperation *)&v4 cancel];
  id v3 = [(VSImageLoadOperation *)self task];
  [v3 cancel];

  [(VSAsyncOperation *)self finishExecutionIfPossible];
}

- (BOOL)isNonAppInitiated
{
  return self->_nonAppInitiated;
}

- (void)setNonAppInitiated:(BOOL)a3
{
  self->_nonAppInitiated = a3;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (CGSize)preferredImageSize
{
  double width = self->_preferredImageSize.width;
  double height = self->_preferredImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

- (void)_finishWithImageData:(uint64_t)a1 orError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Error loading image data: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_finishWithImageData:(os_log_t)log orError:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "Unable to construct image from data.", v1, 2u);
}

@end
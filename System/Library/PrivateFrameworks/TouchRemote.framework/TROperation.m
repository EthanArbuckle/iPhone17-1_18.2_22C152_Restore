@interface TROperation
+ (id)userCancelledError;
- (NSDictionary)result;
- (NSError)error;
- (OS_dispatch_semaphore)semaphore;
- (TROperation)initWithSession:(id)a3;
- (TRSession)session;
- (void)finishWithError:(id)a3;
- (void)finishWithResult:(id)a3;
- (void)main;
- (void)setError:(id)a3;
- (void)setResult:(id)a3;
- (void)setSemaphore:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation TROperation

+ (id)userCancelledError
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-10001 userInfo:0];
}

- (TROperation)initWithSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TROperation;
  v6 = [(TROperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v7;
}

- (void)main
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2048;
      v10 = self;
      id v4 = v8;
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%@<%p> started", (uint8_t *)&v7, 0x16u);
    }
  }
  id v5 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semaphore = self->_semaphore;
  self->_semaphore = v5;

  [(TROperation *)self execute];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)finishWithResult:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_TRLogEnabled == 1)
  {
    id v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v7 = 138412802;
      *(void *)&v7[4] = objc_opt_class();
      *(_WORD *)&v7[12] = 2048;
      *(void *)&v7[14] = self;
      *(_WORD *)&v7[22] = 2112;
      id v8 = v4;
      id v6 = *(id *)&v7[4];
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%@<%p> completed successfully with result %@", v7, 0x20u);
    }
  }
  -[TROperation setResult:](self, "setResult:", v4, *(_OWORD *)v7, *(void *)&v7[16], v8);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)finishWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_TRLogEnabled == 1)
  {
    id v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v7 = 138412802;
      *(void *)&v7[4] = objc_opt_class();
      *(_WORD *)&v7[12] = 2048;
      *(void *)&v7[14] = self;
      *(_WORD *)&v7[22] = 2112;
      id v8 = v4;
      id v6 = *(id *)&v7[4];
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%@<%p> failed with error: %@", v7, 0x20u);
    }
  }
  -[TROperation setError:](self, "setError:", v4, *(_OWORD *)v7, *(void *)&v7[16], v8);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (TRSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSDictionary)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
@interface TPSXPCConnection
@end

@implementation TPSXPCConnection

void __27___TPSXPCConnection_resume__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = +[TPSLogger data];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_19C8DC000, v3, OS_LOG_TYPE_DEFAULT, "%@Connection to \"%@\" interrupted", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = [WeakRetained interruptionHandler];
  v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
}

void __27___TPSXPCConnection_resume__block_invoke_12(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = +[TPSLogger data];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_19C8DC000, v3, OS_LOG_TYPE_DEFAULT, "%@Connection to \"%@\" invalidated", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = [WeakRetained invalidationHandler];
  v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
}

void __44___TPSXPCConnection_setInterruptionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained exportedObject];
  if (objc_opt_respondsToSelector()) {
    [v1 connectionInterrupted];
  }
}

void __44___TPSXPCConnection_setInvalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained exportedObject];
  [v1 connectionInvalidated];
}

@end
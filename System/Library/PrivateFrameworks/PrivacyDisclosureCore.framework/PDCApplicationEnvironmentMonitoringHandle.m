@interface PDCApplicationEnvironmentMonitoringHandle
- (PDCApplicationEnvironmentMonitoring)delegate;
- (PDCApplicationEnvironmentMonitoringHandle)initWithWorkspace:(id)a3 delegate:(id)a4 queue:(id)a5;
- (void)applicationsDidUninstall:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation PDCApplicationEnvironmentMonitoringHandle

- (PDCApplicationEnvironmentMonitoringHandle)initWithWorkspace:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PDCApplicationEnvironmentMonitoringHandle;
  v12 = [(PDCApplicationEnvironmentMonitoringHandle *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workspace, a3);
    [(PDCApplicationEnvironmentMonitoringHandle *)v13 setDelegate:v10];
    objc_storeStrong((id *)&v13->_queue, a5);
    v14 = v13;
  }

  return v13;
}

- (void)invalidate
{
  [(PDCApplicationEnvironmentMonitoringHandle *)self setDelegate:0];
  workspace = self->_workspace;

  [(LSApplicationWorkspace *)workspace removeObserver:self];
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PDCApplicationEnvironmentMonitoringHandle *)self delegate];
  if (v5)
  {
    if (objc_opt_respondsToSelector())
    {
      v6 = [MEMORY[0x263EFF980] array];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v17 = v4;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = v12;
              v14 = [v13 bundleIdentifier];
              [v6 addObject:v14];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v9);
      }

      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __70__PDCApplicationEnvironmentMonitoringHandle_applicationsDidUninstall___block_invoke;
      block[3] = &unk_265479DC8;
      id v19 = v6;
      v20 = self;
      id v21 = v5;
      id v16 = v6;
      dispatch_async(queue, block);

      id v4 = v17;
    }
  }
  else
  {
    [(PDCApplicationEnvironmentMonitoringHandle *)self invalidate];
  }
}

void __70__PDCApplicationEnvironmentMonitoringHandle_applicationsDidUninstall___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
      uint64_t v8 = objc_msgSend(a1[5], "delegate", (void)v9);

      if (!v8) {
        break;
      }
      [a1[6] applicationDidUninstall:v7];
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (PDCApplicationEnvironmentMonitoring)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PDCApplicationEnvironmentMonitoring *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_workspace, 0);
}

@end
@interface BFFFlowStarter
- (BFFFlowDiverter)diverter;
- (BFFFlowStarter)initWithFlowDiverter:(id)a3;
- (BOOL)controllerNeedsToRunForClass:(Class)a3;
- (BOOL)controllerNeedsToRunForFlowItem:(id)a3;
- (void)prepareWithCompletion:(id)a3;
- (void)setDiverter:(id)a3;
@end

@implementation BFFFlowStarter

- (BFFFlowStarter)initWithFlowDiverter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BFFFlowStarter;
  v6 = [(BFFFlowStarter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_diverter, a3);
  }

  return v7;
}

- (void)prepareWithCompletion:(id)a3
{
  v6 = (void (**)(void))a3;
  v4 = [(BFFFlowStarter *)self diverter];

  if (v4)
  {
    id v5 = [(BFFFlowStarter *)self diverter];
    [v5 prepareWithCompletion:v6];
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (BOOL)controllerNeedsToRunForClass:(Class)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v5 = [(BFFFlowStarter *)self diverter];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(BFFFlowStarter *)self diverter];
      id v24 = 0;
      id v25 = 0;
      int v8 = [v7 shouldSkipControllerClass:a3 reason:&v25 humanReadableReason:&v24];
      id v9 = v25;
      id v10 = v24;

      if (v8)
      {
        uint64_t v11 = [v10 length];
        v12 = _BYLoggingFacility();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (v13)
          {
            *(_DWORD *)buf = 138543618;
            Class v27 = a3;
            __int16 v28 = 2114;
            id v29 = v10;
            v14 = "Skipping %{public}@ via %{public}@";
            v15 = v12;
            uint32_t v16 = 22;
LABEL_20:
            _os_log_impl(&dword_21FF9E000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
          }
        }
        else if (v13)
        {
          *(_DWORD *)buf = 138543362;
          Class v27 = a3;
          v14 = "Skipping %{public}@ for unknown reason";
          v15 = v12;
          uint32_t v16 = 12;
          goto LABEL_20;
        }

        v18 = [(BFFFlowStarter *)self diverter];
        [v18 didSkipControllerClass:a3 forReason:v9];
        char v17 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      id v10 = 0;
      id v9 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      char v17 = 1;
LABEL_23:

      return v17;
    }
    v18 = [MEMORY[0x263EFF910] date];
    char v17 = [(objc_class *)a3 controllerNeedsToRun];
    v19 = [MEMORY[0x263EFF910] date];
    v20 = _BYLoggingFacility();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      [v19 timeIntervalSinceDate:v18];
      *(_DWORD *)buf = 138543618;
      Class v27 = a3;
      __int16 v28 = 2048;
      id v29 = v23;
      _os_log_debug_impl(&dword_21FF9E000, v20, OS_LOG_TYPE_DEBUG, "Decided controllerNeedsToRun for %{public}@ in %fs", buf, 0x16u);
    }

    if ((v17 & 1) == 0)
    {
      v21 = _BYLoggingFacility();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        Class v27 = a3;
        _os_log_impl(&dword_21FF9E000, v21, OS_LOG_TYPE_DEFAULT, "Skipping controller %{public}@: does not need to run", buf, 0xCu);
      }
    }
LABEL_22:

    goto LABEL_23;
  }
  return 0;
}

- (BOOL)controllerNeedsToRunForFlowItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [MEMORY[0x263EFF910] date];
    char v5 = [v3 controllerNeedsToRun];
    v6 = [MEMORY[0x263EFF910] date];
    v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      [v6 timeIntervalSinceDate:v4];
      int v11 = 138543618;
      id v12 = v3;
      __int16 v13 = 2048;
      uint64_t v14 = v10;
      _os_log_debug_impl(&dword_21FF9E000, v7, OS_LOG_TYPE_DEBUG, "Decided instance controllerNeedsToRun for %{public}@ in %fs", (uint8_t *)&v11, 0x16u);
    }

    if ((v5 & 1) == 0)
    {
      int v8 = _BYLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v3;
        _os_log_impl(&dword_21FF9E000, v8, OS_LOG_TYPE_DEFAULT, "Skipping controller %{public}@: does not need to run", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BFFFlowDiverter)diverter
{
  return self->_diverter;
}

- (void)setDiverter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
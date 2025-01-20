@interface STSHardwareManagerWrapper
- (BOOL)resolvedHwManagerState;
- (OS_dispatch_semaphore)sem;
- (id)manager;
- (void)hardwareStateDidChange;
- (void)setResolvedHwManagerState:(BOOL)a3;
- (void)setSem:(id)a3;
@end

@implementation STSHardwareManagerWrapper

- (id)manager
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x263F58118] sharedHardwareManagerWithNoUI];
  if ([(STSHardwareManagerWrapper *)v2 resolvedHwManagerState])
  {
    int v4 = [v3 getHwSupport];
  }
  else
  {
    [v3 registerEventListener:v2];
    int v5 = [v3 getHwSupport];
    int v4 = v5;
    if (v5 != 2 && v5 != 4)
    {
      v6 = [(STSHardwareManagerWrapper *)v2 sem];

      if (!v6)
      {
        dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
        [(STSHardwareManagerWrapper *)v2 setSem:v7];
      }
      v8 = [(STSHardwareManagerWrapper *)v2 sem];
      dispatch_time_t v9 = dispatch_time(0, 60000000000);
      intptr_t v10 = dispatch_semaphore_wait(v8, v9);

      if (v10)
      {
        int v4 = 1;
        sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSHardwareManagerWrapper manager]", 47, v2, @"NF state timeout", v11, v12, v16);
      }
      else
      {
        int v4 = [v3 getHwSupport];
      }
    }
    [(STSHardwareManagerWrapper *)v2 setResolvedHwManagerState:1];
    [v3 unregisterEventListener:v2];
  }
  if (v4 == 2) {
    v13 = v3;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  objc_sync_exit(v2);
  return v14;
}

- (void)hardwareStateDidChange
{
  v3 = [(STSHardwareManagerWrapper *)self sem];

  if (v3)
  {
    int v4 = [(STSHardwareManagerWrapper *)self sem];
    dispatch_semaphore_signal(v4);
  }
}

- (OS_dispatch_semaphore)sem
{
  return self->_sem;
}

- (void)setSem:(id)a3
{
}

- (BOOL)resolvedHwManagerState
{
  return self->_resolvedHwManagerState;
}

- (void)setResolvedHwManagerState:(BOOL)a3
{
  self->_resolvedHwManagerState = a3;
}

- (void).cxx_destruct
{
}

@end
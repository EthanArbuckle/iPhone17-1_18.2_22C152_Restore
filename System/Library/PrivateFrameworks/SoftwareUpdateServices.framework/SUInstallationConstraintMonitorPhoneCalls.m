@interface SUInstallationConstraintMonitorPhoneCalls
- (id)initOnQueue:(id)a3 withDownload:(id)a4;
- (id)initOnQueue:(id)a3 withDownload:(id)a4 callCenter:(id)a5 inSpringBoard:(BOOL)a6 onExistingPhoneCall:(BOOL)a7;
- (unint64_t)unsatisfiedConstraints;
- (void)_callStatusChanged;
- (void)_queue_noteOnExistingPhoneCallDidChange:(BOOL)a3;
- (void)dealloc;
@end

@implementation SUInstallationConstraintMonitorPhoneCalls

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  v6 = (void *)MEMORY[0x263F7E1A0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 callCenterWithQueue:v8];
  id v10 = -[SUInstallationConstraintMonitorPhoneCalls initOnQueue:withDownload:callCenter:inSpringBoard:onExistingPhoneCall:](self, "initOnQueue:withDownload:callCenter:inSpringBoard:onExistingPhoneCall:", v8, v7, v9, 0, [v9 currentAudioAndVideoCallCount] != 0);

  return v10;
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 callCenter:(id)a5 inSpringBoard:(BOOL)a6 onExistingPhoneCall:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  BSDispatchQueueAssert();
  v19.receiver = self;
  v19.super_class = (Class)SUInstallationConstraintMonitorPhoneCalls;
  v16 = [(SUInstallationConstraintMonitorBase *)&v19 initOnQueue:v15 withRepresentedInstallationConstraints:256 andDownload:v14];

  if (v16)
  {
    objc_storeStrong(v16 + 6, a5);
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v16 selector:sel__callStatusChanged name:*MEMORY[0x263F7E310] object:0];
    [v17 addObserver:v16 selector:sel__callStatusChanged name:*MEMORY[0x263F7E328] object:0];
    *((unsigned char *)v16 + 57) = a6;
    objc_msgSend(v16, "_queue_noteOnExistingPhoneCallDidChange:", v7);
  }
  return v16;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SUInstallationConstraintMonitorPhoneCalls;
  [(SUInstallationConstraintMonitorPhoneCalls *)&v4 dealloc];
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (self->_queue_satisfied) {
    return 0;
  }
  return [(SUInstallationConstraintMonitorBase *)self representedConstraints];
}

- (void)_callStatusChanged
{
  if (self->_inSpringBoard)
  {
    BSDispatchQueueAssertMain();
    BOOL v3 = [(TUCallCenter *)self->_queue_callCenter currentAudioAndVideoCallCount] != 0;
    queue = self->super._queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__SUInstallationConstraintMonitorPhoneCalls__callStatusChanged__block_invoke;
    v7[3] = &unk_26447CD98;
    v7[4] = self;
    BOOL v8 = v3;
    v5 = v7;
  }
  else
  {
    queue = self->super._queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__SUInstallationConstraintMonitorPhoneCalls__callStatusChanged__block_invoke_2;
    block[3] = &unk_26447C878;
    block[4] = self;
    v5 = block;
  }
  dispatch_async(queue, v5);
}

uint64_t __63__SUInstallationConstraintMonitorPhoneCalls__callStatusChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteOnExistingPhoneCallDidChange:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __63__SUInstallationConstraintMonitorPhoneCalls__callStatusChanged__block_invoke_2(uint64_t a1)
{
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 48) currentAudioAndVideoCallCount] != 0;
  BOOL v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "_queue_noteOnExistingPhoneCallDidChange:", v2);
}

- (void)_queue_noteOnExistingPhoneCallDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  if (self->_queue_satisfied != !v3)
  {
    self->_queue_satisfied = !v3;
    v5 = SULogInstallConstraints();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_satisfied) {
        v6 = @"YES";
      }
      else {
        v6 = @"NO";
      }
      int v8 = 138412546;
      v9 = self;
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_21DCF7000, v5, OS_LOG_TYPE_DEFAULT, "%@ - phone call constraint changed (satisfied? %@)", (uint8_t *)&v8, 0x16u);
    }

    BOOL v7 = [(SUInstallationConstraintMonitorBase *)self delegate];
    objc_msgSend(v7, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));
  }
}

- (void).cxx_destruct
{
}

@end
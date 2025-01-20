@interface PSYServiceSyncSession
- (BOOL)isComplete;
- (NRDevice)pairedDevice;
- (NSUUID)pairingID;
- (NSUUID)sessionIdentifier;
- (PDRDevice)pdrPairedDevice;
- (PSYServiceSyncSession)initWithQueue:(id)a3 supportsMigrationSync:(BOOL)a4;
- (PSYServiceSyncSessionDelegate)delegate;
- (PSYSyncCoordinator)syncCoordinator;
- (unint64_t)switchID;
- (unint64_t)syncSessionType;
- (void)reportProgress:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setPdrPairedDevice:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSwitchID:(unint64_t)a3;
- (void)setSyncCoordinator:(id)a3;
- (void)setSyncSessionType:(unint64_t)a3;
- (void)syncDidComplete;
- (void)syncDidCompleteSending;
- (void)syncDidFailWithError:(id)a3;
@end

@implementation PSYServiceSyncSession

- (PSYServiceSyncSession)initWithQueue:(id)a3 supportsMigrationSync:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSYServiceSyncSession;
  v8 = [(PSYServiceSyncSession *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v9->_supportsMigrationSync = a4;
  }

  return v9;
}

- (NSUUID)pairingID
{
  v2 = [(PSYServiceSyncSession *)self pdrPairedDevice];
  v3 = [v2 pairingID];

  return (NSUUID *)v3;
}

- (NRDevice)pairedDevice
{
  v3 = [MEMORY[0x263F57730] sharedInstance];
  v4 = [(PSYServiceSyncSession *)self pairingID];
  v5 = [v3 deviceForPairingID:v4];

  return (NRDevice *)v5;
}

- (void)syncDidCompleteSending
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PSYServiceSyncSession_syncDidCompleteSending__block_invoke;
  block[3] = &unk_2642B3DB8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __47__PSYServiceSyncSession_syncDidCompleteSending__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncSessionDidCompleteSending:*(void *)(a1 + 32)];
}

- (void)syncDidComplete
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__PSYServiceSyncSession_syncDidComplete__block_invoke;
  block[3] = &unk_2642B3DB8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __40__PSYServiceSyncSession_syncDidComplete__block_invoke(uint64_t a1)
{
  id v2 = psy_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = psy_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2179FA000, v4, OS_LOG_TYPE_DEFAULT, "PSYSyncCoordinator client called syncDidComplete", v6, 2u);
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  v5 = [*(id *)(a1 + 32) delegate];
  [v5 syncSessionDidComplete:*(void *)(a1 + 32)];
}

- (void)syncDidFailWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__PSYServiceSyncSession_syncDidFailWithError___block_invoke;
  v7[3] = &unk_2642B3DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __46__PSYServiceSyncSession_syncDidFailWithError___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncSession:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)reportProgress:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__PSYServiceSyncSession_reportProgress___block_invoke;
  v4[3] = &unk_2642B3F90;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

void __40__PSYServiceSyncSession_reportProgress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncSession:*(void *)(a1 + 32) reportProgress:*(double *)(a1 + 40)];
}

- (unint64_t)syncSessionType
{
  if (self->_syncSessionType == 2 && !self->_supportsMigrationSync) {
    return 0;
  }
  else {
    return self->_syncSessionType;
  }
}

- (PDRDevice)pdrPairedDevice
{
  return self->_pdrPairedDevice;
}

- (void)setPdrPairedDevice:(id)a3
{
}

- (void)setSyncSessionType:(unint64_t)a3
{
  self->_syncSessionType = a3;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (PSYSyncCoordinator)syncCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncCoordinator);

  return (PSYSyncCoordinator *)WeakRetained;
}

- (void)setSyncCoordinator:(id)a3
{
}

- (unint64_t)switchID
{
  return self->_switchID;
}

- (void)setSwitchID:(unint64_t)a3
{
  self->_switchID = a3;
}

- (PSYServiceSyncSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSYServiceSyncSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_syncCoordinator);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pdrPairedDevice, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
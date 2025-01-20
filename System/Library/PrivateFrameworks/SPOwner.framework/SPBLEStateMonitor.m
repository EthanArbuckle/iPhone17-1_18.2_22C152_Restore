@interface SPBLEStateMonitor
- (CBCentralManager)centralManager;
- (SPBLEStateMonitor)init;
- (SPBLEStateMonitorDelegate)delegate;
- (unint64_t)bleState;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)notifyDelegate:(unint64_t)a3;
- (void)setBleState:(unint64_t)a3;
- (void)setCentralManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startMonitoring;
@end

@implementation SPBLEStateMonitor

- (SPBLEStateMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)SPBLEStateMonitor;
  result = [(SPBLEStateMonitor *)&v3 init];
  if (result) {
    result->_bleState = 0;
  }
  return result;
}

- (void)startMonitoring
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SPBLEStateMonitor_startMonitoring__block_invoke;
  block[3] = &unk_1E601B790;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __36__SPBLEStateMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1BD18]);
  objc_super v3 = (void *)[v2 initWithDelegate:*(void *)(a1 + 32) queue:MEMORY[0x1E4F14428]];
  [*(id *)(a1 + 32) setCentralManager:v3];

  v4 = *(void **)(a1 + 32);
  id v5 = [v4 centralManager];
  [v4 centralManagerDidUpdateState:v5];
}

- (void)notifyDelegate:(unint64_t)a3
{
  if ([(SPBLEStateMonitor *)self bleState] != a3)
  {
    id v4 = [(SPBLEStateMonitor *)self delegate];
    objc_msgSend(v4, "bleMonitor:didChangeState:", self, -[SPBLEStateMonitor bleState](self, "bleState"));
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(SPBLEStateMonitor *)self bleState];
  if ([v4 state] == 5) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [(SPBLEStateMonitor *)self setBleState:v6];
  v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = [v4 state];
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "BluetoothState: %lu", (uint8_t *)&v8, 0xCu);
  }

  [(SPBLEStateMonitor *)self notifyDelegate:v5];
}

- (unint64_t)bleState
{
  return self->_bleState;
}

- (void)setBleState:(unint64_t)a3
{
  self->_bleState = a3;
}

- (SPBLEStateMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SPBLEStateMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
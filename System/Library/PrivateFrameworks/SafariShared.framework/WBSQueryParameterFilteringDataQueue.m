@interface WBSQueryParameterFilteringDataQueue
- (WBSQueryParameterFilteringData)currentData;
- (WBSQueryParameterFilteringDataQueueDelegate)delegate;
- (void)_cancelMergingPendingData;
- (void)_mergePendingData;
- (void)_mergePendingDataSoon;
- (void)addPendingDataWithAdjustedURL:(id)a3 originalURL:(id)a4;
- (void)clearPendingData;
- (void)commitPendingData;
- (void)setDelegate:(id)a3;
- (void)transferPendingDataToQueue:(id)a3;
@end

@implementation WBSQueryParameterFilteringDataQueue

- (void)addPendingDataWithAdjustedURL:(id)a3 originalURL:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  pendingData = self->_pendingData;
  if (!pendingData)
  {
    v8 = objc_alloc_init(WBSQueryParameterFilteringData);
    v9 = self->_pendingData;
    self->_pendingData = v8;

    pendingData = self->_pendingData;
  }
  [(WBSQueryParameterFilteringData *)pendingData addAdjustedURL:v10 originalURL:v6];
  [(WBSQueryParameterFilteringDataQueue *)self _mergePendingDataSoon];
}

- (void)clearPendingData
{
  pendingData = self->_pendingData;
  self->_pendingData = 0;

  [(WBSQueryParameterFilteringDataQueue *)self _cancelMergingPendingData];
}

- (void)commitPendingData
{
  objc_storeStrong((id *)&self->_currentData, self->_pendingData);
  pendingData = self->_pendingData;
  self->_pendingData = 0;

  [(WBSQueryParameterFilteringDataQueue *)self _cancelMergingPendingData];
}

- (void)transferPendingDataToQueue:(id)a3
{
  objc_storeStrong((id *)a3 + 1, self->_pendingData);
  pendingData = self->_pendingData;
  self->_pendingData = 0;

  [(WBSQueryParameterFilteringDataQueue *)self _cancelMergingPendingData];
}

- (void)_cancelMergingPendingData
{
  [(NSTimer *)self->_mergePendingDataTimer invalidate];
  mergePendingDataTimer = self->_mergePendingDataTimer;
  self->_mergePendingDataTimer = 0;
}

- (void)_mergePendingData
{
  pendingData = self->_pendingData;
  if (pendingData)
  {
    currentData = self->_currentData;
    p_currentData = &self->_currentData;
    v5 = currentData;
    if (currentData) {
      -[WBSQueryParameterFilteringData addData:](v5, "addData:");
    }
    else {
      objc_storeStrong((id *)p_currentData, pendingData);
    }
    v7 = self->_pendingData;
    self->_pendingData = 0;
  }
}

- (void)_mergePendingDataSoon
{
  [(WBSQueryParameterFilteringDataQueue *)self _cancelMergingPendingData];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __60__WBSQueryParameterFilteringDataQueue__mergePendingDataSoon__block_invoke;
  id v10 = &unk_1E5C9EF98;
  objc_copyWeak(&v11, &location);
  v4 = [v3 timerWithTimeInterval:0 repeats:&v7 block:1.0];
  mergePendingDataTimer = self->_mergePendingDataTimer;
  self->_mergePendingDataTimer = v4;

  id v6 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", v7, v8, v9, v10);
  [v6 addTimer:self->_mergePendingDataTimer forMode:*MEMORY[0x1E4F1C4B0]];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__WBSQueryParameterFilteringDataQueue__mergePendingDataSoon__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    [WeakRetained _cancelMergingPendingData];
    id v2 = objc_loadWeakRetained(v4 + 4);
    v3 = v2;
    if (!v2 || [v2 queryParameterFilteringDataQueueShouldMergePendingData:v4]) {
      [v4 _mergePendingData];
    }

    WeakRetained = v4;
  }
}

- (WBSQueryParameterFilteringData)currentData
{
  return self->_currentData;
}

- (WBSQueryParameterFilteringDataQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSQueryParameterFilteringDataQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_mergePendingDataTimer, 0);
  objc_storeStrong((id *)&self->_pendingData, 0);
}

@end
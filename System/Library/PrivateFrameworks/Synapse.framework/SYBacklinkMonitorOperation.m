@interface SYBacklinkMonitorOperation
- (NSArray)_testingForcedFoundDomainIdentifiers;
- (NSArray)_testingForcedFoundLinkedIdentifiers;
- (OS_dispatch_queue)processingQueue;
- (SYBacklinkMonitorOperation)initWithDelegate:(id)a3 processingQueue:(id)a4 inputUserActivityInfo:(id)a5 processIdentifier:(int)a6;
- (SYBacklinkMonitorOperationDelegate)delegate;
- (SYBacklinkMonitorOperationDelegate_Testing)_testingDelegate;
- (SYShowBacklinkIndicatorCommand)_indicatorCommand;
- (SYUserActivityInfo)inputUserActivityInfo;
- (id)description;
- (int)processIdentifier;
- (int64_t)_operationState;
- (int64_t)type;
- (void)_finishProcessingAndNotify;
- (void)_searchBacklinksForInputUserActivity;
- (void)_setOperationState:(int64_t)a3;
- (void)_showOrHideBacklinkIndicatorForDomainIdentifiers:(id)a3 linkedIdentifiers:(id)a4;
- (void)beginProcessing;
- (void)setInputUserActivityInfo:(id)a3;
- (void)set_indicatorCommand:(id)a3;
- (void)set_testingForcedFoundDomainIdentifiers:(id)a3;
- (void)set_testingForcedFoundLinkedIdentifiers:(id)a3;
@end

@implementation SYBacklinkMonitorOperation

- (SYBacklinkMonitorOperation)initWithDelegate:(id)a3 processingQueue:(id)a4 inputUserActivityInfo:(id)a5 processIdentifier:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SYBacklinkMonitorOperation;
  v13 = [(SYBacklinkMonitorOperation *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v14->_processingQueue, a4);
    objc_storeStrong((id *)&v14->_inputUserActivityInfo, a5);
    v14->_processIdentifier = a6;
    if (objc_opt_respondsToSelector()) {
      objc_storeWeak((id *)&v14->__testingDelegate, v10);
    }
  }

  return v14;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SYBacklinkMonitorOperation;
  v3 = [(SYBacklinkMonitorOperation *)&v8 description];
  unint64_t v4 = [(SYBacklinkMonitorOperation *)self _operationState];
  if (v4 > 3) {
    v5 = &stru_1F1E16740;
  }
  else {
    v5 = off_1E6463FA0[v4];
  }
  v6 = [v3 stringByAppendingFormat:@" state: %@", v5];

  return v6;
}

- (int64_t)type
{
  v3 = [(SYBacklinkMonitorOperation *)self _indicatorCommand];

  if (!v3) {
    return 0;
  }
  unint64_t v4 = [(SYBacklinkMonitorOperation *)self _indicatorCommand];
  if ([v4 isActive]) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = 2;
  }

  return v5;
}

- (void)beginProcessing
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [(SYBacklinkMonitorOperation *)self processingQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_DEFAULT, "BacklinkOperation %p: Begin processing.", (uint8_t *)&v5, 0xCu);
  }

  [(SYBacklinkMonitorOperation *)self _searchBacklinksForInputUserActivity];
}

- (void)_searchBacklinksForInputUserActivity
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(SYBacklinkMonitorOperation *)self processingQueue];
  dispatch_assert_queue_V2(v3);

  [(SYBacklinkMonitorOperation *)self _setOperationState:1];
  unint64_t v4 = [(SYBacklinkMonitorOperation *)self inputUserActivityInfo];
  int v5 = v4;
  if (v4 && SYIsLinkableUserActivity(v4))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__SYBacklinkMonitorOperation__searchBacklinksForInputUserActivity__block_invoke;
    v9[3] = &unk_1E6463F30;
    v9[5] = v6;
    v9[4] = self;
    +[SYItemIndexingManager fetchIdentifiersLinkedToUserActivity:v5 completion:v9];
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = @"not linkable";
      if (!v5) {
        objc_super v8 = @"nil";
      }
      *(_DWORD *)buf = 134218242;
      id v11 = self;
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_DEFAULT, "BacklinkOperation %p: Skipping query, input activity is %@.", buf, 0x16u);
    }

    [(SYBacklinkMonitorOperation *)self _showOrHideBacklinkIndicatorForDomainIdentifiers:0 linkedIdentifiers:0];
  }
}

void __66__SYBacklinkMonitorOperation__searchBacklinksForInputUserActivity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7;
  double v9 = *(double *)(a1 + 40);
  id v10 = v5;
  id v11 = v6;
  __int16 v12 = [*(id *)(a1 + 32) _testingForcedFoundLinkedIdentifiers];

  v13 = v11;
  uint64_t v14 = v10;
  if (v12)
  {
    uint64_t v14 = [*(id *)(a1 + 32) _testingForcedFoundDomainIdentifiers];

    v13 = [*(id *)(a1 + 32) _testingForcedFoundLinkedIdentifiers];
  }
  v15 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218496;
    uint64_t v24 = v16;
    __int16 v25 = 2048;
    uint64_t v26 = [v13 count];
    __int16 v27 = 2048;
    double v28 = (v8 - v9) * 1000.0;
    _os_log_impl(&dword_1C2C5F000, v15, OS_LOG_TYPE_DEFAULT, "BacklinkOperation %p: Found %ld item(s) linked to current activity. Query duration: %0.0f ms.", buf, 0x20u);
  }

  v17 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SYBacklinkMonitorOperation__searchBacklinksForInputUserActivity__block_invoke_30;
  block[3] = &unk_1E64637A8;
  block[4] = *(void *)(a1 + 32);
  id v21 = v14;
  id v22 = v13;
  id v18 = v13;
  id v19 = v14;
  dispatch_async(v17, block);
}

uint64_t __66__SYBacklinkMonitorOperation__searchBacklinksForInputUserActivity__block_invoke_30(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showOrHideBacklinkIndicatorForDomainIdentifiers:*(void *)(a1 + 40) linkedIdentifiers:*(void *)(a1 + 48)];
}

- (void)_showOrHideBacklinkIndicatorForDomainIdentifiers:(id)a3 linkedIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(SYBacklinkMonitorOperation *)self processingQueue];
  dispatch_assert_queue_V2(v8);

  [(SYBacklinkMonitorOperation *)self _setOperationState:2];
  double v9 = [(SYBacklinkMonitorOperation *)self _testingForcedFoundLinkedIdentifiers];

  if (v9)
  {
    dispatch_time_t v10 = dispatch_time(0, 100000000);
    id v11 = [(SYBacklinkMonitorOperation *)self processingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke;
    block[3] = &unk_1E6463AB0;
    block[4] = self;
    dispatch_after(v10, v11, block);
  }
  else
  {
    id v12 = v7;
    id v13 = v6;
    uint64_t v14 = v13;
    if (!v12)
    {

      id v12 = (id)MEMORY[0x1E4F1CBF0];
      uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v15 = [[SYShowBacklinkIndicatorCommand alloc] initWithDomainIdentifiers:v14 linkIdentifiers:v12];
    [(SYBacklinkMonitorOperation *)self set_indicatorCommand:v15];

    uint64_t v16 = [(SYBacklinkMonitorOperation *)self _indicatorCommand];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke_2;
    v17[3] = &unk_1E6463AB0;
    v17[4] = self;
    [v16 runWithCompletion:v17];
  }
}

uint64_t __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishProcessingAndNotify];
}

void __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke_3;
  block[3] = &unk_1E6463AB0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __97__SYBacklinkMonitorOperation__showOrHideBacklinkIndicatorForDomainIdentifiers_linkedIdentifiers___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishProcessingAndNotify];
}

- (void)_finishProcessingAndNotify
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [(SYBacklinkMonitorOperation *)self processingQueue];
  dispatch_assert_queue_V2(v3);

  [(SYBacklinkMonitorOperation *)self _setOperationState:3];
  unint64_t v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = self;
    _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_DEFAULT, "BacklinkOperation %p: Finished, notifying delegate.", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(SYBacklinkMonitorOperation *)self delegate];
  [v5 backlinkMonitorOperationDidFinish:self];
}

- (void)_setOperationState:(int64_t)a3
{
  int v6 = @"Finished";
  switch(self->__operationState)
  {
    case 0:
      if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1)
      {
        int v6 = @"Initial";
        goto LABEL_8;
      }
      break;
    case 1:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
        int v6 = @"SearchingBacklinks";
        goto LABEL_8;
      }
      break;
    case 2:
      if (a3 != 3)
      {
        int v6 = @"PreparingResults";
        goto LABEL_8;
      }
      break;
    case 3:
LABEL_8:
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = v7;
      if ((unint64_t)a3 > 3) {
        double v9 = &stru_1F1E16740;
      }
      else {
        double v9 = off_1E6463FA0[a3];
      }
      [v7 handleFailureInMethod:a2, self, @"SYBacklinkMonitorOperation.m", 205, @"Invalid state transition %@ -> %@ for backlink monitor operation %@", v6, v9, self object file lineNumber description];

      break;
    default:
      break;
  }
  self->__operationState = a3;
  id v10 = [(SYBacklinkMonitorOperation *)self _testingDelegate];
  [v10 backlinkMonitorOperationDidChangeState:self];
}

- (SYBacklinkMonitorOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SYBacklinkMonitorOperationDelegate *)WeakRetained;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (SYUserActivityInfo)inputUserActivityInfo
{
  return self->_inputUserActivityInfo;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (int64_t)_operationState
{
  return self->__operationState;
}

- (NSArray)_testingForcedFoundDomainIdentifiers
{
  return self->__testingForcedFoundDomainIdentifiers;
}

- (void)set_testingForcedFoundDomainIdentifiers:(id)a3
{
}

- (NSArray)_testingForcedFoundLinkedIdentifiers
{
  return self->__testingForcedFoundLinkedIdentifiers;
}

- (void)set_testingForcedFoundLinkedIdentifiers:(id)a3
{
}

- (SYBacklinkMonitorOperationDelegate_Testing)_testingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__testingDelegate);
  return (SYBacklinkMonitorOperationDelegate_Testing *)WeakRetained;
}

- (SYShowBacklinkIndicatorCommand)_indicatorCommand
{
  return self->__indicatorCommand;
}

- (void)set_indicatorCommand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indicatorCommand, 0);
  objc_destroyWeak((id *)&self->__testingDelegate);
  objc_storeStrong((id *)&self->__testingForcedFoundLinkedIdentifiers, 0);
  objc_storeStrong((id *)&self->__testingForcedFoundDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_inputUserActivityInfo, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setInputUserActivityInfo:(id)a3
{
}

@end
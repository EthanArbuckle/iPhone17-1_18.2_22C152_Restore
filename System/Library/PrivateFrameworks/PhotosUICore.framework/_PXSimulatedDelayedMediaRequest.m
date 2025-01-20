@interface _PXSimulatedDelayedMediaRequest
- (_PXSimulatedDelayedMediaRequest)initWithWrappedMediaRequest:(id)a3 delay:(double)a4;
- (double)_simulatedProgressForProgress:(double)a3;
- (void)_handleDelayFraction:(double)a3;
- (void)_produceFinalCallback;
- (void)handleOriginalProgress:(double)a3 error:(id)a4 stop:(BOOL *)a5 info:(id)a6;
- (void)handleOriginalResult:(id)a3 info:(id)a4;
@end

@implementation _PXSimulatedDelayedMediaRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastOriginalInfo, 0);
  objc_storeStrong(&self->_lastOriginalResult, 0);
}

- (void)_produceFinalCallback
{
  v2 = self;
  objc_sync_enter(v2);
  [(_PXSimulatedDelayedMediaRequest *)v2 _handleDelayFraction:1.0];
  id lastOriginalResult = v2->_lastOriginalResult;
  lastOriginalInfo = v2->_lastOriginalInfo;
  v5.receiver = v2;
  v5.super_class = (Class)_PXSimulatedDelayedMediaRequest;
  [(_PXSimulatedMediaRequest *)&v5 handleOriginalResult:lastOriginalResult info:lastOriginalInfo];
  objc_sync_exit(v2);
}

- (void)_handleDelayFraction:(double)a3
{
  v4 = self;
  objc_sync_enter(v4);
  v4->_delayFraction = a3;
  [(_PXSimulatedDelayedMediaRequest *)v4 _simulatedProgressForProgress:v4->_originalProgress];
  char v6 = 0;
  v5.receiver = v4;
  v5.super_class = (Class)_PXSimulatedDelayedMediaRequest;
  -[_PXSimulatedMediaRequest handleOriginalProgress:error:stop:info:](&v5, sel_handleOriginalProgress_error_stop_info_, 0, &v6, 0);
  objc_sync_exit(v4);
}

- (void)handleOriginalResult:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    v16.receiver = v9;
    v16.super_class = (Class)_PXSimulatedDelayedMediaRequest;
    [(_PXSimulatedMediaRequest *)&v16 handleOriginalResult:v7 info:v8];
  }
  else
  {
    objc_storeStrong(&v9->_lastOriginalResult, a3);
    objc_storeStrong((id *)&v9->_lastOriginalInfo, a4);
    if (!v9->_didScheduleFinalCallback)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __61___PXSimulatedDelayedMediaRequest_handleOriginalResult_info___block_invoke;
      aBlock[3] = &unk_1E5DC9E68;
      aBlock[4] = v9;
      v12 = (void (**)(double))_Block_copy(aBlock);
      v12[2](0.25);
      ((void (*)(void (**)(double), double))v12[2])(v12, 0.5);
      ((void (*)(void (**)(double), double))v12[2])(v12, 0.75);
      dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v9->_delay * 1000000000.0));
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __61___PXSimulatedDelayedMediaRequest_handleOriginalResult_info___block_invoke_3;
      v14[3] = &unk_1E5DD36F8;
      v14[4] = v9;
      dispatch_after(v13, MEMORY[0x1E4F14428], v14);
      v9->_didScheduleFinalCallback = 1;
    }
  }
  objc_sync_exit(v9);
}

- (double)_simulatedProgressForProgress:(double)a3
{
}

- (void)handleOriginalProgress:(double)a3 error:(id)a4 stop:(BOOL *)a5 info:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v12 = self;
  objc_sync_enter(v12);
  v12->_originalProgress = a3;
  [(_PXSimulatedDelayedMediaRequest *)v12 _simulatedProgressForProgress:a3];
  v13.receiver = v12;
  v13.super_class = (Class)_PXSimulatedDelayedMediaRequest;
  -[_PXSimulatedMediaRequest handleOriginalProgress:error:stop:info:](&v13, sel_handleOriginalProgress_error_stop_info_, v10, a5, v11);
  objc_sync_exit(v12);
}

- (_PXSimulatedDelayedMediaRequest)initWithWrappedMediaRequest:(id)a3 delay:(double)a4
{
  result = [(_PXSimulatedMediaRequest *)self initWithWrappedMediaRequest:a3];
  if (result) {
    result->_delay = a4;
  }
  return result;
}

@end
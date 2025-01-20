@interface SASHeater
- (BOOL)predictedRecordRouteIsZLL;
- (NSTimer)preheatTimer;
- (SASHeaterDelegate)delegate;
- (double)_preparationStartTime;
- (double)preheatTimeInterval;
- (id)_convertVirtualAudioSubTypeToString:(unsigned int)a3;
- (void)_cancelPreparation;
- (void)_setPreparationStartTime:(double)a3;
- (void)_suggestPreheat;
- (void)cancelPreparationForButtonIdentifier:(int64_t)a3;
- (void)prepareForUseAfterTimeInterval:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setPredictedRecordRouteIsZLL:(BOOL)a3;
- (void)setPreheatTimeInterval:(double)a3;
- (void)setPreheatTimer:(id)a3;
- (void)updatePredictedRouteIsZLL;
@end

@implementation SASHeater

- (void)prepareForUseAfterTimeInterval:(double)a3
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SASHeater_prepareForUseAfterTimeInterval___block_invoke;
  v4[3] = &unk_1E6B675B0;
  objc_copyWeak(v5, &location);
  v5[1] = *(id *)&a3;
  SiriInvokeOnMainQueue(v4);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __44__SASHeater_prepareForUseAfterTimeInterval___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  [v4 systemUptime];
  objc_msgSend(WeakRetained, "_setPreparationStartTime:");

  id v5 = objc_loadWeakRetained(v2);
  [v5 setPreheatTimeInterval:*(double *)(a1 + 40)];

  id v6 = objc_loadWeakRetained(v2);
  [v6 _cancelPreparation];

  if (*(double *)(a1 + 40) + -0.05 >= 0.0) {
    double v7 = *(double *)(a1 + 40) + -0.05;
  }
  else {
    double v7 = 0.0;
  }
  id v8 = objc_loadWeakRetained(v2);
  v9 = (void *)MEMORY[0x1E4F1CB00];
  id v11 = v8;
  v10 = [v9 scheduledTimerWithTimeInterval:v11 target:sel__suggestPreheat selector:0 userInfo:0 repeats:v7];
  [v11 setPreheatTimer:v10];
}

- (void)cancelPreparationForButtonIdentifier:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F28F80] processInfo];
  [v5 systemUptime];
  double v7 = v6;
  [(SASHeater *)self _preparationStartTime];
  double v9 = v7 - v8;

  [(SASHeater *)self _cancelPreparation];
  id v11 = [(SASHeater *)self delegate];
  [(SASHeater *)self preheatTimeInterval];
  [v11 heater:self cancelledPreparationWithButtonIdentifier:a3 duration:v9 targetDuration:v10];
}

- (void)_cancelPreparation
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __31__SASHeater__cancelPreparation__block_invoke;
  v2[3] = &unk_1E6B675D8;
  objc_copyWeak(&v3, &location);
  SiriInvokeOnMainQueue(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __31__SASHeater__cancelPreparation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained preheatTimer];
  [v3 invalidate];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setPreheatTimer:0];
}

- (void)_suggestPreheat
{
  id v3 = [(SASHeater *)self delegate];
  [v3 heaterSuggestsPreheating:self];

  [(SASHeater *)self updatePredictedRouteIsZLL];
}

- (void)updatePredictedRouteIsZLL
{
  if (AFDeviceSupportsZLL())
  {
    [(SASHeater *)self setPredictedRecordRouteIsZLL:1];
    objc_initWeak(&location, self);
    id v3 = dispatch_get_global_queue(21, 0);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __38__SASHeater_updatePredictedRouteIsZLL__block_invoke;
    v4[3] = &unk_1E6B675D8;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SASHeater *)self setPredictedRecordRouteIsZLL:0];
  }
}

void __38__SASHeater_updatePredictedRouteIsZLL__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  id v3 = [v2 pickableRoutesForCategory:*MEMORY[0x1E4F4E6C0] andMode:@"SpeechRecognition"];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = v3;
  id v5 = (void *)[v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    double v7 = (void *)MEMORY[0x1E4F74DE0];
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        double v10 = [v9 objectForKeyedSubscript:*v7];
        int v11 = [v10 BOOLValue];

        if (v11)
        {
          id v5 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F74E08]];
          v13 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F74CF8]];
          v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F74E00]];
          v14 = *MEMORY[0x1E4F4E360];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v28 = "-[SASHeater updatePredictedRouteIsZLL]_block_invoke";
            __int16 v29 = 2112;
            v30 = v9;
            _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s Picked record route: %@", buf, 0x16u);
          }
          goto LABEL_12;
        }
      }
      id v5 = (void *)[v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v12 = 0;
  v13 = 0;
LABEL_12:

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __38__SASHeater_updatePredictedRouteIsZLL__block_invoke_52;
  v18[3] = &unk_1E6B67600;
  objc_copyWeak(&v22, (id *)(a1 + 32));
  id v19 = v5;
  id v20 = v13;
  id v21 = v12;
  id v15 = v12;
  id v16 = v13;
  id v17 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v18);

  objc_destroyWeak(&v22);
}

void __38__SASHeater_updatePredictedRouteIsZLL__block_invoke_52(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    int v3 = [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F74C40]];
    int v4 = [*(id *)(a1 + 40) isEqualToString:*MEMORY[0x1E4F74D38]] | ~v3;
    id v5 = *(void **)(a1 + 48);
    uint64_t v6 = [WeakRetained _convertVirtualAudioSubTypeToString:1781740087];
    LODWORD(v5) = [v5 isEqualToString:v6];

    uint64_t v7 = v4 & (v5 ^ 1);
    double v8 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      double v10 = "-[SASHeater updatePredictedRouteIsZLL]_block_invoke";
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s Predicted record route ZLL: %{BOOL}d", (uint8_t *)&v9, 0x12u);
    }
    [WeakRetained setPredictedRecordRouteIsZLL:v7];
  }
}

- (id)_convertVirtualAudioSubTypeToString:(unsigned int)a3
{
  if (a3)
  {
    cStr[0] = HIBYTE(a3);
    cStr[1] = BYTE2(a3);
    cStr[2] = BYTE1(a3);
    cStr[3] = a3;
    cStr[4] = 0;
    int v4 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], cStr, 0);
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (SASHeaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SASHeaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)_preparationStartTime
{
  return self->_preparationStartTime;
}

- (void)_setPreparationStartTime:(double)a3
{
  self->_preparationStartTime = a3;
}

- (BOOL)predictedRecordRouteIsZLL
{
  return self->_predictedRecordRouteIsZLL;
}

- (void)setPredictedRecordRouteIsZLL:(BOOL)a3
{
  self->_predictedRecordRouteIsZLL = a3;
}

- (NSTimer)preheatTimer
{
  return self->_preheatTimer;
}

- (void)setPreheatTimer:(id)a3
{
}

- (double)preheatTimeInterval
{
  return self->_preheatTimeInterval;
}

- (void)setPreheatTimeInterval:(double)a3
{
  self->_preheatTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preheatTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
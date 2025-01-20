@interface TUAudioFrequencyController
+ (float)normalizedPowerLevelForPowerSpectrum:(id)a3;
+ (float)rawPowerLevelForPowerSpectrum:(id)a3;
+ (id)normalizedSpectrumForPowerSpectrum:(id)a3;
- (AVCAudioPowerSpectrumMeter)powerSpectrumMeter;
- (OS_dispatch_queue)queue;
- (TUAudioFrequencyController)initWithDelegate:(id)a3 queue:(id)a4;
- (TUAudioFrequencyController)initWithDelegate:(id)a3 queue:(id)a4 binCount:(int64_t)a5;
- (TUAudioFrequencyControllerDelegate)delegate;
- (unsigned)_avcTapTypeForTUTapType:(int64_t)a3;
- (void)audioPowerSpectrumMeter:(id)a3 didUpdateAudioPowerSpectrums:(id)a4;
- (void)meterServerDidDisconnect:(id)a3;
- (void)registerCellularPowerSpectrum:(int64_t)a3;
- (void)registerParticipantPowerSpectrum:(int64_t)a3;
- (void)unregisterCellularPowerSpectrum:(int64_t)a3;
- (void)unregisterParticipantPowerSpectrum:(int64_t)a3;
@end

@implementation TUAudioFrequencyController

- (TUAudioFrequencyController)initWithDelegate:(id)a3 queue:(id)a4 binCount:(int64_t)a5
{
  __int16 v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TUAudioFrequencyController;
  v10 = [(TUAudioFrequencyController *)&v22 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a4);
    objc_storeWeak((id *)&v11->_delegate, v8);
    id v12 = objc_alloc((Class)CUTWeakLinkClass());
    v13 = [(TUAudioFrequencyController *)v11 queue];
    int v18 = 0;
    uint64_t v17 = 0;
    __int16 v19 = v5;
    __int16 v20 = 0;
    uint64_t v21 = 0x3FB1111111111111;
    uint64_t v14 = [v12 initWithConfig:&v17 delegate:v11 queue:v13];
    powerSpectrumMeter = v11->_powerSpectrumMeter;
    v11->_powerSpectrumMeter = (AVCAudioPowerSpectrumMeter *)v14;
  }
  return v11;
}

- (TUAudioFrequencyController)initWithDelegate:(id)a3 queue:(id)a4
{
  return [(TUAudioFrequencyController *)self initWithDelegate:a3 queue:a4 binCount:1];
}

- (void)registerParticipantPowerSpectrum:(int64_t)a3
{
  id v4 = [(TUAudioFrequencyController *)self powerSpectrumMeter];
  [v4 registerPowerSpectrumForStreamToken:a3];
}

- (void)unregisterParticipantPowerSpectrum:(int64_t)a3
{
  id v4 = [(TUAudioFrequencyController *)self powerSpectrumMeter];
  [v4 unregisterPowerSpectrumForStreamToken:a3];
}

- (void)registerCellularPowerSpectrum:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[TUAudioFrequencyController _avcTapTypeForTUTapType:](self, "_avcTapTypeForTUTapType:");
  v6 = [(TUAudioFrequencyController *)self powerSpectrumMeter];
  id v10 = 0;
  int v7 = [v6 registerPowerSpectrumForCellularTapType:v5 error:&v10];
  id v8 = v10;

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v12 = a3;
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Register for cellular power spectrum - type: %lu, success: %d, error: %@", buf, 0x1Cu);
  }
}

- (void)unregisterCellularPowerSpectrum:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[TUAudioFrequencyController _avcTapTypeForTUTapType:](self, "_avcTapTypeForTUTapType:");
  v6 = [(TUAudioFrequencyController *)self powerSpectrumMeter];
  id v10 = 0;
  int v7 = [v6 unregisterPowerSpectrumForCellularTapType:v5 error:&v10];
  id v8 = v10;

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v12 = a3;
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Unregister for cellular power spectrum - type: %lu, success: %d, error: %@", buf, 0x1Cu);
  }
}

- (unsigned)_avcTapTypeForTUTapType:(int64_t)a3
{
  return a3 == 1;
}

+ (float)normalizedPowerLevelForPowerSpectrum:(id)a3
{
  [a1 rawPowerLevelForPowerSpectrum:a3];
  float v4 = -40.0;
  if (v3 <= -40.0)
  {
    float v4 = v3;
    if (v3 < -90.0) {
      float v4 = -90.0;
    }
  }
  return (float)(v4 + 90.0) / 50.0;
}

+ (float)rawPowerLevelForPowerSpectrum:(id)a3
{
  float v3 = [a3 channels];
  float v4 = [v3 firstObject];
  uint64_t v5 = [v4 bins];
  v6 = [v5 firstObject];
  [v6 powerLevel];
  float v8 = v7;

  return v8;
}

+ (id)normalizedSpectrumForPowerSpectrum:(id)a3
{
  float v3 = [a3 channels];
  float v4 = [v3 firstObject];
  uint64_t v5 = [v4 bins];

  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if ([v5 count])
  {
    unint64_t v7 = 0;
    do
    {
      float v8 = [v5 objectAtIndexedSubscript:v7];
      [v8 powerLevel];
      float v10 = v9;

      LODWORD(v11) = -1038090240;
      if (v10 <= -40.0)
      {
        *(float *)&double v11 = v10;
        if (v10 < -90.0) {
          LODWORD(v11) = -1028390912;
        }
      }
      *(float *)&double v11 = (float)(*(float *)&v11 + 90.0) / 50.0;
      int64_t v12 = [NSNumber numberWithFloat:v11];
      [v6 setObject:v12 atIndexedSubscript:v7];

      ++v7;
    }
    while (v7 < [v5 count]);
  }

  return v6;
}

- (void)audioPowerSpectrumMeter:(id)a3 didUpdateAudioPowerSpectrums:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(TUAudioFrequencyController *)self queue];
  dispatch_assert_queue_V2(v6);

  unint64_t v7 = [(TUAudioFrequencyController *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v28 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v29 = *(void *)v31;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v31 != v29) {
            objc_enumerationMutation(v8);
          }
          int64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
          __int16 v13 = objc_opt_class();
          int v14 = [v8 objectForKeyedSubscript:v12];
          [v13 normalizedPowerLevelForPowerSpectrum:v14];
          int v16 = v15;

          uint64_t v17 = [v12 integerValue];
          LODWORD(v18) = v16;
          [v7 frequencyController:self audioPowerChanged:v17 forParticipantWithStreamToken:v18];
          if (objc_opt_respondsToSelector())
          {
            __int16 v19 = objc_opt_class();
            __int16 v20 = [v8 objectForKeyedSubscript:v12];
            [v19 rawPowerLevelForPowerSpectrum:v20];
            int v22 = v21;

            uint64_t v23 = [v12 integerValue];
            LODWORD(v24) = v22;
            [v7 frequencyController:self rawValueForAudioPowerChanged:v23 forParticipantWithStreamToken:v24];
          }
          if (objc_opt_respondsToSelector())
          {
            v25 = objc_opt_class();
            v26 = [v8 objectForKeyedSubscript:v12];
            v27 = [v25 normalizedSpectrumForPowerSpectrum:v26];

            objc_msgSend(v7, "frequencyController:spectrumChanged:forParticipantWithStreamToken:", self, v27, objc_msgSend(v12, "integerValue"));
          }
          ++v11;
        }
        while (v10 != v11);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }

    id v5 = v28;
  }
}

- (void)meterServerDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = [(TUAudioFrequencyController *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[TUAudioFrequencyController meterServerDidDisconnect:]((uint64_t)v4, v6);
  }
}

- (TUAudioFrequencyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUAudioFrequencyControllerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (AVCAudioPowerSpectrumMeter)powerSpectrumMeter
{
  return self->_powerSpectrumMeter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerSpectrumMeter, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)meterServerDidDisconnect:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Audio power spectrum meter died: %@", (uint8_t *)&v2, 0xCu);
}

@end
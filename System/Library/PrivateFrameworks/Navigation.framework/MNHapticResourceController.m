@interface MNHapticResourceController
- (BOOL)playHapticSound:(unint64_t)a3 andReport:(id *)a4;
- (BOOL)triggerVibration;
- (BOOL)vibrating;
- (MNHapticControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)stopVibrating;
@end

@implementation MNHapticResourceController

- (BOOL)triggerVibration
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(MNHapticResourceController *)self stopVibrating];
  v10[0] = *MEMORY[0x1E4F1CFD0];
  v10[1] = &unk_1F0E34F98;
  uint64_t v11 = *MEMORY[0x1E4F1CFC8];
  v12 = &unk_1F0E34FB0;
  uint64_t v13 = v10[0];
  v14 = &unk_1F0E34FC8;
  uint64_t v15 = v11;
  v16 = &unk_1F0E34FE0;
  uint64_t v17 = v10[0];
  v18 = &unk_1F0E34FF8;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:10];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F0E35850, @"Intensity", v2, @"VibePattern", 0);
  uint64_t v8 = *MEMORY[0x1E4F18A48];
  v9 = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v5 = GetAudioLogForMNHapticResourceControllerCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "ⓗ Started vibration", buf, 2u);
  }

  AudioServicesPlaySystemSoundWithOptions();
  return 1;
}

- (void)stopVibrating
{
  v3 = GetAudioLogForMNHapticResourceControllerCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "ⓗ Stopping vibration", v4, 2u);
  }

  AudioServicesStopSystemSound();
  self->_isVibrating = 0;
}

- (BOOL)vibrating
{
  return self->_isVibrating;
}

- (BOOL)playHapticSound:(unint64_t)a3 andReport:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 >= 3)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = NAVAudioErrorDomain();
      *a4 = [v10 errorWithDomain:v11 code:3500 userInfo:0];
    }
  }
  else
  {
    if (a3 == 2) {
      int v6 = 1415;
    }
    else {
      int v6 = 1417;
    }
    if (a3 == 1) {
      SystemSoundID v7 = 1414;
    }
    else {
      SystemSoundID v7 = v6;
    }
    uint64_t v8 = GetAudioLogForMNHapticResourceControllerCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v15 = a3;
      __int16 v16 = 1024;
      SystemSoundID v17 = v7;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "ⓗ Starting haptic playback for id %lu (system id %u)", buf, 0x12u);
    }

    self->_isVibrating = 1;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__MNHapticResourceController_playHapticSound_andReport___block_invoke;
    v13[3] = &unk_1E60F6BC0;
    v13[4] = self;
    v13[5] = a3;
    AudioServicesPlaySystemSoundWithCompletion(v7, v13);
  }
  return a3 < 3;
}

void __56__MNHapticResourceController_playHapticSound_andReport___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__MNHapticResourceController_playHapticSound_andReport___block_invoke_2;
  v2[3] = &unk_1E60F6BC0;
  uint64_t v1 = *(void *)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  v2[5] = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __56__MNHapticResourceController_playHapticSound_andReport___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  v2 = GetAudioLogForMNHapticResourceControllerCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_INFO, "ⓗ Finished haptic playback for id %lu", (uint8_t *)&v7, 0xCu);
  }

  v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int v6 = [*(id *)(a1 + 32) delegate];
    [v6 hapticResourceController:*(void *)(a1 + 32) didFinishPlayingHapticIndicator:*(void *)(a1 + 40)];
  }
}

- (MNHapticControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNHapticControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
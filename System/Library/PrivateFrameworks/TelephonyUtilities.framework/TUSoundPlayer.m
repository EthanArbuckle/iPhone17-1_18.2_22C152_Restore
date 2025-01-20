@interface TUSoundPlayer
- (BOOL)currentPlaying;
- (BOOL)isCurrentPlaying;
- (BOOL)isPlaying;
- (BOOL)isRepeatingActorPlaying;
- (OS_dispatch_queue)queue;
- (TURepeatingActor)repeatingActor;
- (TUSoundPlayer)init;
- (unsigned)soundID;
- (void)playSound:(unsigned int)a3;
- (void)playSound:(unsigned int)a3 iterations:(unint64_t)a4 pauseDurationBetweenIterations:(double)a5;
- (void)playSound:(unsigned int)a3 iterations:(unint64_t)a4 pauseDurationBetweenIterations:(double)a5 completion:(id)a6;
- (void)playSoundIndefinitely:(unsigned int)a3 pauseDurationBetweenIterations:(double)a4;
- (void)setCurrentPlaying:(BOOL)a3;
- (void)setIsCurrentPlaying:(BOOL)a3;
- (void)setSoundID:(unsigned int)a3;
- (void)stopPlaying;
@end

@implementation TUSoundPlayer

- (TUSoundPlayer)init
{
  v9.receiver = self;
  v9.super_class = (Class)TUSoundPlayer;
  v2 = [(TUSoundPlayer *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.telephonyutilities.tusoundplayer", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(TURepeatingActor);
    repeatingActor = v2->_repeatingActor;
    v2->_repeatingActor = v6;
  }
  return v2;
}

- (unsigned)soundID
{
  v3 = [(TUSoundPlayer *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_soundID;
}

- (void)setSoundID:(unsigned int)a3
{
  v5 = [(TUSoundPlayer *)self queue];
  dispatch_assert_queue_V2(v5);

  self->_soundID = a3;
}

- (BOOL)isCurrentPlaying
{
  v3 = [(TUSoundPlayer *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_currentPlaying;
}

- (void)setIsCurrentPlaying:(BOOL)a3
{
  v5 = [(TUSoundPlayer *)self queue];
  dispatch_assert_queue_V2(v5);

  self->_currentPlaying = a3;
}

- (void)playSound:(unsigned int)a3
{
}

- (void)playSoundIndefinitely:(unsigned int)a3 pauseDurationBetweenIterations:(double)a4
{
}

- (void)playSound:(unsigned int)a3 iterations:(unint64_t)a4 pauseDurationBetweenIterations:(double)a5
{
}

- (void)playSound:(unsigned int)a3 iterations:(unint64_t)a4 pauseDurationBetweenIterations:(double)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  v12 = TUDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 == -1)
    {
      v13 = @"Infinite";
    }
    else
    {
      v13 = [NSNumber numberWithUnsignedInteger:a4];
    }
    *(_DWORD *)buf = 67109634;
    unsigned int v21 = a3;
    __int16 v22 = 2112;
    v23 = v13;
    __int16 v24 = 2048;
    double v25 = a5;
    _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "Asked to play sound with soundID: %d iterations: %@ pauseDurationBetweenIterations: %f", buf, 0x1Cu);
    if (a4 != -1) {
  }
    }
  [(TUSoundPlayer *)self stopPlaying];
  v14 = [(TUSoundPlayer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke;
  block[3] = &unk_1E58E6918;
  block[4] = self;
  unsigned int v19 = a3;
  dispatch_async(v14, block);

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke_4;
  v17[3] = &unk_1E58E6968;
  v17[4] = self;
  v17[5] = a2;
  v17[6] = a4;
  *(double *)&v17[7] = a5;
  v15 = _Block_copy(v17);
  v16 = [(TUSoundPlayer *)self repeatingActor];
  [v16 beginRepeatingAction:v15 iterations:a4 pauseDurationBetweenIterations:v11 completion:a5];
}

void __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setSoundID:*(unsigned int *)(a1 + 40)];
  [*(id *)(a1 + 32) setIsCurrentPlaying:1];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) soundID];
    int v4 = [*(id *)(a1 + 32) isCurrentPlaying];
    v5[0] = 67109376;
    v5[1] = v3;
    __int16 v6 = 1024;
    int v7 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Started to play current soundID: %d, isCurrentPlaying: %d", (uint8_t *)v5, 0xEu);
  }
}

void __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke_2;
  block[3] = &unk_1E58E6940;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = v6;
  uint64_t v12 = *(void *)(a1 + 56);
  block[4] = v5;
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke_2(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCurrentPlaying])
  {
    if (!TUSoundPlayerInfiniteIterations_block_invoke__kAudioServicesPlaySystemSoundOptionLoopKey)
    {
      v2 = (void *)CUTWeakLinkSymbol();
      id v3 = v2 ? (void *)*v2 : 0;
      objc_storeStrong((id *)&TUSoundPlayerInfiniteIterations_block_invoke__kAudioServicesPlaySystemSoundOptionLoopKey, v3);
      if (!TUSoundPlayerInfiniteIterations_block_invoke__kAudioServicesPlaySystemSoundOptionLoopKey)
      {
        uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 32), @"TUSoundPlayer.m", 75, @"Failed to weak link string named %s", "kAudioServicesPlaySystemSoundOptionLoopKey");
      }
    }
    if (TUSoundPlayerInfiniteIterations_block_invoke__pred_AudioServicesPlaySystemSoundWithOptionsAudioToolbox != -1) {
      dispatch_once(&TUSoundPlayerInfiniteIterations_block_invoke__pred_AudioServicesPlaySystemSoundWithOptionsAudioToolbox, &__block_literal_global_14);
    }
    BOOL v6 = *(void *)(a1 + 56) == -1 && *(double *)(a1 + 64) == 0.0;
    uint64_t v15 = TUSoundPlayerInfiniteIterations_block_invoke__kAudioServicesPlaySystemSoundOptionLoopKey;
    id v7 = [NSNumber numberWithBool:v6];
    v16[0] = v7;
    int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

    uint64_t v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [*(id *)(a1 + 32) soundID];
      *(_DWORD *)buf = 67109378;
      int v12 = v9;
      __int16 v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Calling AudioServicesPlaySystemSoundWithCompletion with soundID: %d options: %@", buf, 0x12u);
    }

    ((void (*)(uint64_t, NSObject *, void))TUSoundPlayerInfiniteIterations_block_invoke__AudioServicesPlaySystemSoundWithOptions)([*(id *)(a1 + 32) soundID], v4, *(void *)(a1 + 40));
  }
  else
  {
    int v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [*(id *)(a1 + 32) soundID];
      *(_DWORD *)buf = 67109120;
      int v12 = v5;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "soundID: %d is stopped, don't play", buf, 8u);
    }
  }
}

void *__80__TUSoundPlayer_playSound_iterations_pauseDurationBetweenIterations_completion___block_invoke_16()
{
  result = (void *)CUTWeakLinkSymbol();
  TUSoundPlayerInfiniteIterations_block_invoke__AudioServicesPlaySystemSoundWithOptions = result;
  return result;
}

- (void)stopPlaying
{
  if ([(TUSoundPlayer *)self isRepeatingActorPlaying])
  {
    id v3 = [(TUSoundPlayer *)self repeatingActor];
    [v3 stop];

    int v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "TUSoundPlayer: stop playing", buf, 2u);
    }

    int v5 = [(TUSoundPlayer *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__TUSoundPlayer_stopPlaying__block_invoke;
    block[3] = &unk_1E58E5BE0;
    block[4] = self;
    dispatch_async(v5, block);
  }
  BOOL v6 = [(TUSoundPlayer *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__TUSoundPlayer_stopPlaying__block_invoke_23;
  v7[3] = &unk_1E58E5BE0;
  v7[4] = self;
  dispatch_async(v6, v7);
}

uint64_t __28__TUSoundPlayer_stopPlaying__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (TUSoundPlayerInfiniteIterations_block_invoke_2__pred_AudioServicesStopSystemSoundAudioToolbox != -1) {
    dispatch_once(&TUSoundPlayerInfiniteIterations_block_invoke_2__pred_AudioServicesStopSystemSoundAudioToolbox, &__block_literal_global_21);
  }
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) soundID];
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Calling AudioServicesStopSystemSound with soundID=%d", (uint8_t *)v5, 8u);
  }

  return ((uint64_t (*)(uint64_t, uint64_t))TUSoundPlayerInfiniteIterations_block_invoke_2__AudioServicesStopSystemSound)([*(id *)(a1 + 32) soundID], 1);
}

void *__28__TUSoundPlayer_stopPlaying__block_invoke_2()
{
  result = (void *)CUTWeakLinkSymbol();
  TUSoundPlayerInfiniteIterations_block_invoke_2__AudioServicesStopSystemSound = result;
  return result;
}

uint64_t __28__TUSoundPlayer_stopPlaying__block_invoke_23(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isCurrentPlaying];
  if (result)
  {
    int v3 = TUDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = [*(id *)(a1 + 32) soundID];
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Stop playing current soundID: %d", (uint8_t *)v5, 8u);
    }

    return [*(id *)(a1 + 32) setIsCurrentPlaying:0];
  }
  return result;
}

- (BOOL)isRepeatingActorPlaying
{
  v2 = [(TUSoundPlayer *)self repeatingActor];
  char v3 = [v2 isRunning];

  return v3;
}

- (BOOL)currentPlaying
{
  return self->_currentPlaying;
}

- (void)setCurrentPlaying:(BOOL)a3
{
  self->_currentPlaying = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TURepeatingActor)repeatingActor
{
  return self->_repeatingActor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatingActor, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
@interface MNSoundEffectResourceController
- (AVAudioPlayer)approach;
- (AVAudioPlayer)leftTurn;
- (AVAudioPlayer)rightTurn;
- (BOOL)playSound:(unint64_t)a3 andReport:(id *)a4;
- (BOOL)playing;
- (MNSoundEffectControllerDelegate)delegate;
- (MNSoundEffectResourceController)init;
- (id)_playerForFileName:(id)a3 andExtension:(id)a4;
- (void)_audioSessionInterruption:(id)a3;
- (void)_mediaSessionServicesWereLost:(id)a3;
- (void)_mediaSessionServicesWereReset:(id)a3;
- (void)_registerForObservation;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)setApproach:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeftTurn:(id)a3;
- (void)setRightTurn:(id)a3;
- (void)stop;
@end

@implementation MNSoundEffectResourceController

- (MNSoundEffectResourceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNSoundEffectResourceController;
  v2 = [(MNSoundEffectResourceController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MNSoundEffectResourceController *)v2 _registerForObservation];
    v3->_indicatorID = 3;
    v4 = v3;
  }

  return v3;
}

- (void)_registerForObservation
{
  v3 = GetAudioLogForMNSoundEffectResourceControllerCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "ⓧ Registering observers", v5, 2u);
  }

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__audioSessionInterruption_ name:*MEMORY[0x1E4F4E830] object:0];
  [v4 addObserver:self selector:sel__mediaSessionServicesWereLost_ name:*MEMORY[0x1E4F4E890] object:0];
  [v4 addObserver:self selector:sel__mediaSessionServicesWereReset_ name:*MEMORY[0x1E4F4E8A0] object:0];
}

- (AVAudioPlayer)approach
{
  approach = self->_approach;
  if (!approach)
  {
    v4 = [(MNSoundEffectResourceController *)self _playerForFileName:@"Approach" andExtension:@"caf"];
    v5 = self->_approach;
    self->_approach = v4;

    [(AVAudioPlayer *)self->_approach setDelegate:self];
    approach = self->_approach;
  }
  return approach;
}

- (AVAudioPlayer)leftTurn
{
  leftTurn = self->_leftTurn;
  if (!leftTurn)
  {
    v4 = [(MNSoundEffectResourceController *)self _playerForFileName:@"TurnLeft" andExtension:@"caf"];
    v5 = self->_leftTurn;
    self->_leftTurn = v4;

    [(AVAudioPlayer *)self->_leftTurn setDelegate:self];
    leftTurn = self->_leftTurn;
  }
  return leftTurn;
}

- (AVAudioPlayer)rightTurn
{
  rightTurn = self->_rightTurn;
  if (!rightTurn)
  {
    v4 = [(MNSoundEffectResourceController *)self _playerForFileName:@"TurnRight" andExtension:@"caf"];
    v5 = self->_rightTurn;
    self->_rightTurn = v4;

    [(AVAudioPlayer *)self->_rightTurn setDelegate:self];
    rightTurn = self->_rightTurn;
  }
  return rightTurn;
}

- (BOOL)playing
{
  if ([(AVAudioPlayer *)self->_approach isPlaying]
    || [(AVAudioPlayer *)self->_leftTurn isPlaying])
  {
    return 1;
  }
  rightTurn = self->_rightTurn;
  return [(AVAudioPlayer *)rightTurn isPlaying];
}

- (BOOL)playSound:(unint64_t)a3 andReport:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 < 3)
  {
    [(MNSoundEffectResourceController *)self stop];
    v10 = GetAudioLogForMNSoundEffectResourceControllerCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v20 = 134217984;
      unint64_t v21 = a3;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_INFO, "Ⓧ Attempting to start playing id %lu", (uint8_t *)&v20, 0xCu);
    }

    if (a3 == 2)
    {
      v11 = [(MNSoundEffectResourceController *)self rightTurn];
    }
    else
    {
      if (a3 == 1) {
        [(MNSoundEffectResourceController *)self leftTurn];
      }
      else {
      v11 = [(MNSoundEffectResourceController *)self approach];
      }
    }
    v12 = v11;
    char v7 = [v11 play];
    v13 = GetAudioLogForMNSoundEffectResourceControllerCategory();
    v14 = v13;
    if (v7)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_INFO, "Ⓧ    Playback was successfully started", (uint8_t *)&v20, 2u);
      }

      self->_indicatorID = a3;
      v15 = [(MNSoundEffectResourceController *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) == 0) {
        goto LABEL_23;
      }
      v17 = [(MNSoundEffectResourceController *)self delegate];
      [v17 soundEffectResourceController:self willStartPlayingIndicator:self->_indicatorID];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v20 = 134217984;
        unint64_t v21 = a3;
        _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "⒳    Error trying to play id %lu (this is a problem in AVAudioPlayer)", (uint8_t *)&v20, 0xCu);
      }

      if (!a4) {
        goto LABEL_23;
      }
      v18 = (void *)MEMORY[0x1E4F28C58];
      v17 = NAVAudioErrorDomain();
      *a4 = [v18 errorWithDomain:v17 code:3700 userInfo:0];
    }

LABEL_23:
    return v7;
  }
  if (a4)
  {
    v5 = (void *)MEMORY[0x1E4F28C58];
    objc_super v6 = NAVAudioErrorDomain();
    *a4 = [v5 errorWithDomain:v6 code:3500 userInfo:0];
  }
  return 0;
}

- (void)stop
{
  if ([(MNSoundEffectResourceController *)self playing])
  {
    v3 = GetAudioLogForMNSoundEffectResourceControllerCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "ⓧ Stopping sound playback", v4, 2u);
    }

    [(AVAudioPlayer *)self->_approach stop];
    [(AVAudioPlayer *)self->_approach setCurrentTime:0.0];
    [(AVAudioPlayer *)self->_leftTurn stop];
    [(AVAudioPlayer *)self->_leftTurn setCurrentTime:0.0];
    [(AVAudioPlayer *)self->_rightTurn stop];
    [(AVAudioPlayer *)self->_rightTurn setCurrentTime:0.0];
    self->_indicatorID = 3;
  }
}

- (id)_playerForFileName:(id)a3 andExtension:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    char v7 = [MEMORY[0x1E4F28B50] _navigationBundle];
    v8 = [v7 URLForResource:v5 withExtension:v6];

    id v14 = 0;
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F153C0]) initWithContentsOfURL:v8 error:&v14];
    id v10 = v14;
    if (v10)
    {
      v11 = GetAudioLogForMNSoundEffectResourceControllerCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v16 = v5;
        __int16 v17 = 2112;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "⒳    Error creating player for %@.%@ - %@", buf, 0x20u);
      }

      id v12 = 0;
    }
    else
    {
      id v12 = v9;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = GetAudioLogForMNSoundEffectResourceControllerCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315650;
    id v16 = "-[MNSoundEffectResourceController audioPlayerDidFinishPlaying:successfully:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 1024;
    BOOL v20 = v4;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "ⓧ %s : %@ : %d", (uint8_t *)&v15, 0x1Cu);
  }

  v8 = [(MNSoundEffectResourceController *)self delegate];
  if (v4)
  {
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(MNSoundEffectResourceController *)self delegate];
      [v10 soundEffectResourceController:self didFinishPlayingIndicator:self->_indicatorID];
LABEL_8:
    }
  }
  else
  {
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      v13 = NAVAudioErrorDomain();
      id v10 = [v12 errorWithDomain:v13 code:3701 userInfo:0];

      id v14 = [(MNSoundEffectResourceController *)self delegate];
      [v14 soundEffectResourceController:self didFailWhilePlayingIndicator:self->_indicatorID withError:v10];

      goto LABEL_8;
    }
  }
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = GetAudioLogForMNSoundEffectResourceControllerCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v19 = "-[MNSoundEffectResourceController audioPlayerDecodeErrorDidOccur:error:]";
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "ⓧ %s : %@ : %@", buf, 0x20u);
  }

  char v9 = [(MNSoundEffectResourceController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    char v11 = (void *)MEMORY[0x1E4F28C58];
    id v12 = NAVAudioErrorDomain();
    uint64_t v16 = *MEMORY[0x1E4F28A50];
    id v17 = v7;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v14 = [v11 errorWithDomain:v12 code:3702 userInfo:v13];

    int v15 = [(MNSoundEffectResourceController *)self delegate];
    [v15 soundEffectResourceController:self didFailWhilePlayingIndicator:self->_indicatorID withError:v14];
  }
}

- (void)_audioSessionInterruption:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F4E868]];
  uint64_t v6 = [v5 integerValue];

  if (v6 == 1 && [(MNSoundEffectResourceController *)self playing])
  {
    id v7 = GetAudioLogForMNSoundEffectResourceControllerCategory();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    char v9 = (void *)MEMORY[0x1E4F4E858];
    if (v8)
    {
      char v10 = [v4 objectForKey:*MEMORY[0x1E4F4E858]];
      *(_DWORD *)buf = 138412290;
      id v23 = v10;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "ⓧ Media services were interrupted - %@", buf, 0xCu);
    }
    unint64_t indicatorID = self->_indicatorID;
    [(MNSoundEffectResourceController *)self stop];
    id v12 = [(MNSoundEffectResourceController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      int v15 = NAVAudioErrorDomain();
      uint64_t v16 = objc_msgSend(v4, "objectForKey:", *v9, *MEMORY[0x1E4F28A50]);
      id v21 = v16;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v18 = [v14 errorWithDomain:v15 code:0 userInfo:v17];

      __int16 v19 = [(MNSoundEffectResourceController *)self delegate];
      [v19 soundEffectResourceController:self wasInterruptedWhilePlayingIndicator:indicatorID withError:v18];
    }
  }
}

- (void)_mediaSessionServicesWereLost:(id)a3
{
  BOOL v4 = GetAudioLogForMNSoundEffectResourceControllerCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "ⓧ Media services were lost", v5, 2u);
  }

  [(MNSoundEffectResourceController *)self stop];
}

- (void)_mediaSessionServicesWereReset:(id)a3
{
  BOOL v4 = GetAudioLogForMNSoundEffectResourceControllerCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "ⓧ Media services were reset", v8, 2u);
  }

  approach = self->_approach;
  self->_approach = 0;

  leftTurn = self->_leftTurn;
  self->_leftTurn = 0;

  rightTurn = self->_rightTurn;
  self->_rightTurn = 0;
}

- (MNSoundEffectControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNSoundEffectControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setApproach:(id)a3
{
}

- (void)setLeftTurn:(id)a3
{
}

- (void)setRightTurn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightTurn, 0);
  objc_storeStrong((id *)&self->_leftTurn, 0);
  objc_storeStrong((id *)&self->_approach, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
@interface VUITransitionalPlaybackUIManager
- (BOOL)_canMenu;
- (BOOL)_canSwipeUp;
- (BOOL)_shouldPause;
- (BOOL)goesToForegroundOnFirstAppear;
- (BOOL)onSupplementaryUIShouldPresent;
- (BOOL)shouldHideUI;
- (VUIMediaController)mediaController;
- (VUIMediaPlaybackManagerDelegate)delegate;
- (VUITransitionalPlaybackUIManager)initWithMediaController:(id)a3;
- (double)showcaseFactor;
- (int)_processBackgroundedStateTriggers;
- (int)_processForegroundedStateTriggers;
- (int)_processPausedStateTriggers;
- (int)_processUndefinedStateTriggers;
- (int)_processWaitingForTimeoutStateTriggers;
- (int)_processWillBeBackgroundedStateTriggers;
- (int)_processWillBeForegroundedStateTriggers;
- (int64_t)currentUIMode;
- (void)_onShowcaseFactorDidChange;
- (void)_onTimeout;
- (void)_processStateEnter;
- (void)_processStateExit;
- (void)_processTrigger;
- (void)_scheduleBackgroundedTimer;
- (void)dealloc;
- (void)onAppear;
- (void)onDisappear;
- (void)onEvent;
- (void)onMediaControllerStateDidChange;
- (void)onSupplementaryUIShouldDismiss;
- (void)setDelegate:(id)a3;
- (void)setGoesToForegroundOnFirstAppear:(BOOL)a3;
- (void)setShowcaseFactor:(double)a3;
@end

@implementation VUITransitionalPlaybackUIManager

- (VUITransitionalPlaybackUIManager)initWithMediaController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUITransitionalPlaybackUIManager;
  v6 = [(VUITransitionalPlaybackUIManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaController, a3);
    v7->_isFirstAppearance = 1;
  }

  return v7;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundedTimer);
  [WeakRetained invalidate];

  v4.receiver = self;
  v4.super_class = (Class)VUITransitionalPlaybackUIManager;
  [(VUITransitionalPlaybackUIManager *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateFlags.hasShouldEnableUIModeImplicitly = p_delegate & 1;
}

- (void)onAppear
{
  self->_mediaPlaybackTrigger = 1;
  [(VUITransitionalPlaybackUIManager *)self _processTrigger];
  self->_isFirstAppearance = 0;
}

- (void)onDisappear
{
  self->_mediaPlaybackTrigger = 2;
  [(VUITransitionalPlaybackUIManager *)self _processTrigger];
}

- (void)onEvent
{
  self->_mediaPlaybackTrigger = 4;
  [(VUITransitionalPlaybackUIManager *)self _processTrigger];
}

- (void)onMediaControllerStateDidChange
{
  self->_mediaPlaybackTrigger = 5;
  [(VUITransitionalPlaybackUIManager *)self _processTrigger];
}

- (BOOL)onSupplementaryUIShouldPresent
{
  int mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState == 2)
  {
    self->_mediaPlaybackTrigger = 3;
    self->_mediaPlaybackTriggerModifier |= 3uLL;
    [(VUITransitionalPlaybackUIManager *)self _processTrigger];
  }
  return mediaPlaybackState == 2;
}

- (void)onSupplementaryUIShouldDismiss
{
  if (self->_mediaPlaybackState == 1 && [(VUITransitionalPlaybackUIManager *)self currentUIMode] == 1)
  {
    self->_mediaPlaybackTrigger = 3;
    [(VUITransitionalPlaybackUIManager *)self _processTrigger];
  }
}

- (void)setShowcaseFactor:(double)a3
{
  if (self->_showcaseFactor != a3)
  {
    self->_showcaseFactor = a3;
    [(VUITransitionalPlaybackUIManager *)self _onShowcaseFactorDidChange];
  }
}

- (BOOL)shouldHideUI
{
  return self->_mediaPlaybackState == 2;
}

- (int64_t)currentUIMode
{
  return self->_mediaPlaybackStateModifier & 1;
}

- (void)_onTimeout
{
  self->_mediaPlaybackTrigger = 6;
  [(VUITransitionalPlaybackUIManager *)self _processTrigger];
}

- (void)_onShowcaseFactorDidChange
{
  self->_mediaPlaybackTrigger = 7;
  [(VUITransitionalPlaybackUIManager *)self _processTrigger];
}

- (void)_processTrigger
{
  switch(self->_mediaPlaybackState)
  {
    case 0:
      int v3 = [(VUITransitionalPlaybackUIManager *)self _processUndefinedStateTriggers];
      goto LABEL_10;
    case 1:
      int v3 = [(VUITransitionalPlaybackUIManager *)self _processBackgroundedStateTriggers];
      goto LABEL_10;
    case 2:
      int v3 = [(VUITransitionalPlaybackUIManager *)self _processForegroundedStateTriggers];
      goto LABEL_10;
    case 3:
      int v3 = [(VUITransitionalPlaybackUIManager *)self _processWaitingForTimeoutStateTriggers];
      goto LABEL_10;
    case 4:
      int v3 = [(VUITransitionalPlaybackUIManager *)self _processWillBeBackgroundedStateTriggers];
      goto LABEL_10;
    case 5:
      int v3 = [(VUITransitionalPlaybackUIManager *)self _processWillBeForegroundedStateTriggers];
      goto LABEL_10;
    case 6:
      int v3 = [(VUITransitionalPlaybackUIManager *)self _processPausedStateTriggers];
LABEL_10:
      int v4 = v3;
      break;
    default:
      int v4 = 0;
      break;
  }
  self->_mediaPlaybackTrigger = 0;
  self->_mediaPlaybackTriggerModifier = 0;
  if (v4 != self->_mediaPlaybackState)
  {
    [(VUITransitionalPlaybackUIManager *)self _processStateExit];
    self->_int mediaPlaybackState = v4;
    [(VUITransitionalPlaybackUIManager *)self _processStateEnter];
  }
}

- (void)_processStateEnter
{
  int mediaPlaybackState = self->_mediaPlaybackState;
  switch(mediaPlaybackState)
  {
    case 0:
      goto LABEL_8;
    case 2:
      v8 = [(VUITransitionalPlaybackUIManager *)self mediaController];
      [v8 setShowsVideoControls:1];

LABEL_8:
      self->_mediaPlaybackStateModifier = 0;
      return;
    case 3:
      [(VUITransitionalPlaybackUIManager *)self _scheduleBackgroundedTimer];
      return;
    case 4:
    case 5:
      int v4 = [(VUITransitionalPlaybackUIManager *)self delegate];
      if (mediaPlaybackState != 5) {
        goto LABEL_16;
      }
      id v5 = [(VUITransitionalPlaybackUIManager *)self mediaController];
      v6 = [v5 mediaInfo];
      if ([v6 intent] != 1)
      {

LABEL_16:
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __54__VUITransitionalPlaybackUIManager__processStateEnter__block_invoke;
        v11[3] = &unk_1E6DF3D58;
        v11[4] = self;
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __54__VUITransitionalPlaybackUIManager__processStateEnter__block_invoke_2;
        v10[3] = &unk_1E6DF5B20;
        v10[4] = self;
        [v4 mediaPlaybackManager:self shouldHideUI:mediaPlaybackState == 5 animated:1 animations:v11 completion:v10];
        goto LABEL_17;
      }
      BOOL hasPresentPlaybackController = self->_delegateFlags.hasPresentPlaybackController;

      if (!hasPresentPlaybackController
        || ([v4 presentForegroundPlaybackControllerForMediaPlaybackManager:self] & 1) == 0)
      {
        goto LABEL_16;
      }
LABEL_17:

      return;
    case 6:
      id v9 = [(VUITransitionalPlaybackUIManager *)self mediaController];
      [v9 pause];

      return;
    default:
      return;
  }
}

void __54__VUITransitionalPlaybackUIManager__processStateEnter__block_invoke(uint64_t a1)
{
  v1 = *(_DWORD **)(a1 + 32);
  BOOL v2 = v1[2] == 5;
  id v3 = [v1 mediaController];
  [v3 transitionToForeground:v2 animated:1];
}

uint64_t __54__VUITransitionalPlaybackUIManager__processStateEnter__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _onTimeout];
  }
  return result;
}

- (void)_processStateExit
{
  int mediaPlaybackState = self->_mediaPlaybackState;
  switch(mediaPlaybackState)
  {
    case 2:
      id WeakRetained = [(VUITransitionalPlaybackUIManager *)self mediaController];
      [WeakRetained setShowsVideoControls:0];
      break;
    case 6:
      id WeakRetained = [(VUITransitionalPlaybackUIManager *)self mediaController];
      [WeakRetained play];
      break;
    case 3:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundedTimer);
      [WeakRetained invalidate];
      break;
    default:
      return;
  }
}

- (int)_processUndefinedStateTriggers
{
  int mediaPlaybackState = self->_mediaPlaybackState;
  if ((self->_mediaPlaybackTrigger | 4) == 5)
  {
    int v4 = [(VUITransitionalPlaybackUIManager *)self mediaController];
    uint64_t v5 = [v4 state];

    if (v5)
    {
      v6 = [(VUITransitionalPlaybackUIManager *)self mediaController];
      uint64_t v7 = [v6 state];

      v8 = [(VUITransitionalPlaybackUIManager *)self delegate];
      if (v7 != 1
        && self->_isFirstAppearance
        && [(VUITransitionalPlaybackUIManager *)self goesToForegroundOnFirstAppear]
        || self->_delegateFlags.hasShouldEnableUIModeImplicitly
        && ![v8 mediaPlaybackManager:self shouldEnableUIModeImplicitly:0])
      {
        int mediaPlaybackState = 2;
        uint64_t v9 = 1;
      }
      else
      {
        uint64_t v9 = 0;
        if ((unint64_t)(v7 - 1) < 2 || v7 == 4) {
          int mediaPlaybackState = 1;
        }
        else {
          int mediaPlaybackState = 3;
        }
      }
      [v8 mediaPlaybackManager:self shouldHideUI:v9 animated:0 animations:0 completion:0];
    }
  }
  return mediaPlaybackState;
}

- (int)_processBackgroundedStateTriggers
{
  int mediaPlaybackState = self->_mediaPlaybackState;
  switch(self->_mediaPlaybackTrigger)
  {
    case 2:
      int mediaPlaybackState = 0;
      break;
    case 3:
      int mediaPlaybackState = 5;
      break;
    case 5:
      id v3 = [(VUITransitionalPlaybackUIManager *)self mediaController];
      uint64_t v4 = [v3 state];

      if (v4 == 3) {
        int mediaPlaybackState = 3;
      }
      break;
    case 7:
      if ([(VUITransitionalPlaybackUIManager *)self _shouldPause]) {
        int mediaPlaybackState = 6;
      }
      break;
    default:
      return mediaPlaybackState;
  }
  return mediaPlaybackState;
}

- (int)_processForegroundedStateTriggers
{
  int mediaPlaybackState = self->_mediaPlaybackState;
  int mediaPlaybackTrigger = self->_mediaPlaybackTrigger;
  switch(mediaPlaybackTrigger)
  {
    case 5:
      uint64_t v5 = [(VUITransitionalPlaybackUIManager *)self mediaController];
      if ([v5 state] == 1)
      {
      }
      else
      {
        v6 = [(VUITransitionalPlaybackUIManager *)self mediaController];
        uint64_t v7 = [v6 state];

        if (v7 != 2) {
          return mediaPlaybackState;
        }
      }
      return 4;
    case 3:
      self->_mediaPlaybackStateModifier |= self->_mediaPlaybackTriggerModifier & 3;
      return 4;
    case 2:
      return 0;
  }
  return mediaPlaybackState;
}

- (int)_processWaitingForTimeoutStateTriggers
{
  int mediaPlaybackState = self->_mediaPlaybackState;
  switch(self->_mediaPlaybackTrigger)
  {
    case 2:
      int mediaPlaybackState = 0;
      break;
    case 3:
    case 6:
      int mediaPlaybackState = 5;
      break;
    case 4:
      [(VUITransitionalPlaybackUIManager *)self _scheduleBackgroundedTimer];
      break;
    case 5:
      id v3 = [(VUITransitionalPlaybackUIManager *)self mediaController];
      uint64_t v4 = [v3 state];

      if (v4 != 3) {
        int mediaPlaybackState = 1;
      }
      break;
    case 7:
      if ([(VUITransitionalPlaybackUIManager *)self _shouldPause]) {
        int mediaPlaybackState = 6;
      }
      break;
    default:
      return mediaPlaybackState;
  }
  return mediaPlaybackState;
}

- (int)_processWillBeBackgroundedStateTriggers
{
  int mediaPlaybackTrigger = self->_mediaPlaybackTrigger;
  if (mediaPlaybackTrigger == 6)
  {
    uint64_t v5 = [(VUITransitionalPlaybackUIManager *)self mediaController];
    if ([v5 state] == 3)
    {
      if ((self->_mediaPlaybackStateModifier & 2) != 0) {
        int v4 = 1;
      }
      else {
        int v4 = 3;
      }
    }
    else
    {
      int v4 = 1;
    }
  }
  else if (mediaPlaybackTrigger == 2)
  {
    return 0;
  }
  else
  {
    return self->_mediaPlaybackState;
  }
  return v4;
}

- (int)_processWillBeForegroundedStateTriggers
{
  int mediaPlaybackState = self->_mediaPlaybackState;
  int mediaPlaybackTrigger = self->_mediaPlaybackTrigger;
  if (mediaPlaybackTrigger == 2) {
    int mediaPlaybackState = 0;
  }
  if (mediaPlaybackTrigger == 6) {
    return 2;
  }
  else {
    return mediaPlaybackState;
  }
}

- (int)_processPausedStateTriggers
{
  int mediaPlaybackState = self->_mediaPlaybackState;
  if (self->_mediaPlaybackTrigger == 7 && ![(VUITransitionalPlaybackUIManager *)self _shouldPause])
  {
    int v4 = [(VUITransitionalPlaybackUIManager *)self mediaController];
    uint64_t v5 = [v4 state];

    v6 = [(VUITransitionalPlaybackUIManager *)self mediaController];
    uint64_t v7 = [v6 mediaInfo];
    uint64_t v8 = [v7 intent];

    if (v8 == 1 && v5 == 2) {
      return 3;
    }
    else {
      return 1;
    }
  }
  return mediaPlaybackState;
}

- (void)_scheduleBackgroundedTimer
{
  p_backgroundedTimer = &self->_backgroundedTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundedTimer);
  [WeakRetained invalidate];

  id v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__onTimeout selector:0 userInfo:0 repeats:5.0];
  objc_storeWeak((id *)p_backgroundedTimer, v5);
}

- (BOOL)_shouldPause
{
  [(VUITransitionalPlaybackUIManager *)self showcaseFactor];
  return 1.0 - v2 > 0.04;
}

- (BOOL)_canSwipeUp
{
  if ((self->_mediaPlaybackState - 1) > 2) {
    return 0;
  }
  id v3 = [(VUITransitionalPlaybackUIManager *)self mediaController];
  uint64_t v4 = [v3 state];

  if (v4 == 4) {
    return 0;
  }
  unint64_t v6 = v4 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v7 = [(VUITransitionalPlaybackUIManager *)self mediaController];
  uint64_t v8 = [v7 mediaInfo];
  uint64_t v9 = [v8 intent];

  int mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState != 1 || v9)
  {
    char v11 = 0;
    if (mediaPlaybackState == 2 && v9 == 1)
    {
      if (self->_delegateFlags.hasShouldEnableUIModeImplicitly)
      {
        v12 = [(VUITransitionalPlaybackUIManager *)self delegate];
        char v11 = [v12 mediaPlaybackManager:self shouldEnableUIModeImplicitly:1];
      }
      else
      {
        char v11 = 0;
      }
    }
  }
  else
  {
    char v11 = 1;
  }
  if (v6 == 2) {
    return v11;
  }
  else {
    return 0;
  }
}

- (BOOL)_canMenu
{
  id v3 = [(VUITransitionalPlaybackUIManager *)self mediaController];
  uint64_t v4 = [v3 mediaInfo];
  uint64_t v5 = [v4 intent];

  int mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState == 2)
  {
    if (v5 != 1) {
      return 1;
    }
    if (!self->_delegateFlags.hasShouldEnableUIModeImplicitly) {
      return 1;
    }
    uint64_t v7 = [(VUITransitionalPlaybackUIManager *)self delegate];
    char v8 = [v7 mediaPlaybackManager:self shouldEnableUIModeImplicitly:0];

    if (v8) {
      return 1;
    }
    int mediaPlaybackState = self->_mediaPlaybackState;
  }
  return (mediaPlaybackState | 2) == 3 && [(VUITransitionalPlaybackUIManager *)self currentUIMode] == 1;
}

- (VUIMediaController)mediaController
{
  return self->_mediaController;
}

- (VUIMediaPlaybackManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIMediaPlaybackManagerDelegate *)WeakRetained;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (BOOL)goesToForegroundOnFirstAppear
{
  return self->_goesToForegroundOnFirstAppear;
}

- (void)setGoesToForegroundOnFirstAppear:(BOOL)a3
{
  self->_goesToForegroundOnFirstAppear = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaController, 0);
  objc_destroyWeak((id *)&self->_backgroundedTimer);
}

@end
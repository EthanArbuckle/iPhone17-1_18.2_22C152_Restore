@interface PXVideoMuteController
+ (PXVideoMuteController)sharedController;
- (BOOL)isAutoplayEnabled;
- (BOOL)isMuted;
- (PXVideoMuteController)init;
- (PXVideoMuteController)initWithAutoplaySetting:(BOOL)a3;
- (id)debugDescription;
- (int64_t)muteState;
- (void)_updateIsMuted;
- (void)applicationDidMoveToBackground;
- (void)autoplaySettingDidChange;
- (void)resetMuteState;
- (void)setAutoplayEnabled:(BOOL)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setMuteState:(int64_t)a3;
- (void)userDidMute;
- (void)userDidUnmute;
@end

@implementation PXVideoMuteController

- (BOOL)isAutoplayEnabled
{
  return self->_isAutoplayEnabled;
}

- (int64_t)muteState
{
  return self->_muteState;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(PXVideoMuteController *)self muteState] - 1;
  if (v6 > 3) {
    v7 = @"Unknown";
  }
  else {
    v7 = off_1E5DBD388[v6];
  }
  BOOL v8 = [(PXVideoMuteController *)self isMuted];
  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  v10 = (void *)[v3 initWithFormat:@"<%@ %p; State: %@, Muted: %@>", v5, self, v7, v9];

  return v10;
}

- (void)setIsMuted:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_isMuted != a3)
  {
    self->_isMuted = a3;
    [(PXVideoMuteController *)self signalChange:1];
    v4 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(PXVideoMuteController *)self debugDescription];
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Video Mute State Changed: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_updateIsMuted
{
  uint64_t v3 = isMutedForMuteState([(PXVideoMuteController *)self muteState], [(PXVideoMuteController *)self isAutoplayEnabled]);
  [(PXVideoMuteController *)self setIsMuted:v3];
}

- (void)setAutoplayEnabled:(BOOL)a3
{
  if (self->_isAutoplayEnabled != a3)
  {
    self->_isAutoplayEnabled = a3;
    [(PXVideoMuteController *)self autoplaySettingDidChange];
  }
}

- (void)setMuteState:(int64_t)a3
{
  if (self->_muteState != a3)
  {
    self->_muteState = a3;
    [(PXVideoMuteController *)self _updateIsMuted];
  }
}

- (void)resetMuteState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__PXVideoMuteController_resetMuteState__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXVideoMuteController *)self performChanges:v2];
}

uint64_t __39__PXVideoMuteController_resetMuteState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMuteState:1];
}

- (void)autoplaySettingDidChange
{
  if ([(PXVideoMuteController *)self muteState] == 1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __49__PXVideoMuteController_autoplaySettingDidChange__block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXVideoMuteController *)self performChanges:v3];
  }
  else
  {
    [(PXVideoMuteController *)self resetMuteState];
  }
}

uint64_t __49__PXVideoMuteController_autoplaySettingDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateIsMuted];
}

- (void)applicationDidMoveToBackground
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__PXVideoMuteController_applicationDidMoveToBackground__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXVideoMuteController *)self performChanges:v2];
}

uint64_t __55__PXVideoMuteController_applicationDidMoveToBackground__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMuteState:4];
}

- (void)userDidUnmute
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__PXVideoMuteController_userDidUnmute__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXVideoMuteController *)self performChanges:v2];
}

uint64_t __38__PXVideoMuteController_userDidUnmute__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMuteState:2];
}

- (void)userDidMute
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__PXVideoMuteController_userDidMute__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXVideoMuteController *)self performChanges:v2];
}

uint64_t __36__PXVideoMuteController_userDidMute__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMuteState:3];
}

- (PXVideoMuteController)initWithAutoplaySetting:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXVideoMuteController;
  v4 = [(PXVideoMuteController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_muteState = 1;
    v4->_isAutoplayEnabled = v3;
    v4->_isMuted = isMutedForMuteState(v4->_muteState, v3);
  }
  return v5;
}

- (PXVideoMuteController)init
{
  return [(PXVideoMuteController *)self initWithAutoplaySetting:1];
}

+ (PXVideoMuteController)sharedController
{
  if (sharedController_onceToken_129827 != -1) {
    dispatch_once(&sharedController_onceToken_129827, &__block_literal_global_129828);
  }
  v2 = (void *)sharedController_sharedController_129829;
  return (PXVideoMuteController *)v2;
}

void __41__PXVideoMuteController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(PXApplicationVideoMuteController);
  v1 = (void *)sharedController_sharedController_129829;
  sharedController_sharedController_129829 = (uint64_t)v0;
}

@end
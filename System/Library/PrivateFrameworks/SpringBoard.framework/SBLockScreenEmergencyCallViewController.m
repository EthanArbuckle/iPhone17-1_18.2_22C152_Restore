@interface SBLockScreenEmergencyCallViewController
- (BOOL)_canShowWhileLocked;
- (SBLockScreenEmergencyCallViewControllerDelegate)delegate;
- (id)tintColorForBackgroundStyle:(int64_t)a3 outBlurRadius:(double *)a4;
- (int64_t)_wallpaperStyleFromUIBackgroundStyle:(int64_t)a3;
- (void)dismiss;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SBLockScreenEmergencyCallViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "View Service terminated with error: %@ -> %@", (uint8_t *)&v11, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained emergencyCallViewController:self didExitWithError:v4];
  }
  else
  {
    v8 = +[SBLockScreenManager sharedInstance];
    v9 = [v8 lockScreenEnvironment];
    v10 = [v9 callController];
    [v10 emergencyDialerExitedWithError:v4];
  }
}

- (void)dismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained dismissEmergencyCallViewController:self];
  }
  else
  {
    id v4 = +[SBLockScreenManager sharedInstance];
    v5 = [v4 lockScreenEnvironment];
    v6 = [v5 callController];
    [v6 exitEmergencyDialerAnimated:1];
  }
}

- (void)setBackgroundStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBLockScreenEmergencyCallViewController;
  [(SBUIEmergencyCallHostViewController *)&v3 setBackgroundStyle:a3];
}

- (id)tintColorForBackgroundStyle:(int64_t)a3 outBlurRadius:(double *)a4
{
  [(SBLockScreenEmergencyCallViewController *)self _wallpaperStyleFromUIBackgroundStyle:a3];
  _WallpaperBackdropParametersForStyleAndAverageColor();
  v5 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:v10];
  if (a4)
  {
    v6 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:v10 graphicsQuality:100];
    [v6 blurRadius];
    *(void *)a4 = v7;
  }
  v8 = [v5 combinedTintColor];

  return v8;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)_wallpaperStyleFromUIBackgroundStyle:(int64_t)a3
{
  uint64_t v3 = _WallpaperStyleForBackgroundStyle();
  return MEMORY[0x1F413A068](v3);
}

- (SBLockScreenEmergencyCallViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLockScreenEmergencyCallViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
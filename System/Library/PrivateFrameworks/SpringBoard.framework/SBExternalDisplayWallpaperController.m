@interface SBExternalDisplayWallpaperController
- (SBExternalDisplayWallpaperController)initWithWindowScene:(id)a3 requiresTraitsParticipant:(BOOL)a4;
- (SBFWindow)window;
- (SBFZStackParticipant)zStackParticipant;
- (void)setWindow:(id)a3;
- (void)setZStackParticipant:(id)a3;
@end

@implementation SBExternalDisplayWallpaperController

- (SBExternalDisplayWallpaperController)initWithWindowScene:(id)a3 requiresTraitsParticipant:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBExternalDisplayWallpaperController;
  v7 = [(SBExternalDisplayWallpaperController *)&v19 init];
  if (v7)
  {
    v8 = [[_SBWallpaperWindow alloc] initWithWindowScene:v6];
    window = v7->_window;
    v7->_window = &v8->super;

    [(SBFWindow *)v7->_window _setRoleHint:@"SBTraitsParticipantRoleWallpaperExternal"];
    [(SBFWindow *)v7->_window setWindowLevel:*MEMORY[0x1E4F43F20] + -3.0];
    v10 = v7->_window;
    v11 = [MEMORY[0x1E4F428B8] blackColor];
    [(SBFWindow *)v10 setBackgroundColor:v11];

    [(SBFWindow *)v7->_window setUserInteractionEnabled:0];
    v12 = [[SBExternalDisplayWallpaperViewController alloc] initWithWindowScene:v6];
    [(SBFWindow *)v7->_window setRootViewController:v12];
    [(SBFWindow *)v7->_window setHidden:0];
    if (v4)
    {
      v13 = [v6 zStackResolver];
      uint64_t v14 = [v13 acquireParticipantWithIdentifier:0 delegate:v7];
      zStackParticipant = v7->_zStackParticipant;
      v7->_zStackParticipant = (SBFZStackParticipant *)v14;

      v16 = [v6 statusBarManager];
      v17 = [v16 layoutManager];

      [v17 setOrientationWindow:v7->_window forStatusBarLayoutLayer:0];
    }
  }
  return v7;
}

- (SBFWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
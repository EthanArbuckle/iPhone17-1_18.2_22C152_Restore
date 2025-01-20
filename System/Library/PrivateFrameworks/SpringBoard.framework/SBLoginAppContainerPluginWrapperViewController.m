@interface SBLoginAppContainerPluginWrapperViewController
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (SBLockScreenPlugin)plugin;
- (SBLoginAppContainerPluginWrapperViewController)initWithPlugin:(id)a3;
- (void)loadView;
@end

@implementation SBLoginAppContainerPluginWrapperViewController

- (SBLoginAppContainerPluginWrapperViewController)initWithPlugin:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBLoginAppContainerPluginWrapperViewController;
  v6 = [(SBLoginAppContainerPluginWrapperViewController *)&v15 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_plugin, a3);
    v8 = [[SBLockScreenPluginOverlayViewController alloc] initWithPlugin:v7->_plugin];
    overlayController = v7->_overlayController;
    v7->_overlayController = v8;

    v10 = [SBLoginAppContainerOverlayWrapperView alloc];
    v11 = [(SBLockOverlayViewController *)v7->_overlayController overlayView];
    uint64_t v12 = -[SBLoginAppContainerOverlayWrapperView initWithFrame:overlayView:](v10, "initWithFrame:overlayView:", v11, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    overlayWrapperView = v7->_overlayWrapperView;
    v7->_overlayWrapperView = (SBLoginAppContainerOverlayWrapperView *)v12;
  }
  return v7;
}

- (void)loadView
{
  v3 = [(SBLockScreenPlugin *)self->_plugin viewController];
  [v3 willMoveToParentViewController:self];

  v4 = [(SBLockScreenPlugin *)self->_plugin viewController];
  [(SBLoginAppContainerPluginWrapperViewController *)self addChildViewController:v4];

  id v5 = [SBLoginAppContainerPluginWrapperView alloc];
  overlayWrapperView = self->_overlayWrapperView;
  v7 = [(SBLockScreenPlugin *)self->_plugin viewController];
  v8 = [v7 view];
  v9 = -[SBLoginAppContainerPluginWrapperView initWithFrame:overlayWrapperView:pluginView:](v5, "initWithFrame:overlayWrapperView:pluginView:", overlayWrapperView, v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  containerView = self->_containerView;
  self->_containerView = v9;

  [(SBLoginAppContainerPluginWrapperViewController *)self setView:self->_containerView];
  id v11 = [(SBLockScreenPlugin *)self->_plugin viewController];
  [v11 didMoveToParentViewController:self];
}

- (BOOL)handleVolumeUpButtonPress
{
  plugin = self->_plugin;
  v3 = [MEMORY[0x1E4F5E3E8] eventWithType:30];
  LOBYTE(plugin) = [(SBLockScreenPlugin *)plugin handleDashBoardEvent:v3];

  return (char)plugin;
}

- (BOOL)handleVolumeDownButtonPress
{
  plugin = self->_plugin;
  v3 = [MEMORY[0x1E4F5E3E8] eventWithType:31];
  LOBYTE(plugin) = [(SBLockScreenPlugin *)plugin handleDashBoardEvent:v3];

  return (char)plugin;
}

- (SBLockScreenPlugin)plugin
{
  return self->_plugin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_overlayWrapperView, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
}

@end
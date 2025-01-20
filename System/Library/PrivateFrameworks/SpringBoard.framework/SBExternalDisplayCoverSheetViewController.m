@interface SBExternalDisplayCoverSheetViewController
- (BOOL)enableBlurEffects;
- (BOOL)isPresented;
- (SBBacklightController)backlightController;
- (SBFZStackParticipant)zStackParticipant;
- (SBFloatingDockBehaviorAssertion)externalDisplayFloatingDockBehaviorAssertion;
- (SBWallpaperEffectViewFactory)wallpaperEffectViewFactory;
- (SBWindowScene)_sbWindowScene;
- (UIView)wallpaperContainerView;
- (UIView)wallpaperEffectView;
- (id)_floatingDockController;
- (id)_initWithWindowScene:(id)a3 wallpaperEffectViewFactory:(id)a4;
- (id)newWallpaperEffectView;
- (void)cleanupAfterDismissal;
- (void)dealloc;
- (void)prepareForPresentation;
- (void)setExternalDisplayFloatingDockBehaviorAssertion:(id)a3;
- (void)setIsPresented:(BOOL)a3;
- (void)setSbWindowScene:(id)a3;
- (void)setWallpaperContainerView:(id)a3;
- (void)setWallpaperEffectView:(id)a3;
- (void)setZStackParticipant:(id)a3;
- (void)viewDidLoad;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBExternalDisplayCoverSheetViewController

- (id)_initWithWindowScene:(id)a3 wallpaperEffectViewFactory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBExternalDisplayCoverSheetViewController;
  v8 = [(SBExternalDisplayCoverSheetViewController *)&v14 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_sbWindowScene, v6);
    objc_storeStrong((id *)&v9->_wallpaperEffectViewFactory, a4);
    v10 = [v6 zStackResolver];
    uint64_t v11 = [v10 acquireParticipantWithIdentifier:8 delegate:v9];
    zStackParticipant = v9->_zStackParticipant;
    v9->_zStackParticipant = (SBFZStackParticipant *)v11;
  }
  return v9;
}

- (void)dealloc
{
  [(SBFZStackParticipant *)self->_zStackParticipant invalidate];
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = 0;

  [(SBFloatingDockBehaviorAssertion *)self->_externalDisplayFloatingDockBehaviorAssertion invalidate];
  externalDisplayFloatingDockBehaviorAssertion = self->_externalDisplayFloatingDockBehaviorAssertion;
  self->_externalDisplayFloatingDockBehaviorAssertion = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBExternalDisplayCoverSheetViewController;
  [(SBExternalDisplayCoverSheetViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)SBExternalDisplayCoverSheetViewController;
  [(SBExternalDisplayCoverSheetViewController *)&v17 viewDidLoad];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
  objc_super v5 = [WeakRetained screen];
  [v5 bounds];
  id v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  wallpaperContainerView = self->_wallpaperContainerView;
  self->_wallpaperContainerView = v6;

  v8 = self->_wallpaperContainerView;
  v9 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIView *)v8 setBackgroundColor:v9];

  [(UIView *)self->_wallpaperContainerView setUserInteractionEnabled:0];
  [(UIView *)self->_wallpaperContainerView setHidden:0];
  [(UIView *)self->_wallpaperContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [(SBExternalDisplayCoverSheetViewController *)self view];
  [v10 addSubview:self->_wallpaperContainerView];

  uint64_t v11 = [(SBExternalDisplayCoverSheetViewController *)self view];
  id v12 = (id)SBHPinViewWithinView();

  if (self->_wallpaperEffectViewFactory) {
    wallpaperEffectViewFactory = self->_wallpaperEffectViewFactory;
  }
  else {
    wallpaperEffectViewFactory = self;
  }
  objc_super v14 = (UIView *)[wallpaperEffectViewFactory newWallpaperEffectView];
  wallpaperEffectView = self->_wallpaperEffectView;
  self->_wallpaperEffectView = v14;

  [(UIView *)self->_wallpaperEffectView setClipsToBounds:1];
  [(UIView *)self->_wallpaperEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_wallpaperContainerView addSubview:self->_wallpaperEffectView];
  id v16 = (id)SBHPinViewWithinView();
}

- (void)prepareForPresentation
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[SBExternalDisplayCoverSheetViewController prepareForPresentation]";
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "[EXTERNAL] %s", (uint8_t *)&v1, 0xCu);
}

- (void)cleanupAfterDismissal
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[SBExternalDisplayCoverSheetViewController cleanupAfterDismissal]";
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "[EXTERNAL] %s", (uint8_t *)&v1, 0xCu);
}

- (id)_floatingDockController
{
  v2 = [(SBExternalDisplayCoverSheetViewController *)self _sbWindowScene];
  uint64_t v3 = [v2 floatingDockController];

  return v3;
}

- (id)newWallpaperEffectView
{
  uint64_t v3 = [SBExternalDisplayWallpaperEffectView alloc];
  return [(SBExternalDisplayWallpaperEffectView *)v3 initExternalDisplayWithDelegate:self wallpaperVariant:0 transformOptions:15];
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
}

- (BOOL)enableBlurEffects
{
  return 0;
}

- (UIView)wallpaperContainerView
{
  return self->_wallpaperContainerView;
}

- (void)setWallpaperContainerView:(id)a3
{
}

- (UIView)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (void)setWallpaperEffectView:(id)a3
{
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

- (SBFloatingDockBehaviorAssertion)externalDisplayFloatingDockBehaviorAssertion
{
  return self->_externalDisplayFloatingDockBehaviorAssertion;
}

- (void)setExternalDisplayFloatingDockBehaviorAssertion:(id)a3
{
}

- (SBWindowScene)_sbWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setSbWindowScene:(id)a3
{
}

- (SBWallpaperEffectViewFactory)wallpaperEffectViewFactory
{
  return self->_wallpaperEffectViewFactory;
}

- (SBBacklightController)backlightController
{
  return self->_backlightController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_wallpaperEffectViewFactory, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_storeStrong((id *)&self->_externalDisplayFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperContainerView, 0);
}

@end
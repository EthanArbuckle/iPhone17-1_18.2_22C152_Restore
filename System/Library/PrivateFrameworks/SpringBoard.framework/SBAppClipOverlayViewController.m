@interface SBAppClipOverlayViewController
- (BOOL)displayedOverPlaceholder;
- (BOOL)needsUpdate;
- (CPSClipOverlayViewController)overlayViewController;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)sceneIdentifier;
- (NSString)webClipIdentifier;
- (SBAppClipOverlayCoordinator)coordinator;
- (SBAppClipOverlayViewController)initWithCoder:(id)a3;
- (SBAppClipOverlayViewController)initWithCoordinator:(id)a3 bundleIdentifier:(id)a4 sceneIdentifier:(id)a5;
- (SBAppClipOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)participantName;
- (id)view;
- (int64_t)preferredStatusBarStyle;
- (int64_t)sceneActivationState;
- (void)invalidate;
- (void)loadView;
- (void)setCoordinator:(id)a3;
- (void)setDisplayedOverPlaceholder:(BOOL)a3;
- (void)setDisplayedOverPlaceholder:(BOOL)a3 animated:(BOOL)a4;
- (void)setNeedsUpdate;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setOverlayViewController:(id)a3;
- (void)setSceneActivationState:(int64_t)a3;
- (void)setSceneActivationState:(int64_t)a3 animated:(BOOL)a4;
- (void)setWebClipIdentifier:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBAppClipOverlayViewController

- (SBAppClipOverlayViewController)initWithCoordinator:(id)a3 bundleIdentifier:(id)a4 sceneIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SBAppClipOverlayViewController;
  v12 = [(SBAppClipOverlayViewController *)&v23 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coordinator, a3);
    uint64_t v14 = [v10 copy];
    bundleIdentifier = v13->_bundleIdentifier;
    v13->_bundleIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    sceneIdentifier = v13->_sceneIdentifier;
    v13->_sceneIdentifier = (NSString *)v16;

    v18 = [MEMORY[0x1E4F628D8] storeForApplication:v13->_bundleIdentifier];
    v19 = [v18 sceneStoreForIdentifier:v13->_sceneIdentifier creatingIfNecessary:0];
    uint64_t v20 = [v19 objectForKey:@"appClipIdentifier"];
    webClipIdentifier = v13->_webClipIdentifier;
    v13->_webClipIdentifier = (NSString *)v20;

    v13->_displayedOverPlaceholder = 0;
    v13->_sceneActivationState = -1;
  }
  return v13;
}

- (SBAppClipOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"SBAppClipOverlayViewController.m" lineNumber:61 description:@"Use -initWithCoordinator:bundleIdentifier:sceneIdentifier: instead"];

  return [(SBAppClipOverlayViewController *)self initWithCoordinator:0 bundleIdentifier:0 sceneIdentifier:0];
}

- (SBAppClipOverlayViewController)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBAppClipOverlayViewController.m" lineNumber:66 description:@"Use -initWithCoordinator:bundleIdentifier:sceneIdentifier: instead"];

  return [(SBAppClipOverlayViewController *)self initWithCoordinator:0 bundleIdentifier:0 sceneIdentifier:0];
}

- (void)setDisplayedOverPlaceholder:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_displayedOverPlaceholder != a3)
  {
    self->_displayedOverPlaceholder = a3;
    if (a3)
    {
      if (self->_webClipIdentifier)
      {
        *(void *)&a3 = 1;
      }
      else
      {
        BOOL v8 = a4;
        v7 = [MEMORY[0x1E4F28B00] currentHandler];
        [v7 handleFailureInMethod:a2 object:self file:@"SBAppClipOverlayViewController.m" lineNumber:76 description:@"Expected to have a non-nil web clip identifier if we're displaying over a placeholder."];

        *(void *)&a4 = v8;
        *(void *)&a3 = self->_displayedOverPlaceholder;
      }
    }
    overlayViewController = self->_overlayViewController;
    [(CPSClipOverlayViewController *)overlayViewController setDisplayedOverPlaceholder:a3 animated:a4];
  }
}

- (void)setSceneActivationState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_sceneActivationState != a3)
  {
    self->_sceneActivationState = a3;
    -[CPSClipOverlayViewController setSceneActivationState:animated:](self->_overlayViewController, "setSceneActivationState:animated:");
  }
}

- (void)setNeedsUpdate
{
  if (self->_overlayViewController) {
    [(CPSClipOverlayViewController *)self->_overlayViewController setClipNeedsUpdateToLatestVersion];
  }
  else {
    self->_needsUpdate = 1;
  }
}

- (id)view
{
  v4.receiver = self;
  v4.super_class = (Class)SBAppClipOverlayViewController;
  v2 = [(SBAppClipOverlayViewController *)&v4 view];
  return v2;
}

- (void)loadView
{
  v3 = [SBAppClipOverlayView alloc];
  objc_super v4 = -[SBAppClipOverlayView initWithFrame:delegate:](v3, "initWithFrame:delegate:", self, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBFTouchPassThroughViewController *)self configureTouchPassThroughView:v4];
  [(SBAppClipOverlayViewController *)self setView:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBAppClipOverlayViewController;
  [(SBAppClipOverlayViewController *)&v8 viewWillAppear:a3];
  if (!self->_overlayViewController)
  {
    objc_super v4 = [(SBAppClipOverlayCoordinator *)self->_coordinator overlayViewControllerForBundleIdentifier:self->_bundleIdentifier webClipIdentifier:self->_webClipIdentifier participant:self];
    overlayViewController = self->_overlayViewController;
    self->_overlayViewController = v4;

    v6 = self->_overlayViewController;
    v7 = [(SBAppClipOverlayViewController *)self view];
    [(SBAppClipOverlayViewController *)self bs_addChildViewController:v6 withSuperview:v7];

    [(CPSClipOverlayViewController *)self->_overlayViewController setDisplayedOverPlaceholder:self->_displayedOverPlaceholder animated:0];
    [(CPSClipOverlayViewController *)self->_overlayViewController setSceneActivationState:self->_sceneActivationState animated:0];
    if (self->_needsUpdate)
    {
      [(CPSClipOverlayViewController *)self->_overlayViewController setClipNeedsUpdateToLatestVersion];
      self->_needsUpdate = 0;
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBAppClipOverlayViewController *)self invalidate];
  v5.receiver = self;
  v5.super_class = (Class)SBAppClipOverlayViewController;
  [(SBAppClipOverlayViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SBAppClipOverlayViewController;
  [(SBAppClipOverlayViewController *)&v13 viewDidLayoutSubviews];
  BOOL v3 = [(SBAppClipOverlayViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(CPSClipOverlayViewController *)self->_overlayViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (int64_t)preferredStatusBarStyle
{
  return [(CPSClipOverlayViewController *)self->_overlayViewController preferredStatusBarStyle];
}

- (id)participantName
{
  BOOL v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [v3 stringWithFormat:@"%@-%@", v5, self->_sceneIdentifier];

  return v6;
}

- (void)invalidate
{
  if (self->_overlayViewController)
  {
    -[SBAppClipOverlayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    [(SBAppClipOverlayCoordinator *)self->_coordinator participant:self didSurrenderViewController:self->_overlayViewController];
    overlayViewController = self->_overlayViewController;
    self->_overlayViewController = 0;
  }
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)SBAppClipOverlayViewController;
  BOOL v3 = [(SBAppClipOverlayViewController *)&v8 description];
  sceneIdentifier = self->_sceneIdentifier;
  double v5 = NSStringFromBOOL();
  double v6 = [v3 stringByAppendingFormat:@" sceneIdentifier:%@ displayedOverPlaceholder:%@ sceneActivationState:%ld overlayViewController:%@", sceneIdentifier, v5, self->_sceneActivationState, self->_overlayViewController];

  return (NSString *)v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (NSString)webClipIdentifier
{
  return self->_webClipIdentifier;
}

- (void)setWebClipIdentifier:(id)a3
{
}

- (SBAppClipOverlayCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (CPSClipOverlayViewController)overlayViewController
{
  return self->_overlayViewController;
}

- (void)setOverlayViewController:(id)a3
{
}

- (BOOL)displayedOverPlaceholder
{
  return self->_displayedOverPlaceholder;
}

- (void)setDisplayedOverPlaceholder:(BOOL)a3
{
  self->_displayedOverPlaceholder = a3;
}

- (int64_t)sceneActivationState
{
  return self->_sceneActivationState;
}

- (void)setSceneActivationState:(int64_t)a3
{
  self->_sceneActivationState = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayViewController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_webClipIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
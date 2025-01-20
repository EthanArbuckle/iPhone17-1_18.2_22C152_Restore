@interface SBHomeScreenSpotlightViewController
- (BSInvalidatable)displayLayoutAssertion;
- (SBHomeScreenSpotlightDismissalDelegate)homescreenSpotlightDelegate;
- (SBHomeScreenSpotlightViewController)initWithDelegate:(id)a3;
- (unint64_t)level;
- (unint64_t)remoteSearchViewPresentationSource;
- (void)_setDisplayLayoutElementActive:(BOOL)a3;
- (void)dealloc;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBHomeScreenSpotlightViewController

- (SBHomeScreenSpotlightViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHomeScreenSpotlightViewController;
  v5 = [(SBHomeScreenSpotlightViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_homescreenSpotlightDelegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_displayLayoutAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBHomeScreenSpotlightViewController;
  [(SBSpotlightMultiplexingViewController *)&v3 dealloc];
}

- (unint64_t)level
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenSpotlightViewController;
  [(SBSpotlightMultiplexingViewController *)&v4 viewWillAppear:a3];
  [(SBHomeScreenSpotlightViewController *)self _setDisplayLayoutElementActive:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeScreenSpotlightViewController;
  [(SBSpotlightMultiplexingViewController *)&v4 viewDidDisappear:a3];
  [(SBHomeScreenSpotlightViewController *)self _setDisplayLayoutElementActive:0];
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (displayLayoutAssertion) {
      return;
    }
    id v5 = objc_alloc(MEMORY[0x1E4FA6A68]);
    v10 = (void *)[v5 initWithIdentifier:*MEMORY[0x1E4FA6F78]];
    [v10 setLevel:0];
    [v10 setFillsDisplayBounds:1];
    [v10 setLayoutRole:6];
    v6 = [MEMORY[0x1E4F62438] sharedInstance];
    v7 = [v6 addElement:v10];
    objc_super v8 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = v7;

    v9 = (BSInvalidatable *)v10;
  }
  else
  {
    if (!displayLayoutAssertion) {
      return;
    }
    [(BSInvalidatable *)displayLayoutAssertion invalidate];
    v9 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;
  }
}

- (unint64_t)remoteSearchViewPresentationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homescreenSpotlightDelegate);
  objc_super v4 = WeakRetained;
  if (WeakRetained) {
    unint64_t v5 = [WeakRetained defaultSearchViewPresentationSourceForViewController:self];
  }
  else {
    unint64_t v5 = 1;
  }

  return v5;
}

- (SBHomeScreenSpotlightDismissalDelegate)homescreenSpotlightDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homescreenSpotlightDelegate);
  return (SBHomeScreenSpotlightDismissalDelegate *)WeakRetained;
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_destroyWeak((id *)&self->_homescreenSpotlightDelegate);
}

@end
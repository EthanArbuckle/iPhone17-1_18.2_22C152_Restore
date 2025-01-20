@interface LocalSearchViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isEnabled;
- (BOOL)shouldBeVisible;
- (BOOL)showInCardFooterWhenCardHasExpandedLayout;
- (BOOL)updateActiveBusinessController;
- (BOOL)viewHasAppeared;
- (BrowseVenueBusinessController)browseVenueBusinessController;
- (LocalSearchBusinessController)activeBusinessController;
- (LocalSearchBusinessController)reportedVisibleBusinessController;
- (LocalSearchViewControllerDelegate)delegate;
- (RefreshSearchHereBusinessController)refreshSearchHereBusinessController;
- (VKVenueFeatureMarker)venueWithFocus;
- (double)bottomInset;
- (double)contentHeight;
- (id)businessControllers;
- (id)contentView;
- (id)initAsButton:(BOOL)a3;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (void)businessControllerContentSizeDidChange:(id)a3;
- (void)businessControllerVisibilityDidChange:(id)a3;
- (void)loadView;
- (void)localSearchViewContentSizeChanged;
- (void)localSearchViewSelected:(id)a3;
- (void)localSearchViewVisibilityChanged;
- (void)reportVisibilityIfNeeded;
- (void)setActiveBusinessController:(id)a3;
- (void)setBottomInset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEnable:(BOOL)a3;
- (void)setReportedVisibleBusinessController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LocalSearchViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)initAsButton:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)LocalSearchViewController;
  v4 = [(LocalSearchViewController *)&v11 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_buttonMode = a3;
    v6 = [[RefreshSearchHereBusinessController alloc] initWithDelegate:v4];
    refreshSearchHereBusinessController = v5->_refreshSearchHereBusinessController;
    v5->_refreshSearchHereBusinessController = v6;

    v8 = [[BrowseVenueBusinessController alloc] initWithDelegate:v5];
    browseVenueBusinessController = v5->_browseVenueBusinessController;
    v5->_browseVenueBusinessController = v8;

    objc_storeStrong((id *)&v5->_activeBusinessController, v5->_refreshSearchHereBusinessController);
  }
  return v5;
}

- (void)loadView
{
  if (!self->_buttonMode)
  {
    v5 = +[MapsTheme visualEffectViewAllowingBlur:1];
    blurView = self->_blurView;
    self->_blurView = v5;

    [(UIVisualEffectView *)self->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
    goto LABEL_5;
  }
  if (sub_1000BBB44(self) == 5)
  {
    v3 = +[MapsTheme visualEffectViewAllowingBlur:1];
    v4 = self->_blurView;
    self->_blurView = v3;

    [(UIVisualEffectView *)self->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIVisualEffectView *)self->_blurView _setCornerRadius:1 continuous:15 maskedCorners:9.0];
LABEL_5:
    v7 = self->_blurView;
    [(LocalSearchViewController *)self setView:v7];
    return;
  }
  v8 = [[CardView alloc] initAllowingBlurredForButton:1];
  [(CardView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CardView *)v8 setLayoutStyle:6];
  cardView = self->_cardView;
  self->_cardView = v8;
  v10 = v8;

  [(LocalSearchViewController *)self setView:self->_cardView];
}

- (double)contentHeight
{
  [(LocalSearchView *)self->_contentView contentHeight];
  return result;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)LocalSearchViewController;
  [(LocalSearchViewController *)&v23 viewDidLoad];
  cardView = self->_cardView;
  if (!cardView) {
    cardView = self->_blurView;
  }
  v18 = [cardView contentView];
  v4 = [(LocalSearchViewController *)self contentView];
  [v18 addSubview:v4];

  v21 = [(LocalSearchView *)self->_contentView leadingAnchor];
  v22 = [(LocalSearchViewController *)self view];
  v20 = [v22 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v24[0] = v19;
  v16 = [(LocalSearchView *)self->_contentView trailingAnchor];
  v17 = [(LocalSearchViewController *)self view];
  v15 = [v17 trailingAnchor];
  v5 = [v16 constraintEqualToAnchor:v15];
  v24[1] = v5;
  v6 = [(LocalSearchView *)self->_contentView topAnchor];
  v7 = [(LocalSearchViewController *)self view];
  v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  v24[2] = v9;
  v10 = [(LocalSearchView *)self->_contentView bottomAnchor];
  objc_super v11 = [(LocalSearchViewController *)self view];
  v12 = [v11 bottomAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v24[3] = v13;
  v14 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_viewHasAppeared = 1;
  v5 = [(LocalSearchViewController *)self activeBusinessController];
  [v5 viewWillAppear];

  v6.receiver = self;
  v6.super_class = (Class)LocalSearchViewController;
  [(LocalSearchViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(LocalSearchViewController *)self reportVisibilityIfNeeded];
  v5.receiver = self;
  v5.super_class = (Class)LocalSearchViewController;
  [(LocalSearchViewController *)&v5 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LocalSearchViewController;
  [(LocalSearchViewController *)&v4 viewDidDisappear:a3];
  self->_viewHasAppeared = 0;
  [(LocalSearchViewController *)self reportVisibilityIfNeeded];
}

- (void)setBottomInset:(double)a3
{
  if (self->_bottomInset != a3)
  {
    self->_bottomInset = a3;
    -[LocalSearchView setBottomInset:](self->_contentView, "setBottomInset:");
  }
}

- (id)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    objc_super v4 = -[LocalSearchView initWithFrame:]([LocalSearchView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_super v5 = self->_contentView;
    self->_contentView = v4;

    [(LocalSearchView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(LocalSearchView *)self->_contentView setButtonMode:self->_buttonMode];
    [(LocalSearchView *)self->_contentView setBottomInset:self->_bottomInset];
    [(LocalSearchView *)self->_contentView setDelegate:self];
    objc_super v6 = self->_contentView;
    v7 = [(LocalSearchViewController *)self activeBusinessController];
    [v7 setContentView:v6];

    contentView = self->_contentView;
  }

  return contentView;
}

- (id)businessControllers
{
  BOOL v3 = [(LocalSearchViewController *)self refreshSearchHereBusinessController];
  v7[0] = v3;
  objc_super v4 = [(LocalSearchViewController *)self browseVenueBusinessController];
  v7[1] = v4;
  objc_super v5 = +[NSArray arrayWithObjects:v7 count:2];

  return v5;
}

- (BOOL)updateActiveBusinessController
{
  p_refreshSearchHereBusinessController = (LocalSearchBusinessController **)&self->_refreshSearchHereBusinessController;
  if (![(RefreshSearchHereBusinessController *)self->_refreshSearchHereBusinessController shouldBeVisible])
  {
    if ([(BrowseVenueBusinessController *)self->_browseVenueBusinessController shouldBeVisible]) {
      p_refreshSearchHereBusinessController = (LocalSearchBusinessController **)&self->_browseVenueBusinessController;
    }
    else {
      p_refreshSearchHereBusinessController = &self->_activeBusinessController;
    }
  }
  objc_super v4 = *p_refreshSearchHereBusinessController;
  activeBusinessController = self->_activeBusinessController;
  if (v4 != activeBusinessController) {
    [(LocalSearchViewController *)self setActiveBusinessController:v4];
  }
  return v4 != activeBusinessController;
}

- (void)setActiveBusinessController:(id)a3
{
  objc_super v5 = (LocalSearchBusinessController *)a3;
  if (self->_activeBusinessController != v5)
  {
    objc_storeStrong((id *)&self->_activeBusinessController, a3);
    objc_super v6 = [(LocalSearchViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(LocalSearchViewController *)self delegate];
      [v8 localSearchViewShowInCardFooterWhenCardHasExpandedLayoutDidChange:self];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = [(LocalSearchViewController *)self businessControllers];
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(LocalSearchBusinessController **)(*((void *)&v17 + 1) + 8 * i);
          if (v14 == v5)
          {
            v15 = [(LocalSearchViewController *)self contentView];
            [(LocalSearchBusinessController *)v5 setContentView:v15];
          }
          else
          {
            [(LocalSearchBusinessController *)v14 setContentView:0];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    v16 = [(LocalSearchViewController *)self contentView];
    [v16 layoutIfNeeded];

    [(LocalSearchViewController *)self reportVisibilityIfNeeded];
    [(MapsThemeViewController *)self updateTheme];
    [(LocalSearchViewController *)self localSearchViewContentSizeChanged];
  }
}

- (void)reportVisibilityIfNeeded
{
  if ([(LocalSearchViewController *)self viewHasAppeared]
    && [(LocalSearchViewController *)self shouldBeVisible])
  {
    BOOL v3 = [(LocalSearchViewController *)self activeBusinessController];
    objc_super v4 = [(LocalSearchViewController *)self reportedVisibleBusinessController];

    if (v3 != v4)
    {
      objc_super v5 = [(LocalSearchViewController *)self activeBusinessController];
      [v5 sendAnalyticsOnBecomeVisibleWithTarget:[self currentUITargetForAnalytics]];

      id v6 = [(LocalSearchViewController *)self activeBusinessController];
      [(LocalSearchViewController *)self setReportedVisibleBusinessController:v6];
    }
  }
  else
  {
    [(LocalSearchViewController *)self setReportedVisibleBusinessController:0];
  }
}

- (void)setEnable:(BOOL)a3
{
  if (self->_enable != a3)
  {
    self->_enable = a3;
    [(LocalSearchViewController *)self localSearchViewVisibilityChanged];
    [(LocalSearchViewController *)self reportVisibilityIfNeeded];
  }
}

- (BOOL)shouldBeVisible
{
  if (![(LocalSearchViewController *)self isEnabled]) {
    return 0;
  }
  BOOL v3 = [(LocalSearchViewController *)self refreshSearchHereBusinessController];
  if ([v3 shouldBeVisible])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    objc_super v5 = [(LocalSearchViewController *)self browseVenueBusinessController];
    unsigned __int8 v4 = [v5 shouldBeVisible];
  }
  return v4;
}

- (BOOL)showInCardFooterWhenCardHasExpandedLayout
{
  v2 = [(LocalSearchViewController *)self activeBusinessController];
  unsigned __int8 v3 = [v2 showInCardFooterWhenCardHasExpandedLayout];

  return v3;
}

- (void)localSearchViewSelected:(id)a3
{
  unsigned __int8 v4 = [(LocalSearchViewController *)self activeBusinessController];
  [v4 sendAnalyticsOnUserActionWithTarget:[self currentUITargetForAnalytics]];

  objc_super v5 = [(LocalSearchViewController *)self activeBusinessController];
  id v6 = [(LocalSearchViewController *)self refreshSearchHereBusinessController];

  if (v5 == v6)
  {
    id v9 = [(LocalSearchViewController *)self delegate];
    [v9 localSearchViewControllerDidSelectRefreshSearchHere:self];
  }
  else
  {
    char v7 = [(LocalSearchViewController *)self activeBusinessController];
    v8 = [(LocalSearchViewController *)self browseVenueBusinessController];

    if (v7 != v8) {
      return;
    }
    id v9 = [(LocalSearchViewController *)self delegate];
    [v9 viewControllerDidSelectBrowseVenue:self];
  }
}

- (void)localSearchViewVisibilityChanged
{
  unsigned __int8 v3 = [(LocalSearchViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(LocalSearchViewController *)self delegate];
    [v5 localSearchViewShouldBeVisibleDidChange:self];
  }
}

- (void)localSearchViewContentSizeChanged
{
  unsigned __int8 v3 = [(LocalSearchViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(LocalSearchViewController *)self delegate];
    [v5 localSearchViewControllerSizeDidChange:self];
  }
}

- (VKVenueFeatureMarker)venueWithFocus
{
  v2 = [(LocalSearchViewController *)self delegate];
  unsigned __int8 v3 = [v2 venueWithFocus];

  return (VKVenueFeatureMarker *)v3;
}

- (void)businessControllerVisibilityDidChange:(id)a3
{
  [(LocalSearchViewController *)self updateActiveBusinessController];
  [(LocalSearchViewController *)self localSearchViewVisibilityChanged];

  [(LocalSearchViewController *)self reportVisibilityIfNeeded];
}

- (void)businessControllerContentSizeDidChange:(id)a3
{
  id v5 = a3;
  if (![(LocalSearchViewController *)self updateActiveBusinessController])
  {
    id v4 = [(LocalSearchViewController *)self activeBusinessController];

    if (v4 == v5) {
      [(LocalSearchViewController *)self localSearchViewContentSizeChanged];
    }
  }
}

- (int)currentUITargetForAnalytics
{
  unsigned __int8 v3 = [(LocalSearchViewController *)self delegate];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  id v5 = [(LocalSearchViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 currentUITargetForAnalytics];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  unsigned __int8 v3 = [(LocalSearchViewController *)self delegate];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  id v5 = [(LocalSearchViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 currentMapViewTargetForAnalytics];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (LocalSearchViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LocalSearchViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RefreshSearchHereBusinessController)refreshSearchHereBusinessController
{
  return self->_refreshSearchHereBusinessController;
}

- (BrowseVenueBusinessController)browseVenueBusinessController
{
  return self->_browseVenueBusinessController;
}

- (BOOL)isEnabled
{
  return self->_enable;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (LocalSearchBusinessController)activeBusinessController
{
  return self->_activeBusinessController;
}

- (LocalSearchBusinessController)reportedVisibleBusinessController
{
  return self->_reportedVisibleBusinessController;
}

- (void)setReportedVisibleBusinessController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedVisibleBusinessController, 0);
  objc_storeStrong((id *)&self->_activeBusinessController, 0);
  objc_storeStrong((id *)&self->_browseVenueBusinessController, 0);
  objc_storeStrong((id *)&self->_refreshSearchHereBusinessController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_cardView, 0);
}

@end
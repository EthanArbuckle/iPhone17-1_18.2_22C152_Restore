@interface RelatedSearchSuggestionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isHidden;
- (GEORelatedSearchSuggestion)pdSuggestion;
- (RelatedSearchSuggestion)suggestion;
- (RelatedSearchSuggestionViewController)init;
- (RelatedSearchSuggestionViewControllerDelegate)delegate;
- (id)_createMapsThemeButtonWithTitle:(id)a3;
- (id)_createMapsThemeLabelWithTitle:(id)a3;
- (void)_clearTimer;
- (void)_componentButtonTapped:(id)a3;
- (void)_hideSuggestionViewTimerFired:(id)a3;
- (void)_loadSuggestions;
- (void)_resetTimer;
- (void)dealloc;
- (void)dismiss;
- (void)dismissWithReason:(unint64_t)a3;
- (void)loadView;
- (void)preferredContentSizeChanged:(id)a3;
- (void)resetData;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setSuggestion:(id)a3;
- (void)updateSuggestionPositionWithOffset:(double)a3;
- (void)viewDidLoad;
@end

@implementation RelatedSearchSuggestionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (RelatedSearchSuggestionViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)RelatedSearchSuggestionViewController;
  v2 = [(RelatedSearchSuggestionViewController *)&v5 init];
  if (v2)
  {
    v2->_accessibilityEnabled = +[UIFont accessibilityTextEnabled];
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"preferredContentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(RelatedSearchSuggestionViewController *)self _clearTimer];
  v3.receiver = self;
  v3.super_class = (Class)RelatedSearchSuggestionViewController;
  [(RelatedSearchSuggestionViewController *)&v3 dealloc];
}

- (void)loadView
{
  v4 = -[RelatedSearchSuggestionView initWithFrame:]([RelatedSearchSuggestionView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(RelatedSearchSuggestionView *)v4 _setHostsLayoutEngine:1];
  LODWORD(v3) = 1148846080;
  [(RelatedSearchSuggestionView *)v4 setContentCompressionResistancePriority:1 forAxis:v3];
  [(RelatedSearchSuggestionView *)v4 setAlpha:0.0];
  [(RelatedSearchSuggestionViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)RelatedSearchSuggestionViewController;
  [(RelatedSearchSuggestionViewController *)&v24 viewDidLoad];
  double v3 = +[MapsTheme visualEffectViewAllowingBlur:1];
  blurView = self->_blurView;
  self->_blurView = v3;

  objc_super v5 = self->_blurView;
  v6 = [(RelatedSearchSuggestionViewController *)self suggestionView];
  [v6 setBlurView:v5];

  v7 = [(RelatedSearchSuggestionViewController *)self view];
  [v7 addSubview:self->_blurView];

  v8 = self->_blurView;
  v9 = [(RelatedSearchSuggestionViewController *)self suggestionView];
  [v9 setBlurView:v8];

  v10 = [objc_alloc((Class)UIScrollView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  scrollView = self->_scrollView;
  self->_scrollView = v10;

  [(UIScrollView *)self->_scrollView setDelegate:self];
  v12 = [(RelatedSearchSuggestionViewController *)self view];
  [v12 addSubview:self->_scrollView];

  v13 = self->_scrollView;
  v14 = [(RelatedSearchSuggestionViewController *)self suggestionView];
  [v14 setScrollView:v13];

  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"Close [DYM]" value:@"localized string not found" table:0];
  v17 = [(RelatedSearchSuggestionViewController *)self _createMapsThemeButtonWithTitle:v16];
  closeButton = self->_closeButton;
  self->_closeButton = v17;

  [(MapsThemeButton *)self->_closeButton setTag:0x7FFFFFFFFFFFFFFFLL];
  v19 = [(RelatedSearchSuggestionViewController *)self view];
  [v19 addSubview:self->_closeButton];

  v20 = self->_closeButton;
  v21 = [(RelatedSearchSuggestionViewController *)self suggestionView];
  [v21 setCloseButton:v20];

  v22 = [(RelatedSearchSuggestionViewController *)self view];
  id v23 = [v22 _maps_addHairlineAtTopWithMargin:0.0];
}

- (void)preferredContentSizeChanged:(id)a3
{
  self->_accessibilityEnabled = +[UIFont accessibilityTextEnabled];
  if ([(RelatedSearchSuggestion *)self->_suggestion showCloseButton]) {
    BOOL v4 = !self->_accessibilityEnabled;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = [(RelatedSearchSuggestionViewController *)self suggestionView];
  [v5 setShowCloseButton:v4];
}

- (void)_loadSuggestions
{
  [(NSMutableArray *)self->_componentViews makeObjectsPerformSelector:"removeFromSuperview"];
  [(NSMutableArray *)self->_componentViews removeAllObjects];
  if (!self->_componentViews)
  {
    double v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    componentViews = self->_componentViews;
    self->_componentViews = v3;
  }
  id v5 = +[NSMutableArray array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v6 = [(RelatedSearchSuggestion *)self->_suggestion components];
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v7)
  {
    id v9 = v6;
    goto LABEL_19;
  }
  id v8 = v7;
  id v9 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = *(void *)v29;
  id obj = v6;
  do
  {
    v10 = 0;
    v11 = v9;
    do
    {
      if (*(void *)v29 != v27) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v10);
      unsigned int v13 = [v12 isRelatedSearchSuggestion:obj];
      v14 = [v12 displayText];
      if (v13)
      {
        v15 = [(RelatedSearchSuggestionViewController *)self _createMapsThemeButtonWithTitle:v14];

        [v15 setTag:(char *)v10 + v26];
      }
      else
      {
        v15 = [(RelatedSearchSuggestionViewController *)self _createMapsThemeLabelWithTitle:v14];
      }
      [(UIScrollView *)self->_scrollView addSubview:v15];
      v16 = [v15 centerYAnchor];
      v17 = [(UIScrollView *)self->_scrollView centerYAnchor];
      v18 = [v16 constraintEqualToAnchor:v17];
      [v5 addObject:v18];

      v19 = [v15 leadingAnchor];
      if (v11)
      {
        v20 = [v11 trailingAnchor];
        [v19 constraintEqualToAnchor:v20];
      }
      else
      {
        v20 = [(UIScrollView *)self->_scrollView leadingAnchor];
        [v19 constraintEqualToAnchor:v20 constant:16.0];
      v21 = };
      [v5 addObject:v21];

      id v9 = v15;
      [(NSMutableArray *)self->_componentViews addObject:v9];

      v10 = (char *)v10 + 1;
      v11 = v9;
    }
    while (v8 != v10);
    id v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    v26 += (uint64_t)v10;
  }
  while (v8);

  if (v9)
  {
    v22 = [v9 trailingAnchor];
    id v23 = [(UIScrollView *)self->_scrollView trailingAnchor];
    objc_super v24 = [v22 constraintEqualToAnchor:v23 constant:-16.0];
    [v5 addObject:v24];

LABEL_19:
  }
  +[NSLayoutConstraint activateConstraints:v5];
}

- (void)_componentButtonTapped:(id)a3
{
  id v12 = a3;
  [(RelatedSearchSuggestionViewController *)self setHidden:1 animated:1];
  id v4 = [v12 tag];
  id v5 = [(RelatedSearchSuggestion *)self->_suggestion components];
  id v6 = [v5 count];

  if (v4 >= v6)
  {
    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
    id v8 = [(RelatedSearchSuggestionViewController *)self delegate];
    [v8 relatedSearchSuggestionViewController:self didDismissWithReason:0];
  }
  else
  {
    id v7 = [(RelatedSearchSuggestion *)self->_suggestion components];
    id v8 = [v7 objectAtIndexedSubscript:v4];

    if ([v8 isRelatedSearchSuggestion])
    {
      id v9 = [v8 suggestion];
      pdSuggestion = self->_pdSuggestion;
      self->_pdSuggestion = v9;

      v11 = [(RelatedSearchSuggestionViewController *)self delegate];
      [v11 relatedSearchSuggestionViewControllerDidTapActionButton:self];
    }
  }

LABEL_7:
}

- (id)_createMapsThemeButtonWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = +[MapsThemeButton buttonWithType:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 _setTouchInsets:-7.0, -7.0, -7.0, -7.0];
  [v5 setTitleColorProvider:&stru_1012F7D28];
  id v6 = [v5 titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v6 withFontProvider:&stru_1012EC5C0];

  [v5 addTarget:self action:"_componentButtonTapped:" forControlEvents:64];
  id v7 = [v5 titleLabel];
  [v7 setLineBreakMode:4];

  if (MKApplicationLayoutDirectionIsRightToLeft()) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  [v5 setContentHorizontalAlignment:v8];
  [v5 setTitle:v4 forState:0];

  return v5;
}

- (id)_createMapsThemeLabelWithTitle:(id)a3
{
  id v3 = a3;
  id v4 = -[MapsThemeLabel initWithFrame:]([MapsThemeLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(MapsThemeLabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = +[UIColor labelColor];
  [(MapsThemeLabel *)v4 setTextColor:v5];

  +[DynamicTypeWizard autorefreshLabel:v4 withFontProvider:&stru_1012EC5C0];
  LODWORD(v6) = 1148846080;
  [(MapsThemeLabel *)v4 setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [(MapsThemeLabel *)v4 setContentCompressionResistancePriority:0 forAxis:v7];
  [(MapsThemeLabel *)v4 setText:v3];

  return v4;
}

- (void)_clearTimer
{
  [(NSTimer *)self->_hideSuggestionViewTimer invalidate];
  hideSuggestionViewTimer = self->_hideSuggestionViewTimer;
  self->_hideSuggestionViewTimer = 0;
}

- (void)_hideSuggestionViewTimerFired:(id)a3
{
  [(RelatedSearchSuggestionViewController *)self _clearTimer];

  [(RelatedSearchSuggestionViewController *)self dismissWithReason:1];
}

- (void)_resetTimer
{
  [(RelatedSearchSuggestionViewController *)self _clearTimer];
  if (self->_hideSuggestionViewTimeoutInSeconds > 0.0)
  {
    +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_hideSuggestionViewTimerFired:", 0, 0);
    id v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    hideSuggestionViewTimer = self->_hideSuggestionViewTimer;
    self->_hideSuggestionViewTimer = v3;
  }
}

- (BOOL)isHidden
{
  v2 = [(RelatedSearchSuggestionViewController *)self view];
  [v2 alpha];
  BOOL v4 = v3 == 0.0;

  return v4;
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(RelatedSearchSuggestionViewController *)self isHidden] != a3)
  {
    if (a3)
    {
      [(RelatedSearchSuggestionViewController *)self _clearTimer];
      suggestionShownDate = self->_suggestionShownDate;
      self->_suggestionShownDate = 0;

      double v8 = 0.0;
    }
    else
    {
      [(RelatedSearchSuggestionViewController *)self _resetTimer];
      id v9 = +[NSDate date];
      v10 = self->_suggestionShownDate;
      self->_suggestionShownDate = v9;

      self->_forceDismiss = 0;
      double v8 = 1.0;
    }
    id v11 = [(RelatedSearchSuggestionViewController *)self suggestionView];
    [v11 setAlpha:v4 animated:v8];
  }
}

- (void)setSuggestion:(id)a3
{
  id v5 = (RelatedSearchSuggestion *)a3;
  if (self->_suggestion != v5)
  {
    objc_storeStrong((id *)&self->_suggestion, a3);
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", CGPointZero.x, CGPointZero.y);
    [(RelatedSearchSuggestion *)v5 visibleTime];
    self->_hideSuggestionViewTimeoutInSeconds = v6;
    if ([(RelatedSearchSuggestion *)v5 showCloseButton]) {
      BOOL v7 = !self->_accessibilityEnabled;
    }
    else {
      BOOL v7 = 0;
    }
    double v8 = [(RelatedSearchSuggestionViewController *)self suggestionView];
    [v8 setShowCloseButton:v7];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004B8190;
    v9[3] = &unk_1012E5D08;
    v9[4] = self;
    +[UIView performWithoutAnimation:v9];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  self->_suggestionScrollViewScrollingLeft = 0;
  self->_suggestionScrollViewScrollingRight = 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v8 = a3;
  [v8 contentOffset];
  double v5 = v4;
  if (MKApplicationLayoutDirectionIsRightToLeft())
  {
    [v8 contentSize];
    double v7 = v6 - v5;
    [v8 frame];
    double v5 = v7 - CGRectGetWidth(v10);
  }
  [(RelatedSearchSuggestionViewController *)self updateSuggestionPositionWithOffset:v5];
}

- (void)updateSuggestionPositionWithOffset:(double)a3
{
  double lastSuggestionScrollOffset = self->_lastSuggestionScrollOffset;
  if (lastSuggestionScrollOffset < a3 && !self->_suggestionScrollViewScrollingLeft)
  {
    self->_suggestionScrollViewScrollingLeft = 1;
    self->_suggestionScrollViewScrollingRight = 0;
    double v6 = [(RelatedSearchSuggestionViewController *)self delegate];
    [v6 relatedSearchSuggestionViewControllerDidScrollLeft:self];
    goto LABEL_7;
  }
  if (lastSuggestionScrollOffset > a3 && !self->_suggestionScrollViewScrollingRight)
  {
    self->_suggestionScrollViewScrollingLeft = 0;
    self->_suggestionScrollViewScrollingRight = 1;
    double v6 = [(RelatedSearchSuggestionViewController *)self delegate];
    [v6 relatedSearchSuggestionViewControllerDidScrollRight:self];
LABEL_7:
  }
  self->_double lastSuggestionScrollOffset = a3;
}

- (void)dismiss
{
}

- (void)dismissWithReason:(unint64_t)a3
{
  [(NSDate *)self->_suggestionShownDate timeIntervalSinceNow];
  double v6 = v5;
  [(NSDate *)self->_suggestionShownDate timeIntervalSinceNow];
  double v8 = v7;
  if (![(RelatedSearchSuggestionViewController *)self isHidden])
  {
    double v9 = -v8;
    if (v6 >= 0.0) {
      double v9 = v8;
    }
    if (v9 >= 5.0 || self->_forceDismiss)
    {
      [(RelatedSearchSuggestionViewController *)self setHidden:1 animated:1];
      [(RelatedSearchSuggestionViewController *)self resetData];
      CGRect v10 = [(RelatedSearchSuggestionViewController *)self delegate];
      [v10 relatedSearchSuggestionViewController:self didDismissWithReason:a3];
    }
  }
  self->_forceDismiss = 1;
}

- (void)resetData
{
}

- (RelatedSearchSuggestionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RelatedSearchSuggestionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RelatedSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (GEORelatedSearchSuggestion)pdSuggestion
{
  return self->_pdSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hideSuggestionViewTimer, 0);
  objc_storeStrong((id *)&self->_suggestionShownDate, 0);
  objc_storeStrong((id *)&self->_componentViews, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
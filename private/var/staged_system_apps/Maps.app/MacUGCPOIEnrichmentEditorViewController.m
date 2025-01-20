@interface MacUGCPOIEnrichmentEditorViewController
- (BOOL)suppressRatings;
- (MacUGCPOIEnrichmentEditorViewController)initWithPOIEnrichmentForm:(id)a3 delegate:(id)a4 presentationContext:(int64_t)a5;
- (UGCPOIEnrichmentEditorDelegate)delegate;
- (void)_animteProgressViewWithCompletion:(id)a3;
- (void)cancelButtonPressed;
- (void)formDidChange:(id)a3;
- (void)loadView;
- (void)macFooterViewLeftButtonTapped:(id)a3;
- (void)macFooterViewRightButtonTapped:(id)a3;
- (void)sendButtonPressed;
- (void)setDelegate:(id)a3;
- (void)setSuppressRatings:(BOOL)a3;
- (void)submissionFinishedWithError:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBeginSubmissionWithProgress:(id)a3;
@end

@implementation MacUGCPOIEnrichmentEditorViewController

- (MacUGCPOIEnrichmentEditorViewController)initWithPOIEnrichmentForm:(id)a3 delegate:(id)a4 presentationContext:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MacUGCPOIEnrichmentEditorViewController;
  v11 = [(MacUGCPOIEnrichmentEditorViewController *)&v16 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_poiEnrichmentForm, a3);
    [(UGCForm *)v12->_poiEnrichmentForm addObserver:v12];
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13 = [[UGCPOIEnrichmentViewController alloc] initWithPOIEnrichmentForm:v9 presentationContext:a5];
    contentViewController = v12->_contentViewController;
    v12->_contentViewController = v13;
  }
  return v12;
}

- (void)loadView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(MacUGCPOIEnrichmentEditorViewController *)self setView:v3];

  id v4 = [(MacUGCPOIEnrichmentEditorViewController *)self view];
  [v4 setAccessibilityIdentifier:@"UGCPOIEnrichmentView"];
}

- (void)viewDidLoad
{
  v39.receiver = self;
  v39.super_class = (Class)MacUGCPOIEnrichmentEditorViewController;
  [(MacUGCPOIEnrichmentEditorViewController *)&v39 viewDidLoad];
  [(MacUGCPOIEnrichmentEditorViewController *)self _mapsui_resetViewLayoutMargins];
  id v3 = [(MacUGCPOIEnrichmentEditorViewController *)self view];
  [v3 setDirectionalLayoutMargins:0.0, 26.0, 0.0, 26.0];

  id v4 = +[MapsTheme visualEffectViewAllowingBlur:1];
  blurView = self->_blurView;
  self->_blurView = v4;

  [(UIVisualEffectView *)self->_blurView _mapsui_resetLayoutMarginsWithPreservesSuperview:1];
  v6 = [(UIVisualEffectView *)self->_blurView contentView];
  [v6 _mapsui_resetLayoutMarginsWithPreservesSuperview:1];

  v7 = [(MacUGCPOIEnrichmentEditorViewController *)self view];
  [v7 addSubview:self->_blurView];

  v8 = [UGCPOIEnrichmentHeaderView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v12 = -[UGCPOIEnrichmentHeaderView initWithFrame:](v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  macHeaderView = self->_macHeaderView;
  self->_macHeaderView = v12;

  [(UGCPOIEnrichmentHeaderView *)self->_macHeaderView setPreservesSuperviewLayoutMargins:1];
  v14 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm mapItem];
  [(UGCPOIEnrichmentHeaderView *)self->_macHeaderView setMapItem:v14];

  v15 = [(UIVisualEffectView *)self->_blurView contentView];
  [v15 addSubview:self->_macHeaderView];

  objc_super v16 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
  [v16 setPreservesSuperviewLayoutMargins:1];

  [(UGCPOIEnrichmentViewController *)self->_contentViewController setSuppressRatings:self->_suppressRatings];
  [(MacUGCPOIEnrichmentEditorViewController *)self addChildViewController:self->_contentViewController];
  v17 = [(UIVisualEffectView *)self->_blurView contentView];
  v18 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
  [v17 addSubview:v18];

  [(UGCPOIEnrichmentViewController *)self->_contentViewController didMoveToParentViewController:self];
  v19 = [[MacFooterView alloc] initWithNoBlurRightSideButtonsOfType:16];
  submitButtonsFooterView = self->_submitButtonsFooterView;
  self->_submitButtonsFooterView = v19;

  [(MacFooterView *)self->_submitButtonsFooterView setDelegate:self];
  BOOL v21 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm isComplete];
  v22 = [(MacFooterView *)self->_submitButtonsFooterView rightButton];
  [v22 setEnabled:v21];

  v23 = [(UIVisualEffectView *)self->_blurView contentView];
  [v23 addSubview:self->_submitButtonsFooterView];

  id v24 = objc_alloc((Class)MUEdgeLayout);
  v25 = self->_blurView;
  v26 = [(MacUGCPOIEnrichmentEditorViewController *)self view];
  id v27 = [v24 initWithItem:v25 container:v26];

  id v28 = objc_alloc((Class)MUStackLayout);
  v29 = [(UIVisualEffectView *)self->_blurView contentView];
  id v30 = [v28 initWithContainer:v29 axis:1];

  v41[0] = self->_macHeaderView;
  v31 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
  v32 = self->_submitButtonsFooterView;
  v41[1] = v31;
  v41[2] = v32;
  v33 = +[NSArray arrayWithObjects:v41 count:3];
  [v30 setArrangedLayoutItems:v33];

  v40[0] = v27;
  v40[1] = v30;
  v34 = +[NSArray arrayWithObjects:v40 count:2];
  +[NSLayoutConstraint _mapsui_activateLayouts:v34];

  v35 = -[MapsProgressBarModalView initWithFrame:]([MapsProgressBarModalView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  progressView = self->_progressView;
  self->_progressView = v35;

  v37 = +[NSBundle mainBundle];
  v38 = [v37 localizedStringForKey:@"Uploading... [UGC]" value:@"localized string not found" table:0];
  [(MapsProgressBarModalView *)self->_progressView setProgressTitle:v38];
}

- (void)viewWillAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MacUGCPOIEnrichmentEditorViewController;
  [(MacUGCPOIEnrichmentEditorViewController *)&v17 viewWillAppear:a3];
  double height = UILayoutFittingCompressedSize.height;
  -[UGCPOIEnrichmentHeaderView systemLayoutSizeFittingSize:](self->_macHeaderView, "systemLayoutSizeFittingSize:", 348.0, height);
  double v6 = v5;
  v7 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
  [v7 systemLayoutSizeFittingSize:348.0 height];
  double v9 = v8;

  -[MacFooterView systemLayoutSizeFittingSize:](self->_submitButtonsFooterView, "systemLayoutSizeFittingSize:", 348.0, height);
  double v11 = v10;
  sizeLayout = self->_sizeLayout;
  if (!sizeLayout)
  {
    id v13 = objc_alloc((Class)MUSizeLayout);
    v14 = [(MacUGCPOIEnrichmentEditorViewController *)self view];
    v15 = [v13 initWithItem:v14 size:CGSizeZero.width, CGSizeZero.height];
    objc_super v16 = self->_sizeLayout;
    self->_sizeLayout = v15;

    sizeLayout = self->_sizeLayout;
  }
  -[MUSizeLayout setSize:](sizeLayout, "setSize:", 348.0, v6 + v9 + v11);
  [(MUSizeLayout *)self->_sizeLayout activate];
}

- (void)setSuppressRatings:(BOOL)a3
{
  if (self->_suppressRatings != a3)
  {
    BOOL v3 = a3;
    self->_suppressRatings = a3;
    if ([(MacUGCPOIEnrichmentEditorViewController *)self isViewLoaded])
    {
      contentViewController = self->_contentViewController;
      [(UGCPOIEnrichmentViewController *)contentViewController setSuppressRatings:v3];
    }
  }
}

- (void)cancelButtonPressed
{
  [(UGCPOIEnrichmentViewController *)self->_contentViewController logCancelAction];
  id v3 = [(MacUGCPOIEnrichmentEditorViewController *)self delegate];
  [v3 poiEnrichmenEditorDidCancel:self];
}

- (void)sendButtonPressed
{
  [(UGCPOIEnrichmentViewController *)self->_contentViewController logDoneAction];
  id v3 = [(MacUGCPOIEnrichmentEditorViewController *)self delegate];
  [v3 poiEnrichmentEditor:self finishedFillingEnrichmentForm:self->_poiEnrichmentForm];
}

- (void)_animteProgressViewWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(MacUGCPOIEnrichmentEditorViewController *)self view];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100548B54;
    v6[3] = &unk_1012E6EA8;
    id v7 = v4;
    +[UIView transitionWithView:v5 duration:5242882 options:v6 animations:0 completion:0.100000001];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", buf, 2u);
  }
}

- (void)submissionFinishedWithError:(id)a3
{
  id v4 = a3;
  progressView = self->_progressView;
  if (v4)
  {
    [(MapsProgressBarModalView *)progressView setObservedProgress:0];
    progressView = self->_progressView;
    double v5 = 0.0;
  }
  else
  {
    LODWORD(v5) = 1.0;
  }
  [(MapsProgressBarModalView *)progressView setProgress:v5];
  [(UGCPOIEnrichmentViewController *)self->_contentViewController submissionFinishedWithError:v4];
  [(MacFooterView *)self->_submitButtonsFooterView submissionFinishedWithError:v4];
  BOOL v7 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm isComplete];
  double v8 = [(MacFooterView *)self->_submitButtonsFooterView rightButton];
  [v8 setEnabled:v7];

  if ((MapsFeature_IsEnabled_SydneyARP() & 1) == 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100548C7C;
    v9[3] = &unk_1012E5D08;
    v9[4] = self;
    [(MacUGCPOIEnrichmentEditorViewController *)self _animteProgressViewWithCompletion:v9];
  }
}

- (void)willBeginSubmissionWithProgress:(id)a3
{
  id v4 = a3;
  [(UGCPOIEnrichmentViewController *)self->_contentViewController willBeginSubmissionWithProgress:v4];
  [(MacFooterView *)self->_submitButtonsFooterView willBeginSubmissionWithProgress:v4];
  double v5 = [(MacUGCPOIEnrichmentEditorViewController *)self view];
  [v5 addSubview:self->_progressView];

  [(MapsProgressBarModalView *)self->_progressView setHidden:1];
  id v6 = objc_alloc((Class)MUEdgeLayout);
  progressView = self->_progressView;
  double v8 = [(MacUGCPOIEnrichmentEditorViewController *)self view];
  id v9 = [v6 initWithItem:progressView container:v8];
  [v9 activate];

  if ((MapsFeature_IsEnabled_SydneyARP() & 1) == 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100548E14;
    v10[3] = &unk_1012E5D58;
    v10[4] = self;
    id v11 = v4;
    [(MacUGCPOIEnrichmentEditorViewController *)self _animteProgressViewWithCompletion:v10];
  }
}

- (void)formDidChange:(id)a3
{
  BOOL v4 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm isComplete];
  id v5 = [(MacFooterView *)self->_submitButtonsFooterView rightButton];
  [v5 setEnabled:v4];
}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
}

- (void)macFooterViewRightButtonTapped:(id)a3
{
}

- (UGCPOIEnrichmentEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCPOIEnrichmentEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)suppressRatings
{
  return self->_suppressRatings;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sizeLayout, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentForm, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_submitButtonsFooterView, 0);
  objc_storeStrong((id *)&self->_macHeaderView, 0);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
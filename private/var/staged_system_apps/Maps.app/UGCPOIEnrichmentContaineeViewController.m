@interface UGCPOIEnrichmentContaineeViewController
- (BOOL)showCardBackground;
- (BOOL)suppressRatings;
- (UGCPOIEnrichmentContaineeViewController)initWithPOIEnrichmentForm:(id)a3 delegate:(id)a4 presentationContext:(int64_t)a5;
- (UGCPOIEnrichmentEditorDelegate)delegate;
- (double)heightForLayout:(unint64_t)a3;
- (id)_backgroundColorForModalFormSheet;
- (void)_updateAppearanceForSubmission;
- (void)cancelButtonPressed;
- (void)contentDidUpdate;
- (void)poiEnrichmentViewController:(id)a3 didSelectTermsOfServiceURL:(id)a4;
- (void)sendButtonPressed;
- (void)setDelegate:(id)a3;
- (void)setShowCardBackground:(BOOL)a3;
- (void)setSuppressRatings:(BOOL)a3;
- (void)submissionFinishedWithError:(id)a3;
- (void)viewDidLoad;
- (void)willBeginSubmissionWithProgress:(id)a3;
@end

@implementation UGCPOIEnrichmentContaineeViewController

- (UGCPOIEnrichmentContaineeViewController)initWithPOIEnrichmentForm:(id)a3 delegate:(id)a4 presentationContext:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v28.receiver = self;
  v28.super_class = (Class)UGCPOIEnrichmentContaineeViewController;
  v11 = [(UGCPOIEnrichmentContaineeViewController *)&v28 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    p_poiEnrichmentForm = (id *)&v11->_poiEnrichmentForm;
    objc_storeStrong((id *)&v11->_poiEnrichmentForm, a3);
    [*p_poiEnrichmentForm addObserver:v12];
    objc_storeWeak((id *)&v12->_delegate, v10);
    v14 = [[UGCPOIEnrichmentViewController alloc] initWithPOIEnrichmentForm:v9 presentationContext:a5];
    contentViewController = v12->_contentViewController;
    v12->_contentViewController = v14;

    [(UGCPOIEnrichmentViewController *)v12->_contentViewController setDelegate:v12];
    v16 = -[UGCPOIEnrichmentModalHeaderView initWithFrame:]([UGCPOIEnrichmentModalHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    headerView = v12->_headerView;
    v12->_headerView = v16;

    [(UGCPOIEnrichmentModalHeaderView *)v12->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [*p_poiEnrichmentForm mapItem];
    [(UGCPOIEnrichmentModalHeaderView *)v12->_headerView setMapItem:v18];

    v19 = [(UGCPOIEnrichmentModalHeaderView *)v12->_headerView leadingButton];
    v20 = sub_100AEBD5C();
    [v19 setTitle:v20 forState:0];

    v21 = [(UGCPOIEnrichmentModalHeaderView *)v12->_headerView leadingButton];
    [v21 addTarget:v12 action:"cancelButtonPressed" forControlEvents:64];

    v22 = [(UGCPOIEnrichmentModalHeaderView *)v12->_headerView trailingButton];
    v23 = sub_100AEBDC4();
    [v22 setTitle:v23 forState:0];

    v24 = [(UGCPOIEnrichmentModalHeaderView *)v12->_headerView trailingButton];
    [v24 addTarget:v12 action:"sendButtonPressed" forControlEvents:64];

    v25 = [[CardView alloc] initAllowingBlurred:0];
    cardView = v12->_cardView;
    v12->_cardView = v25;

    [(CardView *)v12->_cardView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CardView *)v12->_cardView setHideGrabber:1];
  }

  return v12;
}

- (id)_backgroundColorForModalFormSheet
{
  v2 = [(UGCPOIEnrichmentContaineeViewController *)self theme];
  v3 = [v2 backgroundColorForModalFormSheet];

  return v3;
}

- (void)cancelButtonPressed
{
  [(UGCPOIEnrichmentViewController *)self->_contentViewController logCancelAction];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained poiEnrichmenEditorDidCancel:self];
}

- (void)sendButtonPressed
{
  if ([(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm isComplete])
  {
    [(UGCPOIEnrichmentViewController *)self->_contentViewController logDoneAction];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained poiEnrichmentEditor:self finishedFillingEnrichmentForm:self->_poiEnrichmentForm];
  }
  else
  {
    [(UGCPOIEnrichmentContaineeViewController *)self cancelButtonPressed];
  }
}

- (void)_updateAppearanceForSubmission
{
  v3 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm photosForm];
  id v4 = [v3 numberOfAddedPhotos];

  v5 = [(UGCPOIEnrichmentModalHeaderView *)self->_headerView trailingButton];
  if (v4)
  {
    v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"Add [Modal Card Header]" value:@"localized string not found" table:0];
    [v5 setTitle:v7 forState:0];
  }
  else
  {
    v6 = sub_100AEBDC4();
    [v5 setTitle:v6 forState:0];
  }

  BOOL v8 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm isComplete];
  id v9 = [(UGCPOIEnrichmentModalHeaderView *)self->_headerView trailingButton];
  [v9 setEnabled:v8];
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)UGCPOIEnrichmentContaineeViewController;
  [(ContaineeViewController *)&v49 viewDidLoad];
  v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setPresentedModally:1];

  id v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setTakesAvailableHeight:1];

  v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setAllowsSwipeToDismiss:0];

  v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 setDefaultContaineeLayout:5];

  v7 = [(ContaineeViewController *)self headerView];
  [v7 addSubview:self->_headerView];

  [(UGCPOIEnrichmentViewController *)self->_contentViewController setSuppressRatings:self->_suppressRatings];
  BOOL v8 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v9 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
  [v9 setPreservesSuperviewLayoutMargins:1];

  [(UGCPOIEnrichmentContaineeViewController *)self addChildViewController:self->_contentViewController];
  id v10 = [(ContaineeViewController *)self contentView];
  v11 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
  [v10 addSubview:v11];

  [(UGCPOIEnrichmentViewController *)self->_contentViewController didMoveToParentViewController:self];
  v47 = [(UGCPOIEnrichmentModalHeaderView *)self->_headerView topAnchor];
  v48 = [(ContaineeViewController *)self headerView];
  v46 = [v48 topAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v50[0] = v45;
  v43 = [(UGCPOIEnrichmentModalHeaderView *)self->_headerView leadingAnchor];
  v44 = [(ContaineeViewController *)self headerView];
  v42 = [v44 leadingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v50[1] = v41;
  v39 = [(UGCPOIEnrichmentModalHeaderView *)self->_headerView trailingAnchor];
  v40 = [(ContaineeViewController *)self headerView];
  v38 = [v40 trailingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v50[2] = v37;
  v35 = [(UGCPOIEnrichmentModalHeaderView *)self->_headerView bottomAnchor];
  v36 = [(ContaineeViewController *)self headerView];
  v34 = [v36 bottomAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v50[3] = v33;
  v32 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
  v30 = [v32 topAnchor];
  v31 = [(ContaineeViewController *)self contentView];
  v29 = [v31 topAnchor];
  objc_super v28 = [v30 constraintEqualToAnchor:v29];
  v50[4] = v28;
  v27 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
  v25 = [v27 leadingAnchor];
  v26 = [(ContaineeViewController *)self contentView];
  v24 = [v26 leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v50[5] = v23;
  v22 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
  v21 = [v22 trailingAnchor];
  v12 = [(ContaineeViewController *)self contentView];
  v13 = [v12 trailingAnchor];
  v14 = [v21 constraintEqualToAnchor:v13];
  v50[6] = v14;
  v15 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
  v16 = [v15 bottomAnchor];
  v17 = [(ContaineeViewController *)self contentView];
  v18 = [v17 bottomAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v50[7] = v19;
  v20 = +[NSArray arrayWithObjects:v50 count:8];
  +[NSLayoutConstraint activateConstraints:v20];

  [(UGCPOIEnrichmentContaineeViewController *)self _updateAppearanceForSubmission];
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 > 5)
  {
    double v12 = -1.0;
  }
  else
  {
    if (((1 << a3) & 0x27) != 0)
    {
      double height = UILayoutFittingCompressedSize.height;
      -[UGCPOIEnrichmentModalHeaderView systemLayoutSizeFittingSize:](self->_headerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
      double v6 = v5 + 0.0;
      v7 = [(UGCPOIEnrichmentViewController *)self->_contentViewController view];
      [v7 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width height];
      double v9 = v6 + v8;

      id v10 = [(ContaineeViewController *)self cardPresentationController];
      [v10 bottomSafeOffset];
      double v12 = v9 + v11;
    }
    else
    {
      id v10 = [(ContaineeViewController *)self cardPresentationController];
      [v10 availableHeight];
      double v12 = v13;
    }
  }
  v14 = [(ContaineeViewController *)self cardPresentationController];
  id v15 = [v14 containerStyle];

  if (v15 == (id)6)
  {
    v16 = [(ContaineeViewController *)self cardPresentationController];
    [v16 availableHeight];
    double v12 = v17;
  }
  return v12;
}

- (void)setShowCardBackground:(BOOL)a3
{
  if (self->_showCardBackground != a3)
  {
    self->_showCardBackground = a3;
    if (a3)
    {
      id v4 = [(UGCPOIEnrichmentContaineeViewController *)self view];
      [v4 insertSubview:self->_cardView atIndex:0];

      cardView = self->_cardView;
      id v8 = [(UGCPOIEnrichmentContaineeViewController *)self view];
      double v6 = [(CardView *)cardView _maps_constraintsForCenteringInView:v8];
      +[NSLayoutConstraint activateConstraints:v6];
    }
    else
    {
      v7 = self->_cardView;
      [(CardView *)v7 removeFromSuperview];
    }
  }
}

- (void)setSuppressRatings:(BOOL)a3
{
  if (self->_suppressRatings != a3)
  {
    BOOL v3 = a3;
    self->_suppressRatings = a3;
    if ([(UGCPOIEnrichmentContaineeViewController *)self isViewLoaded])
    {
      contentViewController = self->_contentViewController;
      [(UGCPOIEnrichmentViewController *)contentViewController setSuppressRatings:v3];
    }
  }
}

- (void)willBeginSubmissionWithProgress:(id)a3
{
  headerView = self->_headerView;
  id v7 = a3;
  double v5 = [(UGCPOIEnrichmentModalHeaderView *)headerView leadingButton];
  [v5 setEnabled:0];

  double v6 = [(UGCPOIEnrichmentModalHeaderView *)self->_headerView trailingButton];
  [v6 setEnabled:0];

  [(UGCPOIEnrichmentModalHeaderView *)self->_headerView setObservedProgress:v7];
  [(UGCPOIEnrichmentViewController *)self->_contentViewController willBeginSubmissionWithProgress:v7];
}

- (void)submissionFinishedWithError:(id)a3
{
  headerView = self->_headerView;
  id v9 = a3;
  double v5 = [(UGCPOIEnrichmentModalHeaderView *)headerView leadingButton];
  [v5 setEnabled:1];

  double v6 = [(UGCPOIEnrichmentModalHeaderView *)self->_headerView trailingButton];
  [v6 setEnabled:[self->_poiEnrichmentForm isComplete]];

  id v8 = self->_headerView;
  if (v9)
  {
    [(UGCPOIEnrichmentModalHeaderView *)v8 setObservedProgress:0];
    id v8 = self->_headerView;
    double v7 = 0.0;
  }
  else
  {
    LODWORD(v7) = 1.0;
  }
  [(UGCPOIEnrichmentModalHeaderView *)v8 setProgress:v7];
  [(UGCPOIEnrichmentViewController *)self->_contentViewController submissionFinishedWithError:v9];
}

- (void)contentDidUpdate
{
  id v2 = [(ContaineeViewController *)self cardPresentationController];
  [v2 updateHeightForCurrentLayoutAnimated:1];
}

- (void)poiEnrichmentViewController:(id)a3 didSelectTermsOfServiceURL:(id)a4
{
  id v5 = a4;
  id v6 = [(UGCPOIEnrichmentContaineeViewController *)self delegate];
  [v6 poiEnrichmentEditor:self didSelectTermsOfServiceURL:v5];
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

- (BOOL)showCardBackground
{
  return self->_showCardBackground;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentForm, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
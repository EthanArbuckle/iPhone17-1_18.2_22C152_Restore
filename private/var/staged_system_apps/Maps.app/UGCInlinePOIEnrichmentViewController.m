@interface UGCInlinePOIEnrichmentViewController
- (BOOL)formInteractionEnabled;
- (UGCInlinePOIEnrichmentController)enrichmentController;
- (UGCInlinePOIEnrichmentViewController)initWithPOIEnrichmentForm:(id)a3;
- (UGCPOIEnrichmentForm)poiEnrichmentForm;
- (void)formDidChange:(id)a3;
- (void)poiEnrichmentViewController:(id)a3 captureUserAction:(int)a4 value:(id)a5 target:(int)a6;
- (void)poiEnrichmentViewController:(id)a3 captureUserActionForRatingCategoryState:(int64_t)a4 value:(id)a5 target:(int)a6;
- (void)poiEnrichmentViewController:(id)a3 didSelectAddPhotosUsingSourceType:(int64_t)a4 presentationOptions:(id)a5;
- (void)poiEnrichmentViewController:(id)a3 didSelectTermsOfServiceURL:(id)a4;
- (void)poiEnrichmentViewController:(id)a3 presentInformedConsentIfNeededWithCompletion:(id)a4;
- (void)setEnrichmentController:(id)a3;
- (void)setFormInteractionEnabled:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation UGCInlinePOIEnrichmentViewController

- (UGCInlinePOIEnrichmentViewController)initWithPOIEnrichmentForm:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UGCInlinePOIEnrichmentViewController;
  v6 = [(UGCInlinePOIEnrichmentViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_poiEnrichmentForm, a3);
    v8 = [(UGCPOIEnrichmentForm *)v7->_poiEnrichmentForm ratingsForm];
    [v8 addObserver:v7];
  }
  return v7;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)UGCInlinePOIEnrichmentViewController;
  [(UGCInlinePOIEnrichmentViewController *)&v13 viewDidLoad];
  [(UGCInlinePOIEnrichmentViewController *)self _mapsui_resetViewLayoutMargins];
  v3 = [[UGCPOIEnrichmentViewController alloc] initWithPOIEnrichmentForm:self->_poiEnrichmentForm presentationContext:1];
  contentVC = self->_contentVC;
  self->_contentVC = v3;

  [(UGCPOIEnrichmentViewController *)self->_contentVC setIsInlineMode:1];
  [(UGCPOIEnrichmentViewController *)self->_contentVC setFormInteractionEnabled:self->_formInteractionEnabled];
  [(UGCPOIEnrichmentViewController *)self->_contentVC setDelegate:self];
  id v5 = [(UGCPOIEnrichmentViewController *)self->_contentVC view];
  [v5 setPreservesSuperviewLayoutMargins:1];

  v6 = [(UGCInlinePOIEnrichmentViewController *)self view];
  v7 = [(UGCPOIEnrichmentViewController *)self->_contentVC view];
  [v6 addSubview:v7];

  [(UGCInlinePOIEnrichmentViewController *)self addChildViewController:self->_contentVC];
  [(UGCPOIEnrichmentViewController *)self->_contentVC didMoveToParentViewController:self];
  id v8 = objc_alloc((Class)MUEdgeLayout);
  v9 = [(UGCPOIEnrichmentViewController *)self->_contentVC view];
  objc_super v10 = [(UGCInlinePOIEnrichmentViewController *)self view];
  id v11 = [v8 initWithItem:v9 container:v10];

  id v14 = v11;
  v12 = +[NSArray arrayWithObjects:&v14 count:1];
  +[NSLayoutConstraint _mapsui_activateLayouts:v12];
}

- (void)setFormInteractionEnabled:(BOOL)a3
{
  if (self->_formInteractionEnabled != a3)
  {
    BOOL v3 = a3;
    self->_formInteractionEnabled = a3;
    if ([(UGCInlinePOIEnrichmentViewController *)self isViewLoaded])
    {
      contentVC = self->_contentVC;
      [(UGCPOIEnrichmentViewController *)contentVC setFormInteractionEnabled:v3];
    }
  }
}

- (void)formDidChange:(id)a3
{
  unsigned int v3 = [(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm isComplete];
  if (qword_1016107F0 != -1) {
    dispatch_once(&qword_1016107F0, &stru_101317030);
  }
  v4 = (id)qword_1016107E8;
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      __int16 v9 = 0;
      v6 = "POI enrichement form is complete";
      v7 = (uint8_t *)&v9;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    __int16 v8 = 0;
    v6 = "POI enrichement form is not complete";
    v7 = (uint8_t *)&v8;
    goto LABEL_8;
  }
}

- (void)poiEnrichmentViewController:(id)a3 presentInformedConsentIfNeededWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(UGCInlinePOIEnrichmentViewController *)self enrichmentController];
  [v6 presentInformedConsentIfNeededWithCompletion:v5];
}

- (void)poiEnrichmentViewController:(id)a3 didSelectAddPhotosUsingSourceType:(int64_t)a4 presentationOptions:(id)a5
{
  id v7 = a5;
  id v8 = [(UGCInlinePOIEnrichmentViewController *)self enrichmentController];
  [v8 requestAddPhotosWithSourceType:a4 presentationOptions:v7];
}

- (void)poiEnrichmentViewController:(id)a3 captureUserActionForRatingCategoryState:(int64_t)a4 value:(id)a5 target:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a5;
  id v10 = [(UGCInlinePOIEnrichmentViewController *)self enrichmentController];
  [v10 captureUserActionForRatingState:a4 value:v9 target:v6];
}

- (void)poiEnrichmentViewController:(id)a3 captureUserAction:(int)a4 value:(id)a5 target:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = [(UGCInlinePOIEnrichmentViewController *)self enrichmentController];
  [v10 captureUserAction:v7 value:v9 target:v6];
}

- (void)poiEnrichmentViewController:(id)a3 didSelectTermsOfServiceURL:(id)a4
{
  id v5 = a4;
  id v6 = [(UGCInlinePOIEnrichmentViewController *)self enrichmentController];
  [v6 openTermsOfServiceURL:v5];
}

- (UGCInlinePOIEnrichmentController)enrichmentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enrichmentController);

  return (UGCInlinePOIEnrichmentController *)WeakRetained;
}

- (void)setEnrichmentController:(id)a3
{
}

- (BOOL)formInteractionEnabled
{
  return self->_formInteractionEnabled;
}

- (UGCPOIEnrichmentForm)poiEnrichmentForm
{
  return self->_poiEnrichmentForm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiEnrichmentForm, 0);
  objc_destroyWeak((id *)&self->_enrichmentController);

  objc_storeStrong((id *)&self->_contentVC, 0);
}

@end
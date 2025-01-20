@interface UGCInlinePOIEnrichmentController
- (BOOL)_isLoading;
- (MKMapItem)mapItem;
- (MUPlaceCallToActionAppearance)submissionStatus;
- (MUPlaceCardAnalyticsController)analyticsController;
- (UGCInlinePOIEnrichmentController)initWithMapItem:(id)a3;
- (UGCInlinePOIEnrichmentControllerDelegate)delegate;
- (UGCSubmissionLookupResult)lookupResult;
- (UIViewController)contentViewController;
- (UIViewController)presentingViewController;
- (id)_previousSubmission;
- (void)_reloadInlineViewController;
- (void)_submitWithUploadPolicy:(int64_t)a3 completion:(id)a4;
- (void)captureAnalyticsForRatingsForm:(id)a3 photosForm:(id)a4;
- (void)captureUserAction:(int)a3 value:(id)a4 target:(int)a5;
- (void)captureUserActionForRatingState:(int64_t)a3 value:(id)a4 target:(int)a5;
- (void)openTermsOfServiceURL:(id)a3;
- (void)presentInformedConsentIfNeededWithCompletion:(id)a3;
- (void)requestAddPhotosWithSourceType:(int64_t)a3 presentationOptions:(id)a4;
- (void)setAnalyticsController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLookupResult:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSubmissionStatus:(id)a3;
- (void)submitForCurrentState;
@end

@implementation UGCInlinePOIEnrichmentController

- (UGCInlinePOIEnrichmentController)initWithMapItem:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UGCInlinePOIEnrichmentController;
  v6 = [(UGCInlinePOIEnrichmentController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    uint64_t v8 = +[MKLocationManager unretainedUGCInstance];
    locationManager = v7->_locationManager;
    v7->_locationManager = (MKLocationManager *)v8;
  }
  return v7;
}

- (void)setSubmissionStatus:(id)a3
{
  id v5 = (MUPlaceCallToActionAppearance *)a3;
  v6 = v5;
  if (self->_submissionStatus != v5)
  {
    uint64_t v8 = v5;
    unsigned __int8 v7 = -[MUPlaceCallToActionAppearance isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_submissionStatus, a3);
      [(UGCInlinePOIEnrichmentViewController *)self->_inlineViewController setFormInteractionEnabled:[(UGCInlinePOIEnrichmentController *)self _isLoading] ^ 1];
      v6 = v8;
    }
  }
}

- (void)setLookupResult:(id)a3
{
  id v5 = (UGCSubmissionLookupResult *)a3;
  v6 = v5;
  if (self->_lookupResult != v5)
  {
    uint64_t v8 = v5;
    unsigned __int8 v7 = -[UGCSubmissionLookupResult isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lookupResult, a3);
      [(UGCInlinePOIEnrichmentController *)self _reloadInlineViewController];
      v6 = v8;
    }
  }
}

- (UIViewController)contentViewController
{
  contentViewController = self->_contentViewController;
  if (!contentViewController)
  {
    v4 = (UIViewController *)objc_alloc_init((Class)UIViewController);
    id v5 = self->_contentViewController;
    self->_contentViewController = v4;

    [(UIViewController *)self->_contentViewController _mapsui_resetViewLayoutMargins];
    [(UGCInlinePOIEnrichmentController *)self _reloadInlineViewController];
    contentViewController = self->_contentViewController;
  }

  return contentViewController;
}

- (BOOL)_isLoading
{
  submissionStatus = self->_submissionStatus;
  if (submissionStatus) {
    LOBYTE(submissionStatus) = [(MUPlaceCallToActionAppearance *)submissionStatus type] == (id)5;
  }
  return (char)submissionStatus;
}

- (id)_previousSubmission
{
  lookupResult = self->_lookupResult;
  if (lookupResult)
  {
    if ([lookupResult status] == (id)1)
    {
      lookupResult = [(UGCSubmissionLookupResult *)self->_lookupResult previousSubmission];
    }
    else
    {
      lookupResult = 0;
    }
  }

  return lookupResult;
}

- (void)_reloadInlineViewController
{
  inlineViewController = self->_inlineViewController;
  if (inlineViewController)
  {
    [(UGCInlinePOIEnrichmentViewController *)inlineViewController willMoveToParentViewController:0];
    v4 = [(UGCInlinePOIEnrichmentViewController *)self->_inlineViewController view];
    [v4 removeFromSuperview];

    [(UGCInlinePOIEnrichmentViewController *)self->_inlineViewController removeFromParentViewController];
    id v5 = self->_inlineViewController;
    self->_inlineViewController = 0;
  }
  id v33 = [(UGCInlinePOIEnrichmentController *)self _previousSubmission];
  v6 = [(UGCInlinePOIEnrichmentController *)self mapItem];
  unsigned __int8 v7 = [v6 _geoMapItem];
  uint64_t v8 = [v7 _placeQuestionnaire];
  if (v33)
  {
    v9 = [v33 scorecard];
    v10 = +[UGCRatingsForm editRatingFormWithPlaceQuestionnaire:v8 existingScorecard:v9];

    objc_super v11 = [(UGCInlinePOIEnrichmentController *)self mapItem];
    v12 = [v11 _geoMapItem];
    v13 = [v12 _placeQuestionnaire];
    v14 = [v33 images];
    v15 = +[UGCPhotosForm editPhotosFormWithPlaceQuestionnaire:v13 previouslySubmittedImages:v14];

    v16 = [(UGCInlinePOIEnrichmentController *)self mapItem];
    v17 = [(UGCSubmissionLookupResult *)self->_lookupResult parentSubmissionIdentifier];
    v18 = +[UGCPOIEnrichmentForm editPOIEnrichmentFormWithMapItem:v16 parentSubmissionIdentifier:v17 photosForm:v15 ratingsForm:v10];
  }
  else
  {
    v10 = +[UGCRatingsForm addRatingFormWithPlaceQuestionnaire:v8];

    v19 = [(UGCInlinePOIEnrichmentController *)self mapItem];
    v20 = [v19 _geoMapItem];
    v21 = [v20 _placeQuestionnaire];
    v15 = +[UGCPhotosForm addPhotosFormWithPlaceQuestionnaire:v21 photosWithMetadata:&__NSArray0__struct];

    v16 = [(UGCInlinePOIEnrichmentController *)self mapItem];
    v18 = +[UGCPOIEnrichmentForm addPOIEnrichmentFormWithMapItem:v16 photosForm:v15 ratingsForm:v10];
  }

  poiEnrichmentForm = self->_poiEnrichmentForm;
  self->_poiEnrichmentForm = v18;
  v23 = v18;

  v24 = [[UGCInlinePOIEnrichmentViewController alloc] initWithPOIEnrichmentForm:v23];
  v25 = self->_inlineViewController;
  self->_inlineViewController = v24;

  [(UGCInlinePOIEnrichmentViewController *)self->_inlineViewController setEnrichmentController:self];
  [(UGCInlinePOIEnrichmentViewController *)self->_inlineViewController setFormInteractionEnabled:[(UGCInlinePOIEnrichmentController *)self _isLoading] ^ 1];
  v26 = [(UGCInlinePOIEnrichmentViewController *)self->_inlineViewController view];
  [v26 setPreservesSuperviewLayoutMargins:1];

  [(UIViewController *)self->_contentViewController addChildViewController:self->_inlineViewController];
  v27 = [(UIViewController *)self->_contentViewController view];
  v28 = [(UGCInlinePOIEnrichmentViewController *)self->_inlineViewController view];
  [v27 addSubview:v28];

  [(UGCInlinePOIEnrichmentViewController *)self->_inlineViewController didMoveToParentViewController:self->_contentViewController];
  id v29 = objc_alloc((Class)MUEdgeLayout);
  v30 = [(UGCInlinePOIEnrichmentViewController *)self->_inlineViewController view];
  v31 = [(UIViewController *)self->_contentViewController view];

  id v32 = [v29 initWithItem:v30 container:v31];
  [v32 activate];
}

- (void)submitForCurrentState
{
}

- (void)_submitWithUploadPolicy:(int64_t)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  if (![(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm isEdited])
  {
    v15 = sub_1004B1D30();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      v16 = "The form is not edited so not submitting";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v16, (uint8_t *)location, 2u);
    }
LABEL_10:

    v6[2](v6);
    goto LABEL_13;
  }
  if (![(UGCPOIEnrichmentForm *)self->_poiEnrichmentForm isComplete])
  {
    v15 = sub_1004B1D30();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      v16 = "The form is not complete so bailing";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  unsigned __int8 v7 = +[UIApplication sharedMapsDelegate];
  uint64_t v8 = [v7 submissionManager];

  v9 = [_TtC4Maps9UGCReport alloc];
  poiEnrichmentForm = self->_poiEnrichmentForm;
  objc_super v11 = [(UGCInlinePOIEnrichmentController *)self mapItem];
  v12 = [(UGCReport *)v9 initWithReportType:0 initialForm:poiEnrichmentForm mapItem:v11 submitter:v8];

  objc_initWeak(location, self);
  if (MapsFeature_IsEnabled_ARPCommunityID())
  {
    v13 = v19;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1004B2028;
    v19[3] = &unk_1012EC390;
    v14 = &v20;
    objc_copyWeak(&v20, location);
    v19[4] = self;
    v19[5] = v6;
    [(UGCReport *)v12 submitRatingsAndPhotosWithUploadPolicy:a3 progressBlock:0 completion:v19];
  }
  else
  {
    v13 = v17;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1004B2150;
    v17[3] = &unk_1012EC390;
    v14 = &v18;
    objc_copyWeak(&v18, location);
    v17[4] = self;
    v17[5] = v6;
    [(UGCReport *)v12 submitRatingsAndPhotosSimultaneouslyUsingDSIDWithUploadPolicy:a3 progressBlock:0 completion:v17];
  }

  objc_destroyWeak(v14);
  objc_destroyWeak(location);

LABEL_13:
}

- (void)presentInformedConsentIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004B2338;
  v7[3] = &unk_1012EC3B8;
  id v8 = v4;
  id v6 = v4;
  +[UGCInformedConsentViewController presentIfNeededWithPresentingViewController:WeakRetained presentationContext:1 completion:v7];
}

- (void)requestAddPhotosWithSourceType:(int64_t)a3 presentationOptions:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = [(UGCInlinePOIEnrichmentController *)self mapItem];
  id v8 = +[UGCPOIEnrichmentCoordinator photoEmphasizedAddCoordinatorWithMapItem:v7 preferredSourceType:a3 originTarget:@"PLACECARD_BUSINESS_INFO" suppressRatings:1];

  v9 = [v6 sourceView];
  [v8 setAnchoringView:v9];

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004B24A4;
  v11[3] = &unk_1012E6690;
  objc_copyWeak(&v13, &location);
  id v10 = v8;
  id v12 = v10;
  [(UGCInlinePOIEnrichmentController *)self _submitWithUploadPolicy:0 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)captureUserActionForRatingState:(int64_t)a3 value:(id)a4 target:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (a3 == 1) {
    unsigned int v7 = 298;
  }
  else {
    unsigned int v7 = 0;
  }
  if (a3 == 2) {
    uint64_t v8 = 299;
  }
  else {
    uint64_t v8 = v7;
  }
  id v9 = a4;
  id v10 = [(UGCInlinePOIEnrichmentController *)self analyticsController];
  [v10 instrumentAction:v8 target:v5 eventValue:v9 moduleType:6 feedbackType:0];
}

- (void)captureUserAction:(int)a3 value:(id)a4 target:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = [(UGCInlinePOIEnrichmentController *)self analyticsController];
  [v9 instrumentAction:v6 target:v5 eventValue:v8 moduleType:6 feedbackType:0];
}

- (void)captureAnalyticsForRatingsForm:(id)a3 photosForm:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UGCInlinePOIEnrichmentController *)self analyticsController];
  [v8 instrumentAction:301 target:201 eventValue:0 moduleType:6 feedbackType:0];

  id v9 = +[GEOAPSharedStateData sharedData];
  [v9 populateRatingPhotoSubmissionDetailsWithEntryPoint:2 originTarget:@"PLACECARD_INLINE"];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = [v6 allRatingCategories];
  id v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v39;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v38 + 1) + 8 * i) isEdited])
        {
          LODWORD(v11) = 1;
          goto LABEL_11;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v14 = [v7 numberOfAddedPhotos];
  char v15 = v11 ^ 1;
  if (!v14) {
    char v15 = 1;
  }
  if (v15)
  {
    if ([v7 numberOfAddedPhotos])
    {
      id v20 = [(UGCInlinePOIEnrichmentController *)self analyticsController];
      [v20 instrumentAction:2131 target:201 eventValue:0 moduleType:6 feedbackType:0];

      v21 = +[GEOAPSharedStateData sharedData];
      [v21 populatePhotoSubmissionDetailsWithEntryPoint:2 numberOfPhotos:[v7 numberOfAddedPhotos] numberOfARPSuggestedPhotos:0 originTarget:@"PLACECARD_INLINE"];

      v22 = [(UGCInlinePOIEnrichmentController *)self analyticsController];
      [v22 instrumentAction:2131 target:201 eventValue:0 moduleType:6 feedbackType:0];

      goto LABEL_20;
    }
    if (!v11) {
      goto LABEL_20;
    }
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    v23 = +[GEOAPSharedStateData sharedData];
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_1004B2BC8;
    v28 = &unk_1012EC3E0;
    v30 = &v34;
    id v29 = v6;
    [v23 populateRatingSubmissionDetailsWithEntryPoint:2 originTarget:@"PLACECARD_INLINE" specifierBlock:&v25];

    v24 = [(UGCInlinePOIEnrichmentController *)self analyticsController];
    [v24 instrumentAction:343 target:201 eventValue:0 moduleType:6 feedbackType:0];
  }
  else
  {
    v16 = +[GEOAPSharedStateData sharedData];
    [v16 populatePhotoSubmissionDetailsWithEntryPoint:2 numberOfPhotos:[v7 numberOfAddedPhotos] numberOfARPSuggestedPhotos:0 originTarget:@"PLACECARD_INLINE"];

    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    v17 = +[GEOAPSharedStateData sharedData];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1004B2A88;
    v31[3] = &unk_1012EC3E0;
    id v33 = &v34;
    id v32 = v6;
    [v17 populateRatingSubmissionDetailsWithEntryPoint:2 originTarget:@"PLACECARD_INLINE" specifierBlock:v31];

    id v18 = [(UGCInlinePOIEnrichmentController *)self analyticsController];
    [v18 instrumentAction:2131 target:201 eventValue:0 moduleType:6 feedbackType:0];

    v19 = [(UGCInlinePOIEnrichmentController *)self analyticsController];
    [v19 instrumentAction:343 target:201 eventValue:0 moduleType:6 feedbackType:0];
  }
  _Block_object_dispose(&v34, 8);
LABEL_20:
}

- (void)openTermsOfServiceURL:(id)a3
{
  id v4 = a3;
  id v5 = [(UGCInlinePOIEnrichmentController *)self delegate];
  [v5 inlinePOIEnrichmentController:self didSelectTermsOfServiceURL:v4];
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (UGCInlinePOIEnrichmentControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCInlinePOIEnrichmentControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (MUPlaceCardAnalyticsController)analyticsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsController);

  return (MUPlaceCardAnalyticsController *)WeakRetained;
}

- (void)setAnalyticsController:(id)a3
{
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (UGCSubmissionLookupResult)lookupResult
{
  return self->_lookupResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupResult, 0);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_destroyWeak((id *)&self->_analyticsController);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentForm, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_inlineViewController, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
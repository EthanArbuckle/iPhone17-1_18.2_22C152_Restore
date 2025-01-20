@interface UGCRatingsAndPhotosCoordinator
- (BOOL)hasPhotoPickerEmphasis;
- (BOOL)isEditingSubmission;
- (BOOL)shouldDismissPlacecard;
- (BOOL)suppressRatings;
- (NSArray)initialPhotosWithMetadata;
- (UGCRatingsAndPhotosCoordinator)init;
- (UGCSubmissionLookupResult)existingSubmission;
- (id)_createPOIEnrichmentFormWithContext;
- (id)addPhotosControllerRequestsAnchoringBarButtonItem:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (int)_generateEntryPointForAnalytics:(int64_t)a3;
- (int64_t)initialOverallState;
- (int64_t)preferredSourceType;
- (void)_dismissPOIEnrichmentEditorWithCompletion:(id)a3;
- (void)_dismissPhotoPickerWithCompletion:(id)a3;
- (void)_dismissPlacecardWithCompletion:(id)a3;
- (void)_failLookupWithError:(id)a3;
- (void)_failWithAccountErrorWithPresentingViewController:(id)a3;
- (void)_handleLookupSubmissionCompletion:(id)a3 lookupError:(id)a4;
- (void)_iosBasedPresentation;
- (void)_macOSBasedPresentation;
- (void)_presentFailedToSubmitAlertForResponse:(id)a3 withPresentingViewController:(id)a4;
- (void)_presentPOIEnrichmentViewController;
- (void)_presentPhotoPickerWithMaxCount:(unint64_t)a3;
- (void)_presentPushNotificationPromptIfNecessary;
- (void)_presentThirdPartyPhotoSharePromptIfNecessaryForReviewedPlace:(id)a3;
- (void)_startPOIEnrichmentFlow;
- (void)_startRatingsAndPhotosFlowDependentUponReviewedPlaceLookup;
- (void)_startRatingsAndPhotosFlowRequiringInformedConsent;
- (void)_startRatingsAndPhotosFlowWithInformedConsentIfNeeded;
- (void)_startRatingsAndPhotosFlowWithSubmissionLookup;
- (void)captureAnalyticsForRatingsForm:(id)a3 photosForm:(id)a4;
- (void)poiEnrichmenEditorDidCancel:(id)a3;
- (void)poiEnrichmentEditor:(id)a3 didSelectTermsOfServiceURL:(id)a4;
- (void)poiEnrichmentEditor:(id)a3 finishedFillingEnrichmentForm:(id)a4;
- (void)present;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setExistingSubmission:(id)a3;
- (void)setHasPhotoPickerEmphasis:(BOOL)a3;
- (void)setInitialOverallState:(int64_t)a3;
- (void)setInitialPhotosWithMetadata:(id)a3;
- (void)setPreferredSourceType:(int64_t)a3;
- (void)setSuppressRatings:(BOOL)a3;
- (void)submissionCompletionWithViewController:(id)a3 enrichmentForm:(id)a4 policy:(int64_t)a5 newReviewedPlace:(id)a6 response:(id)a7 error:(id)a8;
- (void)takePhotoController:(id)a3 didSelectPhotosWithMetadata:(id)a4;
- (void)takePhotoControllerDidCancel:(id)a3;
@end

@implementation UGCRatingsAndPhotosCoordinator

- (UGCRatingsAndPhotosCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)UGCRatingsAndPhotosCoordinator;
  result = [(UGCPOIEnrichmentCoordinator *)&v3 init];
  if (result) {
    result->_shouldShowThankYouScreen = 1;
  }
  return result;
}

- (void)present
{
  objc_super v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    [(UGCRatingsAndPhotosCoordinator *)self _macOSBasedPresentation];
  }
  else
  {
    [(UGCRatingsAndPhotosCoordinator *)self _iosBasedPresentation];
  }
}

- (void)_iosBasedPresentation
{
}

- (void)_macOSBasedPresentation
{
  if ([(UGCRatingsAndPhotosCoordinator *)self shouldDismissPlacecard]
    && ![(UGCRatingsAndPhotosCoordinator *)self hasPhotoPickerEmphasis])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100B88340;
    v3[3] = &unk_1012E5D08;
    v3[4] = self;
    [(UGCRatingsAndPhotosCoordinator *)self _dismissPlacecardWithCompletion:v3];
  }
  else
  {
    [(UGCRatingsAndPhotosCoordinator *)self _startRatingsAndPhotosFlowWithInformedConsentIfNeeded];
  }
}

- (BOOL)shouldDismissPlacecard
{
  objc_super v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (id)5)
  {
    id v4 = [(UGCPOIEnrichmentCoordinator *)self placeCardDismissalDelegate];
    if (v4)
    {
      v5 = [(UGCPOIEnrichmentCoordinator *)self presentationDelegate];
      char v6 = objc_opt_respondsToSelector();
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (void)_dismissPlacecardWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(location, self);
    v5 = [(UGCPOIEnrichmentCoordinator *)self presentationDelegate];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B88530;
    v6[3] = &unk_1012E74A8;
    objc_copyWeak(&v8, location);
    id v7 = v4;
    [v5 poiEnrichmentCoordinator:self requestPresentingViewControllerWithBlock:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", (uint8_t *)location, 2u);
  }
}

- (void)_startRatingsAndPhotosFlowWithInformedConsentIfNeeded
{
  if (MapsFeature_IsEnabled_ARPCommunityID()
    && GEOConfigGetBOOL()
    && ![(UGCRatingsAndPhotosCoordinator *)self hasPhotoPickerEmphasis]
    && ![(UGCPOIEnrichmentCoordinator *)self entryPointRequiresARPPrivacyScreenIfNeeded])
  {
    [(UGCRatingsAndPhotosCoordinator *)self _startRatingsAndPhotosFlowDependentUponReviewedPlaceLookup];
  }
  else
  {
    [(UGCRatingsAndPhotosCoordinator *)self _startRatingsAndPhotosFlowRequiringInformedConsent];
  }
}

- (void)_startRatingsAndPhotosFlowRequiringInformedConsent
{
  objc_initWeak(&location, self);
  objc_super v3 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
  int64_t v4 = [(UGCPOIEnrichmentCoordinator *)self presentationContext];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B8872C;
  v5[3] = &unk_1012E9EF0;
  objc_copyWeak(&v6, &location);
  +[UGCInformedConsentViewController presentIfNeededWithPresentingViewController:v3 presentationContext:v4 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_startRatingsAndPhotosFlowDependentUponReviewedPlaceLookup
{
  objc_initWeak(&location, self);
  objc_super v3 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  id v4 = [v3 _muid];
  v5 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  id v6 = [v5 _geoMapItem];
  id v7 = [v6 _identifierHistory];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B888F8;
  v8[3] = &unk_101315A30;
  objc_copyWeak(&v9, &location);
  +[UGCReviewedPlaceManager fetchReviewedPlaceForMUID:v4 withIdentifierHistory:v7 completion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_startPOIEnrichmentFlow
{
  if (MapsFeature_IsEnabled_SydneyARP())
  {
    objc_super v3 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
    id v4 = [v3 _geoMapItem];
    v5 = [v4 _placeQuestionnaire];
    id UInteger = [v5 maximumNumberOfPhotos];
  }
  else
  {
    id UInteger = (id)GEOConfigGetUInteger();
  }
  id v7 = [(UGCSubmissionLookupResult *)self->_existingSubmission previousSubmission];
  id v8 = [v7 images];
  id v9 = [v8 count];
  v10 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  v11 = [v10 _geoMapItem];
  v12 = [v11 _placeQuestionnaire];
  id v13 = [v12 maximumNumberOfPhotos];

  if ([(UGCRatingsAndPhotosCoordinator *)self hasPhotoPickerEmphasis] && UInteger && v9 < v13)
  {
    [(UGCRatingsAndPhotosCoordinator *)self _presentPhotoPickerWithMaxCount:UInteger];
  }
  else
  {
    [(UGCRatingsAndPhotosCoordinator *)self _presentPOIEnrichmentViewController];
  }
}

- (void)_startRatingsAndPhotosFlowWithSubmissionLookup
{
  objc_super v3 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  id v4 = [v3 _muid];

  v5 = objc_alloc_init(_TtC4Maps26UGCSubmissionLookupManager);
  lookupManager = self->_lookupManager;
  self->_lookupManager = v5;

  if (MapsFeature_IsEnabled_ARPCommunityID())
  {
    objc_initWeak(&location, self);
    id v7 = self->_lookupManager;
    id v8 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
    id v9 = [v8 _geoMapItem];
    v10 = [v9 _identifierHistory];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100B88CA8;
    v15[3] = &unk_101315AA8;
    objc_copyWeak(&v16, &location);
    [(UGCSubmissionLookupManager *)v7 fetchSubmissionWithCommunityIDAndICloudIDFor:v4 identifierHistory:v10 completion:v15];

    v11 = &v16;
  }
  else
  {
    objc_initWeak(&location, self);
    v12 = self->_lookupManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100B88D20;
    v13[3] = &unk_101315AA8;
    objc_copyWeak(&v14, &location);
    [(UGCSubmissionLookupManager *)v12 fetchSubmissionWithICloudIDFor:v4 completion:v13];
    v11 = &v14;
  }
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)_handleLookupSubmissionCompletion:(id)a3 lookupError:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(UGCPOIEnrichmentCoordinator *)self submissionLookupObserver];
  [v7 endAnimatingActivityIndicatorWithError:v6];

  if (v6)
  {
    id v8 = [(UGCPOIEnrichmentCoordinator *)self submissionStatusDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(UGCPOIEnrichmentCoordinator *)self submissionStatusDelegate];
      [v10 poiEnrichmentCoordinator:self didFinishSubmissionLookup:v14];
    }
    [(UGCRatingsAndPhotosCoordinator *)self _failLookupWithError:v6];
  }
  else
  {
    [(UGCRatingsAndPhotosCoordinator *)self setExistingSubmission:v14];
    v11 = [(UGCPOIEnrichmentCoordinator *)self submissionStatusDelegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = [(UGCPOIEnrichmentCoordinator *)self submissionStatusDelegate];
      [v13 poiEnrichmentCoordinator:self didFinishSubmissionLookup:v14];
    }
    [(UGCRatingsAndPhotosCoordinator *)self _startPOIEnrichmentFlow];
  }
}

- (void)_presentPhotoPickerWithMaxCount:(unint64_t)a3
{
  if (self->_photoPicker)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _photoPicker == ((void *)0)", v14, 2u);
    }
  }
  else
  {
    v5 = [UGCAddPhotosController alloc];
    id v6 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
    int64_t v7 = [(UGCRatingsAndPhotosCoordinator *)self preferredSourceType];
    id v8 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
    char v9 = [v8 _geoMapItem];
    v10 = [v9 _placeQuestionnaire];
    v11 = [(UGCAddPhotosController *)v5 initWithPresentingViewController:v6 sourceType:v7 multipleSelectionLimit:a3 placeQuestionnaire:v10 delegate:self];
    photoPicker = self->_photoPicker;
    self->_photoPicker = v11;

    id v13 = self->_photoPicker;
    [(UGCAddPhotosController *)v13 present];
  }
}

- (void)_presentPOIEnrichmentViewController
{
  id v13 = [(UGCRatingsAndPhotosCoordinator *)self _createPOIEnrichmentFormWithContext];
  objc_super v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    v5 = [[MacUGCPOIEnrichmentEditorViewController alloc] initWithPOIEnrichmentForm:v13 delegate:self presentationContext:[(UGCPOIEnrichmentCoordinator *)self presentationContext]];
    [(MacUGCPOIEnrichmentEditorViewController *)v5 setModalInPresentation:1];
    [(MacUGCPOIEnrichmentEditorViewController *)v5 setModalPresentationStyle:2];
    [(MacUGCPOIEnrichmentEditorViewController *)v5 setSuppressRatings:[(UGCRatingsAndPhotosCoordinator *)self suppressRatings]];
    ratingContributionsViewController = self->_ratingContributionsViewController;
    self->_ratingContributionsViewController = (UGCPOIEnrichmentEditor *)v5;
    int64_t v7 = v5;

    id v8 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
    char v9 = v8;
    v10 = (UGCPOIEnrichmentContaineeViewController *)v7;
LABEL_6:
    [(UGCPOIEnrichmentContaineeViewController *)v8 presentViewController:v10 animated:1 completion:0];
    goto LABEL_9;
  }
  char v9 = [[UGCPOIEnrichmentContaineeViewController alloc] initWithPOIEnrichmentForm:v13 delegate:self presentationContext:[(UGCPOIEnrichmentCoordinator *)self presentationContext]];
  objc_storeStrong((id *)&self->_ratingContributionsViewController, v9);
  [(UGCPOIEnrichmentContaineeViewController *)v9 setSuppressRatings:[(UGCRatingsAndPhotosCoordinator *)self suppressRatings]];
  if ([(UGCPOIEnrichmentCoordinator *)self prefersDefaultPresentationOverContainee])
  {
    v11 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];

    if (v11)
    {
      [(UGCPOIEnrichmentContaineeViewController *)v9 setShowCardBackground:1];
      [(UGCPOIEnrichmentContaineeViewController *)v9 setTransitioningDelegate:self];
      [(UGCPOIEnrichmentContaineeViewController *)v9 setModalPresentationStyle:4];
      [(UGCPOIEnrichmentContaineeViewController *)v9 setModalInPresentation:1];
      id v8 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
      int64_t v7 = (MacUGCPOIEnrichmentEditorViewController *)v8;
      v10 = v9;
      goto LABEL_6;
    }
  }
  char v12 = [(UGCPOIEnrichmentCoordinator *)self containerViewController];

  if (!v12) {
    goto LABEL_10;
  }
  int64_t v7 = [(UGCPOIEnrichmentCoordinator *)self containerViewController];
  [(MacUGCPOIEnrichmentEditorViewController *)v7 presentController:v9 animated:1];
LABEL_9:

LABEL_10:
  [(UGCPOIEnrichmentEditor *)self->_ratingContributionsViewController setAccessibilityIdentifier:@"RatingsAndPhotosView"];
}

- (id)_createPOIEnrichmentFormWithContext
{
  objc_super v3 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  id v4 = [v3 _geoMapItem];
  v5 = [v4 _placeQuestionnaire];

  id v6 = [(UGCRatingsAndPhotosCoordinator *)self existingSubmission];
  int64_t v7 = [v6 parentSubmissionIdentifier];

  id v8 = [(UGCRatingsAndPhotosCoordinator *)self existingSubmission];
  char v9 = [v8 previousSubmission];

  if ([(UGCRatingsAndPhotosCoordinator *)self isEditingSubmission])
  {
    v10 = [v9 scorecard];
    v11 = +[UGCRatingsForm editRatingFormWithPlaceQuestionnaire:v5 existingScorecard:v10];

    char v12 = [(UGCRatingsAndPhotosCoordinator *)self existingSubmission];
    id v13 = [v12 ratingsSubmissionIdentifier];
    [v11 setParentSubmissionIdentifier:v13];

    id v14 = [v9 images];
    v15 = +[UGCPhotosForm editPhotosFormWithPlaceQuestionnaire:v5 previouslySubmittedImages:v14];

    id v16 = [(UGCRatingsAndPhotosCoordinator *)self existingSubmission];
    v17 = [v16 photosSubmissionIdentifier];
    [v15 setParentSubmissionIdentifier:v17];

    v18 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
    +[UGCPOIEnrichmentForm editPOIEnrichmentFormWithMapItem:v18 parentSubmissionIdentifier:v7 photosForm:v15 ratingsForm:v11];
  }
  else
  {
    v11 = +[UGCRatingsForm addRatingFormWithPlaceQuestionnaire:v5];
    int64_t v19 = [(UGCRatingsAndPhotosCoordinator *)self initialOverallState];
    v20 = [v11 overallCategory];
    [v20 setCurrentState:v19];

    v15 = +[UGCPhotosForm addPhotosFormWithPlaceQuestionnaire:v5 photosWithMetadata:&__NSArray0__struct];
    v18 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
    +[UGCPOIEnrichmentForm addPOIEnrichmentFormWithMapItem:v18 photosForm:v15 ratingsForm:v11];
  v21 = };

  if ([(UGCRatingsAndPhotosCoordinator *)self initialOverallState])
  {
    int64_t v22 = [(UGCRatingsAndPhotosCoordinator *)self initialOverallState];
    v23 = [v11 overallCategory];
    [v23 setCurrentState:v22];
  }
  [v15 addPhotoListWithMetadata:self->_initialPhotosWithMetadata];

  return v21;
}

- (BOOL)isEditingSubmission
{
  v2 = [(UGCRatingsAndPhotosCoordinator *)self existingSubmission];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)poiEnrichmentEditor:(id)a3 finishedFillingEnrichmentForm:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[UIApplication sharedMapsDelegate];
  char v9 = [v8 submissionManager];

  v10 = [_TtC4Maps9UGCReport alloc];
  v11 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  char v12 = [(UGCReport *)v10 initWithReportType:0 initialForm:v7 mapItem:v11 submitter:v9];

  id v13 = [(UGCReport *)v12 newReviewedPlace];
  self->_userHasDeletedSubmission = [(UGCReviewedPlace *)v13 isDeleted];
  unint64_t IsEnabled_SydneyARP = MapsFeature_IsEnabled_SydneyARP();
  if (MapsFeature_IsEnabled_ARPCommunityID())
  {
    v15 = [(UGCRatingsAndPhotosCoordinator *)self existingSubmission];
    -[UGCReport setShouldMigrateRatingsWithICloud:](v12, "setShouldMigrateRatingsWithICloud:", [v15 hasRatingsWithICloud]);

    objc_initWeak(&location, self);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100B89890;
    v31[3] = &unk_10131A070;
    id v16 = v6;
    id v32 = v16;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100B8989C;
    v26[3] = &unk_10131A098;
    objc_copyWeak(v30, &location);
    id v27 = v16;
    id v28 = v7;
    v30[1] = (id)IsEnabled_SydneyARP;
    v29 = v13;
    [(UGCReport *)v12 submitRatingsAndPhotosWithUploadPolicy:IsEnabled_SydneyARP progressBlock:v31 completion:v26];

    objc_destroyWeak(v30);
    v17 = v32;
  }
  else
  {
    objc_initWeak(&location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100B89928;
    v24[3] = &unk_10131A070;
    id v18 = v6;
    id v25 = v18;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100B89934;
    v19[3] = &unk_10131A098;
    objc_copyWeak(v23, &location);
    id v20 = v18;
    id v21 = v7;
    v23[1] = (id)IsEnabled_SydneyARP;
    int64_t v22 = v13;
    [(UGCReport *)v12 submitRatingsAndPhotosSimultaneouslyUsingDSIDWithUploadPolicy:IsEnabled_SydneyARP progressBlock:v24 completion:v19];

    objc_destroyWeak(v23);
    v17 = v25;
  }

  objc_destroyWeak(&location);
}

- (void)submissionCompletionWithViewController:(id)a3 enrichmentForm:(id)a4 policy:(int64_t)a5 newReviewedPlace:(id)a6 response:(id)a7 error:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  [v14 submissionFinishedWithError:v18];
  int64_t v19 = [v15 ratingsForm];
  id v20 = [v15 photosForm];
  [(UGCRatingsAndPhotosCoordinator *)self captureAnalyticsForRatingsForm:v19 photosForm:v20];

  if (!v18 && ![v17 status])
  {
    if (!a5) {
      [(UGCPOIEnrichmentCoordinator *)self invokeSubmissionUpdate];
    }
    id v21 = sub_100018584();
    [v21 hintRefreshOfType:21];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_userHasDeletedSubmission)
      {
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100B89D5C;
        v36[3] = &unk_1012E5D58;
        v36[4] = self;
        id v37 = v16;
        [v14 dismissViewControllerAnimated:1 completion:v36];

        goto LABEL_4;
      }
      objc_initWeak(&location, self);
      int64_t v22 = [UGCCommunityAcknowledgementViewController alloc];
      v23 = +[ARPAcknowledgementOptions defaultOptions];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100B89DC0;
      v31[3] = &unk_1012E9258;
      id v24 = v14;
      id v32 = v24;
      objc_copyWeak(&v34, &location);
      id v33 = v16;
      id v25 = [(UGCCommunityAcknowledgementViewController *)v22 initWithOptions:v23 completion:v31];
      thankYouVC = self->_thankYouVC;
      self->_thankYouVC = v25;

      id v27 = [(UGCCommunityAcknowledgementViewController *)self->_thankYouVC navigationItem];
      [v27 setHidesBackButton:1];

      [v24 presentViewController:self->_thankYouVC animated:1 completion:0];
      objc_destroyWeak(&v34);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_4;
      }
      objc_initWeak(&location, self);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100B89F0C;
      v28[3] = &unk_1012E6690;
      objc_copyWeak(&v30, &location);
      id v29 = v16;
      [(UGCRatingsAndPhotosCoordinator *)self _dismissPOIEnrichmentEditorWithCompletion:v28];

      objc_destroyWeak(&v30);
    }
    objc_destroyWeak(&location);
    goto LABEL_4;
  }
  [(UGCRatingsAndPhotosCoordinator *)self _presentFailedToSubmitAlertForResponse:v17 withPresentingViewController:v14];
LABEL_4:
}

- (void)poiEnrichmentEditor:(id)a3 didSelectTermsOfServiceURL:(id)a4
{
  id v5 = a4;
  id v6 = [(UGCPOIEnrichmentCoordinator *)self delegate];
  [v6 poiEnrichmentCoordinator:self openURL:v5];
}

- (void)captureAnalyticsForRatingsForm:(id)a3 photosForm:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UGCRatingsAndPhotosCoordinator *)self _generateEntryPointForAnalytics:[(UGCPOIEnrichmentCoordinator *)self entryPoint]];
  char v9 = [(UGCPOIEnrichmentCoordinator *)self originTarget];
  +[GEOAPPortal captureUserAction:301 target:666 value:0];
  v10 = +[GEOAPSharedStateData sharedData];
  [v10 populateRatingPhotoSubmissionDetailsWithEntryPoint:v8 originTarget:v9];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v11 = [v6 allRatingCategories];
  id v12 = [v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v50;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v50 != v13) {
          objc_enumerationMutation(v11);
        }
        if ([*(id *)(*((void *)&v49 + 1) + 8 * i) isEdited])
        {
          LODWORD(v12) = 1;
          goto LABEL_11;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v15 = [v7 numberOfAddedPhotos];
  char v16 = v12 ^ 1;
  if (!v15) {
    char v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    +[GEOAPPortal captureUserAction:2131 target:666 value:0];
    +[GEOAPPortal captureUserAction:343 target:666 value:0];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v17 = [v7 addedPhotos];
    uint64_t v18 = 0;
    id v19 = [v17 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v46;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v18 = v18
              + [*(id *)(*((void *)&v45 + 1) + 8 * (void)j) isSuggestedPhoto];
        }
        id v19 = [v17 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v19);
    }

    int64_t v22 = +[GEOAPSharedStateData sharedData];
    [v22 populatePhotoSubmissionDetailsWithEntryPoint:v8 numberOfPhotos:[v7 numberOfAddedPhotos] numberOfARPSuggestedPhotos:v18 originTarget:v9];

    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    uint64_t v44 = 0;
    v23 = +[GEOAPSharedStateData sharedData];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100B8A4E4;
    v38[3] = &unk_1012EC3E0;
    v40 = &v41;
    id v39 = v6;
    [v23 populateRatingSubmissionDetailsWithEntryPoint:v8 originTarget:v9 specifierBlock:v38];

LABEL_22:
    _Block_object_dispose(&v41, 8);
    goto LABEL_34;
  }
  if (![v7 numberOfAddedPhotos])
  {
    if (!v12) {
      goto LABEL_34;
    }
    +[GEOAPPortal captureUserAction:343 target:666 value:0];
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    uint64_t v44 = 0;
    id v30 = +[GEOAPSharedStateData sharedData];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100B8A624;
    v31[3] = &unk_1012EC3E0;
    id v33 = &v41;
    id v32 = v6;
    [v30 populateRatingSubmissionDetailsWithEntryPoint:v8 originTarget:v9 specifierBlock:v31];

    goto LABEL_22;
  }
  +[GEOAPPortal captureUserAction:2131 target:666 value:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = [v7 addedPhotos];
  uint64_t v25 = 0;
  id v26 = [v24 countByEnumeratingWithState:&v34 objects:v53 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      for (k = 0; k != v26; k = (char *)k + 1)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v25 = v25
            + [*(id *)(*((void *)&v34 + 1) + 8 * (void)k) isSuggestedPhoto];
      }
      id v26 = [v24 countByEnumeratingWithState:&v34 objects:v53 count:16];
    }
    while (v26);
  }

  id v29 = +[GEOAPSharedStateData sharedData];
  [v29 populatePhotoSubmissionDetailsWithEntryPoint:v8 numberOfPhotos:[v7 numberOfAddedPhotos] numberOfARPSuggestedPhotos:v25 originTarget:v9];

LABEL_34:
}

- (int)_generateEntryPointForAnalytics:(int64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

- (void)_presentPushNotificationPromptIfNecessary
{
}

- (void)_presentThirdPartyPhotoSharePromptIfNecessaryForReviewedPlace:(id)a3
{
  id v3 = a3;
  if (MapsFeature_IsEnabled_SydneyARP() && [v3 numberOfPhotosAdded]) {
    +[UGCThirdPartyPhotoSharingSplashViewController checkShouldPresentPhotoSharingSplash:&stru_10131A118];
  }
}

- (void)poiEnrichmenEditorDidCancel:(id)a3
{
  self->_shouldShowThankYouScreen = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100B8AAAC;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [(UGCRatingsAndPhotosCoordinator *)self _dismissPOIEnrichmentEditorWithCompletion:v3];
}

- (void)_presentFailedToSubmitAlertForResponse:(id)a3 withPresentingViewController:(id)a4
{
}

- (void)takePhotoControllerDidCancel:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B8AB94;
  v5[3] = &unk_1012E6708;
  objc_copyWeak(&v6, &location);
  [(UGCRatingsAndPhotosCoordinator *)self _dismissPhotoPickerWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)takePhotoController:(id)a3 didSelectPhotosWithMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(UGCRatingsAndPhotosCoordinator *)self setInitialPhotosWithMetadata:v7];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B8ACC8;
  v8[3] = &unk_1012E6708;
  objc_copyWeak(&v9, &location);
  [(UGCRatingsAndPhotosCoordinator *)self _dismissPhotoPickerWithCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_dismissPhotoPickerWithCompletion:(id)a3
{
  id v4 = a3;
  photoPicker = self->_photoPicker;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B8ADAC;
  v7[3] = &unk_1012E76E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(UGCAddPhotosController *)photoPicker dismissWithCompletion:v7];
}

- (id)addPhotosControllerRequestsAnchoringBarButtonItem:(id)a3
{
  return [(UGCPOIEnrichmentCoordinator *)self anchoringBarButtonItem];
}

- (void)_failLookupWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B8AF9C;
  v6[3] = &unk_1012E6708;
  objc_copyWeak(&v7, &location);
  [v5 presentLookupFailureAlertWithCancelHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_failWithAccountErrorWithPresentingViewController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B8B0AC;
  v5[3] = &unk_1012E6708;
  objc_copyWeak(&v6, &location);
  [v4 presentLoginFailureAlertWithCancelHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_dismissPOIEnrichmentEditorWithCompletion:(id)a3
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  id v23[2] = sub_100B8B37C;
  v23[3] = &unk_1012E76E8;
  v23[4] = self;
  id v4 = a3;
  id v24 = v4;
  id v5 = objc_retainBlock(v23);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || [(UGCPOIEnrichmentCoordinator *)self prefersDefaultPresentationOverContainee]&& ([(UGCPOIEnrichmentCoordinator *)self presentingViewController], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    [(UGCPOIEnrichmentEditor *)self->_ratingContributionsViewController dismissViewControllerAnimated:1 completion:v5];
  }
  else
  {
    id v7 = [(UGCPOIEnrichmentCoordinator *)self containerViewController];

    if (v7)
    {
      if (MapsFeature_IsEnabled_SydneyARP()
        && self->_shouldShowThankYouScreen
        && !self->_userHasDeletedSubmission)
      {
        id v9 = [UGCCommunityAcknowledgementViewController alloc];
        v10 = +[ARPAcknowledgementOptions defaultOptions];
        id v17 = _NSConcreteStackBlock;
        uint64_t v18 = 3221225472;
        id v19 = sub_100B8B3D0;
        uint64_t v20 = &unk_1012E76E8;
        id v21 = self;
        int64_t v22 = v5;
        v11 = [(UGCCommunityAcknowledgementViewController *)v9 initWithOptions:v10 completion:&v17];
        thankYouVC = self->_thankYouVC;
        self->_thankYouVC = v11;

        id v13 = objc_alloc((Class)UINavigationController);
        id v14 = [v13 initWithRootViewController:self->_thankYouVC v17, v18, v19, v20, v21];
        id v15 = [(UGCCommunityAcknowledgementViewController *)self->_thankYouVC navigationItem];
        [v15 setHidesBackButton:1];

        char v16 = [v14 presentationController];
        [v16 setDelegate:self];

        [(UGCPOIEnrichmentEditor *)self->_ratingContributionsViewController presentViewController:v14 animated:1 completion:0];
      }
      else
      {
        id v8 = [(UGCPOIEnrichmentCoordinator *)self containeeDelegate];
        [v8 containeeViewControllerGoToPreviousState:self->_ratingContributionsViewController withSender:0];

        ((void (*)(void *))v5[2])(v5);
      }
    }
  }
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[MapsFormSheetPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (void)presentationControllerWillDismiss:(id)a3
{
}

- (int64_t)initialOverallState
{
  return self->_initialOverallState;
}

- (void)setInitialOverallState:(int64_t)a3
{
  self->_initialOverallState = a3;
}

- (NSArray)initialPhotosWithMetadata
{
  return self->_initialPhotosWithMetadata;
}

- (void)setInitialPhotosWithMetadata:(id)a3
{
}

- (BOOL)hasPhotoPickerEmphasis
{
  return self->_hasPhotoPickerEmphasis;
}

- (void)setHasPhotoPickerEmphasis:(BOOL)a3
{
  self->_hasPhotoPickerEmphasis = a3;
}

- (BOOL)suppressRatings
{
  return self->_suppressRatings;
}

- (void)setSuppressRatings:(BOOL)a3
{
  self->_suppressRatings = a3;
}

- (int64_t)preferredSourceType
{
  return self->_preferredSourceType;
}

- (void)setPreferredSourceType:(int64_t)a3
{
  self->_preferredSourceType = a3;
}

- (UGCSubmissionLookupResult)existingSubmission
{
  return self->_existingSubmission;
}

- (void)setExistingSubmission:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingSubmission, 0);
  objc_storeStrong((id *)&self->_initialPhotosWithMetadata, 0);
  objc_storeStrong((id *)&self->_lookupManager, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong((id *)&self->_thankYouVC, 0);

  objc_storeStrong((id *)&self->_ratingContributionsViewController, 0);
}

@end
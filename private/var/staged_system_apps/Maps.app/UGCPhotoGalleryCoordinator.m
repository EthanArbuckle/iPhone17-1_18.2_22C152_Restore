@interface UGCPhotoGalleryCoordinator
- (UGCPhotoGalleryCoordinator)init;
- (id)_attributionAtIndex:(unint64_t)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3;
- (id)placePhotoGalleryRequestsUserAttribution:(id)a3;
- (unint64_t)albumIndex;
- (unint64_t)selectedIndex;
- (void)_captureUserAction:(int)a3 atIndex:(unint64_t)a4;
- (void)_fetchUserAttribution;
- (void)_performPunchoutWithPhoto:(id)a3 index:(unint64_t)a4 presentingViewController:(id)a5;
- (void)_placePhotoGalleryDidSelectDeleteImage:(id)a3;
- (void)_startPresentationUsingIOSPhotoViewer;
- (void)_startPresentationUsingMacPhotoViewer;
- (void)dealloc;
- (void)photoThumbnailGalleryViewController:(id)a3 selectedAddPhotosUsingEntryPoint:(int64_t)a4 presentationOptions:(id)a5;
- (void)photoThumbnailGalleryViewController:(id)a3 selectedPhotoAtIndex:(unint64_t)a4 photoList:(id)a5 albumCategory:(id)a6 imageViewForTransition:(id)a7;
- (void)photoThumbnailGalleryViewControllerDidSelectDone:(id)a3;
- (void)placePhotoGallery:(id)a3 didSelectDeleteImageAtIndex:(unint64_t)a4;
- (void)placePhotoGallery:(id)a3 didSelectReportImageAtIndex:(unint64_t)a4;
- (void)placePhotoGallery:(id)a3 openButtonTappedAtIndex:(unint64_t)a4;
- (void)placePhotoGallery:(id)a3 selectedAddPhotoWithEntryPoint:(int64_t)a4 usingPresentationOptions:(id)a5;
- (void)placePhotoGalleryDidScrollLeftToIndex:(unint64_t)a3;
- (void)placePhotoGalleryDidScrollRightToIndex:(unint64_t)a3;
- (void)placePhotoGalleryDidScrollToIndex:(unint64_t)a3;
- (void)placePhotoGalleryDidSelectEditPhotoCredit:(id)a3;
- (void)placePhotoViewerSceneWillDisconnect:(id)a3;
- (void)poiEnrichmentCoordinator:(id)a3 didFinishSubmissionLookup:(id)a4;
- (void)poiEnrichmentCoordinator:(id)a3 didUpdateUserConsent:(BOOL)a4;
- (void)poiEnrichmentCoordinator:(id)a3 openURL:(id)a4;
- (void)poiEnrichmentCoordinator:(id)a3 requestPresentingViewControllerWithBlock:(id)a4;
- (void)poiEnrichmentCoordinatorDidFinish:(id)a3;
- (void)poiEnrichmentCoordinatorDidUpdateUserSubmission:(id)a3;
- (void)present;
- (void)setAlbumIndex:(unint64_t)a3;
- (void)setSelectedIndex:(unint64_t)a3;
@end

@implementation UGCPhotoGalleryCoordinator

- (UGCPhotoGalleryCoordinator)init
{
  v5.receiver = self;
  v5.super_class = (Class)UGCPhotoGalleryCoordinator;
  v2 = [(UGCPOIEnrichmentCoordinator *)&v5 init];
  if (v2)
  {
    v3 = +[UGCPhotoAttributionPreferencesManager sharedManager];
    [v3 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[UGCPhotoAttributionPreferencesManager sharedManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)UGCPhotoGalleryCoordinator;
  [(UGCPhotoGalleryCoordinator *)&v4 dealloc];
}

- (void)present
{
  v3 = +[UIApplication sharedMapsDelegate];
  objc_super v4 = [v3 appCoordinator];
  objc_super v5 = [v4 baseActionCoordinator];
  actionCoordinator = self->_actionCoordinator;
  self->_actionCoordinator = v5;

  v7 = +[UIDevice currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  if (v8 == (id)5)
  {
    [(UGCPhotoGalleryCoordinator *)self _startPresentationUsingMacPhotoViewer];
  }
  else
  {
    [(UGCPhotoGalleryCoordinator *)self _startPresentationUsingIOSPhotoViewer];
  }
}

- (void)_startPresentationUsingMacPhotoViewer
{
  v3 = +[MacPlacePhotoViewerScene requestSceneActivation];
  photoViewerScene = self->_photoViewerScene;
  self->_photoViewerScene = v3;

  objc_super v5 = [MacPlacePhotoViewerConfiguration alloc];
  v6 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  v11 = [(MacPlacePhotoViewerConfiguration *)v5 initWithMapItem:v6 startingContext:1];

  [(MacPlacePhotoViewerConfiguration *)v11 setAlbumIndex:[(UGCPhotoGalleryCoordinator *)self albumIndex]];
  [(MacPlacePhotoViewerConfiguration *)v11 setSelectedPhotoIndex:[(UGCPhotoGalleryCoordinator *)self selectedIndex]];
  v7 = [(UGCPOIEnrichmentCoordinator *)self submissionLookupResult];
  [(MacPlacePhotoViewerConfiguration *)v11 setUserSubmissionLookupResult:v7];

  id v8 = self->_photoViewerScene;
  v9 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
  v10 = [v9 _maps_mapsSceneDelegate];
  [(MacPlacePhotoViewerScene *)v8 openPhotoGalleryWithConfiguration:v11 sceneDelegate:v10 delegate:self];
}

- (void)_startPresentationUsingIOSPhotoViewer
{
  v3 = [UGCMorePhotosFeedViewController alloc];
  objc_super v4 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  objc_super v5 = [(UGCMorePhotosFeedViewController *)v3 initWithMapItem:v4];
  galleryViewController = self->_galleryViewController;
  self->_galleryViewController = v5;

  [(UGCMorePhotosFeedViewController *)self->_galleryViewController setDelegate:self];
  [(UGCMorePhotosFeedViewController *)self->_galleryViewController setModalPresentationStyle:8];
  [(UGCMorePhotosFeedViewController *)self->_galleryViewController setSelectedAlbumIndex:[(UGCPhotoGalleryCoordinator *)self albumIndex]];
  [(UGCMorePhotosFeedViewController *)self->_galleryViewController setStartingImageIndex:[(UGCPhotoGalleryCoordinator *)self selectedIndex]];
  if (sub_1000BBB44(self->_galleryViewController) == 5)
  {
    v7 = [(UGCPOIEnrichmentCoordinator *)self delegate];
    char v8 = objc_opt_respondsToSelector();
  }
  else
  {
    char v8 = 0;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1003AA338;
  v16[3] = &unk_1012E7480;
  v16[4] = self;
  v9 = objc_retainBlock(v16);
  if (v8)
  {
    objc_initWeak(&location, self);
    v10 = [(UGCPOIEnrichmentCoordinator *)self presentationDelegate];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003AA358;
    v12[3] = &unk_1012E74A8;
    objc_copyWeak(&v14, &location);
    v13 = v9;
    [v10 poiEnrichmentCoordinator:self requestPresentingViewControllerWithBlock:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
    ((void (*)(void *, void *))v9[2])(v9, v11);
  }
}

- (void)photoThumbnailGalleryViewControllerDidSelectDone:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003AA464;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [a3 dismissViewControllerAnimated:1 completion:v3];
}

- (void)photoThumbnailGalleryViewController:(id)a3 selectedAddPhotosUsingEntryPoint:(int64_t)a4 presentationOptions:(id)a5
{
  BOOL v8 = a4 == 2;
  id v9 = a5;
  id v10 = a3;
  v11 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  if (a4 == 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2 * v8;
  }
  v13 = +[UGCPOIEnrichmentCoordinator photoEmphasizedAddCoordinatorWithMapItem:v11 preferredSourceType:v12 originTarget:@"PLACECARD_PHOTO_VIEWER_ALL"];
  poiEnrichmentCoordinator = self->_poiEnrichmentCoordinator;
  self->_poiEnrichmentCoordinator = v13;

  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setDelegate:self];
  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setPresentingViewController:v10];

  v15 = [v9 sourceView];
  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setAnchoringView:v15];

  v16 = [v9 progressObserver];

  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setSubmissionLookupObserver:v16];
  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setPresentationContext:1];
  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setPrefersDefaultPresentationOverContainee:1];
  v17 = self->_poiEnrichmentCoordinator;

  [(UGCPOIEnrichmentCoordinator *)v17 present];
}

- (void)poiEnrichmentCoordinatorDidFinish:(id)a3
{
  poiEnrichmentCoordinator = self->_poiEnrichmentCoordinator;
  self->_poiEnrichmentCoordinator = 0;
}

- (void)poiEnrichmentCoordinator:(id)a3 openURL:(id)a4
{
  id v5 = a4;
  id v6 = [(UGCPOIEnrichmentCoordinator *)self delegate];
  [v6 poiEnrichmentCoordinator:self openURL:v5];
}

- (void)poiEnrichmentCoordinator:(id)a3 requestPresentingViewControllerWithBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)poiEnrichmentCoordinator:(id)a3 didUpdateUserConsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UGCPOIEnrichmentCoordinator *)self submissionStatusDelegate];
  [v7 poiEnrichmentCoordinator:v6 didUpdateUserConsent:v4];
}

- (void)poiEnrichmentCoordinatorDidUpdateUserSubmission:(id)a3
{
  BOOL v4 = [(UGCPOIEnrichmentCoordinator *)self submissionStatusDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UGCPOIEnrichmentCoordinator *)self submissionStatusDelegate];
    [v6 poiEnrichmentCoordinatorDidUpdateUserSubmission:self];
  }
}

- (void)poiEnrichmentCoordinator:(id)a3 didFinishSubmissionLookup:(id)a4
{
  id v8 = a4;
  char v5 = [(UGCPOIEnrichmentCoordinator *)self submissionStatusDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(UGCPOIEnrichmentCoordinator *)self submissionStatusDelegate];
    [v7 poiEnrichmentCoordinator:self didFinishSubmissionLookup:v8];
  }
}

- (void)photoThumbnailGalleryViewController:(id)a3 selectedPhotoAtIndex:(unint64_t)a4 photoList:(id)a5 albumCategory:(id)a6 imageViewForTransition:(id)a7
{
  id v22 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [v12 objectAtIndexedSubscript:a4];
  if ([v15 needsObfuscationWhenRenderedInFullScreen])
  {
    [(UGCPhotoGalleryCoordinator *)self _performPunchoutWithPhoto:v15 index:a4 presentingViewController:v22];
  }
  else
  {
    objc_storeStrong((id *)&self->_galleryPhotoList, a5);
    objc_storeStrong((id *)&self->_imageViewForTransition, a7);
    id v16 = objc_alloc((Class)MUPlacePhotoGalleryViewController);
    v17 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
    v18 = (MUPlacePhotoGalleryViewController *)[v16 initWithPhotos:v12 additionalView:0 scrollToIndex:a4 mapItem:v17 delegate:self];
    fullScreenGalleryViewController = self->_fullScreenGalleryViewController;
    self->_fullScreenGalleryViewController = v18;

    -[MUPlacePhotoGalleryViewController setEnablePersonalizedAttribution:](self->_fullScreenGalleryViewController, "setEnablePersonalizedAttribution:", [v13 categoryType] == (id)2);
    id v20 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_fullScreenGalleryViewController];
    v21 = [v20 navigationController];
    [v21 setNavigationBarHidden:1 animated:0];

    if (sub_1000BBB44(self->_fullScreenGalleryViewController) != 5) {
      [v20 setTransitioningDelegate:self];
    }
    [v20 setModalPresentationStyle:5];
    [(UGCMorePhotosFeedViewController *)self->_galleryViewController presentViewController:v20 animated:1 completion:0];
  }
}

- (id)placePhotoGalleryRequestsUserAttribution:(id)a3
{
  id v4 = a3;
  userAttributionResult = self->_userAttributionResult;
  if (userAttributionResult)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = sub_100103B2C;
    id v13 = sub_100104620;
    id v14 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003AAB4C;
    v8[3] = &unk_1012E74D0;
    v8[4] = &v9;
    [userAttributionResult withValue:v8 orError:&stru_1012E7510];
    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    [(UGCPhotoGalleryCoordinator *)self _fetchUserAttribution];
    id v6 = [objc_alloc((Class)MUPlaceUserAttributionViewModel) initWithAttributionName:&stru_101324E70];
  }

  return v6;
}

- (void)_fetchUserAttribution
{
  v3 = [(UGCPOIEnrichmentCoordinator *)self submissionLookupResult];
  id v4 = [v3 previousSubmission];
  char v5 = [v4 images];
  id v6 = [v5 count];

  if (v6)
  {
    objc_initWeak(&location, self);
    id v7 = +[UGCPhotoAttributionPreferencesManager sharedManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003AADC0;
    v12[3] = &unk_1012E7538;
    objc_copyWeak(&v13, &location);
    [v7 photoAttributionPreferencesWithCompletion:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    GEOErrorDomain();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = +[NSError errorWithDomain:v11 code:-6 userInfo:0];
    uint64_t v9 = +[Result resultWithError:v8];
    userAttributionResult = self->_userAttributionResult;
    self->_userAttributionResult = v9;
  }
}

- (void)placePhotoGallery:(id)a3 openButtonTappedAtIndex:(unint64_t)a4
{
  id v7 = a3;
  if ([(NSArray *)self->_galleryPhotoList count] > a4)
  {
    id v6 = [(NSArray *)self->_galleryPhotoList objectAtIndexedSubscript:a4];
    [(UGCPhotoGalleryCoordinator *)self _performPunchoutWithPhoto:v6 index:a4 presentingViewController:v7];
  }
}

- (void)placePhotoGallery:(id)a3 didSelectDeleteImageAtIndex:(unint64_t)a4
{
  char v5 = [(NSArray *)self->_galleryPhotoList objectAtIndex:a4];
  id v6 = [v5 geoMapItemPhoto];

  [(UGCPhotoGalleryCoordinator *)self _placePhotoGalleryDidSelectDeleteImage:v6];
}

- (void)_placePhotoGalleryDidSelectDeleteImage:(id)a3
{
  id v4 = a3;
  char v5 = objc_alloc_init(_TtC4Maps26UGCSubmissionLookupManager);
  lookupManager = self->_lookupManager;
  self->_lookupManager = v5;

  objc_initWeak(&location, self);
  id v7 = self->_lookupManager;
  id v8 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  id v9 = [v8 _muid];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_1003AB1BC;
  v15 = &unk_1012E75C0;
  objc_copyWeak(&v18, &location);
  id v10 = v4;
  id v16 = v10;
  v17 = self;
  [(UGCSubmissionLookupManager *)v7 fetchSubmissionWithICloudIDFor:v9 completion:&v12];

  id v11 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
  [v11 dismissViewControllerAnimated:1 completion:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)placePhotoGalleryDidSelectEditPhotoCredit:(id)a3
{
  actionCoordinator = self->_actionCoordinator;
  id v4 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
  [(ActionCoordination *)actionCoordinator viewControllerShowPhotoCredit:v4];
}

- (void)_performPunchoutWithPhoto:(id)a3 index:(unint64_t)a4 presentingViewController:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NSNumber numberWithUnsignedInteger:a4];
  id v11 = [v10 stringValue];
  id v12 = [v8 attribution];
  uint64_t v13 = [v12 providerID];
  +[GEOAPPortal captureUserAction:6018 target:612 value:v11 actionRichProviderId:v13];

  id v14 = [v8 attribution];
  if (+[MUPlaceAttributionUtilities shouldPresentStoreProductViewControllerWithAttribution:v14])
  {
    v15 = [v14 appAdamID];
    id v16 = [v14 providerID];
    +[MUPlaceAttributionUtilities presentStoreProductViewControllerWithAppAdamID:v15 bundleIdentifier:v16 presentingViewController:v9];
  }
  else
  {
    v17 = [v8 photoID];
    id v18 = [v14 urlsForPhotoWithIdentifier:v17];

    v19 = [v8 attribution];
    id v20 = +[MKPunchoutOptions punchoutOptionsForURLStrings:v18 withAttribution:v19];

    if ([v20 strategy] == (id)1)
    {
      +[MKAppLaunchController launchAttributionURLs:v18 withAttribution:v14 usingTarget:665 completionHandler:0];
    }
    else
    {
      v33 = self;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = v18;
      id v21 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v36;
        v31 = v20;
        v32 = v18;
        while (2)
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v36 != v23) {
              objc_enumerationMutation(obj);
            }
            v25 = +[NSURL URLWithString:*(void *)(*((void *)&v35 + 1) + 8 * i)];
            v26 = [v25 scheme];
            if (([v26 isEqualToString:@"http"] & 1) != 0
              || ([v25 scheme],
                  v27 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v28 = [v27 isEqualToString:@"https"],
                  v27,
                  v28))
            {
              v29 = [(UGCPOIEnrichmentCoordinator *)v33 delegate];
              [v29 poiEnrichmentCoordinator:v33 openURL:v25];

              v30 = [v25 absoluteString];
              +[GEOAPPortal captureUserAction:6050 target:665 value:v30];

              id v20 = v31;
              id v18 = v32;
              goto LABEL_16;
            }
          }
          id v22 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
          id v20 = v31;
          id v18 = v32;
          if (v22) {
            continue;
          }
          break;
        }
      }

      +[MKAppLaunchController launchAttributionURLs:obj withAttribution:v14 usingTarget:665 completionHandler:0];
    }
LABEL_16:
  }
}

- (void)placePhotoViewerSceneWillDisconnect:(id)a3
{
  photoViewerScene = self->_photoViewerScene;
  self->_photoViewerScene = 0;

  id v5 = [(UGCPOIEnrichmentCoordinator *)self delegate];
  [v5 poiEnrichmentCoordinatorDidFinish:self];
}

- (void)placePhotoGallery:(id)a3 didSelectReportImageAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(NSArray *)self->_galleryPhotoList objectAtIndex:a4];
  id v8 = [v7 geoMapItemPhoto];

  id v9 = [UGCReportImageryController alloc];
  id v10 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  id v11 = [(UGCReportImageryController *)v9 initWithMapItem:v10 reportedPhoto:v8 presentingViewController:v6];
  reportImageryController = self->_reportImageryController;
  self->_reportImageryController = v11;

  [v6 startAnimatingActivityIndicatorViewForRAP];
  uint64_t v13 = self->_reportImageryController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003ABB34;
  v15[3] = &unk_1012E75E8;
  id v16 = v6;
  id v14 = v6;
  [(UGCReportImageryController *)v13 fetchLayoutAndPresentWithCompletion:v15];
}

- (void)placePhotoGallery:(id)a3 selectedAddPhotoWithEntryPoint:(int64_t)a4 usingPresentationOptions:(id)a5
{
  BOOL v7 = a4 == 2;
  id v8 = a3;
  +[GEOAPPortal captureUserAction:2147 target:612 value:0];
  id v9 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
  if (a4 == 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2 * v7;
  }
  id v11 = +[UGCPOIEnrichmentCoordinator photoEmphasizedAddCoordinatorWithMapItem:v9 preferredSourceType:v10 originTarget:@"PLACECARD_PHOTO_VIEWER_ALL"];
  poiEnrichmentCoordinator = self->_poiEnrichmentCoordinator;
  self->_poiEnrichmentCoordinator = v11;

  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setDelegate:self];
  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setPresentingViewController:v8];
  uint64_t v13 = [v8 navigationItem];
  id v14 = [v13 rightBarButtonItem];
  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setAnchoringBarButtonItem:v14];

  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setSubmissionLookupObserver:v8];
  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setPresentationContext:1];
  [(UGCPOIEnrichmentCoordinator *)self->_poiEnrichmentCoordinator setPrefersDefaultPresentationOverContainee:1];
  v15 = self->_poiEnrichmentCoordinator;

  [(UGCPOIEnrichmentCoordinator *)v15 present];
}

- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3
{
  return [(UGCMorePhotosFeedViewController *)self->_galleryViewController imageViewForIndex:a3];
}

- (void)placePhotoGalleryDidScrollToIndex:(unint64_t)a3
{
  [(UGCReportImageryController *)self->_reportImageryController cancelPresentation];
  fullScreenGalleryViewController = self->_fullScreenGalleryViewController;

  [(MUPlacePhotoGalleryViewController *)fullScreenGalleryViewController stopAnimatingActivityIndicatorViewForRAP];
}

- (void)placePhotoGalleryDidScrollLeftToIndex:(unint64_t)a3
{
  [(UGCPhotoGalleryCoordinator *)self _captureUserAction:6048 atIndex:a3];
  galleryViewController = self->_galleryViewController;

  [(UGCMorePhotosFeedViewController *)galleryViewController scrollToPhotoAtIndex:a3 animated:0];
}

- (void)placePhotoGalleryDidScrollRightToIndex:(unint64_t)a3
{
  [(UGCPhotoGalleryCoordinator *)self _captureUserAction:6049 atIndex:a3];
  galleryViewController = self->_galleryViewController;

  [(UGCMorePhotosFeedViewController *)galleryViewController scrollToPhotoAtIndex:a3 animated:0];
}

- (void)_captureUserAction:(int)a3 atIndex:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = +[NSString stringWithFormat:@"%lu", a4];
  +[GEOAPPortal captureUserAction:v5 target:612 value:v7];
  id v8 = [(UGCPhotoGalleryCoordinator *)self _attributionAtIndex:a4];
  if ([v8 isUserSubmitted])
  {
    id v9 = +[NSNumber numberWithUnsignedInteger:a4];
    id v11 = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:&v11 count:1];
    +[GEOAPPortal captureUGCUserAction:v5 target:612 value:v7 photoSources:v10];
  }
}

- (id)_attributionAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_galleryPhotoList count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v5 = [(NSArray *)self->_galleryPhotoList objectAtIndexedSubscript:a3];
    id v6 = [v5 attribution];
  }

  return v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = objc_alloc((Class)UIImageView);
  BOOL v7 = [(UIImageView *)self->_imageViewForTransition image];
  id v8 = [v6 initWithImage:v7];

  [v8 setContentMode:[self->_imageViewForTransition contentMode]];
  id v9 = [objc_alloc((Class)MUPhotoGalleryTransitionAnimator) initWithView:self->_imageViewForTransition transitionView:v8];

  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  id v5 = v4;
  id v6 = [v5 viewControllers];
  BOOL v7 = [v6 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [v5 viewControllers];
    uint64_t v10 = [v9 firstObject];

    if (v10)
    {
      id v11 = [v10 indexOfVisibleView];
      if (v11 >= (id)[(NSArray *)self->_galleryPhotoList count])
      {
        id v16 = 0;
      }
      else
      {
        id v12 = [(UGCMorePhotosFeedViewController *)self->_galleryViewController imageViewForIndex:v11];
        id v13 = objc_alloc((Class)UIImageView);
        id v14 = [v12 image];
        id v15 = [v13 initWithImage:v14];

        [v15 setContentMode:[v12 contentMode]];
        id v16 = [objc_alloc((Class)MUPhotoGalleryTransitionAnimator) initWithView:v12 transitionView:v15];
      }
      id v5 = v10;
      goto LABEL_10;
    }
LABEL_6:
    id v16 = 0;
    goto LABEL_11;
  }
  id v16 = 0;
LABEL_10:

LABEL_11:

  return v16;
}

- (unint64_t)albumIndex
{
  return self->_albumIndex;
}

- (void)setAlbumIndex:(unint64_t)a3
{
  self->_albumIndex = a3;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  self->_selectedIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupManager, 0);
  objc_storeStrong((id *)&self->_userAttributionResult, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_storeStrong((id *)&self->_galleryPhotoList, 0);
  objc_storeStrong((id *)&self->_imageViewForTransition, 0);
  objc_storeStrong((id *)&self->_photoViewerScene, 0);
  objc_storeStrong((id *)&self->_reportImageryController, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentCoordinator, 0);
  objc_storeStrong((id *)&self->_galleryViewController, 0);

  objc_storeStrong((id *)&self->_fullScreenGalleryViewController, 0);
}

@end
@interface MacPlacePhotoViewerRootViewController
- (MKMapItem)mapItem;
- (MUPlacePhotoGalleryViewController)photoGalleryViewController;
- (MUPlacePhotoGalleryViewControllerDelegate)underlyingGalleryDelegate;
- (MacPlacePhotoViewerActionDelegate)delegate;
- (MacPlacePhotoViewerConfiguration)configuration;
- (MacPlacePhotoViewerRootViewController)initWithConfiguration:(id)a3 sceneDelegate:(id)a4;
- (MapsSceneDelegate)mapsSceneDelegate;
- (PhotoViewerToolbarController)toolbarController;
- (RAPPlacecardImageryLayoutManager)reportImageryLayoutManager;
- (RAPPresenter)rapPresenter;
- (Result)userAttributionResult;
- (UGCMorePhotosFeedViewController)photoThumbnailViewController;
- (UGCReportImageryController)reportImageryController;
- (UIViewController)topmostViewController;
- (id)photoViewerToolbarControllerGetCurrentPhoto:(id)a3;
- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3;
- (id)placePhotoGalleryRequestsUserAttribution:(id)a3;
- (id)userUploadedDataProviderForThumbnailGallery:(id)a3;
- (int64_t)context;
- (void)_fetchUserAttribution;
- (void)_logAction:(int)a3 withValue:(id)a4;
- (void)_logUGCAction:(int)a3 withIndex:(unint64_t)a4;
- (void)_performPunchoutWithPhoto:(id)a3 index:(unint64_t)a4 presentingViewController:(id)a5;
- (void)photoThumbnailGalleryViewController:(id)a3 selectedPhotoAtIndex:(unint64_t)a4 photoList:(id)a5 albumCategory:(id)a6 imageViewForTransition:(id)a7;
- (void)photoViewerToolbarController:(id)a3 selectedReportAnIssueItem:(id)a4;
- (void)photoViewerToolbarControllerTappedAddPhoto:(id)a3;
- (void)photoViewerToolbarControllerTappedLeft:(id)a3;
- (void)photoViewerToolbarControllerTappedMorePhotos:(id)a3;
- (void)photoViewerToolbarControllerTappedRight:(id)a3;
- (void)placePhotoGallery:(id)a3 attributionViewTappedAtIndex:(unint64_t)a4;
- (void)placePhotoGallery:(id)a3 openButtonTappedAtIndex:(unint64_t)a4;
- (void)placePhotoGallery:(id)a3 willCloseAtIndex:(unint64_t)a4;
- (void)placePhotoGalleryAdditionalViewTapped:(id)a3;
- (void)placePhotoGalleryDidCloseAtIndex:(unint64_t)a3;
- (void)placePhotoGalleryDidFinishDismissing:(id)a3;
- (void)placePhotoGalleryDidScrollLeftToIndex:(unint64_t)a3;
- (void)placePhotoGalleryDidScrollRightToIndex:(unint64_t)a3;
- (void)placePhotoGalleryDidScrollToIndex:(unint64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMapsSceneDelegate:(id)a3;
- (void)setPhotoGalleryViewController:(id)a3;
- (void)setPhotoThumbnailViewController:(id)a3;
- (void)setRapPresenter:(id)a3;
- (void)setReportImageryController:(id)a3;
- (void)setReportImageryLayoutManager:(id)a3;
- (void)setToolbarController:(id)a3;
- (void)setUnderlyingGalleryDelegate:(id)a3;
- (void)setUserAttributionResult:(id)a3;
- (void)viewDidLoad;
@end

@implementation MacPlacePhotoViewerRootViewController

- (MKMapItem)mapItem
{
  return [(MacPlacePhotoViewerConfiguration *)self->_configuration mapItem];
}

- (MacPlacePhotoViewerRootViewController)initWithConfiguration:(id)a3 sceneDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MacPlacePhotoViewerRootViewController;
  v9 = [(MacPlacePhotoViewerRootViewController *)&v29 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    p_configuration = (id *)&v9->_configuration;
    objc_storeStrong((id *)&v9->_configuration, a3);
    v12 = [PhotoViewerToolbarController alloc];
    v13 = [*p_configuration mapItem];
    v14 = [(PhotoViewerToolbarController *)v12 initWithMapItem:v13];
    toolbarController = v10->_toolbarController;
    v10->_toolbarController = v14;

    [(PhotoViewerToolbarController *)v10->_toolbarController setDelegate:v10];
    v16 = [RAPPlacecardImageryLayoutManager alloc];
    v17 = +[RAPPlacecardImageryIssueItem defaultIssueItems];
    v18 = [(RAPPlacecardImageryLayoutManager *)v16 initWithDefaultItems:v17];
    reportImageryLayoutManager = v10->_reportImageryLayoutManager;
    v10->_reportImageryLayoutManager = v18;

    objc_storeStrong((id *)&v10->_mapsSceneDelegate, a4);
    v20 = [[RAPPresenter alloc] initWithSceneDelegate:v10->_mapsSceneDelegate];
    rapPresenter = v10->_rapPresenter;
    v10->_rapPresenter = v20;

    v22 = [v7 photoGalleryViewController];
    v23 = [v22 delegate];
    objc_storeWeak((id *)&v10->_underlyingGalleryDelegate, v23);

    v24 = [v7 photoGalleryViewController];
    [v24 setDelegate:v10];

    uint64_t v25 = [v7 photoGalleryViewController];
    photoGalleryViewController = v10->_photoGalleryViewController;
    v10->_photoGalleryViewController = (MUPlacePhotoGalleryViewController *)v25;

    v27 = [v7 photoGalleryViewController];
    [(PhotoViewerToolbarController *)v10->_toolbarController setSuppressPhotoGrid:v27 != 0];

    -[MacPlacePhotoViewerRootViewController setContext:](v10, "setContext:", [*p_configuration startingContext]);
  }

  return v10;
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)MacPlacePhotoViewerRootViewController;
  [(MacPlacePhotoViewerRootViewController *)&v26 viewDidLoad];
  v3 = [UGCMorePhotosFeedViewController alloc];
  v4 = [(MacPlacePhotoViewerRootViewController *)self mapItem];
  v5 = [(UGCMorePhotosFeedViewController *)v3 initWithMapItem:v4];
  [(MacPlacePhotoViewerRootViewController *)self setPhotoThumbnailViewController:v5];

  v6 = [(MacPlacePhotoViewerRootViewController *)self photoThumbnailViewController];
  [v6 setDelegate:self];

  unint64_t v7 = [(MacPlacePhotoViewerConfiguration *)self->_configuration albumIndex];
  id v8 = [(MacPlacePhotoViewerRootViewController *)self photoThumbnailViewController];
  [v8 setSelectedAlbumIndex:v7];

  unint64_t v9 = [(MacPlacePhotoViewerConfiguration *)self->_configuration selectedPhotoIndex];
  v10 = [(MacPlacePhotoViewerRootViewController *)self photoThumbnailViewController];
  [v10 setStartingImageIndex:v9];

  int64_t v11 = [(MacPlacePhotoViewerRootViewController *)self context];
  if (v11 == 2)
  {
    v17 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
    v13 = [v17 view];

    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
    [(MacPlacePhotoViewerRootViewController *)self addChildViewController:v18];

    v19 = [(MacPlacePhotoViewerRootViewController *)self view];
    [v19 addSubview:v13];

    v16 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
  }
  else
  {
    if (v11 != 1) {
      return;
    }
    v12 = [(MacPlacePhotoViewerRootViewController *)self photoThumbnailViewController];
    v13 = [v12 view];

    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(MacPlacePhotoViewerRootViewController *)self photoThumbnailViewController];
    [(MacPlacePhotoViewerRootViewController *)self addChildViewController:v14];

    v15 = [(MacPlacePhotoViewerRootViewController *)self view];
    [v15 addSubview:v13];

    v16 = [(MacPlacePhotoViewerRootViewController *)self photoThumbnailViewController];
  }
  v20 = v16;
  [v16 didMoveToParentViewController:self];

  if (v13)
  {
    v21 = [(MacPlacePhotoViewerRootViewController *)self view];
    v22 = [v21 safeAreaLayoutGuide];
    LODWORD(v23) = 1148846080;
    v24 = [v13 _maps_constraintsEqualToEdgesOfLayoutGuide:v22 priority:v23];
    uint64_t v25 = [v24 allConstraints];
    +[NSLayoutConstraint activateConstraints:v25];
  }
}

- (id)placePhotoGalleryImageViewForPhotoAtIndex:(unint64_t)a3
{
  v4 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
  v5 = [v4 placePhotoGalleryImageViewForPhotoAtIndex:a3];

  return v5;
}

- (void)photoViewerToolbarController:(id)a3 selectedReportAnIssueItem:(id)a4
{
  id v5 = a4;
  v6 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
  id v13 = [v6 currentPhoto];

  unint64_t v7 = [RAPPlacecardImageryContextImpl alloc];
  id v8 = [(MacPlacePhotoViewerRootViewController *)self mapItem];
  unint64_t v9 = [v13 geoMapItemPhoto];
  v10 = [v13 largestPhotoURL];
  int64_t v11 = [v10 absoluteString];
  v12 = [(RAPPlacecardImageryContextImpl *)v7 initWithMapItem:v8 photo:v9 selectedPhotoURL:v11];

  [(RAPPresenter *)self->_rapPresenter presentPlacecardImageryRAPWithContext:v12 selectedIssueItem:v5 completion:0];
}

- (id)photoViewerToolbarControllerGetCurrentPhoto:(id)a3
{
  v3 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
  v4 = [v3 currentPhoto];

  return v4;
}

- (void)placePhotoGallery:(id)a3 willCloseAtIndex:(unint64_t)a4
{
  id v9 = a3;
  v6 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
    [v8 placePhotoGallery:v9 willCloseAtIndex:a4];
  }
}

- (void)placePhotoGalleryDidCloseAtIndex:(unint64_t)a3
{
  id v5 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
    [v7 placePhotoGalleryDidCloseAtIndex:a3];
  }
}

- (void)placePhotoGalleryAdditionalViewTapped:(id)a3
{
  id v7 = a3;
  v4 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
    [v6 placePhotoGalleryAdditionalViewTapped:v7];
  }
}

- (void)placePhotoGallery:(id)a3 attributionViewTappedAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
    [v9 placePhotoGallery:v6 attributionViewTappedAtIndex:a4];
  }
  else
  {
    id v9 = [v6 currentPhoto];
    -[MacPlacePhotoViewerRootViewController _performPunchoutWithPhoto:index:presentingViewController:](self, "_performPunchoutWithPhoto:index:presentingViewController:");
  }
}

- (void)_performPunchoutWithPhoto:(id)a3 index:(unint64_t)a4 presentingViewController:(id)a5
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedInteger:a4];
  char v8 = [v7 stringValue];
  id v9 = [v6 attribution];
  v10 = [v9 providerID];
  +[GEOAPPortal captureUserAction:6018 target:612 value:v8 actionRichProviderId:v10];

  id v13 = [v6 attribution];
  int64_t v11 = [v6 photoID];

  v12 = [v13 urlsForPhotoWithIdentifier:v11];

  +[MKAppLaunchController launchAttributionURLs:v12 withAttribution:v13 completionHandler:0];
}

- (void)placePhotoGalleryDidScrollLeftToIndex:(unint64_t)a3
{
  -[MacPlacePhotoViewerRootViewController _updateScrollButtonsWithIndex:](self, "_updateScrollButtonsWithIndex:");
  char v5 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
    [v7 placePhotoGalleryDidScrollLeftToIndex:a3];
  }
  else
  {
    [(MacPlacePhotoViewerRootViewController *)self _logUGCAction:6048 withIndex:a3];
    id v7 = [(MacPlacePhotoViewerRootViewController *)self photoThumbnailViewController];
    [v7 scrollToPhotoAtIndex:a3 animated:0];
  }
}

- (void)placePhotoGalleryDidScrollRightToIndex:(unint64_t)a3
{
  -[MacPlacePhotoViewerRootViewController _updateScrollButtonsWithIndex:](self, "_updateScrollButtonsWithIndex:");
  char v5 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
    [v7 placePhotoGalleryDidScrollRightToIndex:a3];
  }
  else
  {
    [(MacPlacePhotoViewerRootViewController *)self _logUGCAction:6049 withIndex:a3];
    id v7 = [(MacPlacePhotoViewerRootViewController *)self photoThumbnailViewController];
    [v7 scrollToPhotoAtIndex:a3 animated:0];
  }
}

- (void)placePhotoGalleryDidScrollToIndex:(unint64_t)a3
{
  char v5 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
    [v7 placePhotoGalleryDidScrollToIndex:a3];
  }
}

- (void)placePhotoGallery:(id)a3 openButtonTappedAtIndex:(unint64_t)a4
{
  id v14 = a3;
  char v6 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(MacPlacePhotoViewerRootViewController *)self underlyingGalleryDelegate];
    [v8 placePhotoGallery:v14 openButtonTappedAtIndex:a4];
  }
  else
  {
    id v9 = [v14 currentPhoto];
    char v8 = v9;
    if (v9)
    {
      v10 = [v9 attribution];
      int64_t v11 = [v8 photoID];
      v12 = [v10 urlsForPhotoWithIdentifier:v11];

      id v13 = [v8 attribution];
      +[MKAppLaunchController launchAttributionURLs:v12 withAttribution:v13 usingTarget:665 completionHandler:0];
    }
  }
}

- (void)placePhotoGalleryDidFinishDismissing:(id)a3
{
}

- (id)placePhotoGalleryRequestsUserAttribution:(id)a3
{
  id v4 = a3;
  userAttributionResult = self->_userAttributionResult;
  if (userAttributionResult)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = sub_100103B9C;
    id v13 = sub_100104658;
    id v14 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100420828;
    v8[3] = &unk_1012E74D0;
    v8[4] = &v9;
    [userAttributionResult withValue:v8 orError:&stru_1012E9DD8];
    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    [(MacPlacePhotoViewerRootViewController *)self _fetchUserAttribution];
    id v6 = [objc_alloc((Class)MUPlaceUserAttributionViewModel) initWithAttributionName:&stru_101324E70];
  }

  return v6;
}

- (void)_fetchUserAttribution
{
  v3 = [(MacPlacePhotoViewerConfiguration *)self->_configuration userSubmissionLookupResult];
  id v4 = [v3 previousSubmission];
  char v5 = [v4 images];
  id v6 = [v5 count];

  if (v6)
  {
    objc_initWeak(&location, self);
    char v7 = +[UGCPhotoAttributionPreferencesManager sharedManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100420AA8;
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
    char v8 = +[NSError errorWithDomain:v11 code:-6 userInfo:0];
    uint64_t v9 = +[Result resultWithError:v8];
    userAttributionResult = self->_userAttributionResult;
    self->_userAttributionResult = v9;
  }
}

- (void)photoThumbnailGalleryViewController:(id)a3 selectedPhotoAtIndex:(unint64_t)a4 photoList:(id)a5 albumCategory:(id)a6 imageViewForTransition:(id)a7
{
  id v22 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v11 objectAtIndexedSubscript:a4];
  if ([v13 needsObfuscationWhenRenderedInFullScreen])
  {
    [(MacPlacePhotoViewerRootViewController *)self _performPunchoutWithPhoto:v13 index:a4 presentingViewController:v22];
  }
  else
  {
    id v14 = objc_alloc((Class)MUPlacePhotoGalleryViewController);
    v15 = [(MacPlacePhotoViewerRootViewController *)self mapItem];
    id v16 = [v14 initWithPhotos:v11 additionalView:0 scrollToIndex:a4 mapItem:v15 delegate:self];
    [(MacPlacePhotoViewerRootViewController *)self setPhotoGalleryViewController:v16];

    BOOL v17 = [v12 categoryType] == (id)2;
    v18 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
    [v18 setEnablePersonalizedAttribution:v17];

    v19 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
    [v19 setDelegate:self];

    v20 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
    [v20 setModalPresentationStyle:8];

    [(MacPlacePhotoViewerRootViewController *)self setContext:2];
    v21 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
    [(MacPlacePhotoViewerRootViewController *)self presentViewController:v21 animated:1 completion:0];
  }
}

- (void)setContext:(int64_t)a3
{
  id v4 = [(MacPlacePhotoViewerRootViewController *)self toolbarController];
  [v4 setContext:a3];
}

- (int64_t)context
{
  v2 = [(MacPlacePhotoViewerRootViewController *)self toolbarController];
  id v3 = [v2 context];

  return (int64_t)v3;
}

- (id)userUploadedDataProviderForThumbnailGallery:(id)a3
{
  return [(MacPlacePhotoViewerConfiguration *)self->_configuration userSubmissionLookupResult];
}

- (void)photoViewerToolbarControllerTappedAddPhoto:(id)a3
{
}

- (void)photoViewerToolbarControllerTappedLeft:(id)a3
{
  id v3 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
  [v3 scrollLeft];
}

- (void)photoViewerToolbarControllerTappedRight:(id)a3
{
  id v3 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
  [v3 scrollRight];
}

- (void)photoViewerToolbarControllerTappedMorePhotos:(id)a3
{
  [(MacPlacePhotoViewerRootViewController *)self setContext:1];
  id v4 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100420F9C;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

- (UIViewController)topmostViewController
{
  id v3 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];

  if (v3)
  {
    id v4 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
  }
  else
  {
    id v4 = self;
  }

  return (UIViewController *)v4;
}

- (void)_logUGCAction:(int)a3 withIndex:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = [(MacPlacePhotoViewerRootViewController *)self photoGalleryViewController];
  char v7 = [v6 currentPhoto];
  char v8 = [v7 attribution];

  if ([v8 isUserSubmitted])
  {
    uint64_t v9 = +[NSNumber numberWithUnsignedInteger:a4];
    id v11 = v9;
    v10 = +[NSArray arrayWithObjects:&v11 count:1];
    +[GEOAPPortal captureUGCUserAction:v5 target:612 value:0 photoSources:v10];
  }
}

- (void)_logAction:(int)a3 withValue:(id)a4
{
}

- (MacPlacePhotoViewerActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MacPlacePhotoViewerActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MacPlacePhotoViewerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (UGCMorePhotosFeedViewController)photoThumbnailViewController
{
  return self->_photoThumbnailViewController;
}

- (void)setPhotoThumbnailViewController:(id)a3
{
}

- (MUPlacePhotoGalleryViewController)photoGalleryViewController
{
  return self->_photoGalleryViewController;
}

- (void)setPhotoGalleryViewController:(id)a3
{
}

- (PhotoViewerToolbarController)toolbarController
{
  return self->_toolbarController;
}

- (void)setToolbarController:(id)a3
{
}

- (UGCReportImageryController)reportImageryController
{
  return self->_reportImageryController;
}

- (void)setReportImageryController:(id)a3
{
}

- (RAPPlacecardImageryLayoutManager)reportImageryLayoutManager
{
  return self->_reportImageryLayoutManager;
}

- (void)setReportImageryLayoutManager:(id)a3
{
}

- (RAPPresenter)rapPresenter
{
  return self->_rapPresenter;
}

- (void)setRapPresenter:(id)a3
{
}

- (MapsSceneDelegate)mapsSceneDelegate
{
  return self->_mapsSceneDelegate;
}

- (void)setMapsSceneDelegate:(id)a3
{
}

- (MUPlacePhotoGalleryViewControllerDelegate)underlyingGalleryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_underlyingGalleryDelegate);

  return (MUPlacePhotoGalleryViewControllerDelegate *)WeakRetained;
}

- (void)setUnderlyingGalleryDelegate:(id)a3
{
}

- (Result)userAttributionResult
{
  return self->_userAttributionResult;
}

- (void)setUserAttributionResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAttributionResult, 0);
  objc_destroyWeak((id *)&self->_underlyingGalleryDelegate);
  objc_storeStrong((id *)&self->_mapsSceneDelegate, 0);
  objc_storeStrong((id *)&self->_rapPresenter, 0);
  objc_storeStrong((id *)&self->_reportImageryLayoutManager, 0);
  objc_storeStrong((id *)&self->_reportImageryController, 0);
  objc_storeStrong((id *)&self->_toolbarController, 0);
  objc_storeStrong((id *)&self->_photoGalleryViewController, 0);
  objc_storeStrong((id *)&self->_photoThumbnailViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
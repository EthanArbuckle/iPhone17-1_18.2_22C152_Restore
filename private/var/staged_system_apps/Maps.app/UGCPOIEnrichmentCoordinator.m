@interface UGCPOIEnrichmentCoordinator
+ (id)_addCoordinatorWithMapItem:(id)a3 entryPoint:(int64_t)a4;
+ (id)photoEmphasizedAddCoordinatorWithMapItem:(id)a3 originTarget:(id)a4;
+ (id)photoEmphasizedAddCoordinatorWithMapItem:(id)a3 preferredSourceType:(int64_t)a4 originTarget:(id)a5;
+ (id)photoEmphasizedAddCoordinatorWithMapItem:(id)a3 preferredSourceType:(int64_t)a4 originTarget:(id)a5 suppressRatings:(BOOL)a6;
+ (id)photoThumbnailGalleryCoordinatorWithMapItem:(id)a3 albumIndex:(unint64_t)a4;
+ (id)photoThumbnailGalleryCoordinatorWithMapItem:(id)a3 withStartingIndex:(unint64_t)a4;
+ (id)ratingsAndPhotosCoordinatorWithMapItem:(id)a3 entryPoint:(int64_t)a4 originTarget:(id)a5;
+ (id)ratingsAndPhotosCoordinatorWithMapItem:(id)a3 initialOverallState:(int64_t)a4 entryPoint:(int64_t)a5 originTarget:(id)a6;
- (BOOL)entryPointRequiresARPPrivacyScreenIfNeeded;
- (BOOL)prefersDefaultPresentationOverContainee;
- (ContaineeViewControllerDelegate)containeeDelegate;
- (ContainerViewController)containerViewController;
- (MKMapItem)mapItem;
- (MUActivityObserving)submissionLookupObserver;
- (NSString)originTarget;
- (PlaceCardDismissable)placeCardDismissalDelegate;
- (UGCPOIEnrichmentCoordinator)init;
- (UGCPOIEnrichmentCoordinatorDelegate)delegate;
- (UGCPOIEnrichmentPresentationDelegate)presentationDelegate;
- (UGCPOIEnrichmentSubmissionStatusDelegate)submissionStatusDelegate;
- (UGCSubmissionLookupResult)submissionLookupResult;
- (UIBarButtonItem)anchoringBarButtonItem;
- (UIView)anchoringView;
- (UIViewController)presentingViewController;
- (int64_t)entryPoint;
- (int64_t)presentationContext;
- (void)invokeCompletion;
- (void)invokeSubmissionUpdate;
- (void)setAnchoringBarButtonItem:(id)a3;
- (void)setAnchoringView:(id)a3;
- (void)setContaineeDelegate:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntryPoint:(int64_t)a3;
- (void)setEntryPointRequiresARPPrivacyScreenIfNeeded:(BOOL)a3;
- (void)setMapItem:(id)a3;
- (void)setOriginTarget:(id)a3;
- (void)setPlaceCardDismissalDelegate:(id)a3;
- (void)setPrefersDefaultPresentationOverContainee:(BOOL)a3;
- (void)setPresentationContext:(int64_t)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSubmissionLookupObserver:(id)a3;
- (void)setSubmissionLookupResult:(id)a3;
- (void)setSubmissionStatusDelegate:(id)a3;
@end

@implementation UGCPOIEnrichmentCoordinator

- (UGCPOIEnrichmentCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)UGCPOIEnrichmentCoordinator;
  v2 = [(UGCPOIEnrichmentCoordinator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[MKLocationManager unretainedUGCInstance];
    locationManager = v2->_locationManager;
    v2->_locationManager = (MKLocationManager *)v3;
  }
  return v2;
}

- (void)invokeSubmissionUpdate
{
  uint64_t v3 = [(UGCPOIEnrichmentCoordinator *)self submissionStatusDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UGCPOIEnrichmentCoordinator *)self submissionStatusDelegate];
    [v5 poiEnrichmentCoordinatorDidUpdateUserSubmission:self];
  }
}

- (void)invokeCompletion
{
  uint64_t v3 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
  uint64_t v4 = sub_1000BBB44(v3);

  if (v4 == 5)
  {
    id v5 = [(UGCPOIEnrichmentCoordinator *)self placeCardDismissalDelegate];
    objc_super v6 = [(UGCPOIEnrichmentCoordinator *)self presentingViewController];
    v7 = [(UGCPOIEnrichmentCoordinator *)self mapItem];
    [v5 didDismissViewController:v6 mapItem:v7];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained poiEnrichmentCoordinatorDidFinish:self];
}

+ (id)ratingsAndPhotosCoordinatorWithMapItem:(id)a3 initialOverallState:(int64_t)a4 entryPoint:(int64_t)a5 originTarget:(id)a6
{
  id v9 = a6;
  v10 = +[UGCPOIEnrichmentCoordinator _addCoordinatorWithMapItem:a3 entryPoint:a5];
  [v10 setInitialOverallState:a4];
  [v10 setOriginTarget:v9];

  return v10;
}

+ (id)photoEmphasizedAddCoordinatorWithMapItem:(id)a3 originTarget:(id)a4
{
  id v5 = a4;
  objc_super v6 = +[UGCPOIEnrichmentCoordinator _addCoordinatorWithMapItem:a3 entryPoint:0];
  [v6 setHasPhotoPickerEmphasis:1];
  [v6 setOriginTarget:v5];

  return v6;
}

+ (id)photoEmphasizedAddCoordinatorWithMapItem:(id)a3 preferredSourceType:(int64_t)a4 originTarget:(id)a5 suppressRatings:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  v10 = +[UGCPOIEnrichmentCoordinator _addCoordinatorWithMapItem:a3 entryPoint:0];
  [v10 setHasPhotoPickerEmphasis:1];
  [v10 setSuppressRatings:v6];
  [v10 setPreferredSourceType:a4];
  [v10 setOriginTarget:v9];

  return v10;
}

+ (id)photoEmphasizedAddCoordinatorWithMapItem:(id)a3 preferredSourceType:(int64_t)a4 originTarget:(id)a5
{
  id v7 = a5;
  v8 = +[UGCPOIEnrichmentCoordinator _addCoordinatorWithMapItem:a3 entryPoint:0];
  [v8 setHasPhotoPickerEmphasis:1];
  [v8 setPreferredSourceType:a4];
  [v8 setOriginTarget:v7];

  return v8;
}

+ (id)_addCoordinatorWithMapItem:(id)a3 entryPoint:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = objc_alloc_init(UGCRatingsAndPhotosCoordinator);
  [(UGCPOIEnrichmentCoordinator *)v6 setMapItem:v5];

  [(UGCPOIEnrichmentCoordinator *)v6 setEntryPoint:a4];

  return v6;
}

+ (id)ratingsAndPhotosCoordinatorWithMapItem:(id)a3 entryPoint:(int64_t)a4 originTarget:(id)a5
{
  id v7 = a5;
  v8 = +[UGCPOIEnrichmentCoordinator _addCoordinatorWithMapItem:a3 entryPoint:a4];
  [v8 setOriginTarget:v7];

  return v8;
}

+ (id)photoThumbnailGalleryCoordinatorWithMapItem:(id)a3 withStartingIndex:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = objc_alloc_init(UGCPhotoGalleryCoordinator);
  [(UGCPOIEnrichmentCoordinator *)v6 setMapItem:v5];

  [(UGCPhotoGalleryCoordinator *)v6 setSelectedIndex:a4];

  return v6;
}

+ (id)photoThumbnailGalleryCoordinatorWithMapItem:(id)a3 albumIndex:(unint64_t)a4
{
  id v5 = [a1 photoThumbnailGalleryCoordinatorWithMapItem:a3 withStartingIndex:0];
  [v5 setAlbumIndex:a4];

  return v5;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UGCPOIEnrichmentCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCPOIEnrichmentCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UGCPOIEnrichmentSubmissionStatusDelegate)submissionStatusDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_submissionStatusDelegate);

  return (UGCPOIEnrichmentSubmissionStatusDelegate *)WeakRetained;
}

- (void)setSubmissionStatusDelegate:(id)a3
{
}

- (UGCPOIEnrichmentPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (UGCPOIEnrichmentPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (UIBarButtonItem)anchoringBarButtonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_anchoringBarButtonItem);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setAnchoringBarButtonItem:(id)a3
{
}

- (UIView)anchoringView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_anchoringView);

  return (UIView *)WeakRetained;
}

- (void)setAnchoringView:(id)a3
{
}

- (MUActivityObserving)submissionLookupObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_submissionLookupObserver);

  return (MUActivityObserving *)WeakRetained;
}

- (void)setSubmissionLookupObserver:(id)a3
{
}

- (PlaceCardDismissable)placeCardDismissalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardDismissalDelegate);

  return (PlaceCardDismissable *)WeakRetained;
}

- (void)setPlaceCardDismissalDelegate:(id)a3
{
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(int64_t)a3
{
  self->_presentationContext = a3;
}

- (int64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int64_t)a3
{
  self->_entryPoint = a3;
}

- (NSString)originTarget
{
  return self->_originTarget;
}

- (void)setOriginTarget:(id)a3
{
}

- (BOOL)entryPointRequiresARPPrivacyScreenIfNeeded
{
  return self->_entryPointRequiresARPPrivacyScreenIfNeeded;
}

- (void)setEntryPointRequiresARPPrivacyScreenIfNeeded:(BOOL)a3
{
  self->_entryPointRequiresARPPrivacyScreenIfNeeded = a3;
}

- (BOOL)prefersDefaultPresentationOverContainee
{
  return self->_prefersDefaultPresentationOverContainee;
}

- (void)setPrefersDefaultPresentationOverContainee:(BOOL)a3
{
  self->_prefersDefaultPresentationOverContainee = a3;
}

- (ContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (ContainerViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (ContaineeViewControllerDelegate)containeeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeDelegate);

  return (ContaineeViewControllerDelegate *)WeakRetained;
}

- (void)setContaineeDelegate:(id)a3
{
}

- (UGCSubmissionLookupResult)submissionLookupResult
{
  return self->_submissionLookupResult;
}

- (void)setSubmissionLookupResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionLookupResult, 0);
  objc_destroyWeak((id *)&self->_containeeDelegate);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_originTarget, 0);
  objc_destroyWeak((id *)&self->_placeCardDismissalDelegate);
  objc_destroyWeak((id *)&self->_submissionLookupObserver);
  objc_destroyWeak((id *)&self->_anchoringView);
  objc_destroyWeak((id *)&self->_anchoringBarButtonItem);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_destroyWeak((id *)&self->_submissionStatusDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
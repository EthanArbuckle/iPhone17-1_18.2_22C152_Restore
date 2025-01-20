@interface UGCCallToActionViewProvider
- (BOOL)alwaysRefinesUserSubmission;
- (BOOL)canAddRatingOrPhoto;
- (BOOL)hasUserAlreadyRatedThisPlace;
- (BOOL)isResolving;
- (MKMapItem)mapItem;
- (MUPlaceCallToActionAppearance)submissionStatusAppearance;
- (NSString)firstPhotoID;
- (NSURL)firstPhotoURL;
- (UGCCallToActionViewProvider)initWithDelegate:(id)a3;
- (UGCSubmissionLookupResult)lookupResult;
- (int64_t)currentRatingCategoryState;
- (unint64_t)numberOfPhotosAddedForSubmission;
- (void)_finishResolvingWithBlock:(id)a3;
- (void)_handleLookupSubmissionCompletion:(id)a3 lookupError:(id)a4;
- (void)_resolveForCurrentState;
- (void)_resolveForEditWithCompletion:(id)a3;
- (void)_restart;
- (void)_retrievePhotoURLWithCompletion:(id)a3;
- (void)_updateWithPOIEnrichment:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)feedbackSubmissionManagerCompletedSubmissionWithMUID:(unint64_t)a3 withError:(id)a4;
- (void)refineUserSubmissionForMapItem:(id)a3;
- (void)resolveForUserEdit;
- (void)setAlwaysRefinesUserSubmission:(BOOL)a3;
- (void)setCurrentRatingCategoryState:(int64_t)a3;
- (void)setFirstPhotoID:(id)a3;
- (void)setFirstPhotoURL:(id)a3;
- (void)setHasUserAlreadyRatedThisPlace:(BOOL)a3;
- (void)setIsResolving:(BOOL)a3;
- (void)setLookupResult:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setNumberOfPhotosAddedForSubmission:(unint64_t)a3;
- (void)updateWithFetchedLookupResult:(id)a3;
@end

@implementation UGCCallToActionViewProvider

- (UGCCallToActionViewProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UGCCallToActionViewProvider;
  v5 = [(UGCCallToActionViewProvider *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[UIApplication sharedMapsDelegate];
    v8 = [v7 submissionManager];
    [v8 addObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  [(UGCSubmissionLookupManager *)self->_lookupManager cancelIfNeeded];
  v3 = +[UIApplication sharedMapsDelegate];
  id v4 = [v3 submissionManager];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)UGCCallToActionViewProvider;
  [(UGCCallToActionViewProvider *)&v5 dealloc];
}

- (MUPlaceCallToActionAppearance)submissionStatusAppearance
{
  if ([(UGCCallToActionViewProvider *)self isResolving])
  {
    v3 = +[MUPlaceCallToActionAppearance userRecommendedLoadingAppearance];
  }
  else if ([(UGCCallToActionViewProvider *)self hasUserAlreadyRatedThisPlace])
  {
    if ([(UGCCallToActionViewProvider *)self currentRatingCategoryState]
      || (v3 = [(UGCCallToActionViewProvider *)self numberOfPhotosAddedForSubmission]) != 0)
    {
      int64_t v4 = [(UGCCallToActionViewProvider *)self currentRatingCategoryState];
      if (v4 == 2) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = v4 == 1;
      }
      v3 = +[MUPlaceCallToActionAppearance userRecommendedAppearanceForRatingState:v5 numberOfPhotosAdded:[(UGCCallToActionViewProvider *)self numberOfPhotosAddedForSubmission]];
    }
  }
  else
  {
    v3 = 0;
  }

  return (MUPlaceCallToActionAppearance *)v3;
}

- (BOOL)canAddRatingOrPhoto
{
  return +[MKPOIEnrichmentAvailibility shouldShowCallToActionForMapItem:self->_mapItem];
}

- (void)setMapItem:(id)a3
{
  uint64_t v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    [(UGCCallToActionViewProvider *)self _restart];
    uint64_t v5 = v6;
  }
}

- (void)setAlwaysRefinesUserSubmission:(BOOL)a3
{
  if (self->_alwaysRefinesUserSubmission != a3)
  {
    self->_alwaysRefinesUserSubmission = a3;
    [(UGCCallToActionViewProvider *)self _restart];
  }
}

- (void)_restart
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(UGCCallToActionViewProvider *)self cancel];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained callToActionViewProviderDidFinishClearingExistingState:self];

  [(UGCCallToActionViewProvider *)self _resolveForCurrentState];
}

- (void)_resolveForCurrentState
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = sub_100577714();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Resolving current state", (uint8_t *)&buf, 2u);
  }

  if ([(MKMapItem *)self->_mapItem _muid])
  {
    [(UGCCallToActionViewProvider *)self setIsResolving:1];
    if ([(UGCCallToActionViewProvider *)self canAddRatingOrPhoto])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained callToActionViewProviderInitialLoadingStateDidChange:self];

      objc_initWeak(&buf, self);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100A7213C;
      v8[3] = &unk_101315A30;
      uint64_t v5 = &v9;
      objc_copyWeak(&v9, &buf);
      [(UGCCallToActionViewProvider *)self _resolveForEditWithCompletion:v8];
    }
    else
    {
      v7 = sub_100577714();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "This POI does not support ratings/photos.  Will not show CTA but will check if we reviewed this place", (uint8_t *)&buf, 2u);
      }

      objc_initWeak(&buf, self);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100A71EAC;
      v10[3] = &unk_101315A30;
      uint64_t v5 = &v11;
      objc_copyWeak(&v11, &buf);
      [(UGCCallToActionViewProvider *)self _resolveForEditWithCompletion:v10];
    }
    objc_destroyWeak(v5);
    objc_destroyWeak(&buf);
  }
  else
  {
    v6 = sub_100577714();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Map item does not have MUID. Early exit.", (uint8_t *)&buf, 2u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100A71E58;
    v13[3] = &unk_1012E5D08;
    v13[4] = self;
    [(UGCCallToActionViewProvider *)self _finishResolvingWithBlock:v13];
  }
}

- (void)_resolveForEditWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(location, self);
    id v5 = [(MKMapItem *)self->_mapItem _muid];
    v6 = [(MKMapItem *)self->_mapItem _geoMapItem];
    v7 = [v6 _identifierHistory];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100A72550;
    v8[3] = &unk_101315A80;
    void v8[4] = self;
    id v9 = v4;
    objc_copyWeak(&v10, location);
    +[UGCReviewedPlaceManager fetchReviewedPlaceForMUID:v5 withIdentifierHistory:v7 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", (uint8_t *)location, 2u);
  }
}

- (void)resolveForUserEdit
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(UGCCallToActionViewProvider *)self cancel];

  [(UGCCallToActionViewProvider *)self _resolveForCurrentState];
}

- (void)cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(UGCSubmissionLookupManager *)self->_lookupManager cancelIfNeeded];
  [(UGCCallToActionViewProvider *)self setHasUserAlreadyRatedThisPlace:0];
  [(UGCCallToActionViewProvider *)self setCurrentRatingCategoryState:0];
  [(UGCCallToActionViewProvider *)self setNumberOfPhotosAddedForSubmission:0];
  [(UGCCallToActionViewProvider *)self setLookupResult:0];
  [(UGCCallToActionViewProvider *)self setIsResolving:0];

  [(UGCCallToActionViewProvider *)self setFirstPhotoURL:0];
}

- (void)updateWithFetchedLookupResult:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([v4 status] == (id)1)
  {
    [(UGCCallToActionViewProvider *)self cancel];
    [(UGCCallToActionViewProvider *)self setHasUserAlreadyRatedThisPlace:1];
    [(UGCCallToActionViewProvider *)self setLookupResult:v4];
    id v5 = [v4 previousSubmission];
    [(UGCCallToActionViewProvider *)self _updateWithPOIEnrichment:v5];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained callToActionViewProviderDidFinishResolvingEditState:self];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: lookupResult.status == UGCSubmissionLookupStatusSuccess", v7, 2u);
  }
}

- (void)refineUserSubmissionForMapItem:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(UGCSubmissionLookupManager *)self->_lookupManager cancelIfNeeded];
  id v5 = objc_alloc_init(_TtC4Maps26UGCSubmissionLookupManager);
  lookupManager = self->_lookupManager;
  self->_lookupManager = v5;

  if (MapsFeature_IsEnabled_ARPCommunityID())
  {
    objc_initWeak(&location, self);
    v7 = self->_lookupManager;
    id v8 = [v4 _muid];
    id v9 = [v4 _geoMapItem];
    id v10 = [v9 _identifierHistory];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100A72B10;
    v16[3] = &unk_101315AA8;
    objc_copyWeak(&v17, &location);
    [(UGCSubmissionLookupManager *)v7 fetchSubmissionWithCommunityIDAndICloudIDFor:v8 identifierHistory:v10 completion:v16];

    id v11 = &v17;
  }
  else
  {
    objc_initWeak(&location, self);
    v12 = self->_lookupManager;
    id v13 = [v4 _muid];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100A72C40;
    v14[3] = &unk_101315AA8;
    objc_copyWeak(&v15, &location);
    [(UGCSubmissionLookupManager *)v12 fetchSubmissionWithICloudIDFor:v13 completion:v14];
    id v11 = &v15;
  }
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)_handleLookupSubmissionCompletion:(id)a3 lookupError:(id)a4
{
  id v5 = a3;
  [(UGCCallToActionViewProvider *)self setLookupResult:v5];
  if ([v5 status] == (id)1)
  {
    v6 = [v5 previousSubmission];
    [(UGCCallToActionViewProvider *)self _updateWithPOIEnrichment:v6];

    v7 = (void ***)v11;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    id v8 = sub_100A72E74;
  }
  else
  {
    v7 = &v9;
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v8 = sub_100A72EC8;
  }
  v7[2] = (void **)v8;
  v7[3] = (void **)&unk_1012E5D08;
  v7[4] = (void **)&self->super.isa;
  -[UGCCallToActionViewProvider _finishResolvingWithBlock:](self, "_finishResolvingWithBlock:", v9, v10);
}

- (void)_updateWithPOIEnrichment:(id)a3
{
  id v23 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v4 = [v23 scorecard];
  unsigned __int8 v5 = [v4 hasRecommended];

  if (v5)
  {
    v6 = [v23 scorecard];
    if ([v6 recommended]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    [(UGCCallToActionViewProvider *)self setCurrentRatingCategoryState:v7];
  }
  else
  {
    [(UGCCallToActionViewProvider *)self setCurrentRatingCategoryState:0];
  }
  id v8 = [v23 images];
  -[UGCCallToActionViewProvider setNumberOfPhotosAddedForSubmission:](self, "setNumberOfPhotosAddedForSubmission:", [v8 count]);

  id v9 = [v23 images];
  uint64_t v10 = [v9 firstObject];

  uint64_t v11 = [(UGCCallToActionViewProvider *)self firstPhotoURL];
  uint64_t v12 = v11 | v10;

  if (v12)
  {
    id v13 = [(UGCCallToActionViewProvider *)self firstPhotoURL];
    v14 = [v13 absoluteString];
    id v15 = [(id)v10 url];
    unsigned __int8 v16 = [v14 isEqual:v15];

    if ((v16 & 1) == 0)
    {
      id v17 = [(id)v10 url];
      v18 = +[NSURL URLWithString:v17];
      [(UGCCallToActionViewProvider *)self setFirstPhotoURL:v18];

      v19 = [(id)v10 imageId];
      [(UGCCallToActionViewProvider *)self setFirstPhotoID:v19];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v21 = [(UGCCallToActionViewProvider *)self firstPhotoURL];
      v22 = [(id)v10 imageId];
      [WeakRetained callToActionViewProviderDidUpdateWithPreferredUserUploadedPhoto:v21 photoID:v22 numberOfPhotos:[self numberOfPhotosAddedForSubmission]];
    }
  }
}

- (void)_retrievePhotoURLWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void *, unint64_t))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  unsigned __int8 v5 = [(UGCCallToActionViewProvider *)self firstPhotoURL];

  if (v5)
  {
    v6 = [(UGCCallToActionViewProvider *)self firstPhotoURL];
    uint64_t v7 = [(UGCCallToActionViewProvider *)self firstPhotoID];
    v4[2](v4, v6, v7, [(UGCCallToActionViewProvider *)self numberOfPhotosAddedForSubmission]);
  }
  else
  {
    id v8 = [(UGCCallToActionViewProvider *)self mapItem];
    id v9 = [v8 _muid];

    [(UGCSubmissionLookupManager *)self->_lookupManager cancelIfNeeded];
    uint64_t v10 = objc_alloc_init(_TtC4Maps26UGCSubmissionLookupManager);
    lookupManager = self->_lookupManager;
    self->_lookupManager = v10;

    objc_initWeak(&location, self);
    uint64_t v12 = self->_lookupManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100A732D0;
    v13[3] = &unk_101315AD0;
    objc_copyWeak(&v15, &location);
    v14 = v4;
    [(UGCSubmissionLookupManager *)v12 fetchSubmissionWithICloudIDFor:v9 completion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)_finishResolvingWithBlock:(id)a3
{
  id v5 = a3;
  [(UGCCallToActionViewProvider *)self setIsResolving:0];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)feedbackSubmissionManagerCompletedSubmissionWithMUID:(unint64_t)a3 withError:(id)a4
{
  id v6 = a4;
  if (MapsFeature_IsEnabled_SydneyARP())
  {
    uint64_t v7 = sub_100577714();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 134218242;
      unint64_t v11 = a3;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "FeedbackSubmissionManager did complete photo submission for muid: %llu error: %@", (uint8_t *)&v10, 0x16u);
    }

    if (!v6)
    {
      id v8 = [(UGCCallToActionViewProvider *)self mapItem];
      id v9 = [v8 _muid];

      if (v9 == (id)a3) {
        [(UGCCallToActionViewProvider *)self resolveForUserEdit];
      }
    }
  }
}

- (UGCSubmissionLookupResult)lookupResult
{
  return self->_lookupResult;
}

- (void)setLookupResult:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)alwaysRefinesUserSubmission
{
  return self->_alwaysRefinesUserSubmission;
}

- (BOOL)hasUserAlreadyRatedThisPlace
{
  return self->_hasUserAlreadyRatedThisPlace;
}

- (void)setHasUserAlreadyRatedThisPlace:(BOOL)a3
{
  self->_hasUserAlreadyRatedThisPlace = a3;
}

- (int64_t)currentRatingCategoryState
{
  return self->_currentRatingCategoryState;
}

- (void)setCurrentRatingCategoryState:(int64_t)a3
{
  self->_currentRatingCategoryState = a3;
}

- (unint64_t)numberOfPhotosAddedForSubmission
{
  return self->_numberOfPhotosAddedForSubmission;
}

- (void)setNumberOfPhotosAddedForSubmission:(unint64_t)a3
{
  self->_numberOfPhotosAddedForSubmission = a3;
}

- (NSURL)firstPhotoURL
{
  return self->_firstPhotoURL;
}

- (void)setFirstPhotoURL:(id)a3
{
}

- (NSString)firstPhotoID
{
  return self->_firstPhotoID;
}

- (void)setFirstPhotoID:(id)a3
{
}

- (BOOL)isResolving
{
  return self->_isResolving;
}

- (void)setIsResolving:(BOOL)a3
{
  self->_isResolving = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPhotoID, 0);
  objc_storeStrong((id *)&self->_firstPhotoURL, 0);
  objc_storeStrong((id *)&self->_lookupResult, 0);
  objc_storeStrong((id *)&self->_lookupManager, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
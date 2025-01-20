@interface RAPReport
- (BOOL)_shouldEnableCommunityID;
- (BOOL)canCreateSubmittableProblem;
- (GEORPUserPath)combinedUserPath;
- (NSDate)creationDate;
- (NSString)preferredEmailAddress;
- (NSString)previousFeedbackID;
- (RAPAppStateProtocol)_context;
- (RAPQuestion)initialQuestion;
- (RAPReport)init;
- (RAPReport)initWithContext:(id)a3 submitter:(id)a4;
- (id)_auxiliaryControlsRecording;
- (id)_buildRequestParamsWithError:(id *)a3;
- (id)_directionsRecording;
- (id)_mapContext;
- (id)_navigationSettings;
- (id)_placeContext;
- (id)_saveRAPInfoToMapsSyncWithRequestParams:(id)a3;
- (id)devicePushToken;
- (id)newFeedbackRequestParameters;
- (void)_anonymizeDirectionsRequestsAndResponsesIfNeeded:(id)a3;
- (void)_anonymizeLocations:(id)a3 traits:(id)a4;
- (void)_anonymizePhotos:(id)a3;
- (void)_anonymizeScreenshots:(id)a3;
- (void)_buildUserInfoWithRequestParams:(id)a3 CompletionHandler:(id)a4;
- (void)_invokeChangeHandlers;
- (void)_prepareRequestParametersForSubmission:(id)a3;
- (void)_setNeedsUpdate;
- (void)_update;
- (void)addObserver:(id)a3 changeHandler:(id)a4;
- (void)addPhotoWithMetadata:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removePhotosOfType:(int64_t)a3;
- (void)setCombinedUserPath:(id)a3;
- (void)setInitialQuestion:(id)a3;
- (void)setPreferredEmailAddress:(id)a3;
- (void)setPreviousFeedbackID:(id)a3;
- (void)submitWithPrivacyRequestHandler:(id)a3 willStartSubmitting:(id)a4 didFinishSubmitting:(id)a5;
- (void)updateIfNeeded;
@end

@implementation RAPReport

- (RAPReport)init
{
  result = (RAPReport *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (RAPReport)initWithContext:(id)a3 submitter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPReport;
  v9 = [(RAPReport *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_submitter, a4);
    uint64_t v11 = objc_opt_new();
    photosWithMetadata = v10->_photosWithMetadata;
    v10->_photosWithMetadata = (NSMutableArray *)v11;

    uint64_t v13 = +[NSDate now];
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v13;

    [(RAPReport *)v10 _setNeedsUpdate];
  }

  return v10;
}

- (void)setInitialQuestion:(id)a3
{
  id v5 = a3;
  if (!self->_initialQuestion)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_initialQuestion, a3);
    [(RAPReport *)self _setNeedsUpdate];
    id v5 = v6;
  }
}

- (void)addPhotoWithMetadata:(id)a3
{
}

- (void)removePhotosOfType:(int64_t)a3
{
  photosWithMetadata = self->_photosWithMetadata;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007F6D38;
  v5[3] = &unk_1012F9880;
  v5[4] = a3;
  v4 = +[NSPredicate predicateWithBlock:v5];
  [(NSMutableArray *)photosWithMetadata filterUsingPredicate:v4];
}

- (BOOL)canCreateSubmittableProblem
{
  return self->_canCreateSubmittableProblem;
}

- (void)_setNeedsUpdate
{
  if (!self->_willUpdate)
  {
    self->_willUpdate = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007F6E1C;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)updateIfNeeded
{
  if (self->_willUpdate)
  {
    self->_willUpdate = 0;
    [(RAPReport *)self _update];
  }
}

- (void)_update
{
  v3 = [(RAPReport *)self initialQuestion];
  unsigned int v4 = [v3 _isRecursivelyComplete];

  if (self->_canCreateSubmittableProblem != v4)
  {
    self->_canCreateSubmittableProblem = v4;
    [(RAPReport *)self _invokeChangeHandlers];
  }
}

- (id)newFeedbackRequestParameters
{
  id v3 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  id v4 = objc_alloc_init((Class)GEORPFeedbackSubmissionParameters);
  id v5 = [(RAPReport *)self initialQuestion];
  [v5 _fillSubmissionParameters:v4];

  [v3 setSubmissionParameters:v4];
  return v3;
}

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    id v8 = +[NSMapTable weakToStrongObjectsMapTable];
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  id v10 = [v6 copy];
  [(NSMapTable *)observers setObject:v10 forKey:v11];
}

- (void)removeObserver:(id)a3
{
}

- (void)_invokeChangeHandlers
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(NSMapTable *)self->_observers keyEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v9 = [(NSMapTable *)self->_observers objectForKey:v8];
        ((void (**)(void, RAPReport *, uint64_t))v9)[2](v9, self, v8);
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)_mapContext
{
  id v3 = [(RAPReport *)self initialQuestion];
  id v4 = [v3 _alternateMapViewContext];

  if (!v4)
  {
    id v4 = [(RAPReport *)self _context];
  }

  return v4;
}

- (id)_placeContext
{
  id v3 = [(RAPReport *)self initialQuestion];
  id v4 = [v3 _alternatePlaceContext];

  if (!v4)
  {
    id v4 = [(RAPReport *)self _context];
  }

  return v4;
}

- (id)_directionsRecording
{
  id v3 = [(RAPReport *)self initialQuestion];
  id v4 = [v3 _alternateDirectionsRecording];

  if (!v4)
  {
    id v5 = [(RAPReport *)self _context];
    id v4 = [v5 directionsRecording];
  }

  return v4;
}

- (id)_auxiliaryControlsRecording
{
  id v3 = [(RAPReport *)self initialQuestion];
  id v4 = [v3 _alternateAuxiliaryControlsRecording];

  if (!v4)
  {
    id v5 = [(RAPReport *)self _context];
    id v4 = [v5 currentlyConnectedAuxiliaryControls];
  }

  return v4;
}

- (id)_navigationSettings
{
  v2 = objc_opt_new();
  id v3 = +[MNNavigationService sharedService];
  [v2 setDistanceUnits:0];
  if (qword_10160FA50 != -1) {
    dispatch_once(&qword_10160FA50, &stru_1012F9990);
  }
  id v4 = [(id)qword_10160FA48 path];
  id v5 = (void *)_CFPreferencesCopyAppValueWithContainer();

  if (v5)
  {
    if ((_GEOConfigHasValue() & 1) == 0)
    {
      [v5 BOOLValue];
      GEOConfigSetBOOL();
    }
    uint64_t v6 = +[MSPMapsPaths mapsApplicationContainerPaths];
    [v6 homeDirectory];
    _CFPreferencesSetValueWithContainer();

    id BOOL = [v5 BOOLValue];
  }
  else
  {
    id BOOL = (id)GEOConfigGetBOOL();
  }
  id v8 = BOOL;

  [v2 setPauseSpokenAudio:v8];
  unsigned int v9 = [v3 effectiveTransportType];
  if (!v9 || v9 == 3 || v9 == 2) {
    id Integer = (id)GEOConfigGetInteger();
  }
  else {
    id Integer = 0;
  }
  [v2 setMuteSpeechOverride:[v3 voiceGuidanceLevel] != Integer];
  [v2 setSpeechEnabled:1];
  [v2 setMaxAlternateRouteCount:2];
  long long v11 = [v3 currentVoiceLanguage];
  [v2 setVoiceLanguage:v11];

  [v2 setShouldUseGuidanceEventManager:1];
  [v2 setUserPreferredTransportType:GEOGetUserPreferredTransportType()];

  return v2;
}

- (void)_prepareRequestParametersForSubmission:(id)a3
{
  id v4 = a3;
  id v5 = [v4 submissionParameters];
  uint64_t v6 = [v5 commonContext];

  if (!v6)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = [v4 submissionParameters];
    [v7 setCommonContext:v6];
  }
  id v8 = [v6 combinedUserPath];

  unsigned int v9 = [(RAPReport *)self combinedUserPath];
  long long v10 = v9;
  if (v8)
  {
    id v11 = [v9 nativePathsCount];

    if (v11)
    {
      unint64_t v12 = 0;
      do
      {
        long long v13 = [(RAPReport *)self combinedUserPath];
        id v14 = [v13 nativePathAtIndex:v12];

        v15 = [v6 combinedUserPath];
        [v15 addNativePath:v14];

        ++v12;
        objc_super v16 = [(RAPReport *)self combinedUserPath];
        id v17 = [v16 nativePathsCount];
      }
      while (v12 < (unint64_t)v17);
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v18 = [(RAPReport *)self combinedUserPath];
    long long v10 = [v18 webPaths];

    id v19 = [v10 countByEnumeratingWithState:&v82 objects:v86 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v83;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v83 != v21) {
            objc_enumerationMutation(v10);
          }
          uint64_t v23 = *(void *)(*((void *)&v82 + 1) + 8 * i);
          v24 = [v6 combinedUserPath];
          [v24 addWebPath:v23];
        }
        id v20 = [v10 countByEnumeratingWithState:&v82 objects:v86 count:16];
      }
      while (v20);
    }
  }
  else
  {
    [v6 setCombinedUserPath:v9];
  }

  v25 = +[NSTimeZone localTimeZone];
  [v6 setDeviceGmtOffset:[v25 secondsFromGMT]];

  v26 = [(RAPReport *)self _context];
  v27 = [v26 reportedPlace];
  v28 = [v27 mapItem];
  unsigned int v29 = [v28 _isMapItemTypeBrand];

  if (v29)
  {
    v30 = [v4 submissionParameters];
    v31 = [v30 commonContext];
    [v31 setPinType:8];
  }
  v32 = [(RAPReport *)self _auxiliaryControlsRecording];
  v33 = [v32 auxiliaryControls];
  id v34 = [v33 mutableCopy];
  [v6 setAuxiliaryControls:v34];

  if ([v32 hasOriginatingAuxiliaryControlIndex]) {
    [v6 setOriginatingAuxiliaryControlIndex:[v32 originatingAuxiliaryControlIndex]];
  }
  id v35 = objc_alloc_init((Class)GEORPMapLocation);
  [v6 setMapLocation:v35];
  v36 = [(RAPReport *)self _mapContext];
  v37 = [v36 mapSnapshotImageData];

  if (v37)
  {
    v38 = [RAPPhoto alloc];
    id v39 = objc_alloc((Class)UIImage);
    v40 = [v36 mapSnapshotImageData];
    id v41 = [v39 initWithData:v40];
    v42 = [(RAPPhoto *)v38 initWithPhoto:v41 date:0 location:0];

    v43 = [[RAPPhotoWithMetadata alloc] initWithRAPPhoto:v42 photoType:0];
    [(RAPReport *)self addPhotoWithMetadata:v43];
  }
  [(RAPQuestion *)self->_initialQuestion _prepareForSubmission];
  [v36 mapZoomLevel];
  *(float *)&double v44 = v44;
  [v35 setZoomLevel:v44];
  id v45 = [v36 mapType];
  v46 = [v36 mapRegion];
  [v35 _setMapType:v45 region:v46];

  v47 = [v36 mapVisibleTileSets];
  id v48 = [v47 mutableCopy];
  [v6 setVisibleTileSets:v48];

  v49 = [(RAPReport *)self _navigationSettings];
  [v6 setNavigationSettings:v49];

  [v6 setClientCreatedAt:CFAbsoluteTimeGetCurrent()];
  v50 = [(RAPReport *)self _context];
  v51 = [v50 reportedPlace];

  if (v51)
  {
    v52 = [(RAPReport *)self _context];
    v53 = [v52 reportedPlace];
    unint64_t v54 = (unint64_t)[v53 source];

    if (v54 <= 9) {
      [v6 setPinType:dword_100F72268[v54]];
    }
  }
  v55 = [(RAPReport *)self _context];
  v56 = [v55 reportedPlace];
  v57 = [v56 mapItem];
  unsigned int v58 = [v57 _isMapItemTypeBrand];

  if (v58) {
    [v6 setPinType:8];
  }
  if ([v6 pinType] == 6)
  {
    v59 = [(RAPReport *)self _context];
    v60 = [v59 reportedPlace];

    if (v60)
    {
      v61 = [v6 sourceInfo];

      if (!v61)
      {
        id v62 = objc_alloc_init((Class)GEORPSourceInfo);
        [v6 setSourceInfo:v62];
      }
      v63 = [(RAPReport *)self _context];
      v64 = [v63 reportedPlace];
      v65 = [v64 sourceApplication];
      v66 = [v6 sourceInfo];
      [v66 setSourceApplication:v65];

      v67 = [(RAPReport *)self _context];
      v68 = [v67 reportedPlace];
      v69 = [v68 sourceURL];
      v70 = [v6 sourceInfo];
      [v70 setSourceUrl:v69];
    }
  }
  v71 = [(RAPReport *)self _context];
  [v6 setIsSprMap:[v71 isSprMap]];

  v72 = [v4 submissionParameters];
  v73 = [v72 commonContext];
  id v74 = [v73 searchCommon];

  if (!v74)
  {
    id v74 = objc_alloc_init((Class)GEORPSearchCommonContext);
    v75 = [v4 submissionParameters];
    v76 = [v75 commonContext];
    [v76 setSearchCommon:v74];
  }
  v77 = [(RAPReport *)self _context];
  v78 = [v77 currentSearchString];
  [v74 setLastSearchString:v78];

  v79 = [(RAPReport *)self _context];
  v80 = [v79 currentUserTypedSearchString];
  [v74 setLastUserTypedSearchString:v80];

  v81 = [v4 submissionParameters];
  [v81 setFeedbackType];
}

- (id)devicePushToken
{
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100103FD8;
  v15 = sub_100104878;
  id v16 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007F7DEC;
  v8[3] = &unk_1012F9020;
  long long v10 = &v11;
  id v4 = v2;
  unsigned int v9 = v4;
  [v3 fetchDevicePushToken:v8];

  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  id v6 = 0;
  if (!dispatch_semaphore_wait(v4, v5)) {
    id v6 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)submitWithPrivacyRequestHandler:(id)a3 willStartSubmitting:(id)a4 didFinishSubmitting:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(RAPReport *)self updateIfNeeded];
  [(RAPReport *)self _shouldEnableCommunityID];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1007F8068;
  v24[3] = &unk_1012E5D08;
  v24[4] = self;
  uint64_t v11 = objc_retainBlock(v24);
  if ([(RAPReport *)self canCreateSubmittableProblem])
  {
    unsigned __int8 v12 = +[RAPPrivacy hasReceivedPrivacyConsent];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1007F8070;
    v20[3] = &unk_1012F98F8;
    v20[4] = self;
    id v21 = v9;
    uint64_t v13 = v11;
    id v22 = v13;
    id v23 = v10;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1007F89AC;
    v15[3] = &unk_1012F9920;
    v15[4] = self;
    id v16 = objc_retainBlock(v20);
    unsigned __int8 v19 = v12;
    id v17 = v8;
    v18 = v13;
    id v14 = v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
  }
  else
  {
    ((void (*)(void *))v11[2])(v11);
  }
}

- (BOOL)_shouldEnableCommunityID
{
  int IsEnabled_RAPCommunityID = MapsFeature_IsEnabled_RAPCommunityID();
  if (IsEnabled_RAPCommunityID)
  {
    id v4 = [(RAPReport *)self initialQuestion];
    unsigned __int8 v5 = [v4 isAnonymous];

    LOBYTE(IsEnabled_RAPCommunityID) = v5;
  }
  return IsEnabled_RAPCommunityID;
}

- (void)_buildUserInfoWithRequestParams:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RAPReport *)self _shouldEnableCommunityID])
  {
    id v8 = +[ServerEvaluationStatusMapsSync shared];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1007F8D38;
    v13[3] = &unk_1012F9970;
    id v14 = v6;
    v15 = self;
    id v16 = v7;
    [v8 fetchRAPStatusWithCompletion:v13];
  }
  else
  {
    if (sub_100523AA0())
    {
      id v9 = 0;
      id v10 = 0;
      uint64_t v11 = 0;
    }
    else
    {
      id v9 = [(RAPReport *)self devicePushToken];
      if (sub_100578E8C(@"RAPContactBackByEmailPreference") == (id)1)
      {
        id v10 = sub_100521AB8();
      }
      else
      {
        id v10 = 0;
      }
      unsigned __int8 v12 = [(RAPReport *)self preferredEmailAddress];
      uint64_t v11 = +[GEORPFeedbackUserInfo userCredentialsForContactBackEmailAddress:v10 userEnteredEmailAddress:v12 pushToken:v9];
    }
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (id)_buildRequestParamsWithError:(id *)a3
{
  id v5 = [(RAPReport *)self newFeedbackRequestParameters];
  if (!sub_100525680()
    || ([v5 submissionParameters],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isPersonalizedMapsFeedback],
        v6,
        !v7))
  {
    id v10 = [v5 submissionParameters];
    if ([v10 isDirectionsFeedback])
    {
      int v11 = sub_100524890();

      if (v11)
      {
        if (!sub_1005259FC())
        {
          id v8 = GEOErrorDomain();
          uint64_t v20 = kCFErrorDebugDescriptionKey;
          CFStringRef v9 = @"Cannot submit directions RAP due to privacy";
          goto LABEL_19;
        }
LABEL_13:
        id v14 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "RAP suppressed without user-visible error (invalid request)", buf, 2u);
        }

        id v15 = 0;
        goto LABEL_20;
      }
    }
    else
    {
    }
    unsigned __int8 v12 = [v5 submissionParameters];
    if ([v12 isTransitFeedback])
    {
      int v13 = sub_100525304();

      if (v13)
      {
        if (!sub_1005259FC())
        {
          id v8 = GEOErrorDomain();
          uint64_t v20 = kCFErrorDebugDescriptionKey;
          CFStringRef v9 = @"Cannot submit transit RAP due to privacy";
          goto LABEL_19;
        }
        goto LABEL_13;
      }
    }
    else
    {
    }
    [(RAPReport *)self _prepareRequestParametersForSubmission:v5];
    id v16 = v5;
    goto LABEL_21;
  }
  if (sub_1005259FC()) {
    goto LABEL_13;
  }
  id v8 = GEOErrorDomain();
  uint64_t v20 = kCFErrorDebugDescriptionKey;
  CFStringRef v9 = @"Cannot submit personalized Maps RAP due to privacy";
LABEL_19:
  *(void *)buf = v9;
  id v17 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v20 count:1];
  v18 = +[NSError errorWithDomain:v8 code:-10 userInfo:v17];

  id v15 = v18;
LABEL_20:
  id v16 = 0;
  *a3 = v15;
LABEL_21:

  return v16;
}

- (id)_saveRAPInfoToMapsSyncWithRequestParams:(id)a3
{
  id v4 = a3;
  id v5 = [v4 submissionParameters];
  unsigned int v6 = [v5 type];

  unsigned int v7 = 0;
  unsigned int v8 = v6;
  CFStringRef v9 = 0;
  id v10 = 0;
  switch(v8)
  {
    case 0u:
    case 1u:
    case 5u:
    case 6u:
    case 7u:
    case 0xBu:
    case 0xEu:
    case 0xFu:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
      int v11 = [(RAPReport *)self _context];
      unsigned __int8 v12 = [v11 reportedPlace];
      int v13 = [v12 mapItem];
      id v14 = [v13 _geoMapItem];

      id v10 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v14];

      goto LABEL_3;
    case 2u:
      id v15 = [v4 submissionParameters];
      id v16 = [v15 details];
      unsigned int v17 = [v16 hasPoiFeedback];

      if (!v17) {
        goto LABEL_19;
      }
      v18 = [v4 submissionParameters];
      unsigned __int8 v19 = [v18 details];
      uint64_t v20 = [v19 poiFeedback];
      goto LABEL_16;
    case 3u:
      id v21 = [v4 submissionParameters];
      id v22 = [v21 details];
      unsigned int v23 = [v22 hasTransitPoiFeedback];

      if (!v23) {
        goto LABEL_19;
      }
      v18 = [v4 submissionParameters];
      unsigned __int8 v19 = [v18 details];
      uint64_t v20 = [v19 transitPoiFeedback];
      goto LABEL_16;
    case 4u:
      v24 = [v4 submissionParameters];
      v25 = [v24 details];
      unsigned int v26 = [v25 hasAddressPointFeedback];

      if (!v26) {
        goto LABEL_19;
      }
      v18 = [v4 submissionParameters];
      unsigned __int8 v19 = [v18 details];
      uint64_t v20 = [v19 addressPointFeedback];
      goto LABEL_16;
    case 8u:
      unsigned int v7 = [(RAPReport *)self _directionsRecording];
      goto LABEL_20;
    case 9u:
      goto LABEL_22;
    case 0xAu:
      v27 = [v4 submissionParameters];
      v28 = [v27 details];
      unsigned int v29 = [v28 hasPoiEnrichmentUpdate];

      if (!v29) {
        goto LABEL_19;
      }
      v18 = [v4 submissionParameters];
      unsigned __int8 v19 = [v18 details];
      uint64_t v20 = [v19 poiEnrichmentUpdate];
      goto LABEL_16;
    case 0xCu:
      v42 = [v4 submissionParameters];
      v43 = [v42 details];
      double v44 = [v43 curatedCollectionFeedback];
      unsigned int v45 = [v44 hasCuratedCollectionContext];

      if (!v45) {
        goto LABEL_19;
      }
      id v46 = objc_alloc((Class)MKMapItemIdentifier);
      v47 = [v4 submissionParameters];
      id v48 = [v47 details];
      v49 = [v48 curatedCollectionFeedback];
      v50 = [v49 curatedCollectionContext];
      id v51 = [v50 curatedCollectionMuid];
      id v52 = [v46 initWithMUID:v51 resultProviderID:0 coordinate:MKCoordinateInvalid[0], MKCoordinateInvalid[1]];

      CFStringRef v9 = +[NSString stringWithFormat:@"%@", v52];

      unsigned int v7 = 0;
      goto LABEL_21;
    case 0xDu:
      v30 = [v4 submissionParameters];
      v31 = [v30 details];
      unsigned int v32 = [v31 hasPoiImageFeedback];

      if (v32)
      {
        v33 = [v4 submissionParameters];
        id v34 = [v33 details];
        id v35 = [v34 poiImageFeedback];
        v36 = [v35 poiImageContext];
        v37 = [v36 place];
        v38 = [v37 geoMapItem];

        id v10 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v38];

LABEL_3:
        unsigned int v7 = 0;
        CFStringRef v9 = 0;
      }
      else
      {
LABEL_19:
        unsigned int v7 = 0;
LABEL_20:
        CFStringRef v9 = 0;
LABEL_21:
        id v10 = 0;
      }
LABEL_22:
      v53 = objc_alloc_init(RapUserProfileRecord);
      [(RapUserProfileRecord *)v53 setMapItemStorage:v10];
      [(RapUserProfileRecord *)v53 setCuratedCollectionIdentifier:v9];
      [(RapUserProfileRecord *)v53 setDirections:v7];
      [(RapUserProfileRecord *)v53 setMuninViewState:0];

      return v53;
    case 0x10u:
      v18 = [v4 submissionParameters];
      unsigned __int8 v19 = [v18 details];
      uint64_t v20 = [v19 localityFeedback];
LABEL_16:
      id v39 = v20;
      v40 = [v20 place];
      id v41 = [v40 geoMapItem];

      id v10 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v41];

      goto LABEL_3;
    default:
      CFStringRef v9 = 0;
      id v10 = 0;
      goto LABEL_22;
  }
}

- (void)_anonymizePhotos:(id)a3
{
  id v4 = a3;
  [(RAPReport *)self removePhotosOfType:1];
  [(RAPReport *)self removePhotosOfType:4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 details];
  unsigned int v6 = [v5 directionsFeedback];
  unsigned int v7 = [v6 directionsCorrections];
  unsigned int v8 = [v7 instructionCorrections];

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      unsigned __int8 v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) setPhotoId:0];
        unsigned __int8 v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_anonymizeScreenshots:(id)a3
{
  id v4 = a3;
  [(RAPReport *)self removePhotosOfType:0];
  [(RAPReport *)self removePhotosOfType:5];
  [(RAPReport *)self removePhotosOfType:2];
  [(RAPReport *)self removePhotosOfType:3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  [v4 details];
  unsigned int v6 = [v5 directionsFeedback];
  unsigned int v7 = [v6 directionsCorrections];
  unsigned int v8 = [v7 instructionCorrections];

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      unsigned __int8 v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) setRouteStepScreenshotImageId:0];
        unsigned __int8 v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_anonymizeLocations:(id)a3 traits:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 clearSessionId];
  [v6 clearLocations];
  unsigned int v7 = [v5 details];
  unsigned int v8 = [v7 directionsFeedback];
  id v9 = [v8 directionsContext];

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v10 = [v9 directionsWaypointPlaceInfos];
  id v11 = [v10 countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v81;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v81 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v80 + 1) + 8 * (void)v14) clearLocations];
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v80 objects:v89 count:16];
    }
    while (v12);
  }

  long long v15 = [v9 directionsRequests];
  id v16 = [v15 count];

  if (v16)
  {
    unsigned int v17 = objc_opt_new();
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v18 = [v9 directionsRequests];
    id v19 = [v18 countByEnumeratingWithState:&v76 objects:v88 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v77;
      do
      {
        id v22 = 0;
        do
        {
          if (*(void *)v77 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = [*(id *)(*((void *)&v76 + 1) + 8 * (void)v22) copy];
          [v23 clearLocations];
          [v23 setRequestTime:0.0];
          [v17 addObject:v23];

          id v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v76 objects:v88 count:16];
      }
      while (v20);
    }

    [v9 setDirectionsRequests:v17];
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v24 = [v9 directionsResponses];
  id v25 = [v24 countByEnumeratingWithState:&v72 objects:v87 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v73;
    do
    {
      v28 = 0;
      do
      {
        if (*(void *)v73 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v72 + 1) + 8 * (void)v28) clearLocations];
        v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v72 objects:v87 count:16];
    }
    while (v26);
  }

  unsigned int v29 = [v9 startWaypoint];
  [v29 setOrigin:0];

  v30 = [v9 startWaypoint];
  [v30 setAutocompleteEntry:0];

  v31 = [v9 startWaypoint];
  [v31 setSearchString:0];

  unsigned int v32 = [v9 endWaypoint];
  [v32 setOrigin:0];

  v33 = [v9 endWaypoint];
  [v33 setAutocompleteEntry:0];

  id v34 = [v9 endWaypoint];
  [v34 setSearchString:0];

  id v35 = [v5 details];
  v36 = [v35 transitPoiFeedback];

  v37 = [v36 directionsRequests];
  id v38 = [v37 count];

  if (v38)
  {
    id v39 = objc_opt_new();
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v40 = [v36 directionsRequests];
    id v41 = [v40 countByEnumeratingWithState:&v68 objects:v86 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v69;
      do
      {
        double v44 = 0;
        do
        {
          if (*(void *)v69 != v43) {
            objc_enumerationMutation(v40);
          }
          id v45 = [*(id *)(*((void *)&v68 + 1) + 8 * (void)v44) copy];
          [v45 clearLocations];
          [v45 setRequestTime:0.0];
          [v39 addObject:v45];

          double v44 = (char *)v44 + 1;
        }
        while (v42 != v44);
        id v42 = [v40 countByEnumeratingWithState:&v68 objects:v86 count:16];
      }
      while (v42);
    }

    [v36 setDirectionsRequests:v39];
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v46 = [v36 directionsResponses];
  id v47 = [v46 countByEnumeratingWithState:&v64 objects:v85 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v65;
    do
    {
      v50 = 0;
      do
      {
        if (*(void *)v65 != v49) {
          objc_enumerationMutation(v46);
        }
        [*(id *)(*((void *)&v64 + 1) + 8 * (void)v50) clearLocations];
        v50 = (char *)v50 + 1;
      }
      while (v48 != v50);
      id v48 = [v46 countByEnumeratingWithState:&v64 objects:v85 count:16];
    }
    while (v48);
  }

  id v51 = [v5 commonContext];
  if ([v51 pinType] == 4) {
    [v51 setPinType:2];
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v52 = self->_photosWithMetadata;
  id v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v60 objects:v84 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v61;
    do
    {
      v56 = 0;
      do
      {
        if (*(void *)v61 != v55) {
          objc_enumerationMutation(v52);
        }
        [*(id *)(*((void *)&v60 + 1) + 8 * (void)v56) anonymizeLocation];
        v56 = (char *)v56 + 1;
      }
      while (v54 != v56);
      id v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v60 objects:v84 count:16];
    }
    while (v54);
  }

  if ([v5 isPersonalizedMapsFeedback])
  {
    [v51 clearUserPaths];
    [v51 addUserPath:1];
    [v51 addUserPath:7];
    [v51 addUserPath:10];
    [v51 addUserPath:10];
    v57 = [v5 details];
    unsigned int v58 = [v57 addressPointFeedback];
    [v58 setPersonalizedMaps:0];
  }
}

- (void)_anonymizeDirectionsRequestsAndResponsesIfNeeded:(id)a3
{
  id v3 = a3;
  id v4 = [v3 details];
  id v5 = [v4 directionsFeedback];
  id v6 = [v5 directionsContext];

  unsigned int v7 = [v6 directionsRequests];
  id v8 = [v7 count];

  if (v8)
  {
    if (sub_100524C0C())
    {
      [v6 setDirectionsRequests:0];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v9 = [v6 directionsWaypointPlaceInfos];
      id v10 = [v9 countByEnumeratingWithState:&v48 objects:v55 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v49;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v49 != v12) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(*((void *)&v48 + 1) + 8 * i) setPlaceRequest:0];
          }
          id v11 = [v9 countByEnumeratingWithState:&v48 objects:v55 count:16];
        }
        while (v11);
      }
    }
    else
    {
      id v9 = objc_opt_new();
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v14 = [v6 directionsRequests];
      id v15 = [v14 countByEnumeratingWithState:&v44 objects:v54 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v45;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v45 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)j) copy];
            if ((sub_10052371C() & 1) == 0) {
              [v19 clearDeviceHistoricalLocations];
            }
            [v19 clearSessionId];
            [v9 addObject:v19];
          }
          id v16 = [v14 countByEnumeratingWithState:&v44 objects:v54 count:16];
        }
        while (v16);
      }

      [v6 setDirectionsRequests:v9];
    }
  }
  if (sub_100524F88())
  {
    [v6 setDirectionsResponses:0];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v20 = [v6 directionsWaypointPlaceInfos];
    id v21 = [v20 countByEnumeratingWithState:&v40 objects:v53 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v41;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(void *)v41 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * (void)k) setPlaceResponse:0];
        }
        id v22 = [v20 countByEnumeratingWithState:&v40 objects:v53 count:16];
      }
      while (v22);
    }
  }
  id v25 = [v3 details];
  id v26 = [v25 transitPoiFeedback];

  uint64_t v27 = [v26 directionsRequests];
  id v28 = [v27 count];

  if (v28)
  {
    if (sub_100524C0C())
    {
      [v26 setDirectionsRequests:0];
    }
    else
    {
      unsigned int v29 = objc_opt_new();
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v30 = [v26 directionsRequests];
      id v31 = [v30 countByEnumeratingWithState:&v36 objects:v52 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v37;
        do
        {
          for (m = 0; m != v32; m = (char *)m + 1)
          {
            if (*(void *)v37 != v33) {
              objc_enumerationMutation(v30);
            }
            id v35 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)m) copy];
            if ((sub_10052371C() & 1) == 0) {
              [v35 clearDeviceHistoricalLocations];
            }
            [v35 clearSessionId];
            [v29 addObject:v35];
          }
          id v32 = [v30 countByEnumeratingWithState:&v36 objects:v52 count:16];
        }
        while (v32);
      }

      [v26 setDirectionsRequests:v29];
    }
  }
  if (sub_100524F88()) {
    [v26 setDirectionsResponses:0];
  }
}

- (GEORPUserPath)combinedUserPath
{
  combinedUserPath = self->_combinedUserPath;
  if (!combinedUserPath)
  {
    id v4 = (GEORPUserPath *)objc_alloc_init((Class)GEORPUserPath);
    id v5 = self->_combinedUserPath;
    self->_combinedUserPath = v4;

    combinedUserPath = self->_combinedUserPath;
  }

  return combinedUserPath;
}

- (RAPQuestion)initialQuestion
{
  return self->_initialQuestion;
}

- (RAPAppStateProtocol)_context
{
  return self->_context;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCombinedUserPath:(id)a3
{
}

- (NSString)preferredEmailAddress
{
  return self->_preferredEmailAddress;
}

- (void)setPreferredEmailAddress:(id)a3
{
}

- (NSString)previousFeedbackID
{
  return self->_previousFeedbackID;
}

- (void)setPreviousFeedbackID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousFeedbackID, 0);
  objc_storeStrong((id *)&self->_preferredEmailAddress, 0);
  objc_storeStrong((id *)&self->_combinedUserPath, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_initialQuestion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_submitter, 0);
  objc_storeStrong((id *)&self->_reportContext, 0);

  objc_storeStrong((id *)&self->_photosWithMetadata, 0);
}

@end
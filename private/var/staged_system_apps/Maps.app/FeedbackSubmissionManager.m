@interface FeedbackSubmissionManager
+ (BOOL)canHandleSessionIdentifier:(id)a3;
+ (BOOL)isStatusCodeSuccess:(int64_t)a3;
+ (id)badFeedbackResponseErrorWithCode:(int64_t)a3;
+ (id)failedToEnqueueSubmissionError;
- (FeedbackSubmissionManager)init;
- (NSProgress)currentProgress;
- (id)_feedbackUploaderForUploadPolicy:(int64_t)a3;
- (id)observers;
- (void)_logDiscardIfNeededForFeedback:(id)a3 userInfo:(id)a4 feedbackObjectToUpdate:(id)a5;
- (void)_recordRAPSubmissionID:(id)a3;
- (void)_sendTdmFraudNotificationWithFraudReportResponse:(id)a3 tdmRequestInfo:(id)a4;
- (void)_startFraudScoreExchangeIfNeededWithResponse:(id)a3 request:(id)a4;
- (void)_submitOrEnqueueFeedback:(id)a3 attachedImages:(id)a4 resolvedUserInfo:(id)a5 traits:(id)a6 debugSettings:(id)a7 uploadPolicy:(int64_t)a8 feedbackObjectToUpdate:(id)a9 completion:(id)a10;
- (void)_submitOrEnqueueFeedback:(id)a3 resolvedUserInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6 uploadPolicy:(int64_t)a7 feedbackObjectToUpdate:(id)a8 completion:(id)a9;
- (void)_updateSpamStatusWithResponse:(id)a3 request:(id)a4;
- (void)_updateUserInfo:(id)a3 requestParameters:(id)a4 completion:(id)a5;
- (void)addObserver:(id)a3;
- (void)finishedCorrectionsUploadWithResponse:(id)a3 request:(id)a4 error:(id)a5;
- (void)finishedUploadingImagesWithImageUpdate:(id)a3 correctionsRequest:(id)a4 completion:(id)a5;
- (void)removeObserver:(id)a3;
- (void)submitOrEnqueueFeedback:(id)a3 attachedImages:(id)a4 userInfo:(id)a5 traits:(id)a6 debugSettings:(id)a7 uploadPolicy:(int64_t)a8 feedbackObjectToUpdate:(id)a9 completion:(id)a10;
- (void)submitOrEnqueueFeedback:(id)a3 attachedImages:(id)a4 userInfo:(id)a5 traits:(id)a6 uploadPolicy:(int64_t)a7 feedbackObjectToUpdate:(id)a8 completion:(id)a9;
- (void)submitOrEnqueueFeedback:(id)a3 userInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6 uploadPolicy:(int64_t)a7 feedbackObjectToUpdate:(id)a8 completion:(id)a9;
- (void)updateEventsForBackgroundURLSessionWithCompletionHandler:(id)a3;
@end

@implementation FeedbackSubmissionManager

- (id)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___FeedbackSubmissionManagerObserver queue:&_dispatch_main_q];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(FeedbackSubmissionManager *)self observers];
  [v5 registerObserver:v4];
}

- (FeedbackSubmissionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)FeedbackSubmissionManager;
  v2 = [(FeedbackSubmissionManager *)&v12 init];
  if (v2)
  {
    v3 = [[InteractiveFeedbackUploader alloc] initWithUploadStepObserver:v2];
    interactiveFeedbackUploader = v2->_interactiveFeedbackUploader;
    v2->_interactiveFeedbackUploader = v3;

    id v5 = [[BackgroundFeedbackUploader alloc] initWithUploadStepObserver:v2];
    backgroundFeedbackUploader = v2->_backgroundFeedbackUploader;
    v2->_backgroundFeedbackUploader = v5;

    v7 = objc_alloc_init(FeedbackSubmissionPostActionManager);
    feedbackSubmissionPostActionManager = v2->_feedbackSubmissionPostActionManager;
    v2->_feedbackSubmissionPostActionManager = v7;

    v9 = sub_100109EF8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Initializing FeedbackSubmissionManager...", v11, 2u);
    }
  }
  return v2;
}

- (void)updateEventsForBackgroundURLSessionWithCompletionHandler:(id)a3
{
}

- (void)submitOrEnqueueFeedback:(id)a3 attachedImages:(id)a4 userInfo:(id)a5 traits:(id)a6 uploadPolicy:(int64_t)a7 feedbackObjectToUpdate:(id)a8 completion:(id)a9
{
}

- (void)submitOrEnqueueFeedback:(id)a3 attachedImages:(id)a4 userInfo:(id)a5 traits:(id)a6 debugSettings:(id)a7 uploadPolicy:(int64_t)a8 feedbackObjectToUpdate:(id)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  if ([v17 count])
  {
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100878EB4;
    v23[3] = &unk_1012FE4C0;
    objc_copyWeak(v30, &location);
    id v29 = v22;
    id v24 = v16;
    id v25 = v17;
    id v26 = v19;
    id v27 = v20;
    v30[1] = (id)a8;
    id v28 = v21;
    [(FeedbackSubmissionManager *)self _updateUserInfo:v18 requestParameters:v24 completion:v23];

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);
  }
  else
  {
    [(FeedbackSubmissionManager *)self submitOrEnqueueFeedback:v16 userInfo:v18 traits:v19 debugSettings:v20 uploadPolicy:a8 feedbackObjectToUpdate:v21 completion:v22];
  }
}

- (void)_submitOrEnqueueFeedback:(id)a3 attachedImages:(id)a4 resolvedUserInfo:(id)a5 traits:(id)a6 debugSettings:(id)a7 uploadPolicy:(int64_t)a8 feedbackObjectToUpdate:(id)a9 completion:(id)a10
{
  id v14 = a3;
  id v15 = a4;
  id v62 = a5;
  id v16 = a6;
  id v17 = a7;
  id v60 = a9;
  id v55 = a10;
  sub_100899E0C();
  id v18 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  id v19 = objc_alloc_init((Class)GEORPFeedbackImageUploadParameters);
  [v18 setImageUploadParameters:v19];

  v59 = v14;
  id v20 = [v14 submissionParameters];
  id v21 = [v20 isPOIEnrichment];
  id v22 = [v18 imageUploadParameters];
  [v22 setIsEnrichment:v21];

  long long v73 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v70 = 0u;
  id v23 = v15;
  id v24 = [v23 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v71;
    do
    {
      id v26 = 0;
      do
      {
        if (*(void *)v71 != v25) {
          objc_enumerationMutation(v23);
        }
        id v27 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v26);
        id v28 = [v18 imageUploadParameters];
        id v29 = [v27 photoMetadata];
        [v28 addImage:v29];

        id v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v23 countByEnumeratingWithState:&v70 objects:v78 count:16];
    }
    while (v24);
  }

  if ((sub_100523E1C() & 1) == 0)
  {
    v30 = +[MKMapService sharedService];
    uint64_t v31 = [v30 defaultTraitsWithTraits:v16];

    id v16 = (id)v31;
  }
  v58 = +[GEORPFeedbackRequest defaultDebugSettingsMergedWithSettings:v17];

  id v57 = [objc_alloc((Class)GEORPFeedbackRequest) initWithFeedbackRequestParameters:v18 userInfo:v62 traits:v16 debugSettings:v58];
  id v32 = [objc_alloc((Class)GEORPFeedbackRequest) initWithFeedbackRequestParameters:v59 userInfo:v62 traits:v16 debugSettings:v58];
  v33 = v32;
  if (v60)
  {
    v34 = [v32 feedbackRequestParameters];
    v35 = [v34 submissionParameters];
    v36 = [v35 clientSubmissionUuid];

    v37 = [v33 feedbackRequestParameters];
    v38 = [v37 submissionParameters];
    unsigned int v39 = [v38 hasClientSubmissionUuid];
    if (v36) {
      unsigned int v40 = v39;
    }
    else {
      unsigned int v40 = 0;
    }

    if (v40)
    {
      [(FeedbackSubmissionPostActionManager *)self->_feedbackSubmissionPostActionManager saveFeedbackObject:v60 forSubmissionIdentifier:v36];
    }
    else
    {
      v41 = sub_100109EF8();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "submissionIdentifier is nil", buf, 2u);
      }
    }
  }
  v42 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", (int)([v23 count] + 2));
  objc_storeStrong((id *)&self->_currentProgress, v42);
  v43 = sub_100109EF8();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    v44 = [v62 userCredentials];
    v45 = [v44 icloudUserPersonId];
    v46 = [v62 userCredentials];
    v47 = [v46 icloudUserMapsAuthToken];
    *(_DWORD *)buf = 138412546;
    v75 = v45;
    __int16 v76 = 2112;
    v77 = v47;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Submitting with icloud person id %@ and auth token %@", buf, 0x16u);
  }
  v48 = +[MSPFeedbackSubmissionTicket ticketForFeedbackRequest:v57 traits:v16];
  v49 = [v48 fakeProgress];
  [v42 addChild:v49 withPendingUnitCount:1];

  [(FeedbackSubmissionManager *)self _logDiscardIfNeededForFeedback:v59 userInfo:v62 feedbackObjectToUpdate:v60];
  objc_initWeak((id *)buf, self);
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100879534;
  v63[3] = &unk_1012FE538;
  objc_copyWeak(v69, (id *)buf);
  id v50 = v55;
  id v68 = v50;
  id v51 = v23;
  id v64 = v51;
  id v52 = v33;
  id v65 = v52;
  v69[1] = (id)a8;
  id v53 = v16;
  id v66 = v53;
  id v54 = v42;
  id v67 = v54;
  [v48 submitWithHandler:v63 networkActivity:0];

  objc_destroyWeak(v69);
  objc_destroyWeak((id *)buf);
}

- (void)_updateUserInfo:(id)a3 requestParameters:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (GEOConfigGetBOOL())
  {
    v10 = [v7 tdmUserInfo];
    v11 = [v10 anonymousUserId];

    if ([v11 length])
    {
      objc_super v12 = [v7 tdmUserInfo];
      v13 = [v12 baaCertificates];
      id v14 = [v13 count];

      if (v14)
      {
        id v15 = sub_100109EF8();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v16 = "Already fetched BAA certificates so early exit.";
LABEL_11:
          id v18 = v15;
          uint32_t v19 = 2;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v16, buf, v19);
        }
      }
      else
      {
        if (([v8 hasSubmissionParameters] & 1) != 0
          || ([v8 hasImageUploadParameters] & 1) != 0
          || ([v8 hasLogEventParameters] & 1) != 0)
        {
          id v20 = [v11 dataUsingEncoding:4];
          GEOConfigGetBOOL();
          GEOConfigGetDouble();
          id v21 = v7;
          id v22 = v9;
          MSPUGCFetchClientCertificate();

          goto LABEL_18;
        }
        id v15 = sub_100109EF8();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v8;
          id v16 = "Request parameters are not not writable so early exit.\n %@";
          id v18 = v15;
          uint32_t v19 = 12;
          goto LABEL_12;
        }
      }
    }
    else
    {
      id v15 = sub_100109EF8();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v16 = "No anonymous id so not fetching BAA certificates.";
        goto LABEL_11;
      }
    }

    (*((void (**)(id, id, void))v9 + 2))(v9, v7, 0);
LABEL_18:

    goto LABEL_19;
  }
  id v17 = sub_100109EF8();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "GeoConfig is disabled so not fetching BAA certificates.", buf, 2u);
  }

  (*((void (**)(id, id, void))v9 + 2))(v9, v7, 0);
LABEL_19:
}

- (void)submitOrEnqueueFeedback:(id)a3 userInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6 uploadPolicy:(int64_t)a7 feedbackObjectToUpdate:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100879F98;
  v26[3] = &unk_1012FE5B0;
  objc_copyWeak(v32, &location);
  id v21 = v20;
  id v31 = v21;
  id v22 = v15;
  id v27 = v22;
  id v23 = v17;
  id v28 = v23;
  id v24 = v18;
  id v29 = v24;
  v32[1] = (id)a7;
  id v25 = v19;
  id v30 = v25;
  [(FeedbackSubmissionManager *)self _updateUserInfo:v16 requestParameters:v22 completion:v26];

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
}

- (void)_submitOrEnqueueFeedback:(id)a3 resolvedUserInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6 uploadPolicy:(int64_t)a7 feedbackObjectToUpdate:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  id v20 = a6;
  id v21 = [(FeedbackSubmissionManager *)self _feedbackUploaderForUploadPolicy:a7];
  uint64_t v22 = +[GEORPFeedbackRequest defaultDebugSettingsMergedWithSettings:v20];

  v38 = (void *)v22;
  id v23 = [objc_alloc((Class)GEORPFeedbackRequest) initWithFeedbackRequestParameters:v15 userInfo:v16 traits:v17 debugSettings:v22];
  id v24 = v23;
  if (v18)
  {
    v36 = v21;
    id v37 = v15;
    id v25 = [v23 feedbackRequestParameters];
    id v26 = [v25 submissionParameters];
    id v27 = [v26 clientSubmissionUuid];

    id v28 = [v24 feedbackRequestParameters];
    id v29 = [v28 submissionParameters];
    unsigned int v30 = [v29 hasClientSubmissionUuid];

    if (v30 && v27)
    {
      [(FeedbackSubmissionPostActionManager *)self->_feedbackSubmissionPostActionManager saveFeedbackObject:v18 forSubmissionIdentifier:v27];
    }
    else
    {
      id v31 = sub_100109EF8();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "submissionIdentifier is nil", buf, 2u);
      }
    }
    id v21 = v36;

    id v15 = v37;
  }
  id v32 = +[NSProgress discreteProgressWithTotalUnitCount:1];
  currentProgress = self->_currentProgress;
  self->_currentProgress = v32;
  v34 = v32;

  [(FeedbackSubmissionManager *)self _logDiscardIfNeededForFeedback:v15 userInfo:v16 feedbackObjectToUpdate:v18];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10087A2D4;
  v39[3] = &unk_1012FE510;
  id v40 = v19;
  id v35 = v19;
  [v21 submitCorrectionsRequest:v24 traits:v17 parentProgress:v34 completion:v39];
}

- (void)_logDiscardIfNeededForFeedback:(id)a3 userInfo:(id)a4 feedbackObjectToUpdate:(id)a5
{
  id v18 = a3;
  id v7 = a5;
  if ([a4 hasUserCredentials]
    && [v18 hasSubmissionParameters])
  {
    id v8 = [v18 submissionParameters];
    [v8 logDiscardTriggerType];

    id v9 = sub_100109EF8();
    v10 = [v18 submissionParameters];
    v11 = [v10 clientSubmissionUuid];
    if ([v11 length])
    {
      objc_super v12 = [v18 submissionParameters];
      [v12 clientSubmissionUuid];
    }
    else
    {
      objc_super v12 = +[NSUUID UUID];
      [v12 UUIDString];
    v13 = };

    MSPUGCPerformLogDiscardForCurrentSessionWithCompletion();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v7;
      if ([v14 hasDirections])
      {
        id v15 = [v14 directions];
        unsigned int v16 = [v15 hasNavigationSessionID];

        if (v16)
        {
          id v17 = [v14 directions];
          [v17 navigationSessionID];

          MSPUGCPerformLogDiscardForSessionWithCompletion();
        }
      }
    }
  }
}

- (id)_feedbackUploaderForUploadPolicy:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v4 = 24;
  }
  else
  {
    uint64_t v4 = 16;
  }
  a2 = (SEL)*(id *)((char *)&self->super.isa + v4);
LABEL_6:
  return (id)(id)a2;
}

+ (id)failedToEnqueueSubmissionError
{
  return +[NSError errorWithDomain:@"FeedbackSubmissionManager" code:-2 userInfo:0];
}

+ (id)badFeedbackResponseErrorWithCode:(int64_t)a3
{
  return +[NSError errorWithDomain:@"FeedbackSubmissionManager" code:a3 userInfo:0];
}

+ (BOOL)isStatusCodeSuccess:(int64_t)a3
{
  return (unint64_t)(a3 - 200) < 0x64;
}

+ (BOOL)canHandleSessionIdentifier:(id)a3
{
  return [a3 isEqualToString:@"com.apple.Maps.rap.submission"];
}

- (void)finishedUploadingImagesWithImageUpdate:(id)a3 correctionsRequest:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, id))a5;
  id v9 = [v7 feedbackRequestParameters];
  v10 = [v9 submissionParameters];
  unsigned int v11 = [v10 isPOIEnrichment];

  if (v11)
  {
    objc_super v12 = [v7 feedbackRequestParameters];
    v13 = [v12 submissionParameters];
    [v13 updatePOIEnrichmentWithCloudKitReceipts:v14];
  }
  v8[2](v8, v7);
}

- (void)finishedCorrectionsUploadWithResponse:(id)a3 request:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    unsigned int v11 = [v8 feedbackResult];
    objc_super v12 = [v11 submissionResult];
    v13 = [v12 feedbackId];

    id v14 = sub_100109EF8();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Received a GEORPFeedbackResponse object feedback id %@", (uint8_t *)&v27, 0xCu);
    }

    id v15 = [v8 feedbackResult];
    unsigned int v16 = [v15 submissionResult];
    id v17 = [v16 feedbackId];
    [(FeedbackSubmissionManager *)self _recordRAPSubmissionID:v17];

    [(FeedbackSubmissionPostActionManager *)self->_feedbackSubmissionPostActionManager performActionWithFeedbackResponse:v8 feedbackRequest:v9];
    id v18 = [v9 feedbackRequestParameters];
    id v19 = [v18 submissionParameters];
    id v20 = [v19 details];
    id v21 = [v20 poiEnrichmentUpdate];

    uint64_t v22 = [v21 placeContext];
    if (v22)
    {
      id v23 = (void *)v22;
      id v24 = [v21 placeContext];
      id v25 = [v24 muid];

      if (v25) {
        [(GEOObserverHashTable *)self->_observers feedbackSubmissionManagerCompletedSubmissionWithMUID:v25 withError:0];
      }
    }
    [(FeedbackSubmissionManager *)self _startFraudScoreExchangeIfNeededWithResponse:v8 request:v9];
  }
  if ([v8 attestationNotFound])
  {
    id v26 = sub_100576E2C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Received a GEORPFeedbackResponse with attestationNotFound", (uint8_t *)&v27, 2u);
    }

    [(GEOObserverHashTable *)self->_observers submissionDidFailAttestation];
  }
}

- (void)_startFraudScoreExchangeIfNeededWithResponse:(id)a3 request:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((MapsFeature_IsEnabled_RAPCommunityID() & 1) != 0 || MapsFeature_IsEnabled_ARPCommunityID())
  {
    id v8 = [v6 feedbackResult];
    id v9 = [v8 submissionResult];
    id v10 = [v9 tdmFraudRequestInfo];

    unsigned int v11 = sub_100109EF8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "tdmFraudRequestInfo in FeedbackResponse: %@", buf, 0xCu);
    }

    if (v10)
    {
      objc_super v12 = sub_100109EF8();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Start Fraud Score Exchange Flow...", buf, 2u);
      }

      [(FeedbackSubmissionManager *)self _updateSpamStatusWithResponse:v6 request:v7];
      v13 = +[GEOUserAccountInfo primaryICloudAccount];
      id v14 = [v10 transactionId];
      id v15 = [v10 tdmNamespace];
      unsigned int v16 = [v10 fsrData];
      id v17 = [v10 keyId];
      id v18 = +[AMSFraudReportTask performFraudReportRefreshWithAccount:v13 transactionID:v14 nameSpace:v15 fsrData:v16 keyID:v17];

      id v19 = sub_100109EF8();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Send a request to get Fraud Report...", buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10087ABBC;
      v20[3] = &unk_1012FE5D8;
      objc_copyWeak(&v22, (id *)buf);
      id v21 = v10;
      [v18 resultWithCompletion:v20];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_sendTdmFraudNotificationWithFraudReportResponse:(id)a3 tdmRequestInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[MKMapService sharedService];
  id v8 = [v7 defaultTraits];

  id v9 = objc_alloc_init((Class)GEORPTdmFraudNotificationParameters);
  id v10 = [v5 anonymousId];
  [v9 setAnonymousId:v10];

  unsigned int v11 = [v6 nameSpace];
  [v9 setTdmNamespace:v11];

  objc_super v12 = [v6 finalizedElement];
  [v9 setToken:v12];

  id v13 = [v6 reportedScore];
  id v14 = [v6 newScore];

  id v15 = +[NSString stringWithFormat:@"rs=%ldns=%ld", v13, v14];;
  [v9 setFsrData:v15];

  unsigned int v16 = [v5 transactionId];

  [v9 setTransactionId:v16];
  id v17 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  [v17 setTdmFraudNotificationParameters:v9];
  id v18 = [objc_alloc((Class)GEORPFeedbackRequest) initWithFeedbackRequestParameters:v17 userInfo:0 traits:v8 debugSettings:0];
  id v19 = sub_100109EF8();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Send TDM Fraud Notification... requestParams: %@", buf, 0xCu);
  }

  id v20 = +[MSPFeedbackSubmissionTicket ticketForFeedbackRequest:v18 traits:v8];
  [v20 submitWithHandler:&stru_1012FE618 networkActivity:0];
}

- (void)_updateSpamStatusWithResponse:(id)a3 request:(id)a4
{
  id v14 = a4;
  id v5 = [a3 feedbackResult];
  id v6 = [v5 submissionResult];
  id v7 = [v6 tdmFraudRequestInfo];

  if ([v7 hasTdmUserMapsStatus]
    && [v14 feedbackRequestType] == 1)
  {
    unsigned int v8 = [v14 isPOIEnrichment];
    id v9 = +[ServerEvaluationStatusMapsSync shared];
    id v10 = [v7 tdmUserMapsStatus];
    id v11 = [v10 isBlocked];
    objc_super v12 = [v7 tdmUserMapsStatus];
    id v13 = [v12 isTrusted];
    if (v8) {
      [v9 setARPStatusWithIsBlocked:v11 isTrusted:v13 completion:0];
    }
    else {
      [v9 setRAPStatusWithIsBlocked:v11 isTrusted:v13 completion:0];
    }
  }
}

- (void)_recordRAPSubmissionID:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v14 = +[NSUserDefaults standardUserDefaults];
    uint64_t v4 = [v14 mutableArrayValueForKey:@"RAPPreviouslySubmittedProblemIDs"];
    [v4 insertObject:v3 atIndex:0];
    id v5 = [v14 mutableArrayValueForKey:@"RAPPreviouslySubmittedProblemURLs"];
    id v6 = GEOURLString();
    id v7 = +[NSURL URLWithString:v6];

    unsigned int v8 = [v7 host];
    id v9 = [v8 stringByReplacingOccurrencesOfString:@"sundew" withString:@"bluegrass"];
    id v10 = [v9 stringByReplacingOccurrencesOfString:@"ls" withString:@"geo"];
    id v11 = +[NSString stringWithFormat:@"https://%@/raps/%@", v10, v3];
    [v5 insertObject:v11 atIndex:0];
    [v4 trimToLength:5];
    [v5 trimToLength:5];
    [v14 setObject:v3 forKey:@"RAPLastSubmittedProblemID"];

    objc_super v12 = +[NSArray arrayWithArray:v5];
    [v14 setObject:v12 forKey:@"RAPPreviouslySubmittedProblemURLs"];

    id v13 = +[NSArray arrayWithArray:v4];
    [v14 setObject:v13 forKey:@"RAPPreviouslySubmittedProblemIDs"];

    [v14 synchronize];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(FeedbackSubmissionManager *)self observers];
  [v5 unregisterObserver:v4];
}

- (NSProgress)currentProgress
{
  return self->_currentProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentProgress, 0);
  objc_storeStrong((id *)&self->_feedbackSubmissionPostActionManager, 0);
  objc_storeStrong((id *)&self->_backgroundFeedbackUploader, 0);
  objc_storeStrong((id *)&self->_interactiveFeedbackUploader, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end
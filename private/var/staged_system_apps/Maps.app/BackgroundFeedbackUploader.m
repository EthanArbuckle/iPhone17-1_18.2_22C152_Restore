@interface BackgroundFeedbackUploader
+ (id)resubmissionDateWithRetryCount:(int64_t)a3;
- (BOOL)_saveAttachedImages:(id)a3 andUpdateCorrectionsRequest:(id)a4 withImageUploadInfoResult:(id)a5 submissionIdentifier:(id)a6;
- (BOOL)_saveCorrections:(id)a3 submissionIdentifier:(id)a4 addARPCHeaders:(BOOL)a5;
- (BackgroundFeedbackUploader)initWithUploadStepObserver:(id)a3;
- (FeedbackUploaderStepObserver)uploadStepObserver;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_dispatchCorrectionsUploadForSubmissionIdentifier:(id)a3 newRetryCount:(int64_t)a4 isPOIEnrichment:(BOOL)a5;
- (void)_dispatchImageUploadForImageURL:(id)a3 submissionIdentifier:(id)a4 clientImageIdentifier:(id)a5 httpType:(id)a6 newRetryCount:(int64_t)a7;
- (void)_handleCorrectionsResponse:(id)a3 withData:(id)a4 withTaskDescription:(id)a5;
- (void)_handleCorrectionsResubmissionWithSubmissionIdentifier:(id)a3 newRetryCount:(int64_t)a4;
- (void)_handleCorrectionsUploadTask:(id)a3 withSessionError:(id)a4;
- (void)_handleImageResubmissionWithUploadURL:(id)a3 submissionIdentifier:(id)a4 imageIdentifier:(id)a5 httpType:(id)a6 newRetryCount:(int64_t)a7;
- (void)_handleImageUploadResponse:(id)a3 withData:(id)a4 withTaskDescription:(id)a5;
- (void)_handleImageUploadTask:(id)a3 withSessionError:(id)a4;
- (void)_logResponse:(id)a3;
- (void)getSessionWithCompletionHandler:(id)a3;
- (void)imageStorage:(id)a3 didFinishRemovingAllImagesForClientSubmissionIdentifier:(id)a4;
- (void)setUploadStepObserver:(id)a3;
- (void)submitCorrectionsRequest:(id)a3 traits:(id)a4 parentProgress:(id)a5 completion:(id)a6;
- (void)submitPhotosWithMetadata:(id)a3 withImageUploadResult:(id)a4 withCorrectionsRequest:(id)a5 traits:(id)a6 parentProgress:(id)a7 completion:(id)a8;
- (void)updateEventsForBackgroundURLSessionWithCompletionHandler:(id)a3;
@end

@implementation BackgroundFeedbackUploader

- (BackgroundFeedbackUploader)initWithUploadStepObserver:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BackgroundFeedbackUploader;
  v5 = [(BackgroundFeedbackUploader *)&v16 init];
  if (v5)
  {
    v6 = objc_alloc_init(RAPCorrectionsStorage);
    correctionsStorage = v5->_correctionsStorage;
    v5->_correctionsStorage = v6;

    v8 = [[RAPImageStorage alloc] initWithDelegate:v5];
    imageStorage = v5->_imageStorage;
    v5->_imageStorage = v8;

    v10 = objc_alloc_init(RAPImageResponseStorage);
    imageResponseStorage = v5->_imageResponseStorage;
    v5->_imageResponseStorage = v10;

    objc_storeWeak((id *)&v5->_uploadStepObserver, v4);
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("BackgroundFeedbackUploader.sessionQueue", v12);
    sessionQueue = v5->_sessionQueue;
    v5->_sessionQueue = (OS_dispatch_queue *)v13;
  }
  return v5;
}

- (void)submitCorrectionsRequest:(id)a3 traits:(id)a4 parentProgress:(id)a5 completion:(id)a6
{
  id v8 = a3;
  v9 = (void (**)(id, void, void *))a6;
  v10 = [v8 feedbackRequestParameters];
  v11 = [v10 submissionParameters];
  v12 = [v11 clientSubmissionUuid];

  dispatch_queue_t v13 = [v8 feedbackRequestParameters];
  v14 = [v13 submissionParameters];
  unsigned int v15 = [v14 hasClientSubmissionUuid];

  if (v15 && v12)
  {
    if ([(BackgroundFeedbackUploader *)self _saveCorrections:v8 submissionIdentifier:v12 addARPCHeaders:1])
    {
      -[BackgroundFeedbackUploader _dispatchCorrectionsUploadForSubmissionIdentifier:newRetryCount:isPOIEnrichment:](self, "_dispatchCorrectionsUploadForSubmissionIdentifier:newRetryCount:isPOIEnrichment:", v12, 0, [v8 isPOIEnrichment]);
      objc_super v16 = 0;
      if (!v9) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else
  {
    v17 = sub_100109EF8();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [v8 feedbackRequestParameters];
      v19 = [v18 submissionParameters];
      int v20 = 138412290;
      v21 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "submissionIdentifier is nil, please check submissionParameters: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  objc_super v16 = +[FeedbackSubmissionManager failedToEnqueueSubmissionError];
  if (v9) {
LABEL_10:
  }
    v9[2](v9, 0, v16);
LABEL_11:
}

- (void)submitPhotosWithMetadata:(id)a3 withImageUploadResult:(id)a4 withCorrectionsRequest:(id)a5 traits:(id)a6 parentProgress:(id)a7 completion:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  unsigned int v15 = (void (**)(id, void, void *))a8;
  objc_super v16 = [v14 feedbackRequestParameters];
  v17 = [v16 submissionParameters];
  v18 = [v17 clientSubmissionUuid];

  v19 = [v14 feedbackRequestParameters];
  int v20 = [v19 submissionParameters];
  unsigned int v21 = [v20 hasClientSubmissionUuid];

  if (!v21 || !v18)
  {
    v34 = sub_100109EF8();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = [v14 feedbackRequestParameters];
      v36 = [v35 submissionParameters];
      *(_DWORD *)buf = 138412290;
      v46 = v36;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "submissionIdentifier is nil, please check submissionParameters: %@", buf, 0xCu);
    }
LABEL_17:
    v33 = +[FeedbackSubmissionManager failedToEnqueueSubmissionError];
    if (!v15) {
      goto LABEL_19;
    }
LABEL_18:
    v15[2](v15, 0, v33);
    goto LABEL_19;
  }
  unsigned int v22 = [(BackgroundFeedbackUploader *)self _saveAttachedImages:v12 andUpdateCorrectionsRequest:v14 withImageUploadInfoResult:v13 submissionIdentifier:v18];
  unsigned __int8 v23 = [(BackgroundFeedbackUploader *)self _saveCorrections:v14 submissionIdentifier:v18 addARPCHeaders:0];
  if (!v22 || (v23 & 1) == 0) {
    goto LABEL_17;
  }
  v37 = v15;
  id v38 = v13;
  id v39 = v12;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v24 = [v13 imageUploadInfos];
  id v25 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v41;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v30 = [v29 imageUploadUrl];
        v31 = [v29 clientImageUuid];
        v32 = [v29 imageUploadHttpMethod];
        [(BackgroundFeedbackUploader *)self _dispatchImageUploadForImageURL:v30 submissionIdentifier:v18 clientImageIdentifier:v31 httpType:v32 newRetryCount:0];
      }
      id v26 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v26);
  }

  v33 = 0;
  id v13 = v38;
  id v12 = v39;
  unsigned int v15 = v37;
  if (v37) {
    goto LABEL_18;
  }
LABEL_19:
}

- (BOOL)_saveCorrections:(id)a3 submissionIdentifier:(id)a4 addARPCHeaders:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 data];
  v11 = (void *)v10;
  if (!v5)
  {
    id v13 = (id)v10;
    goto LABEL_7;
  }
  unsigned __int8 v23 = (void *)v10;
  int v12 = GEOCreateBodyDataForProtocolBufferRequest();
  id v13 = v23;

  id v14 = sub_100109EF8();
  unsigned int v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Successfully created data for protobuf %@", buf, 0xCu);
    }

LABEL_7:
    BOOL v16 = [(RAPCorrectionsStorage *)self->_correctionsStorage saveCorrections:v13 forSubmissionIdentifier:v9];
    v17 = sub_100109EF8();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v9;
        v19 = "Successfully saved protobuf to disk %@";
        int v20 = v18;
        os_log_type_t v21 = OS_LOG_TYPE_INFO;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v9;
      v19 = "Failed to save protobuf to disk %@";
      int v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }

    +[UGCSubmissionStorage setMUIDAndSubmissionIdentifierWithCorrectionsRequest:v8];
    goto LABEL_17;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to add ARPC headers for protobuf %@", buf, 0xCu);
  }

  LOBYTE(v16) = 0;
LABEL_17:

  return v16;
}

- (BOOL)_saveAttachedImages:(id)a3 andUpdateCorrectionsRequest:(id)a4 withImageUploadInfoResult:(id)a5 submissionIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100779D00;
  v15[3] = &unk_1012F8108;
  v15[4] = self;
  id v13 = a6;
  id v16 = v13;
  v17 = &v18;
  [v12 enumerateAndMatchPhotosWithMetadata:v10 withBlock:v15];
  LOBYTE(self) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)self;
}

+ (id)resubmissionDateWithRetryCount:(int64_t)a3
{
  GEOConfigGetDouble();
  double v5 = pow(v4, (double)a3);
  v6 = +[NSDate date];
  v7 = [v6 dateByAddingTimeInterval:v5];

  return v7;
}

- (void)updateEventsForBackgroundURLSessionWithCompletionHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100779F98;
  v4[3] = &unk_1012F8158;
  double v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BackgroundFeedbackUploader *)v5 getSessionWithCompletionHandler:v4];
}

- (void)getSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10077A32C;
  v7[3] = &unk_1012E76E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionQueue, v7);
}

- (void)imageStorage:(id)a3 didFinishRemovingAllImagesForClientSubmissionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100109EF8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Removed all image storage for %@", buf, 0xCu);
  }

  id v9 = [(RAPCorrectionsStorage *)self->_correctionsStorage correctionsDataForSubmissionIdentifier:v7];
  id v10 = [objc_alloc((Class)GEORPFeedbackRequest) initWithData:v9];
  id v11 = [(RAPImageResponseStorage *)self->_imageResponseStorage fetchImageUploadObjectsForSubmissionIdentifier:v7];
  id v12 = sub_100109EF8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [v11 count];
    *(_DWORD *)buf = 134217984;
    id v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Received %lu number of image upload data", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uploadStepObserver);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10077A63C;
  v16[3] = &unk_1012F8180;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v7;
  id v17 = v15;
  [WeakRetained finishedUploadingImagesWithImageUpdate:v11 correctionsRequest:v10 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 taskDescription];
  uint64_t v10 = sub_1008CEFB0(v9);

  if (v10 == 2)
  {
    [(BackgroundFeedbackUploader *)self _handleCorrectionsUploadTask:v7 withSessionError:v8];
  }
  else if (v10 == 1)
  {
    [(BackgroundFeedbackUploader *)self _handleImageUploadTask:v7 withSessionError:v8];
  }
  else
  {
    id v11 = sub_100109EF8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v7 taskDescription];
      int v13 = 138412290;
      id v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to submit task with description %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_handleImageUploadTask:(id)a3 withSessionError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v34 = -1;
  id v8 = [v6 taskDescription];
  v32 = &stru_101324E70;
  v33 = &stru_101324E70;
  v31 = @"PUT";
  char v9 = sub_1008CF164(v8, &v33, &v32, &v31, &v34);
  uint64_t v10 = v33;
  id v11 = v32;
  id v12 = v31;

  if (v9)
  {
    uint64_t v13 = v34 + 1;
    id v14 = sub_100109EF8();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v36 = v10;
      __int16 v37 = 2112;
      id v38 = v11;
      __int16 v39 = 2048;
      uint64_t v40 = v34;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "An image upload task with client uuid %@ and image uuid %@ completed and number of retries %ld", buf, 0x20u);
    }

    if (v7)
    {
      id v15 = [v6 originalRequest];
      id v16 = [v15 URL];
      id v17 = [v16 absoluteString];

      id v18 = sub_100109EF8();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v36 = (__CFString *)v17;
        __int16 v37 = 2112;
        id v38 = v7;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Image upload task failed to submit to url %@ with error %@", buf, 0x16u);
      }

      [(BackgroundFeedbackUploader *)self _handleImageResubmissionWithUploadURL:v17 submissionIdentifier:v10 imageIdentifier:v11 httpType:v12 newRetryCount:v13];
      goto LABEL_21;
    }
    id v17 = [v6 response];
    if (!+[FeedbackSubmissionManager isStatusCodeSuccess:[v17 statusCode]])
    {
      uint64_t v30 = v13;
      id v26 = [v6 originalRequest];
      uint64_t v27 = [v26 URL];
      unsigned int v22 = [v27 absoluteString];

      v28 = sub_100109EF8();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = (__CFString *)[v17 statusCode];
        *(_DWORD *)buf = 134218242;
        v36 = v29;
        __int16 v37 = 2112;
        id v38 = v22;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Status code error for %lu for image url %@, so dispatching again", buf, 0x16u);
      }

      [(BackgroundFeedbackUploader *)self _handleImageResubmissionWithUploadURL:v22 submissionIdentifier:v10 imageIdentifier:v11 httpType:v12 newRetryCount:v30];
      goto LABEL_20;
    }
    [(BackgroundFeedbackUploader *)self _logResponse:v17];
    unsigned int v20 = [(RAPImageStorage *)self->_imageStorage removeImageForSubmissionIdentifier:v10 imageIdentifier:v11];
    char v21 = sub_100109EF8();
    unsigned int v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v11;
        unsigned __int8 v23 = "Successfully deleted image %@";
        v24 = v22;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v11;
      unsigned __int8 v23 = "Failed to delete image %@";
      v24 = v22;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  id v17 = sub_100109EF8();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v19 = [v6 taskDescription];
    *(_DWORD *)buf = 138412290;
    v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to parse task description %@", buf, 0xCu);
  }
LABEL_21:
}

- (void)_handleImageResubmissionWithUploadURL:(id)a3 submissionIdentifier:(id)a4 imageIdentifier:(id)a5 httpType:(id)a6 newRetryCount:(int64_t)a7
{
  id v17 = a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = +[RAPImageStorage filePathForSubmissionIdentifier:v14 imageIdentifier:v13];
  id v16 = +[BackgroundFeedbackUploader resubmissionDateWithRetryCount:a7];
  if (+[RAPFileManager haveContentsOfFilePathExpired:v15 withSuggestedRetryDate:v16])
  {
    [(RAPImageStorage *)self->_imageStorage removeImageForSubmissionIdentifier:v14 imageIdentifier:v13];
  }
  else
  {
    [(BackgroundFeedbackUploader *)self _dispatchImageUploadForImageURL:v17 submissionIdentifier:v14 clientImageIdentifier:v13 httpType:v12 newRetryCount:a7];
  }
}

- (void)_handleCorrectionsUploadTask:(id)a3 withSessionError:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  uint64_t v24 = -1;
  id v8 = [v6 taskDescription];
  unsigned __int8 v23 = &stru_101324E70;
  char v9 = sub_1008CF2F4(v8, &v23, &v24);
  uint64_t v10 = v23;

  id v11 = sub_100109EF8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Submission Finished... Received a corrections upload task %@", buf, 0xCu);
  }

  if (v9)
  {
    uint64_t v12 = v24 + 1;
    if (v7)
    {
      id v13 = sub_100109EF8();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Corrections upload task failed with error %@", buf, 0xCu);
      }

      [(BackgroundFeedbackUploader *)self _handleCorrectionsResubmissionWithSubmissionIdentifier:v10 newRetryCount:v12];
      goto LABEL_21;
    }
    id v16 = [v6 response];
    [(BackgroundFeedbackUploader *)self _logResponse:v16];
    if (!+[FeedbackSubmissionManager isStatusCodeSuccess:](FeedbackSubmissionManager, "isStatusCodeSuccess:", [v16 statusCode]))
    {
      [(BackgroundFeedbackUploader *)self _handleCorrectionsResubmissionWithSubmissionIdentifier:v10 newRetryCount:v12];
LABEL_20:

      goto LABEL_21;
    }
    unsigned int v17 = [(RAPCorrectionsStorage *)self->_correctionsStorage removeCorrectionDataForSubmissionIdentifier:v10];
    id v18 = sub_100109EF8();
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v10;
        unsigned int v20 = "Successfully deleted corrections object %@";
        char v21 = v19;
        os_log_type_t v22 = OS_LOG_TYPE_INFO;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v10;
      unsigned int v20 = "Failed to delete corrections object %@";
      char v21 = v19;
      os_log_type_t v22 = OS_LOG_TYPE_ERROR;
      goto LABEL_18;
    }

    goto LABEL_20;
  }
  id v14 = sub_100109EF8();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = [v6 taskDescription];
    *(_DWORD *)buf = 138412290;
    id v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse task description %@", buf, 0xCu);
  }
LABEL_21:
}

- (void)_handleCorrectionsResubmissionWithSubmissionIdentifier:(id)a3 newRetryCount:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:v6];
  id v8 = +[BackgroundFeedbackUploader resubmissionDateWithRetryCount:a4];
  unsigned int v9 = +[RAPFileManager haveContentsOfFilePathExpired:v7 withSuggestedRetryDate:v8];
  correctionsStorage = self->_correctionsStorage;
  if (!v9)
  {
    id v11 = [(RAPCorrectionsStorage *)correctionsStorage correctionsDataForSubmissionIdentifier:v6];
    v36 = (objc_class *)objc_opt_class();
    id v12 = v11;
    id v13 = [objc_alloc((Class)PBDataReader) initWithData:v12];
    if ([v13 readBigEndianFixed16]
      && [v13 readBigEndianFixed32])
    {
      id v14 = [v13 readProtoBuffer];
      id v15 = [objc_alloc((Class)PBDataReader) initWithData:v14];
      if ([(objc_class *)v36 isValid:v13])
      {
        id v16 = objc_alloc_init(v36);
        [v16 readFrom:v15];
LABEL_40:

        -[BackgroundFeedbackUploader _dispatchCorrectionsUploadForSubmissionIdentifier:newRetryCount:isPOIEnrichment:](self, "_dispatchCorrectionsUploadForSubmissionIdentifier:newRetryCount:isPOIEnrichment:", v6, a4, [v16 isPOIEnrichment]);
        goto LABEL_41;
      }
      id v37 = v14;
      id v34 = v12;
      id v23 = [objc_alloc((Class)PBDataReader) initWithData:v34];
      GEOAlwaysUseV2PreambleForRequestKind();
      uint64_t v24 = GEOProtocolBufferRequestPreamble();
      id v25 = [v23 readBytes:[v24 length]];

      v33 = v23;
      if ([v23 hasError])
      {
        id v26 = sub_100109EF8();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v44 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to parse the preamble (ARP)", v44, 2u);
        }
        id v16 = 0;
      }
      else
      {
        [v23 readBigEndianFixed32];
        if ([v23 hasError])
        {
          id v26 = sub_100109EF8();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long v43 = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to parse request type (ARP)", v43, 2u);
          }
          id v16 = 0;
        }
        else
        {
          uint64_t v32 = [v23 readProtoBuffer];
          id v31 = [objc_alloc((Class)PBDataReader) initWithData:v32];
          if ([(objc_class *)v36 isValid:v23])
          {
            id v16 = objc_alloc_init(v36);
            [v16 readFrom:v31];
            v29 = v31;
            id v26 = v32;
          }
          else
          {
            uint64_t v30 = sub_100109EF8();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long v42 = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", v42, 2u);
            }

            id v16 = 0;
            v29 = v31;
            id v26 = v32;
          }
        }
      }

LABEL_39:
      id v14 = v37;
      goto LABEL_40;
    }
    unsigned int v17 = sub_100109EF8();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to parse the preamble", buf, 2u);
    }

    id v37 = v12;
    id v15 = [objc_alloc((Class)PBDataReader) initWithData:v37];
    GEOAlwaysUseV2PreambleForRequestKind();
    id v18 = GEOProtocolBufferRequestPreamble();
    id v19 = [v15 readBytes:[v18 length]];

    if ([v15 hasError])
    {
      unsigned int v20 = sub_100109EF8();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int16 v41 = 0;
        char v21 = "Failed to parse the preamble (ARP)";
        os_log_type_t v22 = (uint8_t *)&v41;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, v22, 2u);
      }
    }
    else
    {
      [v15 readBigEndianFixed32];
      if (![v15 hasError])
      {
        id v35 = v13;
        unsigned int v20 = [v15 readProtoBuffer];
        id v27 = [objc_alloc((Class)PBDataReader) initWithData:v20];
        if ([(objc_class *)v36 isValid:v15])
        {
          id v16 = objc_alloc_init(v36);
          [v16 readFrom:v27];
        }
        else
        {
          v28 = sub_100109EF8();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)__int16 v39 = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", v39, 2u);
          }

          id v16 = 0;
        }

        id v13 = v35;
        goto LABEL_31;
      }
      unsigned int v20 = sub_100109EF8();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v40 = 0;
        char v21 = "Failed to parse request type (ARP)";
        os_log_type_t v22 = v40;
        goto LABEL_15;
      }
    }
    id v16 = 0;
LABEL_31:

    goto LABEL_39;
  }
  [(RAPCorrectionsStorage *)correctionsStorage removeCorrectionDataForSubmissionIdentifier:v6];
LABEL_41:
}

- (void)_logResponse:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[FeedbackSubmissionManager isStatusCodeSuccess:](FeedbackSubmissionManager, "isStatusCodeSuccess:", [v3 statusCode]);
  double v5 = sub_100109EF8();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      id v11 = [v3 statusCode];
      id v7 = "The status code is good %lu";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v10 = 134217984;
    id v11 = [v3 statusCode];
    id v7 = "The status code is bad and we cannot recover %lu";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

- (void)_dispatchImageUploadForImageURL:(id)a3 submissionIdentifier:(id)a4 clientImageIdentifier:(id)a5 httpType:(id)a6 newRetryCount:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = +[RAPImageStorage filePathForSubmissionIdentifier:v13 imageIdentifier:v14];
  unsigned int v17 = +[NSURL URLWithString:v12];
  id v18 = +[NSMutableURLRequest requestWithURL:v17];

  [v18 setHTTPMethod:v15];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10077B87C;
  v25[3] = &unk_1012F81A8;
  id v26 = v18;
  id v27 = v16;
  id v28 = v13;
  id v29 = v14;
  id v31 = v12;
  int64_t v32 = a7;
  id v30 = v15;
  id v19 = v12;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v16;
  id v24 = v18;
  [(BackgroundFeedbackUploader *)self getSessionWithCompletionHandler:v25];
}

- (void)_dispatchCorrectionsUploadForSubmissionIdentifier:(id)a3 newRetryCount:(int64_t)a4 isPOIEnrichment:(BOOL)a5
{
  id v7 = a3;
  id v8 = +[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:v7];
  os_log_type_t v9 = sub_100109EF8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = GEOURLString();
    *(_DWORD *)buf = 138412290;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Choosing url %@", buf, 0xCu);
  }
  id v11 = GEOGetURL();
  id v12 = +[NSMutableURLRequest requestWithURL:v11];
  [v12 setHTTPMethod:@"POST"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10077BBB0;
  v17[3] = &unk_1012F81D0;
  id v18 = v12;
  id v19 = v8;
  id v21 = v11;
  int64_t v22 = a4;
  id v20 = v7;
  id v13 = v11;
  id v14 = v7;
  id v15 = v8;
  id v16 = v12;
  [(BackgroundFeedbackUploader *)self getSessionWithCompletionHandler:v17];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  os_log_type_t v9 = [v8 taskDescription];
  int v10 = sub_100109EF8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 134218242;
    id v14 = [v7 length];
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Did receive data of length %lu from task with description identifier %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v11 = sub_1008CEFB0(v9);
  id v12 = [v8 response];

  if (v11 == 2)
  {
    [(BackgroundFeedbackUploader *)self _handleCorrectionsResponse:v12 withData:v7 withTaskDescription:v9];
  }
  else if (v11 == 1)
  {
    [(BackgroundFeedbackUploader *)self _handleImageUploadResponse:v12 withData:v7 withTaskDescription:v9];
  }
}

- (void)_handleImageUploadResponse:(id)a3 withData:(id)a4 withTaskDescription:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (+[FeedbackSubmissionManager isStatusCodeSuccess:](FeedbackSubmissionManager, "isStatusCodeSuccess:", [a3 statusCode]))
  {
    id v30 = 0;
    int v10 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:&v30];
    uint64_t v11 = v30;
    id v12 = sub_100109EF8();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Did receive json object", buf, 2u);
    }

    int v13 = sub_100109EF8();
    id v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v32 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse json object with error %@.  Probably means that we shouldn't include this in the final submission.  Bailing...", buf, 0xCu);
      }
      goto LABEL_22;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Did receive json object %@", buf, 0xCu);
    }

    id v28 = 0;
    uint64_t v29 = -1;
    id v26 = 0;
    id v27 = 0;
    int v15 = sub_1008CF164(v9, &v28, &v27, &v26, &v29);
    id v14 = v28;
    id v16 = v27;
    id v17 = v26;
    id v18 = sub_100109EF8();
    id v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Successfully parsed image upload task description for CloudKit receipt response", buf, 2u);
      }

      unsigned int v20 = [(RAPImageResponseStorage *)self->_imageResponseStorage saveResponseData:v8 forSubmissionIdentifier:v14 imageIdentifier:v16];
      id v21 = sub_100109EF8();
      id v19 = v21;
      if (v20)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          int64_t v32 = v14;
          __int16 v33 = 2112;
          id v34 = v16;
          int64_t v22 = "Successfully saved CloudKit receipt for submission identifier %@ and image identifier %@";
          id v23 = v19;
          os_log_type_t v24 = OS_LOG_TYPE_INFO;
LABEL_19:
          uint32_t v25 = 22;
          goto LABEL_20;
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        int64_t v32 = v14;
        __int16 v33 = 2112;
        id v34 = v16;
        int64_t v22 = "Failed to save CloudKit receipt for submission identifier %@ and image identifier %@";
        id v23 = v19;
        os_log_type_t v24 = OS_LOG_TYPE_ERROR;
        goto LABEL_19;
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int64_t v22 = "Failed to parse image upload task description for CloudKit receipt response";
      id v23 = v19;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
      uint32_t v25 = 2;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v23, v24, v22, buf, v25);
    }

LABEL_22:
  }
}

- (void)_handleCorrectionsResponse:(id)a3 withData:(id)a4 withTaskDescription:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!+[FeedbackSubmissionManager isStatusCodeSuccess:](FeedbackSubmissionManager, "isStatusCodeSuccess:", [a3 statusCode]))goto LABEL_80; {
  int v10 = (objc_class *)objc_opt_class();
  }
  id v59 = v8;
  id v11 = v8;
  id v12 = [objc_alloc((Class)PBDataReader) initWithData:v11];
  v60 = self;
  if (![v12 readBigEndianFixed16]
    || ![v12 readBigEndianFixed32])
  {
    id v16 = sub_100109EF8();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to parse the preamble", buf, 2u);
    }

    id v13 = v11;
    id v14 = [objc_alloc((Class)PBDataReader) initWithData:v13];
    GEOAlwaysUseV2PreambleForRequestKind();
    id v17 = GEOProtocolBufferRequestPreamble();
    id v18 = [v14 readBytes:[v17 length]];

    if ([v14 hasError])
    {
      id v19 = sub_100109EF8();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        unsigned int v20 = "Failed to parse the preamble (ARP)";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
      }
    }
    else
    {
      [v14 readBigEndianFixed32];
      if (![v14 hasError])
      {
        id v19 = [v14 readProtoBuffer];
        id v27 = [objc_alloc((Class)PBDataReader) initWithData:v19];
        if ([(objc_class *)v10 isValid:v14])
        {
          id v15 = objc_alloc_init(v10);
          [v15 readFrom:v27];
        }
        else
        {
          id v28 = sub_100109EF8();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", buf, 2u);
          }

          id v15 = 0;
        }

        goto LABEL_30;
      }
      id v19 = sub_100109EF8();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        unsigned int v20 = "Failed to parse request type (ARP)";
        goto LABEL_14;
      }
    }
    id v15 = 0;
LABEL_30:

    goto LABEL_38;
  }
  id v13 = [v12 readProtoBuffer];
  id v14 = [objc_alloc((Class)PBDataReader) initWithData:v13];
  if (([(objc_class *)v10 isValid:v12] & 1) == 0)
  {
    id v21 = v11;
    id v22 = [objc_alloc((Class)PBDataReader) initWithData:v21];
    GEOAlwaysUseV2PreambleForRequestKind();
    id v23 = GEOProtocolBufferRequestPreamble();
    id v24 = [v22 readBytes:[v23 length]];

    if ([v22 hasError])
    {
      uint32_t v25 = sub_100109EF8();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v26 = "Failed to parse the preamble (ARP)";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
      }
    }
    else
    {
      [v22 readBigEndianFixed32];
      if (![v22 hasError])
      {
        uint32_t v25 = [v22 readProtoBuffer];
        id v29 = [objc_alloc((Class)PBDataReader) initWithData:v25];
        if ([(objc_class *)v10 isValid:v22])
        {
          id v15 = objc_alloc_init(v10);
          [v15 readFrom:v29];
        }
        else
        {
          id v30 = sub_100109EF8();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", buf, 2u);
          }

          id v15 = 0;
        }

        goto LABEL_37;
      }
      uint32_t v25 = sub_100109EF8();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v26 = "Failed to parse request type (ARP)";
        goto LABEL_24;
      }
    }
    id v15 = 0;
LABEL_37:

    self = v60;
    goto LABEL_38;
  }
  id v15 = objc_alloc_init(v10);
  [v15 readFrom:v14];
LABEL_38:

  v61 = &stru_101324E70;
  *(void *)buf = -1;
  sub_1008CF2F4(v9, &v61, buf);
  id v31 = v61;
  int64_t v32 = [(RAPCorrectionsStorage *)self->_correctionsStorage correctionsDataForSubmissionIdentifier:v31];
  __int16 v33 = (objc_class *)objc_opt_class();
  id v34 = v32;
  id v35 = [objc_alloc((Class)PBDataReader) initWithData:v34];
  if (![v35 readBigEndianFixed16]
    || ![v35 readBigEndianFixed32])
  {
    __int16 v39 = sub_100109EF8();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to parse the preamble", v63, 2u);
    }

    id v36 = v34;
    id v37 = [objc_alloc((Class)PBDataReader) initWithData:v36];
    GEOAlwaysUseV2PreambleForRequestKind();
    uint64_t v40 = GEOProtocolBufferRequestPreamble();
    id v41 = [v37 readBytes:[v40 length]];

    if ([v37 hasError])
    {
      long long v42 = sub_100109EF8();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v63 = 0;
        long long v43 = "Failed to parse the preamble (ARP)";
LABEL_50:
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v43, v63, 2u);
      }
    }
    else
    {
      [v37 readBigEndianFixed32];
      if (![v37 hasError])
      {
        long long v42 = [v37 readProtoBuffer];
        id v49 = [objc_alloc((Class)PBDataReader) initWithData:v42];
        if ([(objc_class *)v33 isValid:v37])
        {
          id v38 = objc_alloc_init(v33);
          [v38 readFrom:v49];
        }
        else
        {
          v50 = sub_100109EF8();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v63 = 0;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", v63, 2u);
          }

          id v38 = 0;
        }

        goto LABEL_66;
      }
      long long v42 = sub_100109EF8();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v63 = 0;
        long long v43 = "Failed to parse request type (ARP)";
        goto LABEL_50;
      }
    }
    id v38 = 0;
LABEL_66:

    goto LABEL_74;
  }
  id v36 = [v35 readProtoBuffer];
  id v37 = [objc_alloc((Class)PBDataReader) initWithData:v36];
  if (([(objc_class *)v33 isValid:v35] & 1) == 0)
  {
    id v58 = v34;
    id v44 = [objc_alloc((Class)PBDataReader) initWithData:v58];
    GEOAlwaysUseV2PreambleForRequestKind();
    v45 = GEOProtocolBufferRequestPreamble();
    id v46 = [v44 readBytes:[v45 length]];

    if ([v44 hasError])
    {
      v47 = sub_100109EF8();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v63 = 0;
        v48 = "Failed to parse the preamble (ARP)";
LABEL_60:
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, v48, v63, 2u);
      }
    }
    else
    {
      [v44 readBigEndianFixed32];
      if (![v44 hasError])
      {
        v47 = [v44 readProtoBuffer];
        id v57 = [objc_alloc((Class)PBDataReader) initWithData:v47];
        if ([(objc_class *)v33 isValid:v44])
        {
          id v38 = objc_alloc_init(v33);
          [v38 readFrom:v57];
        }
        else
        {
          v51 = sub_100109EF8();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v63 = 0;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", v63, 2u);
          }

          id v38 = 0;
        }

        goto LABEL_73;
      }
      v47 = sub_100109EF8();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v63 = 0;
        v48 = "Failed to parse request type (ARP)";
        goto LABEL_60;
      }
    }
    id v38 = 0;
LABEL_73:

    goto LABEL_74;
  }
  id v38 = objc_alloc_init(v33);
  [v38 readFrom:v37];
LABEL_74:

  if ([v15 status])
  {
    v52 = sub_100109EF8();
    v53 = v60;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      unsigned int v54 = [v15 status];
      *(_DWORD *)v63 = 67109120;
      unsigned int v64 = v54;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Received a GEORPFeedbackResponse object with a bad status code %d", v63, 8u);
    }

    v55 = +[FeedbackSubmissionManager badFeedbackResponseErrorWithCode:](FeedbackSubmissionManager, "badFeedbackResponseErrorWithCode:", (int)[v15 status]);
  }
  else
  {
    +[UGCSubmissionStorage removeClientSubmissionIdentifier:v31];
    v55 = 0;
    v53 = v60;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v53->_uploadStepObserver);
  [WeakRetained finishedCorrectionsUploadWithResponse:v15 request:v38 error:v55];

  id v8 = v59;
LABEL_80:
}

- (FeedbackUploaderStepObserver)uploadStepObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uploadStepObserver);

  return (FeedbackUploaderStepObserver *)WeakRetained;
}

- (void)setUploadStepObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_uploadStepObserver);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_imageResponseStorage, 0);
  objc_storeStrong((id *)&self->_imageStorage, 0);

  objc_storeStrong((id *)&self->_correctionsStorage, 0);
}

@end
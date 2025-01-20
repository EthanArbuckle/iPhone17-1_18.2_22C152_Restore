@interface InteractiveFeedbackUploader
- (FeedbackUploaderStepObserver)uploadStepObserver;
- (InteractiveFeedbackUploader)initWithUploadStepObserver:(id)a3;
- (void)_submitCorrectionsRequest:(id)a3 traits:(id)a4 parentProgress:(id)a5 completion:(id)a6;
- (void)setUploadStepObserver:(id)a3;
- (void)submitCorrectionsRequest:(id)a3 traits:(id)a4 parentProgress:(id)a5 completion:(id)a6;
- (void)submitPhotosWithMetadata:(id)a3 withImageUploadResult:(id)a4 withCorrectionsRequest:(id)a5 traits:(id)a6 parentProgress:(id)a7 completion:(id)a8;
@end

@implementation InteractiveFeedbackUploader

- (InteractiveFeedbackUploader)initWithUploadStepObserver:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)InteractiveFeedbackUploader;
  v5 = [(InteractiveFeedbackUploader *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_uploadStepObserver, v4);
    v7 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    uint64_t v8 = +[NSURLSession sessionWithConfiguration:v7];
    session = v6->_session;
    v6->_session = (NSURLSession *)v8;
  }
  return v6;
}

- (void)submitCorrectionsRequest:(id)a3 traits:(id)a4 parentProgress:(id)a5 completion:(id)a6
{
}

- (void)submitPhotosWithMetadata:(id)a3 withImageUploadResult:(id)a4 withCorrectionsRequest:(id)a5 traits:(id)a6 parentProgress:(id)a7 completion:(id)a8
{
  id v33 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = sub_100109EF8();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v33 count];
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Beginning submission with %lu images", (uint8_t *)&buf, 0xCu);
  }

  id v20 = objc_alloc_init((Class)NSMutableArray);
  id v21 = objc_alloc_init((Class)NSMutableArray);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100B6B2E0;
  v45[3] = &unk_101319630;
  group = dispatch_group_create();
  v46 = group;
  v47 = self;
  id v22 = v20;
  id v48 = v22;
  id v23 = v21;
  id v49 = v23;
  p_long long buf = &buf;
  id v24 = v17;
  id v50 = v24;
  [v14 enumerateAndMatchPhotosWithMetadata:v33 withBlock:v45];
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B6B99C;
  block[3] = &unk_101319680;
  id v41 = v18;
  v42 = &buf;
  id v35 = v14;
  id v36 = v22;
  id v25 = v22;
  id v26 = v18;
  id v27 = v14;
  objc_copyWeak(&v43, &location);
  id v37 = v23;
  id v38 = v15;
  id v39 = v16;
  id v40 = v24;
  id v28 = v24;
  id v29 = v16;
  id v30 = v15;
  id v31 = v23;
  dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
}

- (void)_submitCorrectionsRequest:(id)a3 traits:(id)a4 parentProgress:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[MSPFeedbackSubmissionTicket ticketForFeedbackRequest:v10 traits:v11];
  id v15 = [v10 feedbackRequestParameters];
  id v16 = [v15 submissionParameters];
  id v17 = [v16 clientSubmissionUuid];

  id v18 = sub_100109EF8();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v29 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Submitting corrections request with client submission identifier %@", buf, 0xCu);
  }

  v19 = [v14 fakeProgress];
  [v12 addChild:v19 withPendingUnitCount:1];

  objc_initWeak((id *)buf, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100B6BE0C;
  v23[3] = &unk_1013196A8;
  objc_copyWeak(&v27, (id *)buf);
  id v20 = v17;
  id v24 = v20;
  id v21 = v10;
  id v25 = v21;
  id v22 = v13;
  id v26 = v22;
  [v14 submitWithHandler:v23 networkActivity:0];

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
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
  objc_storeStrong((id *)&self->_correctionsTicket, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end
@interface MFMessageScreenshotGenerator
+ (OS_os_log)log;
- (MFMessageContentView)contentView;
- (MFMessageScreenshotGenerator)initWithScene:(id)a3;
- (MailScene)scene;
- (id)presentingViewControllerForMessageContentView:(id)a3;
- (void)_generateScreenshotImageForMessage:(id)a3 completion:(id)a4;
- (void)_setUpAndAddContentViewForMessage:(id)a3 configuration:(id)a4;
- (void)generateScreenshotImageForMessage:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)generateScreenshotViewForMessage:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4;
- (void)messageContentViewDidFinishLoadingMessage:(id)a3;
- (void)setScene:(id)a3;
@end

@implementation MFMessageScreenshotGenerator

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BEA5C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699B98 != -1) {
    dispatch_once(&qword_100699B98, block);
  }
  v2 = (void *)qword_100699B90;

  return (OS_os_log *)v2;
}

- (MFMessageScreenshotGenerator)initWithScene:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageScreenshotGenerator;
  v5 = [(MFMessageScreenshotGenerator *)&v9 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mobilemail.screenshotgenerator", 0);
    generationQueue = v5->_generationQueue;
    v5->_generationQueue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v5;
}

- (MFMessageContentView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = [objc_alloc((Class)MFMessageContentView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_contentView;
    self->_contentView = v4;

    [(MFMessageContentView *)self->_contentView setDelegate:self];
    contentView = self->_contentView;
  }

  return contentView;
}

- (void)generateScreenshotViewForMessage:(id)a3 configuration:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001BECAC;
  v9[3] = &unk_100605758;
  id v10 = a5;
  id v8 = v10;
  [(MFMessageScreenshotGenerator *)self generateScreenshotImageForMessage:a3 configuration:a4 completion:v9];
}

- (void)generateScreenshotImageForMessage:(id)a3 configuration:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001BEEA0;
  v10[3] = &unk_1006086B8;
  v10[4] = self;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)_generateScreenshotImageForMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  generationQueue = self->_generationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BEFA8;
  block[3] = &unk_1006061A0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(generationQueue, block);
}

- (void)_setUpAndAddContentViewForMessage:(id)a3 configuration:(id)a4
{
  id v62 = a3;
  id v7 = a4;
  if (pthread_main_np() != 1)
  {
    v57 = +[NSAssertionHandler currentHandler];
    [v57 handleFailureInMethod:a2 object:self file:@"MFMessageScreenshotGenerator.m" lineNumber:94 description:@"Current thread must be main"];
  }
  id v8 = [v62 objectID];
  v58 = [v8 description];

  [v7 size];
  double v59 = v10;
  double v60 = v9;
  [v7 margins];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v7 showSourceMailbox];
  id v19 = [v7 showBanners];
  v20 = +[MFMessageScreenshotGenerator log];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v76.double height = v59;
    v76.double width = v60;
    NSStringFromCGSize(v76);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v77.top = v12;
    v77.left = v14;
    v77.bottom = v16;
    v77.right = v18;
    NSStringFromUIEdgeInsets(v77);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = [v7 traitCollection];
    v24 = [v23 description];
    v25 = NSStringFromBOOL();
    v26 = NSStringFromBOOL();
    *(_DWORD *)buf = 138544642;
    v65 = v58;
    __int16 v66 = 2114;
    id v67 = v21;
    __int16 v68 = 2114;
    id v69 = v22;
    __int16 v70 = 2114;
    v71 = v24;
    __int16 v72 = 2114;
    v73 = v25;
    __int16 v74 = 2114;
    v75 = v26;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting setup of content view for message - libraryid=%{public}@, size=%{public}@, margins=%{public}@, %{public}@, mailboxSource=%{public}@, banners=%{public}@", buf, 0x3Eu);
  }
  kdebug_trace();
  id v61 = objc_alloc_init((Class)CNContactStore);
  v27 = +[UIApplication sharedApplication];
  v28 = [v27 accountsProvider];

  v29 = [MFConversationItemHeaderBlock alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v33 = -[MFConversationItemHeaderBlock initWithFrame:contactStore:accountsProvider:](v29, "initWithFrame:contactStore:accountsProvider:", v61, v28, CGRectZero.origin.x, y, width, height);
  [(MFConversationItemHeaderBlock *)v33 setDisplayOptions:12];
  v34 = -[MessageHeaderSubjectBlock initWithFrame:]([MessageHeaderSubjectBlock alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v63[0] = v33;
  v63[1] = v34;
  v35 = +[NSArray arrayWithObjects:v63 count:2];
  v36 = [(MFMessageScreenshotGenerator *)self contentView];
  v37 = [v36 headerView];
  [v37 setHeaderBlocks:v35];

  v38 = [(MFMessageScreenshotGenerator *)self contentView];
  [v38 setShowsBanners:v19];

  v39 = [(MFMessageScreenshotGenerator *)self scene];
  v40 = [v7 traitCollection];
  v41 = [(MFMessageScreenshotGenerator *)self contentView];
  [v41 safeAreaInsets];
  v46 = +[MFMessageDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:](MFMessageDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:", v40, [v39 interfaceOrientation], v12, v14, v16, v18, v42, v43, v44, v45);

  v47 = [(MFMessageScreenshotGenerator *)self contentView];
  [v47 setFrame:0.0, 0.0, v60, v59];

  v48 = [(MFMessageScreenshotGenerator *)self contentView];
  [v48 setDisplayMetrics:v46];

  v49 = [(MFMessageScreenshotGenerator *)self contentView];
  [v49 setLayoutMargins:v12, v14, v16, v18];

  v50 = [(MFMessageScreenshotGenerator *)self contentView];
  [v50 setAlpha:0.0];

  v51 = [v39 mf_window];
  v52 = [(MFMessageScreenshotGenerator *)self contentView];
  [v51 addSubview:v52];

  kdebug_trace();
  kdebug_trace();
  id v53 = [objc_alloc((Class)MessageContentRepresentationRequest) initWithMessage:v62];
  v54 = [(MFMessageScreenshotGenerator *)self contentView];
  [v54 setContentRequest:v53];

  [v53 start];
  v55 = [(MFMessageScreenshotGenerator *)self contentView];
  v56 = [v55 headerView];
  [v56 layoutIfNeeded];
}

- (void)messageContentViewDidFinishLoadingMessage:(id)a3
{
  id v4 = a3;
  v5 = +[MFMessageScreenshotGenerator log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 contentRequest];
    id v7 = [v6 message];
    id v8 = [v7 objectID];
    int v10 = 138543362;
    double v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "message content view finished loading libraryid=%{public}@", (uint8_t *)&v10, 0xCu);
  }
  messageFinishedLoadingSemaphore = self->_messageFinishedLoadingSemaphore;
  if (messageFinishedLoadingSemaphore) {
    dispatch_semaphore_signal(messageFinishedLoadingSemaphore);
  }
}

- (id)presentingViewControllerForMessageContentView:(id)a3
{
  return 0;
}

- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4
{
  id v8 = a4;
  v5 = [(MFMessageScreenshotGenerator *)self scene];
  id v6 = [v5 daemonInterface];
  id v7 = [v6 messageRepository];
  [v7 noteViewOfRemoteContentLinks:v8];
}

- (MailScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailScene *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_messageFinishedLoadingSemaphore, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
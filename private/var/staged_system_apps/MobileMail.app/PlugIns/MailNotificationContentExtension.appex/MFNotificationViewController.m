@interface MFNotificationViewController
+ (OS_os_log)signpostLog;
- (BOOL)isDisplayingMessage;
- (BOOL)isRTL;
- (EFPromise)messageDisplayPromise;
- (EMDaemonInterface)daemonInterface;
- (EMMessageList)messageList;
- (LAContext)context;
- (MFMailAccountsProvider)accountsProvider;
- (MFMessageContentLoadingView)loadingView;
- (MUIBrandIndicatorProvider)brandIndicatorProvider;
- (NSError)error;
- (NSURL)messageReferenceURL;
- (UIEdgeInsets)minMargins;
- (double)screenHeight;
- (id)_configureMessageListAndPromiseForQuery:(id)a3 repository:(id)a4;
- (id)_errorLabel;
- (id)_notificationActionIdentifierForSwipeAction:(int64_t)a3;
- (id)userNotificationActionForSwipeAction:(int64_t)a3;
- (unint64_t)signpostID;
- (void)_configureMessageRequestWithSignPostID:(unint64_t)a3;
- (void)_determineMessageToDisplayForCollection:(id)a3 itemIDs:(id)a4;
- (void)_notificationPreviewFailedWithError:(id)a3 singpostID:(unint64_t)a4;
- (void)_resetMessageListAndPromise;
- (void)_setProgressUIVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5;
- (void)didReceiveNotification:(id)a3;
- (void)messageContentView:(id)a3 didFinishRenderingWithHeight:(double)a4;
- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4;
- (void)setAccountsProvider:(id)a3;
- (void)setActionsForMessage:(id)a3;
- (void)setBrandIndicatorProvider:(id)a3;
- (void)setContext:(id)a3;
- (void)setDaemonInterface:(id)a3;
- (void)setError:(id)a3;
- (void)setIsDisplayingMessage:(BOOL)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setLoadingView:(id)a3;
- (void)setMessageDisplayPromise:(id)a3;
- (void)setMessageList:(id)a3;
- (void)setMessageReferenceURL:(id)a3;
- (void)setMinMargins:(UIEdgeInsets)a3;
- (void)setScreenHeight:(double)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MFNotificationViewController

+ (OS_os_log)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C5B4;
  block[3] = &unk_10003C9E0;
  block[4] = a1;
  if (qword_1000485C8 != -1) {
    dispatch_once(&qword_1000485C8, block);
  }
  v2 = (void *)qword_1000485C0;

  return (OS_os_log *)v2;
}

- (unint64_t)signpostID
{
  v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)MFNotificationViewController;
  [(MFNotificationViewController *)&v23 viewDidLoad];
  id v3 = objc_alloc_init((Class)EMDaemonInterface);
  [(MFNotificationViewController *)self setDaemonInterface:v3];

  os_signpost_id_t v4 = [(MFNotificationViewController *)self daemonInterface];
  +[MFWKWebViewFactory setDaemonInterface:v4 URLCacheWithMemoryCapacity:0];

  v5 = [(MFNotificationViewController *)self daemonInterface];
  v6 = [v5 vipManager];
  +[VIPManager setBackingManager:v6];

  id v7 = objc_alloc_init((Class)MUICachingSVGConverter);
  id v8 = objc_alloc((Class)MUIBrandIndicatorProvider);
  v9 = [(MFNotificationViewController *)self daemonInterface];
  v10 = [v9 messageRepository];
  id v11 = [v8 initWithMessageRepository:v10 svgConverter:v7];
  [(MFNotificationViewController *)self setBrandIndicatorProvider:v11];

  [(MFNotificationViewController *)self systemMinimumLayoutMargins];
  v12 = [(MFNotificationViewController *)self view];
  [self setIsRTL:[v12 mf_prefersRightToLeftInterfaceLayout]];

  [(MFNotificationViewController *)self isRTL];
  MFEdgeInsetsFromDirectionalEdgeInsets();
  -[MFNotificationViewController setMinMargins:](self, "setMinMargins:");
  p_minMargins = &self->_minMargins;
  if (self->_minMargins.top == 0.0
    || self->_minMargins.right == 0.0
    || self->_minMargins.bottom == 0.0
    || self->_minMargins.left == 0.0)
  {
    v14 = MSUserNotificationsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v25.top = p_minMargins->top;
      v25.left = self->_minMargins.left;
      v25.bottom = self->_minMargins.bottom;
      v25.right = self->_minMargins.right;
      v15 = NSStringFromUIEdgeInsets(v25);
      sub_100021100(v15, buf, v14);
    }

    __asm { FMOV            V0.2D, #16.0 }
    *(_OWORD *)&p_minMargins->top = _Q0;
    *(_OWORD *)&self->_minMargins.bottom = _Q0;
  }
  v21 = +[UIScreen mainScreen];
  [v21 bounds];
  [(MFNotificationViewController *)self setScreenHeight:v22];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MFNotificationViewController;
  [(MFNotificationViewController *)&v8 viewDidDisappear:a3];
  os_signpost_id_t v4 = MSUserNotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(MFNotificationViewController *)self messageList];
    v6 = [(MFNotificationViewController *)self messageReferenceURL];
    *(_DWORD *)buf = 134218242;
    v10 = v5;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: canceling promise for URL %@", buf, 0x16u);
  }
  id v7 = [(MFNotificationViewController *)self messageDisplayPromise];
  [v7 cancel];

  [(MFNotificationViewController *)self setIsDisplayingMessage:0];
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  if (![(MFNotificationViewController *)self isDisplayingMessage])
  {
    [(MFNotificationViewController *)self setIsDisplayingMessage:1];
    v5 = [(MFNotificationViewController *)self daemonInterface];

    if (v5)
    {
      v6 = +[MFNotificationViewController signpostLog];
      os_signpost_id_t v7 = os_signpost_id_generate(v6);

      objc_super v8 = +[MFNotificationViewController signpostLog];
      v9 = v8;
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MFNotificationPreview", "Starting message preview", buf, 2u);
      }

      [(MFNotificationViewController *)self _setProgressUIVisible:1 animated:0];
      v10 = [v4 request];
      __int16 v11 = [v10 content];
      v12 = [v11 userInfo];
      v13 = [v12 objectForKeyedSubscript:MSUserNotificationContentKeyMessageReference];

      if (v13)
      {
        v14 = +[NSURL URLWithString:v13];
        [(MFNotificationViewController *)self setMessageReferenceURL:v14];
      }
      else
      {
        v14 = [v10 identifier];
        v16 = +[NSURL URLWithString:v14];
        [(MFNotificationViewController *)self setMessageReferenceURL:v16];
      }
      v17 = MSUserNotificationsLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [(MFNotificationViewController *)self messageReferenceURL];
        *(_DWORD *)buf = 138412290;
        v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "NotificationPreview: handle longlook for message with URL %@", buf, 0xCu);
      }
      v19 = (LAContext *)objc_alloc_init((Class)LAContext);
      context = self->_context;
      self->_context = v19;

      v25[0] = &off_10003DFE0;
      v25[1] = &off_10003DFF8;
      v26[0] = &__kCFBooleanTrue;
      v21 = +[NSBundle bundleForClass:objc_opt_class()];
      double v22 = [v21 localizedStringForKey:@"AUTHENTICATION_PROCESS_MAIL" value:&stru_10003D3F8 table:@"Main"];
      v26[1] = v22;
      objc_super v23 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

      id v24 = v23;
      EFPerformSyncWithProtectedDataAvailability();
    }
    else
    {
      v15 = +[NSError errorWithDomain:@"NotificationExtensionErrorDomain" code:3 userInfo:0];
      [(MFNotificationViewController *)self setError:v15];
    }
  }
}

- (void)_configureMessageRequestWithSignPostID:(unint64_t)a3
{
  v5 = [(MFNotificationViewController *)self daemonInterface];
  v6 = [v5 messageRepository];
  os_signpost_id_t v7 = [(MFNotificationViewController *)self messageReferenceURL];
  objc_super v8 = [v6 messageObjectIDForURL:v7];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001D564;
  v15[3] = &unk_10003D328;
  v15[4] = self;
  v9 = [v8 then:v15];
  v10 = +[EFScheduler mainThreadScheduler];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001D6A0;
  v12[3] = &unk_10003D350;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  [v9 onScheduler:v10 addSuccessBlock:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001DD90;
  v11[3] = &unk_10003D378;
  v11[4] = self;
  v11[5] = a3;
  [v9 onScheduler:v10 addFailureBlock:v11];
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)_notificationPreviewFailedWithError:(id)a3 singpostID:(unint64_t)a4
{
  id v6 = a3;
  [(MFNotificationViewController *)self setError:v6];
  os_signpost_id_t v7 = MSUserNotificationsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = [(MFNotificationViewController *)self messageList];
    v9 = [(MFNotificationViewController *)self messageReferenceURL];
    v10 = [v6 ef_publicDescription];
    int v15 = 134218498;
    id v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2048;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: failed to display message for URL %@. Error: %lu", (uint8_t *)&v15, 0x20u);
  }
  __int16 v11 = +[MFNotificationViewController signpostLog];
  v12 = v11;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    id v13 = [v6 code];
    int v15 = 134349056;
    id v16 = v13;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, a4, "MFNotificationPreview", "Failure %{public, name=errorCode}lu", (uint8_t *)&v15, 0xCu);
  }

  [(MFNotificationViewController *)self _resetMessageListAndPromise];
  context = self->_context;
  self->_context = 0;
}

- (void)setError:(id)a3
{
  v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    objc_storeStrong((id *)&self->_error, a3);
    id v6 = [(MFNotificationViewController *)self view];
    os_signpost_id_t v7 = [(MFNotificationViewController *)self _errorLabel];
    [v6 addSubview:v7];

    [(MFNotificationViewController *)self _setProgressUIVisible:0 animated:0];
    objc_super v8 = MSUserNotificationsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(NSError *)v5 userInfo];
      sub_100021158(v9, v10, v8);
    }
  }
}

- (id)_errorLabel
{
  [(MFNotificationViewController *)self minMargins];
  CGFloat v4 = v3;
  v5 = [(MFNotificationViewController *)self view];
  [v5 frame];
  CGRect v18 = CGRectInset(v17, v4, v4);
  double x = v18.origin.x;
  double y = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;

  id v10 = [objc_alloc((Class)UILabel) initWithFrame:x, y, width, height];
  __int16 v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"MESSAGE_CAUSED_PROBLEM" value:&stru_10003D3F8 table:@"Main"];
  [v10 setText:v12];

  id v13 = +[UIColor grayColor];
  [v10 setTextColor:v13];

  v14 = +[UIFont systemFontOfSize:18.0];
  [v10 setFont:v14];

  [v10 setNumberOfLines:3];
  [v10 setTextAlignment:1];

  return v10;
}

- (id)_configureMessageListAndPromiseForQuery:(id)a3 repository:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MFNotificationViewController *)self _resetMessageListAndPromise];
  objc_super v8 = +[EFPromise promise];
  [(MFNotificationViewController *)self setMessageDisplayPromise:v8];

  id v9 = [objc_alloc((Class)EMMessageList) initWithQuery:v6 repository:v7];
  [(MFNotificationViewController *)self setMessageList:v9];

  id v10 = [(MFNotificationViewController *)self messageList];
  [v10 beginObserving:self];

  __int16 v11 = MSUserNotificationsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(MFNotificationViewController *)self messageList];
    id v13 = [(MFNotificationViewController *)self messageReferenceURL];
    int v16 = 134218242;
    CGRect v17 = v12;
    __int16 v18 = 2112;
    __int16 v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: configured message list for URL:%@", (uint8_t *)&v16, 0x16u);
  }
  v14 = [(MFNotificationViewController *)self messageDisplayPromise];

  return v14;
}

- (void)_resetMessageListAndPromise
{
  double v3 = [(MFNotificationViewController *)self messageList];

  if (v3)
  {
    id v6 = [(MFNotificationViewController *)self messageList];
    [v6 stopObserving:self];

    [(MFNotificationViewController *)self setMessageList:0];
  }
  CGFloat v4 = [(MFNotificationViewController *)self messageDisplayPromise];

  if (v4)
  {
    v5 = [(MFNotificationViewController *)self messageDisplayPromise];
    id v7 = [v5 future];

    [v7 cancel];
    [(MFNotificationViewController *)self setMessageDisplayPromise:0];
  }
}

- (void)_determineMessageToDisplayForCollection:(id)a3 itemIDs:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(MFNotificationViewController *)self messageList];
  if (v7 == v11)
  {
    objc_super v8 = [v6 firstObject];
    if (v8)
    {
      [v11 stopObserving:self];
      id v9 = [(MFNotificationViewController *)self messageDisplayPromise];
      id v10 = [v11 messageListItemForItemID:v8];
      [v9 finishWithFuture:v10];
    }
  }
}

- (void)_setProgressUIVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (pthread_main_np() != 1)
  {
    v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"MFNotificationViewController.m" lineNumber:325 description:@"Current thread must be main"];
  }
  id v7 = MSUserNotificationsLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      id v9 = [(MFNotificationViewController *)self messageList];
      id v10 = [(MFNotificationViewController *)self messageReferenceURL];
      int v27 = 134218242;
      v28 = v9;
      __int16 v29 = 2112;
      v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: showing loading spinner for message URL:%@", (uint8_t *)&v27, 0x16u);
    }
    id v11 = [(MFNotificationViewController *)self loadingView];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      id v13 = objc_alloc((Class)MFMessageContentLoadingView);
      v14 = [(MFNotificationViewController *)self view];
      [v14 frame];
      id v15 = [v13 initWithFrame:];
      [(MFNotificationViewController *)self setLoadingView:v15];

      int v16 = +[NSBundle bundleForClass:objc_opt_class()];
      CGRect v17 = [v16 localizedStringForKey:@"LOADING_ALL_CAPS" value:&stru_10003D3F8 table:@"Main"];
      __int16 v18 = [(MFNotificationViewController *)self loadingView];
      [v18 setLoadingTitle:v17];

      __int16 v19 = [(MFNotificationViewController *)self view];
      v20 = [(MFNotificationViewController *)self loadingView];
      [v19 addSubview:v20];
    }
    v21 = [(MFNotificationViewController *)self loadingView];
    [v21 setLoadingIndicatorVisible:1];

    double v22 = [(MFNotificationViewController *)self loadingView];
    [v22 setAutoresizingMask:18];
  }
  else
  {
    if (v8)
    {
      objc_super v23 = [(MFNotificationViewController *)self messageList];
      id v24 = [(MFNotificationViewController *)self messageReferenceURL];
      int v27 = 134218242;
      v28 = v23;
      __int16 v29 = 2112;
      v30 = v24;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: hiding loading spinner for message URL:%@", (uint8_t *)&v27, 0x16u);
    }
    UIEdgeInsets v25 = [(MFNotificationViewController *)self loadingView];
    [v25 setLoadingIndicatorVisible:0];

    double v22 = [(MFNotificationViewController *)self loadingView];
    [v22 removeFromSuperview];
  }
}

- (void)messageContentView:(id)a3 didFinishRenderingWithHeight:(double)a4
{
  id v6 = a3;
  [(MFNotificationViewController *)self _setProgressUIVisible:0 animated:0];
  [(MFNotificationViewController *)self screenHeight];
  double v8 = v7;
  id v9 = [(MFNotificationViewController *)self view];
  [v9 frame];
  if (v8 + v8 <= a4) {
    double v11 = v8 + v8;
  }
  else {
    double v11 = a4;
  }
  -[MFNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v11);

  BOOL v12 = MSUserNotificationsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(MFNotificationViewController *)self messageReferenceURL];
    [(MFNotificationViewController *)self preferredContentSize];
    v14 = NSStringFromSize(v23);
    int v15 = 134218754;
    id v16 = v6;
    __int16 v17 = 2048;
    double v18 = a4;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 2114;
    double v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: messageHeight is %f for message URL:%@ preferredHeight:%{public}@", (uint8_t *)&v15, 0x2Au);
  }
}

- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4
{
  id v7 = a4;
  v5 = [(MFNotificationViewController *)self daemonInterface];
  id v6 = [v5 messageRepository];
  [v6 noteViewOfRemoteContentLinks:v7];
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = MSUserNotificationsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218242;
    id v13 = [v9 count];
    __int16 v14 = 2114;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NotificationPreview: adding %lu items after %{public}@", (uint8_t *)&v12, 0x16u);
  }

  [(MFNotificationViewController *)self _determineMessageToDisplayForCollection:v8 itemIDs:v9];
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = MSUserNotificationsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218242;
    id v13 = [v9 count];
    __int16 v14 = 2114;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NotificationPreview: adding %lu items before %{public}@", (uint8_t *)&v12, 0x16u);
  }

  [(MFNotificationViewController *)self _determineMessageToDisplayForCollection:v8 itemIDs:v9];
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = MSUserNotificationsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v9;
    __int16 v16 = 2114;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NotificationPreview: item id changed from %{public}@ to %{public}@", buf, 0x16u);
  }

  if (v10)
  {
    id v13 = v10;
    int v12 = +[NSArray arrayWithObjects:&v13 count:1];
    [(MFNotificationViewController *)self _determineMessageToDisplayForCollection:v8 itemIDs:v12];
  }
}

- (void)setActionsForMessage:(id)a3
{
  id v4 = a3;
  v5 = [v4 mailboxes];
  id v6 = [v5 firstObject];
  id v7 = [v6 account];

  if ([v7 shouldArchiveByDefault]) {
    uint64_t v8 = 9;
  }
  else {
    uint64_t v8 = 8;
  }
  id v9 = [(MFNotificationViewController *)self userNotificationActionForSwipeAction:v8];
  id v10 = rightSwipeSetting(1);
  int64_t v11 = +[MFTriageActionUtilities triageActionForActionKey:v10];

  if (v11 == 16)
  {
    if ([v7 shouldArchiveByDefault]) {
      int64_t v11 = 8;
    }
    else {
      int64_t v11 = 9;
    }
  }
  int v12 = [(MFNotificationViewController *)self userNotificationActionForSwipeAction:v11];
  v15[0] = v9;
  v15[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v15 count:2];
  __int16 v14 = [(MFNotificationViewController *)self extensionContext];
  [v14 setNotificationActions:v13];
}

- (id)userNotificationActionForSwipeAction:(int64_t)a3
{
  v5 = (_UNKNOWN **)qword_1000485D0;
  if (!qword_1000485D0)
  {
    qword_1000485D0 = (uint64_t)&off_10003E138;

    v5 = &off_10003E138;
  }
  id v6 = +[NSNumber numberWithInteger:a3];
  unsigned int v7 = [v5 containsObject:v6];

  if (!v7) {
    a3 = 2;
  }
  if (a3 == 6)
  {
    uint64_t v8 = +[NSString localizedStringWithFormat:@"NOTIFICATION_%@", @"FLAG"];
    uint64_t v9 = +[UNNotificationActionIcon iconWithSystemImageName:MFImageGlyphFlag];
  }
  else if (a3 == 8)
  {
    uint64_t v8 = +[NSString localizedStringWithFormat:@"NOTIFICATION_%@", @"TRASH"];
    uint64_t v9 = +[UNNotificationActionIcon iconWithSystemImageName:MFImageGlyphTrash];
  }
  else
  {
    if (a3 == 9)
    {
      uint64_t v8 = +[NSString localizedStringWithFormat:@"NOTIFICATION_%@", @"ARCHIVE"];
      +[UNNotificationActionIcon iconWithSystemImageName:MFImageGlyphArchive];
    }
    else
    {
      uint64_t v8 = +[NSString localizedStringWithFormat:@"NOTIFICATION_%@", @"READ"];
      +[UNNotificationActionIcon iconWithSystemImageName:MFImageGlyphRead];
    uint64_t v9 = };
  }
  id v10 = (void *)v9;
  int64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
  int v12 = [v11 localizedStringForKey:v8 value:&stru_10003D3F8 table:@"Main"];

  id v13 = [(MFNotificationViewController *)self _notificationActionIdentifierForSwipeAction:a3];
  if (+[MFTriageActionUtilities isActionDestructive:a3])
  {
    uint64_t v14 = 3;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = +[UNNotificationAction actionWithIdentifier:v13 title:v12 options:v14 icon:v10];

  return v15;
}

- (id)_notificationActionIdentifierForSwipeAction:(int64_t)a3
{
  double v3 = (void *)MSMailNotificationActionIdentifierPrefix;
  id v4 = +[MFTriageActionUtilities actionKeyForTriageAction:a3];
  v5 = [v3 stringByAppendingString:v4];

  return v5;
}

- (double)screenHeight
{
  return self->_screenHeight;
}

- (void)setScreenHeight:(double)a3
{
  self->_screenHeight = a3;
}

- (NSError)error
{
  return self->_error;
}

- (MFMessageContentLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (UIEdgeInsets)minMargins
{
  double top = self->_minMargins.top;
  double left = self->_minMargins.left;
  double bottom = self->_minMargins.bottom;
  double right = self->_minMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMinMargins:(UIEdgeInsets)a3
{
  self->_minMargins = a3;
}

- (NSURL)messageReferenceURL
{
  return self->_messageReferenceURL;
}

- (void)setMessageReferenceURL:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (void)setBrandIndicatorProvider:(id)a3
{
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setMessageList:(id)a3
{
}

- (EFPromise)messageDisplayPromise
{
  return self->_messageDisplayPromise;
}

- (void)setMessageDisplayPromise:(id)a3
{
}

- (LAContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)isDisplayingMessage
{
  return self->_isDisplayingMessage;
}

- (void)setIsDisplayingMessage:(BOOL)a3
{
  self->_isDisplayingMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_messageDisplayPromise, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_messageReferenceURL, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end
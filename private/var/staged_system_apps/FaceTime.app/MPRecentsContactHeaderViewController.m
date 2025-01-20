@interface MPRecentsContactHeaderViewController
- (CHRecentCall)recentCall;
- (MPRecentsContactHeaderViewController)init;
- (NSDictionary)rttConversations;
- (PHRecentCallDetailsView)detailsView;
- (PHRecentsItem)recentsItem;
- (id)generateDetailsView;
- (id)rttConversationForUUID:(id)a3;
- (int64_t)recentCallTTYType;
- (void)loadLayoutConstraints;
- (void)loadRTTConversations;
- (void)loadView;
- (void)presentConversationForUUID:(id)a3;
- (void)setDetailsView:(id)a3;
- (void)setRecentCall:(id)a3;
- (void)setRecentsItem:(id)a3;
- (void)setRttConversations:(id)a3;
@end

@implementation MPRecentsContactHeaderViewController

- (MPRecentsContactHeaderViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MPRecentsContactHeaderViewController;
  v2 = [(MPRecentsContactHeaderViewController *)&v7 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mobilephone.rttConversations", v3);
    rttConversationsQueue = v2->_rttConversationsQueue;
    v2->_rttConversationsQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)MPRecentsContactHeaderViewController;
  [(MPRecentsContactHeaderViewController *)&v5 loadView];
  [(MPRecentsContactHeaderViewController *)self loadRTTConversations];
  v3 = [(MPRecentsContactHeaderViewController *)self view];
  dispatch_queue_t v4 = [(MPRecentsContactHeaderViewController *)self generateDetailsView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v4];
  [(MPRecentsContactHeaderViewController *)self setDetailsView:v4];
  [(MPRecentsContactHeaderViewController *)self loadLayoutConstraints];
}

- (void)loadLayoutConstraints
{
  id v13 = [(MPRecentsContactHeaderViewController *)self detailsView];
  v3 = [(MPRecentsContactHeaderViewController *)self view];
  dispatch_queue_t v4 = [v13 widthAnchor];
  objc_super v5 = [v3 widthAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  [v6 setActive:1];

  objc_super v7 = [v13 topAnchor];
  v8 = [v3 topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [v13 bottomAnchor];
  v11 = [v3 bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  [v12 setActive:1];
}

- (id)generateDetailsView
{
  v3 = -[PHRecentCallDetailsView initWithFrame:]([PHRecentCallDetailsView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(PHRecentCallDetailsView *)v3 setDelegate:self];
  dispatch_queue_t v4 = [(MPRecentsContactHeaderViewController *)self recentCall];
  [(PHRecentCallDetailsView *)v3 setRecentCall:v4];

  return v3;
}

- (void)loadRTTConversations
{
  v3 = sub_100012C68();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting loadRTTConversations", (uint8_t *)buf, 2u);
  }

  id v4 = sub_10001E888();
  if (v4)
  {
    objc_super v5 = v4;
    objc_initWeak(buf, self);
    rttConversationsQueue = self->_rttConversationsQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100030AE8;
    v8[3] = &unk_1000A2278;
    objc_copyWeak(v9, buf);
    v9[1] = v5;
    dispatch_async((dispatch_queue_t)rttConversationsQueue, v8);
    objc_destroyWeak(v9);
    objc_destroyWeak(buf);
  }
  else
  {
    objc_super v7 = sub_100012C68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stopped loadRTTConversations because we could not find RTTUIUtilities", (uint8_t *)buf, 2u);
    }
  }
}

- (int64_t)recentCallTTYType
{
  v2 = [(MPRecentsContactHeaderViewController *)self recentCall];
  id v3 = [v2 ttyType];

  return (int64_t)v3;
}

- (id)rttConversationForUUID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MPRecentsContactHeaderViewController *)self rttConversations];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)presentConversationForUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001E7AC();
  if (v5)
  {
    v6 = v5;
    objc_super v7 = [(MPRecentsContactHeaderViewController *)self rttConversationForUUID:v4];
    if (v7)
    {
      v8 = [v6 viewControllerForConversation:v7];
      v9 = [(MPRecentsContactHeaderViewController *)self navigationController];
      [v9 pushViewController:v8 animated:1];
    }
    else
    {
      v10 = sub_100012C68();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10006AA08(v10);
      }
    }
  }
}

- (PHRecentCallDetailsView)detailsView
{
  return self->_detailsView;
}

- (void)setDetailsView:(id)a3
{
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (void)setRecentCall:(id)a3
{
}

- (PHRecentsItem)recentsItem
{
  return self->_recentsItem;
}

- (void)setRecentsItem:(id)a3
{
}

- (NSDictionary)rttConversations
{
  return self->_rttConversations;
}

- (void)setRttConversations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rttConversations, 0);
  objc_storeStrong((id *)&self->_recentsItem, 0);
  objc_storeStrong((id *)&self->_recentCall, 0);
  objc_storeStrong((id *)&self->_detailsView, 0);

  objc_storeStrong((id *)&self->_rttConversationsQueue, 0);
}

@end
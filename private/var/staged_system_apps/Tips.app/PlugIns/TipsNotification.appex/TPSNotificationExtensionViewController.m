@interface TPSNotificationExtensionViewController
- (_TPSXPCConnection)xpcConnection;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_destroyXPCConnection;
- (void)clearNotificationIgnoreCount;
- (void)dealloc;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)markTipViewed:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)singleTipViewController:(id)a3 tipViewed:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TPSNotificationExtensionViewController

- (void)dealloc
{
  [(TPSNotificationExtensionViewController *)self _destroyXPCConnection];
  v3.receiver = self;
  v3.super_class = (Class)TPSNotificationExtensionViewController;
  [(TPSNotificationExtensionViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)TPSNotificationExtensionViewController;
  [(TPSNotificationExtensionViewController *)&v27 viewDidLoad];
  objc_super v3 = +[TPSURLSessionHandler sharedInstance];
  v4 = +[TPSURLSessionManager defaultManager];
  [v4 setDefaultSessionDelegate:v3];

  id v5 = +[TPSCommonDefines sharedInstance];
  if (!self->_singleTipViewController)
  {
    v6 = +[TPSUIAppController sharedInstance];
    v7 = [[TPSSingleTipViewController alloc] initWithAppController:v6];
    singleTipViewController = self->_singleTipViewController;
    self->_singleTipViewController = v7;

    [(TPSSingleTipViewController *)self->_singleTipViewController setDelegate:self];
    v9 = [(TPSSingleTipViewController *)self->_singleTipViewController view];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TPSNotificationExtensionViewController *)self addChildViewController:self->_singleTipViewController];
    v10 = [(TPSNotificationExtensionViewController *)self view];
    [v10 addSubview:v9];

    v11 = [v9 topAnchor];
    v12 = [(TPSNotificationExtensionViewController *)self view];
    v13 = [v12 topAnchor];
    v14 = [v11 constraintEqualToAnchor:v13];
    [v14 setActive:1];

    v15 = [v9 bottomAnchor];
    v16 = [(TPSNotificationExtensionViewController *)self view];
    v17 = [v16 bottomAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    v19 = [v9 leadingAnchor];
    v20 = [(TPSNotificationExtensionViewController *)self view];
    v21 = [v20 leadingAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    v23 = [v9 trailingAnchor];
    v24 = [(TPSNotificationExtensionViewController *)self view];
    v25 = [v24 trailingAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    [(TPSSingleTipViewController *)self->_singleTipViewController didMoveToParentViewController:self];
  }
  [(TPSNotificationExtensionViewController *)self clearNotificationIgnoreCount];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPSNotificationExtensionViewController;
  [(TPSNotificationExtensionViewController *)&v4 viewWillDisappear:a3];
  objc_super v3 = +[TPSAssetCacheController sharedInstance];
  [v3 syncCacheImmediately];
}

- (void)didReceiveNotification:(id)a3
{
  objc_super v4 = [a3 request];
  id v23 = [v4 content];

  id v5 = [v23 categoryIdentifier];
  unsigned int v6 = [v5 isEqualToString:@"tip-notification-extension"];

  v7 = v23;
  if (v6)
  {
    v8 = [v23 userInfo];
    v9 = [v8 TPSSafeDictionaryForKey:TPSDocumentDocumentRootKey];
    uint64_t v10 = [v8 TPSSafeDictionaryForKey:TPSMetadataRootKey];
    v11 = (void *)v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      v13 = 0;
      id v14 = 0;
    }
    else
    {
      id v14 = [objc_alloc((Class)TPSMetadata) initWithDictionary:v10];
      id v15 = objc_alloc((Class)TPSTip);
      id v16 = [v15 initWithDictionary:v9 metadata:v14 identifierKey:TPSTipDocumentIdKey];
      v13 = v16;
      if (v16)
      {
        v17 = [v14 assetSizes];
        [(TPSSingleTipViewController *)self->_singleTipViewController setAssetSizes:v17];

        [(TPSSingleTipViewController *)self->_singleTipViewController setTip:v13];
        v18 = [v8 TPSSafeStringForKey:@"collectionId"];
        [(TPSSingleTipViewController *)self->_singleTipViewController setCollectionID:v18];
      }
    }
    v19 = [v13 identifier];
    v20 = [v8 TPSSafeStringForKey:@"collectionId"];
    v21 = [v13 correlationID];
    v22 = +[TPSAnalyticsEventAppLaunched eventWithContentID:v19 collectionID:v20 correlationID:v21 launchType:TPSAnalyticsLaunchTypeNotification];
    [v22 log];

    v7 = v23;
  }
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
}

- (_TPSXPCConnection)xpcConnection
{
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    id v4 = objc_alloc((Class)_TPSXPCConnection);
    id v5 = (_TPSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.tipsd" options:_TPSDefaultXPCConnectionOptions];
    unsigned int v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    [(_TPSXPCConnection *)self->_xpcConnection setExportedObject:self];
    [(_TPSXPCConnection *)self->_xpcConnection resume];
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

- (void)_destroyXPCConnection
{
  [(_TPSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (id)exportedInterface
{
  id v2 = objc_alloc_init((Class)NSXPCInterface);

  return v2;
}

- (id)remoteInterface
{
  return (id)_TPSXPCServerInterface(self, a2);
}

- (void)clearNotificationIgnoreCount
{
  id v2 = [(TPSNotificationExtensionViewController *)self xpcConnection];
  objc_super v3 = [v2 remoteObjectProxyWithErrorHandler:&stru_10000C398];

  if (v3) {
    [v3 tipNotificationInteractedByUser];
  }
}

- (void)markTipViewed:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(TPSNotificationExtensionViewController *)self xpcConnection];
    unsigned int v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_10000C3B8];

    if (v6)
    {
      v7 = [v4 identifier];
      [v6 contentViewedForIdentifier:v7];
    }
  }
}

- (void)singleTipViewController:(id)a3 tipViewed:(id)a4
{
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_singleTipViewController, 0);
}

@end
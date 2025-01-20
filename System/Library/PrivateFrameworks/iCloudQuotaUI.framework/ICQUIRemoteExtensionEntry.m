@interface ICQUIRemoteExtensionEntry
+ (ICQUIRemoteExtensionEntry)sharedInstance;
+ (id)extensionPointID;
+ (void)dismissRemoteViewControllerWithError:(id)a3;
+ (void)presentRemoteViewControllerWithContext:(id)a3 presentingViewController:(id)a4 completion:(id)a5;
+ (void)setSharedInstance:(id)a3;
- (BOOL)extensionShouldAccept:(id)a3;
- (BOOL)shouldAcceptConnection:(id)a3;
- (ICQUIRemoteExtensionDelegate)transformer;
- (ICQUIRemoteExtensionEntry)init;
- (NSDictionary)offerContext;
- (NSXPCConnection)currentConnection;
- (id)extensionMakeContentViewController;
- (id)makeContentViewController;
- (void)dismissViewControllerWithError:(id)a3;
- (void)extensionPrepareForSceneConnectionWith:(id)a3;
- (void)prepareForSceneConnectionWithConfiguration:(id)a3;
- (void)setCurrentConnection:(id)a3;
- (void)setOfferContext:(id)a3;
- (void)startConnectionWithContext:(id)a3 completion:(id)a4;
@end

@implementation ICQUIRemoteExtensionEntry

+ (void)presentRemoteViewControllerWithContext:(id)a3 presentingViewController:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Presenting remote extension by %@", (uint8_t *)&v12, 0xCu);
  }

  v11 = objc_opt_new();
  [v11 presentRemoteViewControllerWithContext:v9 presentingViewController:v7 completion:v8];
}

+ (void)dismissRemoteViewControllerWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "+[ICQUIRemoteExtensionEntry dismissRemoteViewControllerWithError:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "%s - error: %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = +[ICQUIRemoteExtensionEntry sharedInstance];
  [v5 dismissViewControllerWithError:v3];
}

+ (id)extensionPointID
{
  return @"com.apple.iCloudQuotaUI.remote-extension";
}

- (ICQUIRemoteExtensionEntry)init
{
  v4.receiver = self;
  v4.super_class = (Class)ICQUIRemoteExtensionEntry;
  v2 = [(ICQUIRemoteExtensionEntry *)&v4 init];
  if (v2) {
    +[ICQUIRemoteExtensionEntry setSharedInstance:v2];
  }
  return v2;
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[ICQUIRemoteExtensionEntry shouldAcceptConnection:]";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = [(ICQUIRemoteExtensionEntry *)self extensionShouldAccept:v4];
  return v6;
}

- (void)prepareForSceneConnectionWithConfiguration:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[ICQUIRemoteExtensionEntry prepareForSceneConnectionWithConfiguration:]";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(ICQUIRemoteExtensionEntry *)self extensionPrepareForSceneConnectionWith:v4];
}

- (id)makeContentViewController
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[ICQUIRemoteExtensionEntry makeContentViewController]";
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(ICQUIRemoteExtensionEntry *)self extensionMakeContentViewController];
  return v4;
}

- (NSXPCConnection)currentConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentConnection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setCurrentConnection:(id)a3
{
}

- (NSDictionary)offerContext
{
  return self->_offerContext;
}

- (void)setOfferContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerContext, 0);
  objc_destroyWeak((id *)&self->_currentConnection);
}

+ (ICQUIRemoteExtensionEntry)sharedInstance
{
  return (ICQUIRemoteExtensionEntry *)(id)qword_2684E0830;
}

+ (void)setSharedInstance:(id)a3
{
  swift_beginAccess();
  id v4 = (void *)qword_2684E0830;
  qword_2684E0830 = (uint64_t)a3;
  id v5 = a3;
}

- (ICQUIRemoteExtensionDelegate)transformer
{
  v2 = self;
  id v3 = (void *)sub_22C99676C();

  return (ICQUIRemoteExtensionDelegate *)v3;
}

- (BOOL)extensionShouldAccept:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ICQUIRemoteExtensionEntry.extensionShouldAccept(_:)((NSXPCConnection)v4);

  return 1;
}

- (void)extensionPrepareForSceneConnectionWith:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _sSo25ICQUIRemoteExtensionEntryC13iCloudQuotaUIE34extensionPrepareForSceneConnection4withySo21_EXSceneConfigurationC_tF_0(v4);
}

- (id)extensionMakeContentViewController
{
  v2 = self;
  id v3 = [(ICQUIRemoteExtensionEntry *)v2 transformer];
  if (v3)
  {
    id v4 = [(ICQUIRemoteExtensionDelegate *)v3 makeContentViewController];

    swift_unknownObjectRelease();
  }
  else
  {

    id v4 = 0;
  }
  return v4;
}

- (void)dismissViewControllerWithError:(id)a3
{
  id v4 = self;
  id v5 = a3;
  ICQUIRemoteExtensionEntry.dismissViewController(error:)(a3);
}

- (void)startConnectionWithContext:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = sub_22C9A3618();
  _Block_copy(v5);
  id v7 = self;
  sub_22C998620(v6, v7, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

@end
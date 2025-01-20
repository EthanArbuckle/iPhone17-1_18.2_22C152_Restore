@interface VUIInterfaceFactory
+ (id)sharedInstance;
- (UIViewController)rootPresentingViewController;
- (VUIControllerPresenter)controllerPresenter;
- (VUIControllerPresenter)welcomeScreenControllerPresenter;
- (VUIDocumentCreator)documentCreator;
- (VUIDownloadQueueManager)downloadQueueManager;
- (VUIGroupActivitiesManagerDelegate)groupActivitiesManager;
- (VUILanguageAwareStringHandling)languageStringHandler;
- (VUIMusicManager)musicManager;
- (VUIOpenURLHandling)openURLHandler;
- (VUIPlaybackEndManager)playbackEndManager;
- (VUIPlaybackMetricsQueueManagerDelegate)playbackMetricsQueueManager;
- (VUISeasonsDownloadViewControllerCreator)seasonsControllerCreator;
- (VUITabBarProtocol)tabBarController;
- (VUITimedMetadataManager)timedMetadataManager;
- (id)accountViewController;
- (id)rootSplitViewController;
- (id)viewControllerWithDocumentDataSource:(id)a3 appContext:(id)a4;
- (id)viewControllerWithDocumentDataSource:(id)a3 appContext:(id)a4 documentOptions:(id)a5;
- (void)setDocumentCreator:(id)a3;
- (void)setDownloadQueueManager:(id)a3;
- (void)setGroupActivitiesManager:(id)a3;
- (void)setLanguageStringHandler:(id)a3;
- (void)setMusicManager:(id)a3;
- (void)setOpenURLHandler:(id)a3;
- (void)setPlaybackEndManager:(id)a3;
- (void)setPlaybackMetricsQueueManager:(id)a3;
- (void)setRootPresentingViewController:(id)a3;
- (void)setSeasonsControllerCreator:(id)a3;
- (void)setTabBarController:(id)a3;
- (void)setTimedMetadataManager:(id)a3;
- (void)setWelcomeScreenControllerPresenter:(id)a3;
@end

@implementation VUIInterfaceFactory

- (void)setTimedMetadataManager:(id)a3
{
}

- (void)setMusicManager:(id)a3
{
}

- (void)setSeasonsControllerCreator:(id)a3
{
}

- (void)setPlaybackMetricsQueueManager:(id)a3
{
}

- (void)setOpenURLHandler:(id)a3
{
}

- (void)setLanguageStringHandler:(id)a3
{
}

- (void)setGroupActivitiesManager:(id)a3
{
}

- (void)setDownloadQueueManager:(id)a3
{
}

- (void)setDocumentCreator:(id)a3
{
  v5 = (VUIDocumentCreator *)a3;
  if (self->_documentCreator != v5)
  {
    objc_storeStrong((id *)&self->_documentCreator, a3);
    self->_documentCreatorFlags.respondsToViewControllerCreation = objc_opt_respondsToSelector() & 1;
  }
}

- (VUIOpenURLHandling)openURLHandler
{
  return self->_openURLHandler;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1) {
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_57);
  }
  v2 = (void *)sharedInstance_sharedInstance_6;
  return v2;
}

- (id)viewControllerWithDocumentDataSource:(id)a3 appContext:(id)a4 documentOptions:(id)a5
{
  if (self->_documentCreatorFlags.respondsToViewControllerCreation)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    v11 = [(VUIInterfaceFactory *)self documentCreator];
    v12 = [v11 viewControllerWithDocumentDataSource:v10 appContext:v9 documentOptions:v8];
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (VUIDocumentCreator)documentCreator
{
  return self->_documentCreator;
}

void __37__VUIInterfaceFactory_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_6;
  sharedInstance_sharedInstance_6 = v0;
}

- (id)viewControllerWithDocumentDataSource:(id)a3 appContext:(id)a4
{
  if (self->_documentCreatorFlags.respondsToViewControllerCreation)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(VUIInterfaceFactory *)self documentCreator];
    id v9 = [v8 viewControllerWithDocumentDataSource:v7 appContext:v6 documentOptions:0];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (VUIControllerPresenter)controllerPresenter
{
  return (VUIControllerPresenter *)+[VUIApplicationRouter topMostVisibleViewController];
}

- (id)rootSplitViewController
{
  if (self->_documentCreatorFlags.respondsToViewControllerCreation)
  {
    v2 = [(VUIInterfaceFactory *)self documentCreator];
    v3 = [v2 rootSplitViewController];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accountViewController
{
  v2 = objc_alloc_init(VUIAccountViewController);
  return v2;
}

- (VUIGroupActivitiesManagerDelegate)groupActivitiesManager
{
  return self->_groupActivitiesManager;
}

- (VUITimedMetadataManager)timedMetadataManager
{
  return self->_timedMetadataManager;
}

- (VUIMusicManager)musicManager
{
  return self->_musicManager;
}

- (VUIPlaybackMetricsQueueManagerDelegate)playbackMetricsQueueManager
{
  return self->_playbackMetricsQueueManager;
}

- (VUIPlaybackEndManager)playbackEndManager
{
  return self->_playbackEndManager;
}

- (void)setPlaybackEndManager:(id)a3
{
}

- (VUISeasonsDownloadViewControllerCreator)seasonsControllerCreator
{
  return self->_seasonsControllerCreator;
}

- (VUIDownloadQueueManager)downloadQueueManager
{
  return self->_downloadQueueManager;
}

- (VUIControllerPresenter)welcomeScreenControllerPresenter
{
  return self->_welcomeScreenControllerPresenter;
}

- (void)setWelcomeScreenControllerPresenter:(id)a3
{
}

- (VUITabBarProtocol)tabBarController
{
  return self->_tabBarController;
}

- (void)setTabBarController:(id)a3
{
}

- (UIViewController)rootPresentingViewController
{
  return self->_rootPresentingViewController;
}

- (void)setRootPresentingViewController:(id)a3
{
}

- (VUILanguageAwareStringHandling)languageStringHandler
{
  return self->_languageStringHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageStringHandler, 0);
  objc_storeStrong((id *)&self->_rootPresentingViewController, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_welcomeScreenControllerPresenter, 0);
  objc_storeStrong((id *)&self->_downloadQueueManager, 0);
  objc_storeStrong((id *)&self->_seasonsControllerCreator, 0);
  objc_storeStrong((id *)&self->_playbackEndManager, 0);
  objc_storeStrong((id *)&self->_playbackMetricsQueueManager, 0);
  objc_storeStrong((id *)&self->_musicManager, 0);
  objc_storeStrong((id *)&self->_timedMetadataManager, 0);
  objc_storeStrong((id *)&self->_openURLHandler, 0);
  objc_storeStrong((id *)&self->_groupActivitiesManager, 0);
  objc_storeStrong((id *)&self->_documentCreator, 0);
}

@end
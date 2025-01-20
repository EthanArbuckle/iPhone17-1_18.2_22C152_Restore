@interface FRFeldsparContext
- (AAViewingSessionManagerType)issueViewingSessionManager;
- (FCBundleSubscriptionManagerType)bundleSubscriptionManager;
- (FCCloudContext)cloudContext;
- (FCNotificationsConfiguration)notificationsConfiguration;
- (FCPrivateChannelMembershipController)privateChannelMembershipController;
- (FCReadingHistory)readingHistory;
- (FCReadingList)readingList;
- (FCShortcutCategoryList)shortcutCategoryList;
- (FCShortcutList)shortcutList;
- (FCSubscriptionController)subscriptionController;
- (FCSubscriptionList)subscriptionList;
- (FRAnalyticsController)analyticsController;
- (FRAppActivityMonitor)appActivityMonitor;
- (FRAppSessionDataReporting)appSessionDataReporter;
- (FRArticleContentPool)articleContentPool;
- (FRArticlePrefetchManager)articlePrefetchManager;
- (FRFavoritesPersonalizer)favoritesPersonalizer;
- (FRGizmoSyncManager)gizmoSyncManager;
- (FRNonArticleHeadlineVendor)nonArticleVendor;
- (FRNotificationManager)notificationManager;
- (FRPresubscribeService)presubscribeService;
- (FRSpotlightManager)spotlightManager;
- (FRStateRestoreController)stateRestoreController;
- (TSSharedImageCacheType)underlyingImageCache;
- (void)setAnalyticsController:(id)a3;
- (void)setAppActivityMonitor:(id)a3;
- (void)setAppSessionDataReporter:(id)a3;
- (void)setArticleContentPool:(id)a3;
- (void)setArticlePrefetchManager:(id)a3;
- (void)setCloudContext:(id)a3;
- (void)setFavoritesPersonalizer:(id)a3;
- (void)setGizmoSyncManager:(id)a3;
- (void)setIssueViewingSessionManager:(id)a3;
- (void)setNonArticleVendor:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setPresubscribeService:(id)a3;
- (void)setReadingHistory:(id)a3;
- (void)setReadingList:(id)a3;
- (void)setShortcutCategoryList:(id)a3;
- (void)setShortcutList:(id)a3;
- (void)setSpotlightManager:(id)a3;
- (void)setStateRestoreController:(id)a3;
- (void)setUnderlyingImageCache:(id)a3;
@end

@implementation FRFeldsparContext

- (FRAppActivityMonitor)appActivityMonitor
{
  return self->_appActivityMonitor;
}

- (FRFavoritesPersonalizer)favoritesPersonalizer
{
  return self->_favoritesPersonalizer;
}

- (FRAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (FRSpotlightManager)spotlightManager
{
  return self->_spotlightManager;
}

- (void)setUnderlyingImageCache:(id)a3
{
}

- (void)setSpotlightManager:(id)a3
{
}

- (void)setReadingList:(id)a3
{
}

- (void)setReadingHistory:(id)a3
{
}

- (void)setPresubscribeService:(id)a3
{
}

- (void)setNotificationManager:(id)a3
{
}

- (void)setIssueViewingSessionManager:(id)a3
{
}

- (void)setGizmoSyncManager:(id)a3
{
}

- (void)setFavoritesPersonalizer:(id)a3
{
}

- (void)setCloudContext:(id)a3
{
}

- (void)setArticlePrefetchManager:(id)a3
{
}

- (void)setArticleContentPool:(id)a3
{
}

- (void)setAppActivityMonitor:(id)a3
{
}

- (void)setAnalyticsController:(id)a3
{
}

- (FCReadingList)readingList
{
  return self->_readingList;
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (FRGizmoSyncManager)gizmoSyncManager
{
  return self->_gizmoSyncManager;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (FRArticleContentPool)articleContentPool
{
  return self->_articleContentPool;
}

- (FCSubscriptionController)subscriptionController
{
  v2 = [(FRFeldsparContext *)self cloudContext];
  v3 = [v2 subscriptionController];

  return (FCSubscriptionController *)v3;
}

- (FCSubscriptionList)subscriptionList
{
  v2 = [(FRFeldsparContext *)self cloudContext];
  v3 = [v2 subscriptionList];

  return (FCSubscriptionList *)v3;
}

- (FCPrivateChannelMembershipController)privateChannelMembershipController
{
  v2 = [(FRFeldsparContext *)self cloudContext];
  v3 = [v2 privateChannelMembershipController];

  return (FCPrivateChannelMembershipController *)v3;
}

- (FCNotificationsConfiguration)notificationsConfiguration
{
  v2 = [(FRFeldsparContext *)self cloudContext];
  v3 = [v2 appConfigurationManager];
  v4 = [v3 possiblyUnfetchedAppConfiguration];
  v5 = [v4 notificationsConfig];

  return (FCNotificationsConfiguration *)v5;
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  v2 = [(FRFeldsparContext *)self cloudContext];
  v3 = [v2 bundleSubscriptionManager];

  return (FCBundleSubscriptionManagerType *)v3;
}

- (FCShortcutList)shortcutList
{
  return self->_shortcutList;
}

- (void)setShortcutList:(id)a3
{
}

- (FCShortcutCategoryList)shortcutCategoryList
{
  return self->_shortcutCategoryList;
}

- (void)setShortcutCategoryList:(id)a3
{
}

- (FRNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (FRAppSessionDataReporting)appSessionDataReporter
{
  return self->_appSessionDataReporter;
}

- (void)setAppSessionDataReporter:(id)a3
{
}

- (FRNonArticleHeadlineVendor)nonArticleVendor
{
  return self->_nonArticleVendor;
}

- (void)setNonArticleVendor:(id)a3
{
}

- (FRArticlePrefetchManager)articlePrefetchManager
{
  return self->_articlePrefetchManager;
}

- (FRStateRestoreController)stateRestoreController
{
  return self->_stateRestoreController;
}

- (void)setStateRestoreController:(id)a3
{
}

- (TSSharedImageCacheType)underlyingImageCache
{
  return self->_underlyingImageCache;
}

- (AAViewingSessionManagerType)issueViewingSessionManager
{
  return self->_issueViewingSessionManager;
}

- (FRPresubscribeService)presubscribeService
{
  return self->_presubscribeService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presubscribeService, 0);
  objc_storeStrong((id *)&self->_issueViewingSessionManager, 0);
  objc_storeStrong((id *)&self->_gizmoSyncManager, 0);
  objc_storeStrong((id *)&self->_underlyingImageCache, 0);
  objc_storeStrong((id *)&self->_stateRestoreController, 0);
  objc_storeStrong((id *)&self->_spotlightManager, 0);
  objc_storeStrong((id *)&self->_articlePrefetchManager, 0);
  objc_storeStrong((id *)&self->_articleContentPool, 0);
  objc_storeStrong((id *)&self->_favoritesPersonalizer, 0);
  objc_storeStrong((id *)&self->_nonArticleVendor, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_appSessionDataReporter, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_subscriptionList, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_shortcutCategoryList, 0);
  objc_storeStrong((id *)&self->_shortcutList, 0);
  objc_storeStrong((id *)&self->_readingList, 0);

  objc_storeStrong((id *)&self->_readingHistory, 0);
}

@end
@interface FRMenuBarClearDataManager
- (BOOL)isSyncingEnabled;
- (FCAppleAccount)account;
- (FCClearableReadingHistory)clearReadingHistoryManager;
- (FCClearableUserEmbedding)clearableUserEmbedding;
- (FCNewsletterManager)newsletterManager;
- (FCPersonalizationData)personalizationData;
- (FCUserEventHistoryStorageType)userEventHistoryStorage;
- (FRAnalyticsController)analyticsController;
- (FRMenuBarClearDataManager)initWithAccount:(id)a3 clearReadingHistoryManager:(id)a4 personalizationData:(id)a5 analyticsController:(id)a6 newsletterManager:(id)a7 userEventHistoryStorage:(id)a8 userActivityManager:(id)a9 clearableUserEmbedding:(id)a10;
- (TSNewsActivityManagerType)userActivityManager;
- (void)clearAllData;
- (void)clearHistory;
- (void)clearRecommendations;
- (void)resetIdentifier;
@end

@implementation FRMenuBarClearDataManager

- (FRMenuBarClearDataManager)initWithAccount:(id)a3 clearReadingHistoryManager:(id)a4 personalizationData:(id)a5 analyticsController:(id)a6 newsletterManager:(id)a7 userEventHistoryStorage:(id)a8 userActivityManager:(id)a9 clearableUserEmbedding:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)FRMenuBarClearDataManager;
  v18 = [(FRMenuBarClearDataManager *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_clearReadingHistoryManager, a4);
    objc_storeStrong((id *)&v19->_personalizationData, a5);
    objc_storeStrong((id *)&v19->_analyticsController, a6);
    objc_storeStrong((id *)&v19->_newsletterManager, a7);
    objc_storeStrong((id *)&v19->_userEventHistoryStorage, a8);
    objc_storeStrong((id *)&v19->_userActivityManager, a9);
    objc_storeStrong((id *)&v19->_clearableUserEmbedding, a10);
  }

  return v19;
}

- (BOOL)isSyncingEnabled
{
  v2 = [(FRMenuBarClearDataManager *)self account];
  unsigned __int8 v3 = [v2 isPrivateDataSyncingEnabled];

  return v3;
}

- (void)clearAllData
{
  [(FRMenuBarClearDataManager *)self clearHistory];
  [(FRMenuBarClearDataManager *)self clearRecommendations];
  [(FRMenuBarClearDataManager *)self resetIdentifier];
  id v3 = [(FRMenuBarClearDataManager *)self userActivityManager];
  [v3 clearAllSavedUserActivities];
}

- (void)clearHistory
{
  id v3 = [(FRMenuBarClearDataManager *)self clearReadingHistoryManager];
  [v3 clearHistory];

  id v4 = [(FRMenuBarClearDataManager *)self userActivityManager];
  [v4 clearAllSavedUserActivities];
}

- (void)clearRecommendations
{
  id v3 = [(FRMenuBarClearDataManager *)self personalizationData];
  [v3 clearPersonalizationData];

  id v4 = [(FRMenuBarClearDataManager *)self userEventHistoryStorage];
  [v4 clearHistory];

  v5 = [(FRMenuBarClearDataManager *)self clearableUserEmbedding];
  [v5 clearHistory];

  v6 = [(FRMenuBarClearDataManager *)self newsletterManager];
  [v6 deletePersonalizationVector];

  id v7 = [(FRMenuBarClearDataManager *)self userActivityManager];
  [v7 clearAllSavedUserActivities];
}

- (void)resetIdentifier
{
  id v3 = +[UIApplication sharedApplication];
  id v4 = [v3 key_window];
  v5 = [v4 windowScene];
  v6 = [v5 session];
  id v9 = [v6 persistentIdentifier];

  id v7 = [(FRMenuBarClearDataManager *)self analyticsController];
  [v7 endSessionForReason:1 byStartingNewSession:1 resetUserID:1 forSceneID:v9];

  v8 = [(FRMenuBarClearDataManager *)self userActivityManager];
  [v8 clearAllSavedUserActivities];
}

- (FCAppleAccount)account
{
  return self->_account;
}

- (FCClearableReadingHistory)clearReadingHistoryManager
{
  return self->_clearReadingHistoryManager;
}

- (FCPersonalizationData)personalizationData
{
  return self->_personalizationData;
}

- (FRAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (FCNewsletterManager)newsletterManager
{
  return self->_newsletterManager;
}

- (FCUserEventHistoryStorageType)userEventHistoryStorage
{
  return self->_userEventHistoryStorage;
}

- (TSNewsActivityManagerType)userActivityManager
{
  return self->_userActivityManager;
}

- (FCClearableUserEmbedding)clearableUserEmbedding
{
  return self->_clearableUserEmbedding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearableUserEmbedding, 0);
  objc_storeStrong((id *)&self->_userActivityManager, 0);
  objc_storeStrong((id *)&self->_userEventHistoryStorage, 0);
  objc_storeStrong((id *)&self->_newsletterManager, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_personalizationData, 0);
  objc_storeStrong((id *)&self->_clearReadingHistoryManager, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end
@interface FCPrivateDataContext
- (BOOL)isPrivateDataSyncingEnabled;
- (FCAudioPlaylist)audioPlaylist;
- (FCContentContext)contentContext;
- (FCIssueReadingHistory)issueReadingHistory;
- (FCNetworkBehaviorMonitor)networkBehaviorMonitor;
- (FCPersonalizationData)personalizationData;
- (FCPrivateChannelMembershipController)privateChannelMembershipController;
- (FCPrivateDataContext)init;
- (FCPrivateDataContext)initWithConfiguration:(id)a3 context:(id)a4 privateDataHostDirectory:(id)a5 privateDataActionProvider:(id)a6 encryptionDelegate:(id)a7 networkBehaviorMonitor:(id)a8 privateDataSyncingEnabled:(BOOL)a9;
- (FCPrivateDataContext)initWithConfiguration:(id)a3 context:(id)a4 privateDatabase:(id)a5 privateDataDirectory:(id)a6 privateDataActionProvider:(id)a7 encryptionDelegate:(id)a8 networkBehaviorMonitor:(id)a9 privateDataSyncingEnabled:(BOOL)a10;
- (FCPrivateDataContextInternal)internalPrivateDataContext;
- (FCPushNotificationHandling)privatePushNotificationHandler;
- (FCPuzzleHistory)puzzleHistory;
- (FCPuzzleTypeSettings)puzzleTypeSettings;
- (FCReadingHistory)readingHistory;
- (FCReadingList)readingList;
- (FCShortcutCategoryList)shortcutCategoryList;
- (FCShortcutList)shortcutList;
- (FCSubscriptionList)subscriptionList;
- (FCTagSettings)tagSettings;
- (FCUserEventHistory)userEventHistory;
- (FCUserInfo)userInfo;
- (NSString)privateDataDirectory;
- (id)_privateDataControllers;
- (id)privateStoreWithName:(id)a3 version:(unint64_t)a4 options:(unint64_t)a5;
- (void)preparePrivateDataControllersForUse;
- (void)setContentContext:(id)a3;
- (void)setInternalPrivateDataContext:(id)a3;
@end

@implementation FCPrivateDataContext

- (FCShortcutList)shortcutList
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  shortcutList = self->_shortcutList;
  if (!shortcutList)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_shortcutList");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext shortcutList]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 296;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      shortcutList = self->_shortcutList;
    }
    else
    {
      shortcutList = 0;
    }
  }
  return shortcutList;
}

- (FCPersonalizationData)personalizationData
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  personalizationData = self->_personalizationData;
  if (!personalizationData)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_personalizationData");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext personalizationData]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 267;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      personalizationData = self->_personalizationData;
    }
    else
    {
      personalizationData = 0;
    }
  }
  return personalizationData;
}

- (FCReadingList)readingList
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  readingList = self->_readingList;
  if (!readingList)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_readingList");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext readingList]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 284;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      readingList = self->_readingList;
    }
    else
    {
      readingList = 0;
    }
  }
  return readingList;
}

- (NSString)privateDataDirectory
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  privateDataDirectory = self->_privateDataDirectory;
  if (!privateDataDirectory)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_privateDataDirectory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext privateDataDirectory]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 338;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      privateDataDirectory = self->_privateDataDirectory;
    }
    else
    {
      privateDataDirectory = 0;
    }
  }
  return privateDataDirectory;
}

- (FCUserInfo)userInfo
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_userInfo");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext userInfo]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 326;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      userInfo = self->_userInfo;
    }
    else
    {
      userInfo = 0;
    }
  }
  return userInfo;
}

- (FCReadingHistory)readingHistory
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  readingHistory = self->_readingHistory;
  if (!readingHistory)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_readingHistory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext readingHistory]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 278;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      readingHistory = self->_readingHistory;
    }
    else
    {
      readingHistory = 0;
    }
  }
  return readingHistory;
}

- (FCPrivateChannelMembershipController)privateChannelMembershipController
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  privateChannelMembershipController = self->_privateChannelMembershipController;
  if (!privateChannelMembershipController)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_privateChannelMembershipController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext privateChannelMembershipController]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 272;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      privateChannelMembershipController = self->_privateChannelMembershipController;
    }
    else
    {
      privateChannelMembershipController = 0;
    }
  }
  return privateChannelMembershipController;
}

- (FCIssueReadingHistory)issueReadingHistory
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  issueReadingHistory = self->_issueReadingHistory;
  if (!issueReadingHistory)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_issueReadingHistory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext issueReadingHistory]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 262;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      issueReadingHistory = self->_issueReadingHistory;
    }
    else
    {
      issueReadingHistory = 0;
    }
  }
  return issueReadingHistory;
}

- (FCSubscriptionList)subscriptionList
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  subscriptionList = self->_subscriptionList;
  if (!subscriptionList)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_subscriptionList");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext subscriptionList]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 320;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      subscriptionList = self->_subscriptionList;
    }
    else
    {
      subscriptionList = 0;
    }
  }
  return subscriptionList;
}

- (FCPrivateDataContextInternal)internalPrivateDataContext
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  internalPrivateDataContext = self->_internalPrivateDataContext;
  if (!internalPrivateDataContext)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_internalPrivateDataContext");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext internalPrivateDataContext]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 344;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      internalPrivateDataContext = self->_internalPrivateDataContext;
    }
    else
    {
      internalPrivateDataContext = 0;
    }
  }
  return internalPrivateDataContext;
}

- (FCUserEventHistory)userEventHistory
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  userEventHistory = self->_userEventHistory;
  if (!userEventHistory)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_userEventHistory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext userEventHistory]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 314;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      userEventHistory = self->_userEventHistory;
    }
    else
    {
      userEventHistory = 0;
    }
  }
  return userEventHistory;
}

- (FCAudioPlaylist)audioPlaylist
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  audioPlaylist = self->_audioPlaylist;
  if (!audioPlaylist)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_audioPlaylist");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext audioPlaylist]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 308;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      audioPlaylist = self->_audioPlaylist;
    }
    else
    {
      audioPlaylist = 0;
    }
  }
  return audioPlaylist;
}

- (FCPuzzleHistory)puzzleHistory
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  puzzleHistory = self->_puzzleHistory;
  if (!puzzleHistory)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_puzzleHistory");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext puzzleHistory]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 290;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      puzzleHistory = self->_puzzleHistory;
    }
    else
    {
      puzzleHistory = 0;
    }
  }
  return puzzleHistory;
}

- (FCPrivateDataContext)initWithConfiguration:(id)a3 context:(id)a4 privateDataHostDirectory:(id)a5 privateDataActionProvider:(id)a6 encryptionDelegate:(id)a7 networkBehaviorMonitor:(id)a8 privateDataSyncingEnabled:(BOOL)a9
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "context != nil");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCPrivateDataContext initWithConfiguration:context:privateDataHostDirectory:privateDataActionProvider:encryp"
          "tionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:]";
    __int16 v34 = 2080;
    v35 = "FCPrivateDataContext.m";
    __int16 v36 = 1024;
    int v37 = 97;
    __int16 v38 = 2114;
    v39 = v28;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateDataHostDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCPrivateDataContext initWithConfiguration:context:privateDataHostDirectory:privateDataActionProvider:encryp"
          "tionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:]";
    __int16 v34 = 2080;
    v35 = "FCPrivateDataContext.m";
    __int16 v36 = 1024;
    int v37 = 98;
    __int16 v38 = 2114;
    v39 = v29;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v20 = [FCCKPrivateDatabase alloc];
  v21 = [v14 privateDataContainerIdentifier];
  v22 = [v14 privateDataSecureContainerIdentifier];
  v23 = -[FCCKPrivateDatabase initWithContainerIdentifier:secureContainerIdentifier:productionEnvironment:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:](v20, v21, v22, [v14 isProductionPrivateDataEnvironment], v18, v19, a9);

  v24 = [v14 privateDataContainerCombinationIdentifier];
  v25 = [v16 URLByAppendingPathComponent:v24 isDirectory:1];

  LOBYTE(v30) = a9;
  v26 = [(FCPrivateDataContext *)self initWithConfiguration:v14 context:v15 privateDatabase:v23 privateDataDirectory:v25 privateDataActionProvider:v17 encryptionDelegate:v18 networkBehaviorMonitor:v19 privateDataSyncingEnabled:v30];

  return v26;
}

- (FCPrivateDataContext)initWithConfiguration:(id)a3 context:(id)a4 privateDatabase:(id)a5 privateDataDirectory:(id)a6 privateDataActionProvider:(id)a7 encryptionDelegate:(id)a8 networkBehaviorMonitor:(id)a9 privateDataSyncingEnabled:(BOOL)a10
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v74 = a6;
  id v73 = a7;
  id v19 = a8;
  id v72 = a9;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v60 = v19;
    v61 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "context != nil");
    *(_DWORD *)buf = 136315906;
    v78 = "-[FCPrivateDataContext initWithConfiguration:context:privateDatabase:privateDataDirectory:privateDataActionPro"
          "vider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:]";
    __int16 v79 = 2080;
    v80 = "FCPrivateDataContext.m";
    __int16 v81 = 1024;
    int v82 = 128;
    __int16 v83 = 2114;
    v84 = v61;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v19 = v60;
    if (v18) {
      goto LABEL_6;
    }
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v62 = v19;
    v63 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateDatabase != nil");
    *(_DWORD *)buf = 136315906;
    v78 = "-[FCPrivateDataContext initWithConfiguration:context:privateDatabase:privateDataDirectory:privateDataActionPro"
          "vider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:]";
    __int16 v79 = 2080;
    v80 = "FCPrivateDataContext.m";
    __int16 v81 = 1024;
    int v82 = 129;
    __int16 v83 = 2114;
    v84 = v63;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v19 = v62;
  }
LABEL_6:
  v20 = v74;
  if (!v74 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v64 = v19;
    v65 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateDataDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v78 = "-[FCPrivateDataContext initWithConfiguration:context:privateDatabase:privateDataDirectory:privateDataActionPro"
          "vider:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:]";
    __int16 v79 = 2080;
    v80 = "FCPrivateDataContext.m";
    __int16 v81 = 1024;
    int v82 = 130;
    __int16 v83 = 2114;
    v84 = v65;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v19 = v64;
  }
  v75.receiver = self;
  v75.super_class = (Class)FCPrivateDataContext;
  v21 = [(FCPrivateDataContext *)&v75 init];
  v22 = v21;
  if (v21)
  {
    id v70 = v19;
    id v71 = v16;
    objc_storeStrong((id *)&v21->_contentContext, a4);
    v22->_privateDataSyncingEnabled = a10;
    v23 = [v74 path];
    uint64_t v24 = [v23 copy];
    privateDataDirectory = v22->_privateDataDirectory;
    v22->_privateDataDirectory = (NSString *)v24;

    objc_storeStrong((id *)&v22->_networkBehaviorMonitor, a9);
    v26 = [v74 path];
    v27 = -[FCPushNotificationCenter initWithPrivateDatabase:storeDirectory:]([FCPushNotificationCenter alloc], v18, v26);
    objc_storeStrong((id *)&v22->_privatePushNotificationHandler, v27);
    v28 = objc_opt_new();
    objc_storeStrong((id *)&v22->_internalPrivateDataContext, v28);
    v29 = [v17 appActivityMonitor];
    [v28 setAppActivityMonitor:v29];

    [v28 setPrivateDatabase:v18];
    v76[0] = @"AudioPlaylist";
    v76[1] = @"IssueReadingHistory";
    v76[2] = @"Subscriptions";
    v76[3] = @"Shortcuts";
    v76[4] = @"SensitiveSubscriptions";
    v76[5] = @"ReadingList";
    v76[6] = @"ReadingHistory";
    v76[7] = @"ChannelMemberships";
    v76[8] = @"UserInfo";
    v76[9] = @"UserEventHistory";
    v76[10] = @"PuzzleHistory";
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:11];
    uint64_t v30 = -[FCCKRecordZoneManager initWithDatabase:recordZoneNames:]([FCCKRecordZoneManager alloc], v18, v68);
    v69 = v28;
    [v28 setRecordZoneManager:v30];

    v31 = [[FCSubscriptionList alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26];
    subscriptionList = v22->_subscriptionList;
    v22->_subscriptionList = v31;

    v67 = [[FCIssueReadingHistory alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26];
    objc_storeStrong((id *)&v22->_issueReadingHistory, v67);
    v66 = [[FCReadingHistory alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26];
    objc_storeStrong((id *)&v22->_readingHistory, v66);
    v33 = [[FCReadingList alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26];
    readingList = v22->_readingList;
    v22->_readingList = v33;

    v35 = [[FCPuzzleHistory alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26];
    puzzleHistory = v22->_puzzleHistory;
    v22->_puzzleHistory = v35;

    int v37 = [[FCShortcutList alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26];
    shortcutList = v22->_shortcutList;
    v22->_shortcutList = v37;

    v39 = [[FCShortcutCategoryList alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26];
    shortcutCategoryList = v22->_shortcutCategoryList;
    v22->_shortcutCategoryList = v39;

    v41 = [[FCAudioPlaylist alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26];
    audioPlaylist = v22->_audioPlaylist;
    v22->_audioPlaylist = v41;

    v43 = [FCUserEventHistoryStorage alloc];
    v44 = [v17 appConfigurationManager];
    v45 = [(FCUserEventHistoryStorage *)v43 initWithPrivateDataDirectory:v74 configurationManager:v44];

    v46 = [[FCUserEventHistory alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26 sessionStorage:v45];
    userEventHistory = v22->_userEventHistory;
    v22->_userEventHistory = v46;

    v48 = [[FCPrivateChannelMembershipController alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26];
    objc_storeStrong((id *)&v22->_privateChannelMembershipController, v48);
    v49 = [[FCUserInfo alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26];
    objc_storeStrong((id *)&v22->_userInfo, v49);
    uint64_t v50 = [(FCUserInfo *)v22->_userInfo tagSettings];
    tagSettings = v22->_tagSettings;
    v22->_tagSettings = (FCTagSettings *)v50;

    uint64_t v52 = [(FCUserInfo *)v22->_userInfo puzzleTypeSettings];
    puzzleTypeSettings = v22->_puzzleTypeSettings;
    v22->_puzzleTypeSettings = (FCPuzzleTypeSettings *)v52;

    v54 = [[FCPersonalizationData alloc] initWithContext:v17 pushNotificationCenter:v27 storeDirectory:v26];
    personalizationData = v22->_personalizationData;
    v22->_personalizationData = v54;

    v56 = [(FCPrivateDataContext *)v22 _privateDataControllers];
    if (v73)
    {
      id v57 = v18;
      v58 = [[FCNonDestructivePrivateDataMigrationHandler alloc] initWithPrivateDataActionProvider:v73 privateDataControllers:v56 privateDataSyncingEnabled:a10];
      [(FCNonDestructivePrivateDataMigrationHandler *)v58 handleMigrationWithPrivateDataDirectory:v22->_privateDataDirectory];

      id v18 = v57;
    }
    if (a10) {
      -[FCPushNotificationCenter enableSyncing](v27);
    }
    else {
      -[FCPushNotificationCenter disableSyncing]((uint64_t)v27);
    }
    -[FCCKPrivateDatabase registerZoneRestorationSources:]((uint64_t)v18, v56);
    -[FCCKPrivateDatabase registerZonePruningAssistants:]((uint64_t)v18, v56);

    id v19 = v70;
    id v16 = v71;
    v20 = v74;
  }

  return v22;
}

- (FCTagSettings)tagSettings
{
  return self->_tagSettings;
}

- (void)preparePrivateDataControllersForUse
{
  id v3 = [(FCPrivateDataContext *)self _privateDataControllers];
  [v3 makeObjectsPerformSelector:sel_prepareForUse];
  [v3 makeObjectsPerformSelector:sel_addStateObserver_ withObject:self];
  [v3 makeObjectsPerformSelector:sel_assertReadyForUse];
}

- (id)_privateDataControllers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  issueReadingHistory = self->_issueReadingHistory;
  personalizationData = self->_personalizationData;
  userEventHistory = self->_userEventHistory;
  v11[0] = self->_audioPlaylist;
  v11[1] = issueReadingHistory;
  privateChannelMembershipController = self->_privateChannelMembershipController;
  readingHistory = self->_readingHistory;
  userInfo = self->_userInfo;
  v11[2] = self->_subscriptionList;
  v11[3] = readingHistory;
  long long v8 = *(_OWORD *)&self->_readingList;
  shortcutList = self->_shortcutList;
  id v14 = privateChannelMembershipController;
  long long v12 = v8;
  id v15 = userInfo;
  id v16 = personalizationData;
  id v17 = userEventHistory;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:11];
  return v9;
}

- (FCShortcutCategoryList)shortcutCategoryList
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  shortcutCategoryList = self->_shortcutCategoryList;
  if (!shortcutCategoryList)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_shortcutCategoryList");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext shortcutCategoryList]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 302;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      shortcutCategoryList = self->_shortcutCategoryList;
    }
    else
    {
      shortcutCategoryList = 0;
    }
  }
  return shortcutCategoryList;
}

- (FCPuzzleTypeSettings)puzzleTypeSettings
{
  return self->_puzzleTypeSettings;
}

- (FCPrivateDataContext)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "-[FCPrivateDataContext init]";
    __int16 v9 = 2080;
    __int16 v10 = "FCPrivateDataContext.m";
    __int16 v11 = 1024;
    int v12 = 86;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPrivateDataContext init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPushNotificationHandling)privatePushNotificationHandler
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  privatePushNotificationHandler = self->_privatePushNotificationHandler;
  if (!privatePushNotificationHandler)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_privatePushNotificationHandler");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContext privatePushNotificationHandler]";
      __int16 v8 = 2080;
      __int16 v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 332;
      __int16 v12 = 2114;
      __int16 v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      privatePushNotificationHandler = self->_privatePushNotificationHandler;
    }
    else
    {
      privatePushNotificationHandler = 0;
    }
  }
  return privatePushNotificationHandler;
}

- (id)privateStoreWithName:(id)a3 version:(unint64_t)a4 options:(unint64_t)a5
{
  id v8 = a3;
  __int16 v9 = [FCKeyValueStore alloc];
  __int16 v10 = [(FCPrivateDataContext *)self privateDataDirectory];
  int v11 = [(FCKeyValueStore *)v9 initWithName:v8 directory:v10 version:a4 options:a5 classRegistry:0];

  return v11;
}

- (BOOL)isPrivateDataSyncingEnabled
{
  return self->_privateDataSyncingEnabled;
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (void)setInternalPrivateDataContext:(id)a3
{
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_internalPrivateDataContext, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_privatePushNotificationHandler, 0);
  objc_storeStrong((id *)&self->_tagSettings, 0);
  objc_storeStrong((id *)&self->_privateDataDirectory, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_subscriptionList, 0);
  objc_storeStrong((id *)&self->_userEventHistory, 0);
  objc_storeStrong((id *)&self->_audioPlaylist, 0);
  objc_storeStrong((id *)&self->_shortcutCategoryList, 0);
  objc_storeStrong((id *)&self->_shortcutList, 0);
  objc_storeStrong((id *)&self->_puzzleTypeSettings, 0);
  objc_storeStrong((id *)&self->_puzzleHistory, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_privateChannelMembershipController, 0);
  objc_storeStrong((id *)&self->_personalizationData, 0);
  objc_storeStrong((id *)&self->_issueReadingHistory, 0);
}

@end
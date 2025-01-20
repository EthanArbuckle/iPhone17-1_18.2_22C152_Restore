@interface FCContentContextInternal
- (FCAVAssetCacheType)avAssetCache;
- (FCAVAssetDownloadManager)avAssetDownloadManager;
- (FCAVAssetFactoryType)avAssetFactory;
- (FCAVAssetKeyCacheType)avAssetKeyCache;
- (FCArticleListRecordSource)articleListRecordSource;
- (FCArticleRecordSource)articleRecordSource;
- (FCAssetKeyCacheType)assetKeyCache;
- (FCAssetKeyManagerType)assetKeyManager;
- (FCAudioConfigRecordSource)audioConfigRecordSource;
- (FCCKContentDatabase)contentDatabase;
- (FCChannelMembershipController)channelMembershipController;
- (FCContentContextInternal)init;
- (FCFeedDatabase)feedDatabase;
- (FCFeedPrewarmer)feedPrewarmer;
- (FCForYouConfigRecordSource)forYouConfigRecordSource;
- (FCIssueListRecordSource)issueListRecordSource;
- (FCIssueRecordSource)issueRecordSource;
- (FCNotificationItemListRecordSource)notificationItemListRecordSource;
- (FCNotificationItemRecordSource)notificationItemRecordSource;
- (FCPurchaseLookupRecordSource)purchaseLookupRecordSource;
- (FCPuzzleRecordSource)puzzleRecordSource;
- (FCPuzzleTypeRecordSource)puzzleTypeRecordSource;
- (FCResourceRecordSource)resourceRecordSource;
- (FCSportsEventRecordSource)sportsEventRecordSource;
- (FCTagListRecordSource)tagListRecordSource;
- (FCTagRecordSource)tagRecordSource;
- (FCWidgetSectionConfigRecordSource)widgetSectionConfigRecordSource;
- (NSArray)recordSources;
- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3;
- (void)setArticleListRecordSource:(id)a3;
- (void)setArticleRecordSource:(id)a3;
- (void)setAssetKeyCache:(id)a3;
- (void)setAssetKeyManager:(id)a3;
- (void)setAudioConfigRecordSource:(id)a3;
- (void)setAvAssetCache:(id)a3;
- (void)setAvAssetDownloadManager:(id)a3;
- (void)setAvAssetFactory:(id)a3;
- (void)setAvAssetKeyCache:(id)a3;
- (void)setChannelMembershipController:(id)a3;
- (void)setContentDatabase:(id)a3;
- (void)setFeedDatabase:(id)a3;
- (void)setFeedPrewarmer:(id)a3;
- (void)setForYouConfigRecordSource:(id)a3;
- (void)setIssueListRecordSource:(id)a3;
- (void)setIssueRecordSource:(id)a3;
- (void)setNotificationItemListRecordSource:(id)a3;
- (void)setNotificationItemRecordSource:(id)a3;
- (void)setPurchaseLookupRecordSource:(id)a3;
- (void)setPuzzleRecordSource:(id)a3;
- (void)setPuzzleTypeRecordSource:(id)a3;
- (void)setResourceRecordSource:(id)a3;
- (void)setSportsEventRecordSource:(id)a3;
- (void)setTagListRecordSource:(id)a3;
- (void)setTagRecordSource:(id)a3;
- (void)setWidgetSectionConfigRecordSource:(id)a3;
@end

@implementation FCContentContextInternal

- (FCCKContentDatabase)contentDatabase
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  contentDatabase = self->_contentDatabase;
  if (!contentDatabase)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_contentDatabase");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal contentDatabase]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 990;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      contentDatabase = self->_contentDatabase;
    }
    else
    {
      contentDatabase = 0;
    }
  }
  return contentDatabase;
}

- (FCChannelMembershipController)channelMembershipController
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  channelMembershipController = self->_channelMembershipController;
  if (!channelMembershipController)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_channelMembershipController");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal channelMembershipController]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 890;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      channelMembershipController = self->_channelMembershipController;
    }
    else
    {
      channelMembershipController = 0;
    }
  }
  return channelMembershipController;
}

- (NSArray)recordSources
{
  v21[16] = *MEMORY[0x1E4F143B8];
  v20 = [(FCContentContextInternal *)self articleRecordSource];
  v21[0] = v20;
  v19 = [(FCContentContextInternal *)self articleListRecordSource];
  v21[1] = v19;
  v18 = [(FCContentContextInternal *)self audioConfigRecordSource];
  v21[2] = v18;
  v17 = [(FCContentContextInternal *)self forYouConfigRecordSource];
  v21[3] = v17;
  v16 = [(FCContentContextInternal *)self issueRecordSource];
  v21[4] = v16;
  v15 = [(FCContentContextInternal *)self issueListRecordSource];
  v21[5] = v15;
  v3 = [(FCContentContextInternal *)self notificationItemRecordSource];
  v21[6] = v3;
  v4 = [(FCContentContextInternal *)self notificationItemListRecordSource];
  v21[7] = v4;
  v5 = [(FCContentContextInternal *)self purchaseLookupRecordSource];
  v21[8] = v5;
  v6 = [(FCContentContextInternal *)self puzzleRecordSource];
  v21[9] = v6;
  v7 = [(FCContentContextInternal *)self puzzleTypeRecordSource];
  v21[10] = v7;
  __int16 v8 = [(FCContentContextInternal *)self resourceRecordSource];
  v21[11] = v8;
  v9 = [(FCContentContextInternal *)self sportsEventRecordSource];
  v21[12] = v9;
  __int16 v10 = [(FCContentContextInternal *)self tagRecordSource];
  v21[13] = v10;
  int v11 = [(FCContentContextInternal *)self tagListRecordSource];
  v21[14] = v11;
  __int16 v12 = [(FCContentContextInternal *)self widgetSectionConfigRecordSource];
  v21[15] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:16];

  return (NSArray *)v14;
}

- (FCResourceRecordSource)resourceRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  resourceRecordSource = self->_resourceRecordSource;
  if (!resourceRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_resourceRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal resourceRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 896;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      resourceRecordSource = self->_resourceRecordSource;
    }
    else
    {
      resourceRecordSource = 0;
    }
  }
  return resourceRecordSource;
}

- (FCTagRecordSource)tagRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  tagRecordSource = self->_tagRecordSource;
  if (!tagRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_tagRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal tagRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 878;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      tagRecordSource = self->_tagRecordSource;
    }
    else
    {
      tagRecordSource = 0;
    }
  }
  return tagRecordSource;
}

- (FCArticleRecordSource)articleRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  articleRecordSource = self->_articleRecordSource;
  if (!articleRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_articleRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal articleRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 872;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      articleRecordSource = self->_articleRecordSource;
    }
    else
    {
      articleRecordSource = 0;
    }
  }
  return articleRecordSource;
}

- (FCWidgetSectionConfigRecordSource)widgetSectionConfigRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  widgetSectionConfigRecordSource = self->_widgetSectionConfigRecordSource;
  if (!widgetSectionConfigRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_widgetSectionConfigRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal widgetSectionConfigRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 920;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      widgetSectionConfigRecordSource = self->_widgetSectionConfigRecordSource;
    }
    else
    {
      widgetSectionConfigRecordSource = 0;
    }
  }
  return widgetSectionConfigRecordSource;
}

- (FCTagListRecordSource)tagListRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  tagListRecordSource = self->_tagListRecordSource;
  if (!tagListRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_tagListRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal tagListRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 884;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      tagListRecordSource = self->_tagListRecordSource;
    }
    else
    {
      tagListRecordSource = 0;
    }
  }
  return tagListRecordSource;
}

- (FCSportsEventRecordSource)sportsEventRecordSource
{
  return self->_sportsEventRecordSource;
}

- (FCPuzzleTypeRecordSource)puzzleTypeRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  puzzleTypeRecordSource = self->_puzzleTypeRecordSource;
  if (!puzzleTypeRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_puzzleTypeRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal puzzleTypeRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 950;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      puzzleTypeRecordSource = self->_puzzleTypeRecordSource;
    }
    else
    {
      puzzleTypeRecordSource = 0;
    }
  }
  return puzzleTypeRecordSource;
}

- (FCPuzzleRecordSource)puzzleRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  puzzleRecordSource = self->_puzzleRecordSource;
  if (!puzzleRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_puzzleRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal puzzleRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 944;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      puzzleRecordSource = self->_puzzleRecordSource;
    }
    else
    {
      puzzleRecordSource = 0;
    }
  }
  return puzzleRecordSource;
}

- (FCPurchaseLookupRecordSource)purchaseLookupRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  purchaseLookupRecordSource = self->_purchaseLookupRecordSource;
  if (!purchaseLookupRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_purchaseLookupRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal purchaseLookupRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 908;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      purchaseLookupRecordSource = self->_purchaseLookupRecordSource;
    }
    else
    {
      purchaseLookupRecordSource = 0;
    }
  }
  return purchaseLookupRecordSource;
}

- (FCNotificationItemRecordSource)notificationItemRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  notificationItemRecordSource = self->_notificationItemRecordSource;
  if (!notificationItemRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_notificationItemRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal notificationItemRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 956;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      notificationItemRecordSource = self->_notificationItemRecordSource;
    }
    else
    {
      notificationItemRecordSource = 0;
    }
  }
  return notificationItemRecordSource;
}

- (FCNotificationItemListRecordSource)notificationItemListRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  notificationItemListRecordSource = self->_notificationItemListRecordSource;
  if (!notificationItemListRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_notificationItemListRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal notificationItemListRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 962;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      notificationItemListRecordSource = self->_notificationItemListRecordSource;
    }
    else
    {
      notificationItemListRecordSource = 0;
    }
  }
  return notificationItemListRecordSource;
}

- (FCIssueRecordSource)issueRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  issueRecordSource = self->_issueRecordSource;
  if (!issueRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_issueRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal issueRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 926;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      issueRecordSource = self->_issueRecordSource;
    }
    else
    {
      issueRecordSource = 0;
    }
  }
  return issueRecordSource;
}

- (FCIssueListRecordSource)issueListRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  issueListRecordSource = self->_issueListRecordSource;
  if (!issueListRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_issueListRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal issueListRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 932;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      issueListRecordSource = self->_issueListRecordSource;
    }
    else
    {
      issueListRecordSource = 0;
    }
  }
  return issueListRecordSource;
}

- (FCForYouConfigRecordSource)forYouConfigRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  forYouConfigRecordSource = self->_forYouConfigRecordSource;
  if (!forYouConfigRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_forYouConfigRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal forYouConfigRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 914;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      forYouConfigRecordSource = self->_forYouConfigRecordSource;
    }
    else
    {
      forYouConfigRecordSource = 0;
    }
  }
  return forYouConfigRecordSource;
}

- (FCAudioConfigRecordSource)audioConfigRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  audioConfigRecordSource = self->_audioConfigRecordSource;
  if (!audioConfigRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_audioConfigRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal audioConfigRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 938;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      audioConfigRecordSource = self->_audioConfigRecordSource;
    }
    else
    {
      audioConfigRecordSource = 0;
    }
  }
  return audioConfigRecordSource;
}

- (FCArticleListRecordSource)articleListRecordSource
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  articleListRecordSource = self->_articleListRecordSource;
  if (!articleListRecordSource)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_articleListRecordSource");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCContentContextInternal articleListRecordSource]";
      __int16 v8 = 2080;
      v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 902;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      articleListRecordSource = self->_articleListRecordSource;
    }
    else
    {
      articleListRecordSource = 0;
    }
  }
  return articleListRecordSource;
}

void __64__FCContentContextInternal_enableFlushingWithFlushingThreshold___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 recordSources];
  [v3 addObjectsFromArray:v4];
}

- (void)enableFlushingWithFlushingThreshold:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__FCContentContextInternal_enableFlushingWithFlushingThreshold___block_invoke;
  v13[3] = &unk_1E5B4BF30;
  v13[4] = self;
  id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v13);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) enableFlushingWithFlushingThreshold:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setWidgetSectionConfigRecordSource:(id)a3
{
}

- (void)setTagRecordSource:(id)a3
{
}

- (void)setTagListRecordSource:(id)a3
{
}

- (void)setSportsEventRecordSource:(id)a3
{
}

- (void)setResourceRecordSource:(id)a3
{
}

- (void)setPuzzleTypeRecordSource:(id)a3
{
}

- (void)setPuzzleRecordSource:(id)a3
{
}

- (void)setPurchaseLookupRecordSource:(id)a3
{
}

- (void)setNotificationItemRecordSource:(id)a3
{
}

- (void)setNotificationItemListRecordSource:(id)a3
{
}

- (void)setIssueRecordSource:(id)a3
{
}

- (void)setIssueListRecordSource:(id)a3
{
}

- (void)setForYouConfigRecordSource:(id)a3
{
}

- (void)setFeedPrewarmer:(id)a3
{
}

- (void)setFeedDatabase:(id)a3
{
}

- (void)setContentDatabase:(id)a3
{
}

- (void)setChannelMembershipController:(id)a3
{
}

- (void)setAvAssetKeyCache:(id)a3
{
}

- (void)setAvAssetFactory:(id)a3
{
}

- (void)setAvAssetDownloadManager:(id)a3
{
}

- (void)setAvAssetCache:(id)a3
{
}

- (void)setAudioConfigRecordSource:(id)a3
{
}

- (void)setAssetKeyManager:(id)a3
{
}

- (void)setAssetKeyCache:(id)a3
{
}

- (void)setArticleRecordSource:(id)a3
{
}

- (void)setArticleListRecordSource:(id)a3
{
}

- (FCContentContextInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCContentContextInternal;
  return [(FCContentContextInternal *)&v3 init];
}

- (FCAssetKeyCacheType)assetKeyCache
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  assetKeyCache = self->_assetKeyCache;
  if (!assetKeyCache)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_assetKeyCache");
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = "-[FCContentContextInternal assetKeyCache]";
      __int16 v8 = 2080;
      long long v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 996;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      assetKeyCache = self->_assetKeyCache;
    }
    else
    {
      assetKeyCache = 0;
    }
  }
  return assetKeyCache;
}

- (FCAssetKeyManagerType)assetKeyManager
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  assetKeyManager = self->_assetKeyManager;
  if (!assetKeyManager)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_assetKeyManager");
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = "-[FCContentContextInternal assetKeyManager]";
      __int16 v8 = 2080;
      long long v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 1002;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      assetKeyManager = self->_assetKeyManager;
    }
    else
    {
      assetKeyManager = 0;
    }
  }
  return assetKeyManager;
}

- (FCAVAssetFactoryType)avAssetFactory
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  avAssetFactory = self->_avAssetFactory;
  if (!avAssetFactory)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_avAssetFactory");
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = "-[FCContentContextInternal avAssetFactory]";
      __int16 v8 = 2080;
      long long v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 1008;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      avAssetFactory = self->_avAssetFactory;
    }
    else
    {
      avAssetFactory = 0;
    }
  }
  return avAssetFactory;
}

- (FCAVAssetCacheType)avAssetCache
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  avAssetCache = self->_avAssetCache;
  if (!avAssetCache)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_avAssetCache");
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = "-[FCContentContextInternal avAssetCache]";
      __int16 v8 = 2080;
      long long v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 1014;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      avAssetCache = self->_avAssetCache;
    }
    else
    {
      avAssetCache = 0;
    }
  }
  return avAssetCache;
}

- (FCAVAssetKeyCacheType)avAssetKeyCache
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  avAssetKeyCache = self->_avAssetKeyCache;
  if (!avAssetKeyCache)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_avAssetKeyCache");
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = "-[FCContentContextInternal avAssetKeyCache]";
      __int16 v8 = 2080;
      long long v9 = "FCContentContext.m";
      __int16 v10 = 1024;
      int v11 = 1020;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      avAssetKeyCache = self->_avAssetKeyCache;
    }
    else
    {
      avAssetKeyCache = 0;
    }
  }
  return avAssetKeyCache;
}

- (FCFeedDatabase)feedDatabase
{
  return (FCFeedDatabase *)objc_getProperty(self, a2, 144, 1);
}

- (FCAVAssetDownloadManager)avAssetDownloadManager
{
  return self->_avAssetDownloadManager;
}

- (FCFeedPrewarmer)feedPrewarmer
{
  return self->_feedPrewarmer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedPrewarmer, 0);
  objc_storeStrong((id *)&self->_avAssetDownloadManager, 0);
  objc_storeStrong((id *)&self->_avAssetKeyCache, 0);
  objc_storeStrong((id *)&self->_avAssetCache, 0);
  objc_storeStrong((id *)&self->_avAssetFactory, 0);
  objc_storeStrong((id *)&self->_assetKeyManager, 0);
  objc_storeStrong((id *)&self->_assetKeyCache, 0);
  objc_storeStrong((id *)&self->_contentDatabase, 0);
  objc_storeStrong((id *)&self->_feedDatabase, 0);
  objc_storeStrong((id *)&self->_notificationItemListRecordSource, 0);
  objc_storeStrong((id *)&self->_notificationItemRecordSource, 0);
  objc_storeStrong((id *)&self->_puzzleTypeRecordSource, 0);
  objc_storeStrong((id *)&self->_puzzleRecordSource, 0);
  objc_storeStrong((id *)&self->_audioConfigRecordSource, 0);
  objc_storeStrong((id *)&self->_issueListRecordSource, 0);
  objc_storeStrong((id *)&self->_issueRecordSource, 0);
  objc_storeStrong((id *)&self->_widgetSectionConfigRecordSource, 0);
  objc_storeStrong((id *)&self->_forYouConfigRecordSource, 0);
  objc_storeStrong((id *)&self->_purchaseLookupRecordSource, 0);
  objc_storeStrong((id *)&self->_articleListRecordSource, 0);
  objc_storeStrong((id *)&self->_resourceRecordSource, 0);
  objc_storeStrong((id *)&self->_channelMembershipController, 0);
  objc_storeStrong((id *)&self->_tagListRecordSource, 0);
  objc_storeStrong((id *)&self->_sportsEventRecordSource, 0);
  objc_storeStrong((id *)&self->_tagRecordSource, 0);
  objc_storeStrong((id *)&self->_articleRecordSource, 0);
}

@end
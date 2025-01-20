@interface FCPrivateDataContextInternal
- (FCAppActivityMonitor)appActivityMonitor;
- (FCCKPrivateDatabase)privateDatabase;
- (FCCKRecordZone)channelMembershipsRecordZone;
- (FCCKRecordZone)issueReadingHistoryRecordZone;
- (FCCKRecordZone)puzzleHistoryRecordZone;
- (FCCKRecordZone)readingHistoryRecordZone;
- (FCCKRecordZone)readingListRecordZone;
- (FCCKRecordZone)sensitiveSubscriptionsRecordZone;
- (FCCKRecordZone)shortcutsRecordZone;
- (FCCKRecordZone)subscriptionsRecordZone;
- (FCCKRecordZone)userInfoRecordZone;
- (FCCKRecordZoneManager)recordZoneManager;
- (FCPrivateDataContextInternal)init;
- (id)recordZoneWithName:(id)a3;
- (void)prepareRecordZonesForUseWithCompletionHandler:(id)a3;
- (void)setAppActivityMonitor:(id)a3;
- (void)setPrivateDatabase:(id)a3;
- (void)setRecordZoneManager:(id)a3;
@end

@implementation FCPrivateDataContextInternal

- (FCCKPrivateDatabase)privateDatabase
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  privateDatabase = self->_privateDatabase;
  if (!privateDatabase)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_privateDatabase");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContextInternal privateDatabase]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 378;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      privateDatabase = self->_privateDatabase;
    }
    else
    {
      privateDatabase = 0;
    }
  }
  return privateDatabase;
}

- (FCAppActivityMonitor)appActivityMonitor
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  appActivityMonitor = self->_appActivityMonitor;
  if (!appActivityMonitor)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_appActivityMonitor");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContextInternal appActivityMonitor]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 384;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      appActivityMonitor = self->_appActivityMonitor;
    }
    else
    {
      appActivityMonitor = 0;
    }
  }
  return appActivityMonitor;
}

- (void)setRecordZoneManager:(id)a3
{
}

- (void)setPrivateDatabase:(id)a3
{
}

- (void)setAppActivityMonitor:(id)a3
{
}

- (FCPrivateDataContextInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCPrivateDataContextInternal;
  return [(FCPrivateDataContextInternal *)&v3 init];
}

- (FCCKRecordZoneManager)recordZoneManager
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  recordZoneManager = self->_recordZoneManager;
  if (!recordZoneManager)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "_recordZoneManager");
      *(_DWORD *)buf = 136315906;
      v7 = "-[FCPrivateDataContextInternal recordZoneManager]";
      __int16 v8 = 2080;
      v9 = "FCPrivateDataContext.m";
      __int16 v10 = 1024;
      int v11 = 371;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      recordZoneManager = self->_recordZoneManager;
    }
    else
    {
      recordZoneManager = 0;
    }
  }
  return recordZoneManager;
}

- (FCCKRecordZone)issueReadingHistoryRecordZone
{
  v2 = [(FCPrivateDataContextInternal *)self recordZoneManager];
  objc_super v3 = -[FCCKRecordZoneManager recordZoneWithName:](v2, @"IssueReadingHistory");

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)readingListRecordZone
{
  v2 = [(FCPrivateDataContextInternal *)self recordZoneManager];
  objc_super v3 = -[FCCKRecordZoneManager recordZoneWithName:](v2, @"ReadingList");

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)puzzleHistoryRecordZone
{
  v2 = [(FCPrivateDataContextInternal *)self recordZoneManager];
  objc_super v3 = -[FCCKRecordZoneManager recordZoneWithName:](v2, @"PuzzleHistory");

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)shortcutsRecordZone
{
  v2 = [(FCPrivateDataContextInternal *)self recordZoneManager];
  objc_super v3 = -[FCCKRecordZoneManager recordZoneWithName:](v2, @"Shortcuts");

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)subscriptionsRecordZone
{
  v2 = [(FCPrivateDataContextInternal *)self recordZoneManager];
  objc_super v3 = -[FCCKRecordZoneManager recordZoneWithName:](v2, @"Subscriptions");

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)sensitiveSubscriptionsRecordZone
{
  v2 = [(FCPrivateDataContextInternal *)self recordZoneManager];
  objc_super v3 = -[FCCKRecordZoneManager recordZoneWithName:](v2, @"SensitiveSubscriptions");

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)readingHistoryRecordZone
{
  v2 = [(FCPrivateDataContextInternal *)self recordZoneManager];
  objc_super v3 = -[FCCKRecordZoneManager recordZoneWithName:](v2, @"ReadingHistory");

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)channelMembershipsRecordZone
{
  v2 = [(FCPrivateDataContextInternal *)self recordZoneManager];
  objc_super v3 = -[FCCKRecordZoneManager recordZoneWithName:](v2, @"ChannelMemberships");

  return (FCCKRecordZone *)v3;
}

- (FCCKRecordZone)userInfoRecordZone
{
  v2 = [(FCPrivateDataContextInternal *)self recordZoneManager];
  objc_super v3 = -[FCCKRecordZoneManager recordZoneWithName:](v2, @"UserInfo");

  return (FCCKRecordZone *)v3;
}

- (id)recordZoneWithName:(id)a3
{
  id v4 = a3;
  v5 = [(FCPrivateDataContextInternal *)self recordZoneManager];
  v6 = -[FCCKRecordZoneManager recordZoneWithName:](v5, (uint64_t)v4);

  return v6;
}

- (void)prepareRecordZonesForUseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(FCPrivateDataContextInternal *)self recordZoneManager];
  -[FCCKRecordZoneManager prepareRecordZonesForUseWithCompletionHandler:]((uint64_t)v5, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneManager, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_privateDatabase, 0);
}

@end
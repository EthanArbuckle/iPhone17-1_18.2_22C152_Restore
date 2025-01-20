@interface CSIndexClientConnection
- (BOOL)quotaDisabled;
- (CSIndexClientConnection)initWithConfiguration:(id)a3 indexer:(id)a4;
- (CSIndexClientConnection)initWithConnection:(id)a3 indexer:(id)a4;
- (MDSearchableIndexService)service;
- (SDConnectionConfiguration)configuration;
@end

@implementation CSIndexClientConnection

- (SDConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (CSIndexClientConnection)initWithConfiguration:(id)a3 indexer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CSIndexClientConnection;
  v9 = [(CSIndexClientConnection *)&v26 init];
  v10 = v9;
  if (v9)
  {
    p_configuration = (id *)&v9->_configuration;
    objc_storeStrong((id *)&v9->_configuration, a3);
    v12 = [(SDConnectionConfiguration *)v10->_configuration bundleID];
    if (v12)
    {
    }
    else if (([*p_configuration internal] & 1) == 0)
    {
      v23 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CSIndexClientConnection initWithConfiguration:indexer:](v7);
      }
      v21 = v10;
      v10 = 0;
      goto LABEL_10;
    }
    v13 = objc_alloc_init(MDSearchableIndexService);
    service = v10->_service;
    v10->_service = v13;

    [(MDSearchableIndexService *)v10->_service setIndexer:v8];
    v15 = [(SDConnectionConfiguration *)v10->_configuration bundleID];

    if (v15)
    {
      v16 = [(SDConnectionConfiguration *)v10->_configuration bundleID];
      [(MDSearchableIndexService *)v10->_service setClientBundleID:v16];
    }
    v17 = [*p_configuration personaID];

    if (v17)
    {
      v18 = [(SDConnectionConfiguration *)v10->_configuration personaID];
      [(MDSearchableIndexService *)v10->_service setClientPersonaID:v18];
    }
    [(MDSearchableIndexService *)v10->_service setIsInternal:[(SDConnectionConfiguration *)v10->_configuration internal]];
    [(MDSearchableIndexService *)v10->_service setIsPrivate:[(SDConnectionConfiguration *)v10->_configuration isPrivate]];
    [(MDSearchableIndexService *)v10->_service setSearchInternal:[(SDConnectionConfiguration *)v10->_configuration searchInternal]];
    -[MDSearchableIndexService setIsExtension:](v10->_service, "setIsExtension:", [v7 isExtension]);
    [(MDSearchableIndexService *)v10->_service setAllowMail:[(SDConnectionConfiguration *)v10->_configuration allowMail]];
    [(MDSearchableIndexService *)v10->_service setAllowPhotosLibraryDeletion:[(SDConnectionConfiguration *)v10->_configuration allowPhotosLibraryDeletion]];
    [(MDSearchableIndexService *)v10->_service setAllowOpenJournalFile:[(SDConnectionConfiguration *)v10->_configuration allowOpenJournalFile]];
    [(MDSearchableIndexService *)v10->_service setAllowNotifications:[(SDConnectionConfiguration *)v10->_configuration allowNotifications]];
    [(MDSearchableIndexService *)v10->_service setAllowMessagesContent:[(SDConnectionConfiguration *)v10->_configuration allowMessagesContent]];
    [(MDSearchableIndexService *)v10->_service setEntitledAttributes:[(SDConnectionConfiguration *)v10->_configuration entitledAttributes]];
    [(MDSearchableIndexService *)v10->_service setQuotaDisabled:[(SDConnectionConfiguration *)v10->_configuration quotaDisabled]];
    v19 = [(SDConnectionConfiguration *)v10->_configuration protectionClass];
    [(MDSearchableIndexService *)v10->_service setProtectionClass:v19];

    [(MDSearchableIndexService *)v10->_service setClientUID:[(SDConnectionConfiguration *)v10->_configuration euid]];
    v20 = [(SDConnectionConfiguration *)v10->_configuration connection];
    [(MDSearchableIndexService *)v10->_service setClientConnection:v20];

    objc_msgSend(@"com.apple.spotlight.IndexAgent", "stringByAppendingFormat:", @".queue.client.%d", -[SDConnectionConfiguration pid](v10->_configuration, "pid"));
    v21 = (CSIndexClientConnection *) objc_claimAutoreleasedReturnValue();
    v22 = (const char *)[(CSIndexClientConnection *)v21 UTF8String];
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create(v22, v23);
    [(MDSearchableIndexService *)v10->_service setClientQueue:v24];

LABEL_10:
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (MDSearchableIndexService)service
{
  return self->_service;
}

- (CSIndexClientConnection)initWithConnection:(id)a3 indexer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CSIndexClientConnection;
  id v8 = [(CSIndexClientConnection *)&v21 init];
  if (v8)
  {
    v9 = [[SDConnectionConfiguration alloc] initWithConnection:v6 isPrivate:0];
    objc_storeStrong((id *)&v8->_configuration, v9);
    v10 = [(SDConnectionConfiguration *)v9 bundleID];
    if (v10)
    {
    }
    else if (![(SDConnectionConfiguration *)v9 internal])
    {
      v18 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SDConnectionConfiguration initWithConnection:isPrivate:isManaged:]((uint64_t)v6, v18);
      }
      v16 = v8;
      id v8 = 0;
      goto LABEL_8;
    }
    v11 = objc_alloc_init(MDSearchableIndexService);
    service = v8->_service;
    v8->_service = v11;

    [(MDSearchableIndexService *)v8->_service setIndexer:v7];
    v13 = [(SDConnectionConfiguration *)v9 bundleID];

    if (v13)
    {
      v14 = [(SDConnectionConfiguration *)v9 bundleID];
      [(MDSearchableIndexService *)v8->_service setClientBundleID:v14];
    }
    [(MDSearchableIndexService *)v8->_service setIsInternal:[(SDConnectionConfiguration *)v9 internal]];
    [(MDSearchableIndexService *)v8->_service setIsPrivate:[(SDConnectionConfiguration *)v8->_configuration isPrivate]];
    [(MDSearchableIndexService *)v8->_service setSearchInternal:[(SDConnectionConfiguration *)v9 searchInternal]];
    [(MDSearchableIndexService *)v8->_service setIsExtension:[(SDConnectionConfiguration *)v9 isExtension]];
    [(MDSearchableIndexService *)v8->_service setQuotaDisabled:[(SDConnectionConfiguration *)v9 quotaDisabled]];
    v15 = [(SDConnectionConfiguration *)v9 protectionClass];
    [(MDSearchableIndexService *)v8->_service setProtectionClass:v15];

    [(MDSearchableIndexService *)v8->_service setClientUID:[(SDConnectionConfiguration *)v9 euid]];
    [(MDSearchableIndexService *)v8->_service setClientConnection:v6];
    objc_msgSend(@"com.apple.spotlight.IndexAgent", "stringByAppendingFormat:", @".queue.client.%d", -[SDConnectionConfiguration pid](v9, "pid"));
    v16 = (CSIndexClientConnection *) objc_claimAutoreleasedReturnValue();
    v17 = (const char *)[(CSIndexClientConnection *)v16 UTF8String];
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    [(MDSearchableIndexService *)v8->_service setClientQueue:v19];

LABEL_8:
  }

  return v8;
}

- (BOOL)quotaDisabled
{
  return self->_quotaDisabled;
}

- (void)initWithConfiguration:(void *)a1 indexer:.cold.1(void *a1)
{
  v1 = [a1 connection];
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "Could not resolve bundle from %@", v4, v5, v6, v7, 2u);
}

@end
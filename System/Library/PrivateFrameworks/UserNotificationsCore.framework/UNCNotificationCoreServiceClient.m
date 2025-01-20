@interface UNCNotificationCoreServiceClient
- (UNCNotificationCoreServiceClient)init;
- (UNCNotificationCoreServiceClientDelegate)delegate;
- (id)allBundleIdentifiersForCategories;
- (id)allBundleIdentifiersForNotifications;
- (id)badgeNumberForBundleIdentifier:(id)a3;
- (id)categoriesForBundleIdentifier:(id)a3;
- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (id)notificationRecordsForBundleIdentifier:(id)a3;
- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4;
- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3;
- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5;
- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3;
- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3;
- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4;
- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3;
- (void)removeSimilarNotificationRecords:(id)a3 forBundleIdentifier:(id)a4;
- (void)removeStoreForBundleIdentifier:(id)a3;
- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 completionHandler:(id)a7;
- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6;
- (void)setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation UNCNotificationCoreServiceClient

- (UNCNotificationCoreServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)UNCNotificationCoreServiceClient;
  v2 = [(UNCNotificationCoreServiceClient *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(UNCNotificationCoreServiceClientImpl);
    client = v2->_client;
    v2->_client = v3;
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
}

- (UNCNotificationCoreServiceClientDelegate)delegate
{
  return [(UNCNotificationCoreServiceClientImpl *)self->_client delegate];
}

- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5
{
}

- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4
{
  id v5 = a4;
  objc_super v6 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    -[UNCNotificationCoreServiceClient categoryRepository:didChangeCategoriesForBundleIdentifier:](v6);
  }
  [(UNCNotificationCoreServiceClientImpl *)self->_client categoryRepositoryDidChangeCategories:v5];
}

- (id)allBundleIdentifiersForNotifications
{
  return [(UNCNotificationCoreServiceClientImpl *)self->_client allBundleIdentifiersForNotifications];
}

- (id)notificationRecordsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UNCNotificationCoreServiceClientImpl *)self->_client notificationRecordsForBundleIdentifier:v4];
  }
  else
  {
    objc_super v6 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient notificationRecordsForBundleIdentifier:](v6);
    }
    id v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v9 = [(UNCNotificationCoreServiceClientImpl *)self->_client notificationRecordForIdentifier:v6 bundleIdentifier:v7];
      goto LABEL_9;
    }
    v11 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient notificationRecordForIdentifier:bundleIdentifier:](v11);
    }
  }
  else
  {
    v10 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient notificationRecordForIdentifier:bundleIdentifier:](v10);
    }
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, void, void *))a7;
  if (!v12)
  {
    v16 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR))
    {
      -[UNCNotificationCoreServiceClient saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:](v16);
      if (!v15) {
        goto LABEL_11;
      }
    }
    else if (!v15)
    {
      goto LABEL_11;
    }
    v17 = @"notificationRecord";
LABEL_10:
    v19 = _UNCNilArgumentError((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:]", (uint64_t)v17);
    v15[2](v15, 0, v19);

    goto LABEL_11;
  }
  if (!v14)
  {
    v18 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR))
    {
      -[UNCNotificationCoreServiceClient saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:](v18);
      if (!v15) {
        goto LABEL_11;
      }
    }
    else if (!v15)
    {
      goto LABEL_11;
    }
    v17 = @"bundleIdentifier";
    goto LABEL_10;
  }
  [(UNCNotificationCoreServiceClientImpl *)self->_client save:v12 targetRevisionNumber:v13 shouldRepost:v9 forBundleIdentifier:v14 completionHandler:v15];
LABEL_11:
}

- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v10)
  {
    if (v11)
    {
      if (v12)
      {
        [(UNCNotificationCoreServiceClientImpl *)self->_client save:v10 shouldRepost:v8 apsMessageTimestamp:v11 forBundleIdentifier:v12];
      }
      else
      {
        v16 = (void *)*MEMORY[0x263F1E010];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
          -[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:](v16);
        }
      }
    }
    else
    {
      v15 = (void *)*MEMORY[0x263F1E010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
        -[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:](v15);
      }
    }
  }
  else
  {
    id v14 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:](v14);
    }
  }
}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (v6)
  {
    if (v7)
    {
      [(UNCNotificationCoreServiceClientImpl *)self->_client removeNotificationRecordsForIdentifiersWithIdentifiers:v6 bundleIdentifier:v7];
    }
    else
    {
      id v10 = (void *)*MEMORY[0x263F1E010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
        -[UNCNotificationCoreServiceClient removeNotificationRecordsForIdentifiers:bundleIdentifier:](v10);
      }
    }
  }
  else
  {
    BOOL v9 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient removeNotificationRecordsForIdentifiers:bundleIdentifier:](v9);
    }
  }
}

- (void)removeSimilarNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (v6)
  {
    if (v7)
    {
      [(UNCNotificationCoreServiceClientImpl *)self->_client removeSimilarNotificationRecords:v6 forBundleIdentifier:v7];
    }
    else
    {
      id v10 = (void *)*MEMORY[0x263F1E010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
        -[UNCNotificationCoreServiceClient removeSimilarNotificationRecords:forBundleIdentifier:](v10);
      }
    }
  }
  else
  {
    BOOL v9 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient removeSimilarNotificationRecords:forBundleIdentifier:](v9);
    }
  }
}

- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(UNCNotificationCoreServiceClientImpl *)self->_client removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:v4];
  }
  else
  {
    id v5 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:](v5);
    }
  }
}

- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(UNCNotificationCoreServiceClientImpl *)self->_client removeInvalidNotificationRecordsForBundleIdentifier:v4];
  }
  else
  {
    id v5 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient removeInvalidNotificationRecordsForBundleIdentifier:](v5);
    }
  }
}

- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(UNCNotificationCoreServiceClientImpl *)self->_client removeAllNotificationRecordsForBundleIdentifier:v4];
  }
  else
  {
    id v5 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient removeAllNotificationRecordsForBundleIdentifier:](v5);
    }
  }
}

- (void)removeStoreForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(UNCNotificationCoreServiceClientImpl *)self->_client removeStoreForBundleIdentifier:v4];
  }
  else
  {
    id v5 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient removeStoreForBundleIdentifier:](v5);
    }
  }
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UNCNotificationCoreServiceClientImpl *)self->_client badgeNumberForBundleIdentifier:v4];
  }
  else
  {
    id v6 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient badgeNumberForBundleIdentifier:](v6);
    }
    id v5 = 0;
  }

  return v5;
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (!v9)
  {
    id v11 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR))
    {
      -[UNCNotificationCoreServiceClient setBadgeNumber:forBundleIdentifier:completionHandler:](v11);
      if (!v10) {
        goto LABEL_6;
      }
    }
    else if (!v10)
    {
      goto LABEL_6;
    }
    id v12 = _UNCNilArgumentError((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeNumber:forBundleIdentifier:completionHandler:]", @"bundleIdentifier");
    v10[2](v10, v12);

    goto LABEL_6;
  }
  [(UNCNotificationCoreServiceClientImpl *)self->_client setBadgeNumber:v8 forBundleIdentifier:v9 completionHandler:v10];
LABEL_6:
}

- (void)setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (!v8)
  {
    id v10 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR))
    {
      -[UNCNotificationCoreServiceClient setBadgeCount:forBundleIdentifier:completionHandler:](v10);
      if (!v9) {
        goto LABEL_6;
      }
    }
    else if (!v9)
    {
      goto LABEL_6;
    }
    id v11 = _UNCNilArgumentError((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeCount:forBundleIdentifier:completionHandler:]", @"bundleIdentifier");
    v9[2](v9, v11);

    goto LABEL_6;
  }
  [(UNCNotificationCoreServiceClientImpl *)self->_client setBadgeCount:a3 forBundleIdentifier:v8 completionHandler:v9];
LABEL_6:
}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (!v9)
  {
    id v11 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR))
    {
      -[UNCNotificationCoreServiceClient setBadgeString:forBundleIdentifier:completionHandler:](v11);
      if (!v10) {
        goto LABEL_6;
      }
    }
    else if (!v10)
    {
      goto LABEL_6;
    }
    id v12 = _UNCNilArgumentError((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeString:forBundleIdentifier:completionHandler:]", @"bundleIdentifier");
    v10[2](v10, v12);

    goto LABEL_6;
  }
  [(UNCNotificationCoreServiceClientImpl *)self->_client setBadgeString:v8 forBundleIdentifier:v9 completionHandler:v10];
LABEL_6:
}

- (id)allBundleIdentifiersForCategories
{
  return [(UNCNotificationCoreServiceClientImpl *)self->_client allBundleIdentifiersForCategories];
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7)
    {
      id v9 = [(UNCNotificationCoreServiceClientImpl *)self->_client categoryForIdentifier:v6 bundleIdentifier:v7];
      goto LABEL_9;
    }
    id v11 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient categoryForIdentifier:bundleIdentifier:](v11);
    }
  }
  else
  {
    id v10 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient categoryForIdentifier:bundleIdentifier:](v10);
    }
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UNCNotificationCoreServiceClientImpl *)self->_client categoriesForBundleIdentifier:v4];
  }
  else
  {
    id v6 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient categoriesForBundleIdentifier:](v6);
    }
    id v5 = 0;
  }

  return v5;
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7)
    {
      [(UNCNotificationCoreServiceClientImpl *)self->_client setCategories:v6 forBundleIdentifier:v7];
    }
    else
    {
      id v10 = (void *)*MEMORY[0x263F1E010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
        -[UNCNotificationCoreServiceClient setCategories:forBundleIdentifier:](v10);
      }
    }
  }
  else
  {
    id v9 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationCoreServiceClient setCategories:forBundleIdentifier:](v9);
    }
  }
}

- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)categoryRepository:(os_log_t)log didChangeCategoriesForBundleIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2608DB000, log, OS_LOG_TYPE_ERROR, "CoreServiceClient didChangeCategoriesForBundleIdentifier not implemented", v1, 2u);
}

- (void)notificationRecordsForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient notificationRecordsForBundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)notificationRecordForIdentifier:(void *)a1 bundleIdentifier:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient notificationRecordForIdentifier:bundleIdentifier:]", @"identifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)notificationRecordForIdentifier:(void *)a1 bundleIdentifier:.cold.2(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient notificationRecordForIdentifier:bundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)saveNotificationRecord:(void *)a1 targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:]", @"notificationRecord");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)saveNotificationRecord:(void *)a1 targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:.cold.2(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)saveNotificationRequest:(void *)a1 shouldRepost:apsMessageTimestamp:forBundleIdentifier:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:]", @"notificationRequest");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)saveNotificationRequest:(void *)a1 shouldRepost:apsMessageTimestamp:forBundleIdentifier:.cold.2(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:]", @"apsMessageTimestamp");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)saveNotificationRequest:(void *)a1 shouldRepost:apsMessageTimestamp:forBundleIdentifier:.cold.3(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)removeNotificationRecordsForIdentifiers:(void *)a1 bundleIdentifier:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeNotificationRecordsForIdentifiers:bundleIdentifier:]", @"identifiers");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)removeNotificationRecordsForIdentifiers:(void *)a1 bundleIdentifier:.cold.2(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeNotificationRecordsForIdentifiers:bundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)removeSimilarNotificationRecords:(void *)a1 forBundleIdentifier:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeSimilarNotificationRecords:forBundleIdentifier:]", @"records");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)removeSimilarNotificationRecords:(void *)a1 forBundleIdentifier:.cold.2(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeSimilarNotificationRecords:forBundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)removeInvalidNotificationRecordsForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeInvalidNotificationRecordsForBundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)removeAllNotificationRecordsForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeAllNotificationRecordsForBundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)removeStoreForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient removeStoreForBundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)badgeNumberForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient badgeNumberForBundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)setBadgeNumber:(void *)a1 forBundleIdentifier:completionHandler:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeNumber:forBundleIdentifier:completionHandler:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)setBadgeCount:(void *)a1 forBundleIdentifier:completionHandler:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeCount:forBundleIdentifier:completionHandler:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)setBadgeString:(void *)a1 forBundleIdentifier:completionHandler:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient setBadgeString:forBundleIdentifier:completionHandler:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)categoryForIdentifier:(void *)a1 bundleIdentifier:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient categoryForIdentifier:bundleIdentifier:]", @"categoryIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)categoryForIdentifier:(void *)a1 bundleIdentifier:.cold.2(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient categoryForIdentifier:bundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)categoriesForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient categoriesForBundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)setCategories:(void *)a1 forBundleIdentifier:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient setCategories:forBundleIdentifier:]", @"categories");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

- (void)setCategories:(void *)a1 forBundleIdentifier:.cold.2(void *a1)
{
  id v1 = a1;
  v2 = _UNCNilArgumentErrorDescription((uint64_t)"-[UNCNotificationCoreServiceClient setCategories:forBundleIdentifier:]", @"bundleIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_4(&dword_2608DB000, v3, v4, "%@", v5, v6, v7, v8, v9);
}

@end
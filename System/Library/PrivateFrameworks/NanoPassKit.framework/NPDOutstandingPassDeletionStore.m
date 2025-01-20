@interface NPDOutstandingPassDeletionStore
- (BOOL)isDeletionPendingForUniqueID:(id)a3;
- (NPDOutstandingPassDeletionStore)initWithDomainAccessor:(id)a3;
- (NPSDomainAccessor)domainAccessor;
- (NSMutableArray)pendingDeletionUniqueIDs;
- (NSMutableDictionary)outstandingMessageRecords;
- (OS_dispatch_source)cleanupTimer;
- (void)_performCleanup;
- (void)_saveOutstandingRecords;
- (void)clearStore;
- (void)dealloc;
- (void)noteDeletionPendingForUniqueID:(id)a3;
- (void)noteDeletionSentForUniqueID:(id)a3 messageID:(id)a4;
- (void)noteDeliveryForMessageID:(id)a3;
- (void)notePassDatabaseReconciled;
- (void)setCleanupTimer:(id)a3;
- (void)setDomainAccessor:(id)a3;
- (void)setOutstandingMessageRecords:(id)a3;
- (void)setPendingDeletionUniqueIDs:(id)a3;
@end

@implementation NPDOutstandingPassDeletionStore

- (NPDOutstandingPassDeletionStore)initWithDomainAccessor:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPDOutstandingPassDeletionStore;
  v5 = [(NPDOutstandingPassDeletionStore *)&v19 init];
  if (v5)
  {
    v6 = [v4 dictionaryForKey:@"OutstandingDeletions"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = +[NSDictionary dictionary];

      v6 = (void *)v7;
    }
    v8 = (NSMutableDictionary *)[v6 mutableCopy];
    outstandingMessageRecords = v5->_outstandingMessageRecords;
    v5->_outstandingMessageRecords = v8;

    v10 = [v4 arrayForKey:@"PendingDeletions"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = +[NSArray array];

      v10 = (void *)v11;
    }
    v12 = (NSMutableArray *)[v10 mutableCopy];
    pendingDeletionUniqueIDs = v5->_pendingDeletionUniqueIDs;
    v5->_pendingDeletionUniqueIDs = v12;

    v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000091DC;
    handler[3] = &unk_10006CFC0;
    v15 = v5;
    v18 = v15;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_source_set_timer(v14, 0, 0x4E94914F0000uLL, 0);
    dispatch_resume(v14);
    [(NPDOutstandingPassDeletionStore *)v15 setCleanupTimer:v14];
  }
  return v5;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_cleanupTimer);
  v3.receiver = self;
  v3.super_class = (Class)NPDOutstandingPassDeletionStore;
  [(NPDOutstandingPassDeletionStore *)&v3 dealloc];
}

- (void)noteDeletionPendingForUniqueID:(id)a3
{
  id v4 = a3;
  v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass deletion store: noting deletion pending for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  v8 = [(NPDOutstandingPassDeletionStore *)self pendingDeletionUniqueIDs];
  [v8 addObject:v4];

  [(NPDOutstandingPassDeletionStore *)self _saveOutstandingRecords];
}

- (void)noteDeletionSentForUniqueID:(id)a3 messageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Pass deletion store: noting deletion sent for unique ID %@ with message ID %@", buf, 0x16u);
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[2] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:3];

  v13 = [(NPDOutstandingPassDeletionStore *)self outstandingMessageRecords];
  [v13 setObject:v12 forKey:v7];

  [(NPDOutstandingPassDeletionStore *)self _saveOutstandingRecords];
}

- (void)noteDeliveryForMessageID:(id)a3
{
  id v4 = a3;
  v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass deletion store: noting delivery for message ID %@", (uint8_t *)&v9, 0xCu);
    }
  }
  v8 = [(NPDOutstandingPassDeletionStore *)self outstandingMessageRecords];
  [v8 removeObjectForKey:v4];

  [(NPDOutstandingPassDeletionStore *)self _saveOutstandingRecords];
}

- (void)notePassDatabaseReconciled
{
  objc_super v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Pass deletion store: noting pass database reconciled", v7, 2u);
    }
  }
  BOOL v6 = [(NPDOutstandingPassDeletionStore *)self pendingDeletionUniqueIDs];
  [v6 removeAllObjects];

  [(NPDOutstandingPassDeletionStore *)self _saveOutstandingRecords];
}

- (BOOL)isDeletionPendingForUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v5 = [(NPDOutstandingPassDeletionStore *)self outstandingMessageRecords];
  BOOL v6 = [v5 allValues];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  __int16 v18 = sub_1000098A0;
  id v19 = &unk_10006CFE8;
  id v7 = v4;
  id v20 = v7;
  v21 = &v22;
  [v6 enumerateObjectsUsingBlock:&v16];

  if (*((unsigned char *)v23 + 24))
  {
    BOOL v8 = 1;
  }
  else
  {
    int v9 = [(NPDOutstandingPassDeletionStore *)self pendingDeletionUniqueIDs];
    unsigned __int8 v10 = [v9 containsObject:v7];

    if (v10)
    {
      uint64_t v11 = pk_Payment_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        v13 = pk_Payment_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [(NPDOutstandingPassDeletionStore *)self pendingDeletionUniqueIDs];
          *(_DWORD *)buf = 138412546;
          id v27 = v7;
          __int16 v28 = 2112;
          v29 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Pass deletion store: deletion for %@ is not pending; Aall unique IDs pending deletion: %@",
            buf,
            0x16u);
        }
      }
      BOOL v8 = 1;
      *((unsigned char *)v23 + 24) = 1;
    }
    else
    {
      BOOL v8 = *((unsigned char *)v23 + 24) != 0;
    }
  }

  _Block_object_dispose(&v22, 8);
  return v8;
}

- (void)clearStore
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  [(NPDOutstandingPassDeletionStore *)self setOutstandingMessageRecords:v3];

  [(NPDOutstandingPassDeletionStore *)self _saveOutstandingRecords];
}

- (void)_saveOutstandingRecords
{
  id v5 = [(NPDOutstandingPassDeletionStore *)self domainAccessor];
  objc_super v3 = [(NPDOutstandingPassDeletionStore *)self outstandingMessageRecords];
  [v5 setObject:v3 forKey:@"OutstandingDeletions"];

  id v4 = [(NPDOutstandingPassDeletionStore *)self pendingDeletionUniqueIDs];
  [v5 setObject:v4 forKey:@"PendingDeletions"];
}

- (void)_performCleanup
{
  objc_super v3 = +[NSMutableArray array];
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;
  BOOL v6 = [(NPDOutstandingPassDeletionStore *)self outstandingMessageRecords];
  BOOL v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_100009C7C;
  v15 = &unk_10006D010;
  uint64_t v17 = v5;
  id v7 = v3;
  id v16 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:&v12];

  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    unsigned __int8 v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Pass deletion store: cleaning up %@", buf, 0xCu);
    }
  }
  uint64_t v11 = [(NPDOutstandingPassDeletionStore *)self outstandingMessageRecords];
  [v11 removeObjectsForKeys:v7];

  [(NPDOutstandingPassDeletionStore *)self _saveOutstandingRecords];
}

- (NSMutableDictionary)outstandingMessageRecords
{
  return self->_outstandingMessageRecords;
}

- (void)setOutstandingMessageRecords:(id)a3
{
}

- (NSMutableArray)pendingDeletionUniqueIDs
{
  return self->_pendingDeletionUniqueIDs;
}

- (void)setPendingDeletionUniqueIDs:(id)a3
{
}

- (OS_dispatch_source)cleanupTimer
{
  return self->_cleanupTimer;
}

- (void)setCleanupTimer:(id)a3
{
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_storeStrong((id *)&self->_pendingDeletionUniqueIDs, 0);
  objc_storeStrong((id *)&self->_outstandingMessageRecords, 0);
}

@end
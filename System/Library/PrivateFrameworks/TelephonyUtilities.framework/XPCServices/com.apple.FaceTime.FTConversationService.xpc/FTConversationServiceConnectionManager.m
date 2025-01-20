@interface FTConversationServiceConnectionManager
- (FTConversationServiceConnectionManager)initWithDataSource:(id)a3;
- (FTPersistentDataSource)dataSource;
- (NSMutableSet)connections;
- (os_unfair_lock_s)accessorLock;
- (void)addConnection:(id)a3;
- (void)addConversationLinkDescriptors:(id)a3 reply:(id)a4;
- (void)addOrUpdateConversationLinkDescriptors:(id)a3 reply:(id)a4;
- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 reply:(id)a4;
- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 reply:(id)a6;
- (void)integerForKey:(id)a3 reply:(id)a4;
- (void)removeConnection:(id)a3;
- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 reply:(id)a5;
- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 reply:(id)a4;
- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setInteger:(int64_t)a3 forKey:(id)a4 reply:(id)a5;
- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setString:(id)a3 forKey:(id)a4 reply:(id)a5;
- (void)stringForKey:(id)a3 reply:(id)a4;
@end

@implementation FTConversationServiceConnectionManager

- (FTConversationServiceConnectionManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FTConversationServiceConnectionManager;
  v6 = [(FTConversationServiceConnectionManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_accessorLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    connections = v7->_connections;
    v7->_connections = v8;

    objc_storeStrong((id *)&v7->_dataSource, a3);
  }

  return v7;
}

- (void)addConnection:(id)a3
{
  id v8 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  [v8 setDelegate:self];
  id v5 = [(FTConversationServiceConnectionManager *)self connections];
  [v5 addObject:v8];

  v6 = [(FTConversationServiceConnectionManager *)self dataSource];
  v7 = [v8 queue];
  [v6 addDelegate:v8 queue:v7];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)removeConnection:(id)a3
{
  id v8 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v5 = [v8 delegate];

  if (v5 == self) {
    [v8 setDelegate:0];
  }
  v6 = [(FTConversationServiceConnectionManager *)self connections];
  [v6 removeObject:v8];

  v7 = [(FTConversationServiceConnectionManager *)self dataSource];
  [v7 removeDelegate:v8];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)addConversationLinkDescriptors:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  id v7 = a3;
  id v8 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v13 = 0;
  id v9 = [v8 addConversationLinkDescriptors:v7 error:&v13];

  id v10 = v13;
  if ((v9 & 1) == 0 && v10)
  {
    objc_super v11 = FTCServiceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001089C();
    }
  }
  v12 = [v10 conversationServiceDataSourceError];
  v6[2](v6, v9, v12);
}

- (void)addOrUpdateConversationLinkDescriptors:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  id v7 = a3;
  id v8 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v13 = 0;
  id v9 = [v8 addOrUpdateConversationLinkDescriptors:v7 error:&v13];

  id v10 = v13;
  if ((v9 & 1) == 0 && v10)
  {
    objc_super v11 = FTCServiceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100010904();
    }
  }
  v12 = [v10 conversationServiceDataSourceError];
  v6[2](v6, v9, v12);
}

- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  id v7 = a3;
  id v8 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v13 = 0;
  id v9 = [v8 conversationLinkDescriptorCountWithPredicate:v7 error:&v13];

  id v10 = v13;
  if (!v9 && v10)
  {
    objc_super v11 = FTCServiceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001096C();
    }
  }
  v12 = [v10 conversationServiceDataSourceError];
  v6[2](v6, v9, v12);
}

- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 reply:(id)a6
{
  id v10 = (void (**)(id, void *, void *))a6;
  id v11 = a3;
  v12 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v17 = 0;
  id v13 = [v12 conversationLinkDescriptorsWithPredicate:v11 limit:a4 offset:a5 error:&v17];

  id v14 = v17;
  if (!v13 && v14)
  {
    v15 = FTCServiceLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000109D4();
    }
  }
  v16 = [v14 conversationServiceDataSourceError];
  v10[2](v10, v13, v16);
}

- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 reply:(id)a5
{
  id v8 = (void (**)(id, id, void *))a5;
  id v9 = a3;
  id v10 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v15 = 0;
  id v11 = [v10 removeConversationLinkDescriptorsWithPredicate:v9 deleteReason:a4 error:&v15];

  id v12 = v15;
  if (!v11 && v12)
  {
    id v13 = FTCServiceLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100010A3C();
    }
  }
  id v14 = [v12 conversationServiceDataSourceError];
  v8[2](v8, v11, v14);
}

- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  id v7 = a3;
  id v8 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v13 = 0;
  id v9 = [v8 removeLinkDescriptorsFromDataSourceWithPredicate:v7 error:&v13];

  id v10 = v13;
  if (!v9 && v10)
  {
    id v11 = FTCServiceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100010AA4();
    }
  }
  id v12 = [v10 conversationServiceDataSourceError];
  v6[2](v6, v9, v12);
}

- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  BOOL v8 = a3;
  id v10 = (void (**)(id, id, void *))a6;
  id v11 = a5;
  id v12 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v17 = 0;
  id v13 = [v12 setActivated:v8 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 error:&v17];

  id v14 = v17;
  if (!v13 && v14)
  {
    id v15 = FTCServiceLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100010B0C();
    }
  }
  v16 = [v14 conversationServiceDataSourceError];
  v10[2](v10, v13, v16);
}

- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  id v10 = (void (**)(id, id, void *))a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v18 = 0;
  id v14 = [v13 setExpirationDate:v12 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 error:&v18];

  id v15 = v18;
  if (!v14 && v15)
  {
    v16 = FTCServiceLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100010B0C();
    }
  }
  id v17 = [v15 conversationServiceDataSourceError];
  v10[2](v10, v14, v17);
}

- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  id v10 = (void (**)(id, id, void *))a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v18 = 0;
  id v14 = [v13 setInvitedHandles:v12 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 error:&v18];

  id v15 = v18;
  if (!v14 && v15)
  {
    v16 = FTCServiceLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100010B0C();
    }
  }
  id v17 = [v15 conversationServiceDataSourceError];
  v10[2](v10, v14, v17);
}

- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  id v10 = (void (**)(id, id, void *))a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v18 = 0;
  id v14 = [v13 setName:v12 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 error:&v18];

  id v15 = v18;
  if (!v14 && v15)
  {
    v16 = FTCServiceLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100010B0C();
    }
  }
  id v17 = [v15 conversationServiceDataSourceError];
  v10[2](v10, v14, v17);
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 reply:(id)a5
{
  BOOL v8 = (void (**)(id, id, void *))a5;
  id v9 = a4;
  id v10 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v15 = 0;
  id v11 = [v10 setInteger:a3 forKey:v9 error:&v15];

  id v12 = v15;
  if ((v11 & 1) == 0 && v12)
  {
    id v13 = FTCServiceLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100010B74();
    }
  }
  id v14 = [v12 conversationServiceDataSourceError];
  v8[2](v8, v11, v14);
}

- (void)integerForKey:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  id v7 = a3;
  BOOL v8 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v13 = 0;
  id v9 = [v8 integerForKey:v7 error:&v13];

  id v10 = v13;
  if (!v9 && v10)
  {
    id v11 = FTCServiceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100010B74();
    }
  }
  id v12 = [v10 conversationServiceDataSourceError];
  v6[2](v6, v9, v12);
}

- (void)setString:(id)a3 forKey:(id)a4 reply:(id)a5
{
  BOOL v8 = (void (**)(id, id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v16 = 0;
  id v12 = [v11 setString:v10 forKey:v9 error:&v16];

  id v13 = v16;
  if ((v12 & 1) == 0 && v13)
  {
    id v14 = FTCServiceLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100010BDC();
    }
  }
  id v15 = [v13 conversationServiceDataSourceError];
  v8[2](v8, v12, v15);
}

- (void)stringForKey:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, void *, void *))a4;
  id v7 = a3;
  BOOL v8 = [(FTConversationServiceConnectionManager *)self dataSource];
  id v13 = 0;
  id v9 = [v8 stringForKey:v7 error:&v13];

  id v10 = v13;
  if (!v9 && v10)
  {
    id v11 = FTCServiceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100010B74();
    }
  }
  id v12 = [v10 conversationServiceDataSourceError];
  v6[2](v6, v9, v12);
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (FTPersistentDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_connections, 0);
}

@end
@interface FTPersistentDataSource
- (BOOL)addConversationLinkDescriptors:(id)a3 error:(id *)a4;
- (BOOL)addConversationLinkDescriptors:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)addOrUpdateConversationLinkDescriptors:(id)a3 error:(id *)a4;
- (BOOL)addOrUpdateConversationLinkDescriptors:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)addOrUpdateKey:(id)a3 forIntegerValue:(int64_t)a4 stringValue:(id)a5 managedObjectContext:(id)a6 error:(id *)a7;
- (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5;
- (FTPersistentContainer)persistentContainer;
- (FTPersistentDataSource)init;
- (FTPersistentDataSource)initWithStoreType:(int64_t)a3;
- (TUDelegateController)delegateController;
- (id)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6;
- (id)conversationLinkDescriptorsWithPredicate:(id)a3 managedObjectContext:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 error:(id *)a7;
- (id)keyValueForKey:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (id)stringForKey:(id)a3 error:(id *)a4;
- (int64_t)integerForKey:(id)a3 error:(id *)a4;
- (unint64_t)conversationLinkDescriptorCountWithPredicate:(id)a3 error:(id *)a4;
- (unint64_t)conversationLinkDescriptorCountWithPredicate:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (unint64_t)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 error:(id *)a5;
- (unint64_t)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 managedObjectContext:(id)a5 error:(id *)a6;
- (unint64_t)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 error:(id *)a4;
- (unint64_t)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (unint64_t)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (unint64_t)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7;
- (unint64_t)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (unint64_t)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7;
- (unint64_t)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (unint64_t)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7;
- (unint64_t)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (unint64_t)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7;
- (void)addConversationLinkDescriptors:(id)a3 completion:(id)a4;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addOrUpdateConversationLinkDescriptors:(id)a3 completion:(id)a4;
- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 completion:(id)a4;
- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6;
- (void)deleteConversationLink:(id)a3 deleteReason:(int64_t)a4 inContext:(id)a5;
- (void)integerForKey:(id)a3 completion:(id)a4;
- (void)notifyDelegatesConversationLinkDescriptorsDidChange;
- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 completion:(id)a5;
- (void)removeDelegate:(id)a3;
- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 completion:(id)a4;
- (void)removeLinkFromDatabase:(id)a3 inContext:(id)a4;
- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setInteger:(int64_t)a3 forKey:(id)a4 completion:(id)a5;
- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)stringForKey:(id)a3 completion:(id)a4;
@end

@implementation FTPersistentDataSource

- (BOOL)addConversationLinkDescriptors:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10000762C;
  v23 = sub_10000763C;
  id v24 = 0;
  v7 = [(FTPersistentDataSource *)self persistentContainer];
  v8 = [v7 managedObjectContext];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100007644;
  v14[3] = &unk_100018460;
  v17 = &v25;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  v18 = &v19;
  [v10 performBlockAndWait:v14];
  if (a4)
  {
    v11 = (void *)v20[5];
    if (v11) {
      *a4 = v11;
    }
  }
  char v12 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (void)addConversationLinkDescriptors:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = [(FTPersistentDataSource *)self persistentContainer];
    id v9 = [v8 managedObjectContext];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000077D4;
    v11[3] = &unk_100018488;
    v11[4] = self;
    id v12 = v6;
    id v13 = v9;
    id v14 = v7;
    id v10 = v9;
    [v10 performBlock:v11];
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (BOOL)addOrUpdateConversationLinkDescriptors:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10000762C;
  v23 = sub_10000763C;
  id v24 = 0;
  id v7 = FTCServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "addOrUpdateConversationLinkDescriptors: %@", buf, 0xCu);
  }

  if ([v6 count])
  {
    v8 = [(FTPersistentDataSource *)self persistentContainer];
    id v9 = [v8 managedObjectContext];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100007A94;
    v14[3] = &unk_100018460;
    v17 = &v25;
    v14[4] = self;
    id v15 = v6;
    id v10 = v9;
    id v16 = v10;
    v18 = &v19;
    [v10 performBlockAndWait:v14];
    if (a4)
    {
      v11 = (void *)v20[5];
      if (v11) {
        *a4 = v11;
      }
    }
  }
  BOOL v12 = *((unsigned char *)v26 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

- (void)addOrUpdateConversationLinkDescriptors:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = [(FTPersistentDataSource *)self persistentContainer];
    id v9 = [v8 managedObjectContext];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100007C24;
    v11[3] = &unk_100018488;
    v11[4] = self;
    id v12 = v6;
    id v13 = v9;
    id v14 = v7;
    id v10 = v9;
    [v10 performBlock:v11];
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (unint64_t)conversationLinkDescriptorCountWithPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10000762C;
  v23 = sub_10000763C;
  id v24 = 0;
  id v7 = [(FTPersistentDataSource *)self persistentContainer];
  v8 = [v7 managedObjectContext];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100007E4C;
  v14[3] = &unk_100018460;
  v17 = &v25;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  v18 = &v19;
  [v10 performBlockAndWait:v14];
  if (a4)
  {
    v11 = (void *)v20[5];
    if (v11) {
      *a4 = v11;
    }
  }
  unint64_t v12 = v26[3];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FTPersistentDataSource *)self persistentContainer];
  id v9 = [v8 managedObjectContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100007FB8;
  v13[3] = &unk_100018488;
  v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = v6;
  [v11 performBlock:v13];
}

- (id)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_10000762C;
  v36 = sub_10000763C;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_10000762C;
  id v30 = sub_10000763C;
  id v31 = 0;
  id v11 = [(FTPersistentDataSource *)self persistentContainer];
  id v12 = [v11 managedObjectContext];

  id v13 = FTCServiceLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "conversationLinkDescriptorsWithPredicate: %@", buf, 0xCu);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000082B4;
  v19[3] = &unk_1000184B0;
  v22 = &v32;
  v19[4] = self;
  id v14 = v10;
  id v20 = v14;
  id v15 = v12;
  unint64_t v24 = a4;
  unint64_t v25 = a5;
  id v21 = v15;
  v23 = &v26;
  [v15 performBlockAndWait:v19];
  if (a6)
  {
    id v16 = (void *)v27[5];
    if (v16) {
      *a6 = v16;
    }
  }
  id v17 = (id)v33[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(FTPersistentDataSource *)self persistentContainer];
  id v13 = [v12 managedObjectContext];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100008444;
  v17[3] = &unk_1000184D8;
  v17[4] = self;
  id v18 = v10;
  unint64_t v21 = a4;
  unint64_t v22 = a5;
  id v19 = v13;
  id v20 = v11;
  id v14 = v11;
  id v15 = v13;
  id v16 = v10;
  [v15 performBlock:v17];
}

- (unint64_t)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  unint64_t v25 = sub_10000762C;
  uint64_t v26 = sub_10000763C;
  id v27 = 0;
  id v9 = [(FTPersistentDataSource *)self persistentContainer];
  id v10 = [v9 managedObjectContext];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100008680;
  v16[3] = &unk_100018500;
  id v19 = &v28;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  int64_t v21 = a4;
  id v12 = v10;
  id v18 = v12;
  id v20 = &v22;
  [v12 performBlockAndWait:v16];
  if (a5)
  {
    id v13 = (void *)v23[5];
    if (v13) {
      *a5 = v13;
    }
  }
  unint64_t v14 = v29[3];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(FTPersistentDataSource *)self persistentContainer];
  id v11 = [v10 managedObjectContext];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000087F4;
  v15[3] = &unk_100018528;
  v15[4] = self;
  id v16 = v8;
  id v18 = v9;
  int64_t v19 = a4;
  id v17 = v11;
  id v12 = v9;
  id v13 = v11;
  id v14 = v8;
  [v13 performBlock:v15];
}

- (unint64_t)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_10000762C;
  v23 = sub_10000763C;
  id v24 = 0;
  id v7 = [(FTPersistentDataSource *)self persistentContainer];
  id v8 = [v7 managedObjectContext];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100008A20;
  v14[3] = &unk_100018460;
  id v17 = &v25;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  id v18 = &v19;
  [v10 performBlockAndWait:v14];
  if (a4)
  {
    id v11 = (void *)v20[5];
    if (v11) {
      *a4 = v11;
    }
  }
  unint64_t v12 = v26[3];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FTPersistentDataSource *)self persistentContainer];
  id v9 = [v8 managedObjectContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008B8C;
  v13[3] = &unk_100018488;
  v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = v6;
  [v11 performBlock:v13];
}

- (unint64_t)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_10000762C;
  v29 = sub_10000763C;
  id v30 = 0;
  id v11 = [(FTPersistentDataSource *)self persistentContainer];
  id v12 = [v11 managedObjectContext];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008DCC;
  v18[3] = &unk_100018550;
  uint64_t v21 = &v31;
  v18[4] = self;
  BOOL v24 = a3;
  int64_t v23 = a4;
  id v13 = v10;
  id v19 = v13;
  id v14 = v12;
  id v20 = v14;
  uint64_t v22 = &v25;
  [v14 performBlockAndWait:v18];
  if (a6)
  {
    id v15 = (void *)v26[5];
    if (v15) {
      *a6 = v15;
    }
  }
  unint64_t v16 = v32[3];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [(FTPersistentDataSource *)self persistentContainer];
  id v13 = [v12 managedObjectContext];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100008F54;
  v17[3] = &unk_100018578;
  BOOL v22 = a3;
  id v20 = v11;
  int64_t v21 = a4;
  v17[4] = self;
  id v18 = v10;
  id v19 = v13;
  id v14 = v11;
  id v15 = v13;
  id v16 = v10;
  [v15 performBlock:v17];
}

- (unint64_t)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_10000762C;
  uint64_t v31 = sub_10000763C;
  id v32 = 0;
  id v12 = [(FTPersistentDataSource *)self persistentContainer];
  id v13 = [v12 managedObjectContext];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000091B8;
  v20[3] = &unk_1000185A0;
  BOOL v24 = &v33;
  v20[4] = self;
  id v14 = v10;
  id v21 = v14;
  int64_t v26 = a4;
  id v15 = v11;
  id v22 = v15;
  id v16 = v13;
  id v23 = v16;
  uint64_t v25 = &v27;
  [v16 performBlockAndWait:v20];
  if (a6)
  {
    id v17 = (void *)v28[5];
    if (v17) {
      *a6 = v17;
    }
  }
  unint64_t v18 = v34[3];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(FTPersistentDataSource *)self persistentContainer];
  id v14 = [v13 managedObjectContext];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100009358;
  v19[3] = &unk_1000185C8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v14;
  id v23 = v12;
  int64_t v24 = a4;
  id v15 = v12;
  id v16 = v14;
  id v17 = v11;
  id v18 = v10;
  [v16 performBlock:v19];
}

- (unint64_t)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_10000762C;
  uint64_t v31 = sub_10000763C;
  id v32 = 0;
  id v12 = [(FTPersistentDataSource *)self persistentContainer];
  id v13 = [v12 managedObjectContext];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000095BC;
  v20[3] = &unk_1000185A0;
  int64_t v24 = &v33;
  v20[4] = self;
  id v14 = v10;
  id v21 = v14;
  int64_t v26 = a4;
  id v15 = v11;
  id v22 = v15;
  id v16 = v13;
  id v23 = v16;
  uint64_t v25 = &v27;
  [v16 performBlockAndWait:v20];
  if (a6)
  {
    id v17 = (void *)v28[5];
    if (v17) {
      *a6 = v17;
    }
  }
  unint64_t v18 = v34[3];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(FTPersistentDataSource *)self persistentContainer];
  id v14 = [v13 managedObjectContext];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000975C;
  v19[3] = &unk_1000185C8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v14;
  id v23 = v12;
  int64_t v24 = a4;
  id v15 = v12;
  id v16 = v14;
  id v17 = v11;
  id v18 = v10;
  [v16 performBlock:v19];
}

- (unint64_t)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_10000762C;
  uint64_t v31 = sub_10000763C;
  id v32 = 0;
  id v12 = [(FTPersistentDataSource *)self persistentContainer];
  id v13 = [v12 managedObjectContext];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000099C0;
  v20[3] = &unk_1000185A0;
  int64_t v24 = &v33;
  v20[4] = self;
  id v14 = v10;
  id v21 = v14;
  int64_t v26 = a4;
  id v15 = v11;
  id v22 = v15;
  id v16 = v13;
  id v23 = v16;
  uint64_t v25 = &v27;
  [v16 performBlockAndWait:v20];
  if (a6)
  {
    id v17 = (void *)v28[5];
    if (v17) {
      *a6 = v17;
    }
  }
  unint64_t v18 = v34[3];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(FTPersistentDataSource *)self persistentContainer];
  id v14 = [v13 managedObjectContext];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100009B60;
  v19[3] = &unk_1000185C8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v14;
  id v23 = v12;
  int64_t v24 = a4;
  id v15 = v12;
  id v16 = v14;
  id v17 = v11;
  id v18 = v10;
  [v16 performBlock:v19];
}

- (BOOL)addConversationLinkDescriptors:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 count]) {
    goto LABEL_15;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = +[FTManagedConversationLink managedConversationLinkForTUConversationLinkDescriptor:inManagedObjectContext:](FTManagedConversationLink, "managedConversationLinkForTUConversationLinkDescriptor:inManagedObjectContext:", *(void *)(*((void *)&v18 + 1) + 8 * i), v9, (void)v18);
        if (v15) {
          [v9 insertObject:v15];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  if (![v9 hasChanges]) {
    goto LABEL_15;
  }
  if (![v9 save:a5])
  {
    [v9 rollback];
LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  [(FTPersistentDataSource *)self notifyDelegatesConversationLinkDescriptorsDidChange];
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (BOOL)addOrUpdateConversationLinkDescriptors:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 count])
  {
LABEL_31:
    BOOL v27 = 0;
    goto LABEL_32;
  }
  id v30 = self;
  id v31 = v8;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v8;
  id v34 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v34)
  {
    uint64_t v10 = *(void *)v40;
    id v11 = &FTConversationService__prots;
    id v32 = v9;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v14 = [&v11[502] fetchRequest];
        id v15 = [v13 pseudonym];
        BOOL v16 = +[NSPredicate tu_predicateForConversationLinkDescriptorsWithPseudonym:v15];
        [v14 setPredicate:v16];

        id v17 = [v9 executeFetchRequest:v14 error:a5];
        if ([v17 count])
        {
          long long v18 = FTCServiceLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v45 = v17;
            __int16 v46 = 2112;
            id v47 = v13;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "update managedObjects: %@ with link: %@", buf, 0x16u);
          }

          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v19 = v17;
          id v20 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = v10;
            id v23 = a5;
            uint64_t v24 = *(void *)v36;
            do
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(void *)v36 != v24) {
                  objc_enumerationMutation(v19);
                }
                [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) updateWithDescriptor:v13];
              }
              id v21 = [v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v21);
            a5 = v23;
            uint64_t v10 = v22;
            id v9 = v32;
            id v11 = &FTConversationService__prots;
          }
        }
        else
        {
          id v19 = [&v11[502] managedConversationLinkForTUConversationLinkDescriptor:v13 inManagedObjectContext:v9];
          int64_t v26 = FTCServiceLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v45 = v19;
            __int16 v46 = 2112;
            id v47 = v9;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "add managedConversationLink: %@ to managedObjectContext: %@", buf, 0x16u);
          }

          if (v19) {
            [v9 insertObject:v19];
          }
        }
      }
      id v34 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v34);
  }

  if (![v9 hasChanges])
  {
    BOOL v27 = 0;
    id v8 = v31;
    goto LABEL_32;
  }
  id v8 = v31;
  if (![v9 save:a5])
  {
    [v9 rollback];
    uint64_t v28 = FTCServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100010CCC((uint64_t)obj, v28);
    }

    goto LABEL_31;
  }
  [(FTPersistentDataSource *)v30 notifyDelegatesConversationLinkDescriptorsDidChange];
  BOOL v27 = 1;
LABEL_32:

  return v27;
}

- (unint64_t)conversationLinkDescriptorCountWithPredicate:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FTManagedConversationLink fetchRequest];
  [v9 setPredicate:v8];

  id v10 = [v7 countForFetchRequest:v9 error:a5];
  return (unint64_t)v10;
}

- (id)conversationLinkDescriptorsWithPredicate:(id)a3 managedObjectContext:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = +[FTManagedConversationLink fetchRequest];
  [v13 setFetchLimit:a5];
  [v13 setFetchOffset:a6];
  [v13 setPredicate:v11];
  [v13 setRelationshipKeyPathsForPrefetching:&off_100018DB0];
  [v13 setRelationshipKeyPathsForPrefetching:&off_100018DC8];
  [v13 setReturnsObjectsAsFaults:0];
  id v14 = [v12 executeFetchRequest:v13 error:a7];
  id v15 = v14;
  if (v14)
  {
    BOOL v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v14 count]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "tuConversationLinkDescriptor", (void)v26);
          [v16 addObject:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v19);
    }

    id v23 = [v16 copy];
    uint64_t v24 = FTCServiceLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "get conversationLinkDescriptors: %@", buf, 0xCu);
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (unint64_t)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = +[FTManagedConversationLink fetchRequest];
  [v12 setPredicate:v10];
  uint64_t v13 = [v11 executeFetchRequest:v12 error:a6];
  id v14 = v13;
  if (!v13) {
    goto LABEL_15;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        [(FTPersistentDataSource *)self deleteConversationLink:*(void *)(*((void *)&v26 + 1) + 8 * (void)v18) deleteReason:a4 inContext:v11];
        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v16);
  }
  if (![v11 hasChanges]) {
    goto LABEL_15;
  }
  id v19 = [v11 updatedObjects];
  id v20 = [v19 count];
  id v21 = [v11 deletedObjects];
  id v22 = [v21 count];

  if (![v11 save:a6])
  {
    [v11 rollback];
    uint64_t v24 = FTCServiceLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100010D44(v24);
    }

LABEL_15:
    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }
  unint64_t v23 = (unint64_t)v20 + (void)v22;
  [(FTPersistentDataSource *)self notifyDelegatesConversationLinkDescriptorsDidChange];
LABEL_16:

  return v23;
}

- (unint64_t)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[FTManagedConversationLink fetchRequest];
  [v10 setPredicate:v8];
  id v11 = [v9 executeFetchRequest:v10 error:a5];
  id v12 = v11;
  if (!v11) {
    goto LABEL_15;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        [(FTPersistentDataSource *)self removeLinkFromDatabase:*(void *)(*((void *)&v24 + 1) + 8 * (void)v16) inContext:v9];
        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }
  if (![v9 hasChanges]) {
    goto LABEL_15;
  }
  uint64_t v17 = [v9 updatedObjects];
  id v18 = [v17 count];
  id v19 = [v9 deletedObjects];
  id v20 = [v19 count];

  if (![v9 save:a5])
  {
    [v9 rollback];
    id v22 = FTCServiceLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100010D88(v22);
    }

LABEL_15:
    unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }
  unint64_t v21 = (unint64_t)v18 + (void)v20;
  [(FTPersistentDataSource *)self notifyDelegatesConversationLinkDescriptorsDidChange];
LABEL_16:

  return v21;
}

- (void)deleteConversationLink:(id)a3 deleteReason:(int64_t)a4 inContext:(id)a5
{
  id v6 = a3;
  id v7 = [v6 deletionDate];

  if (v7)
  {
    id v8 = FTCServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)(int)[v6 deleteReason];
      id v10 = [v6 deletionDate];
      id v11 = [v6 pseudonym];
      int v16 = 134218754;
      int64_t v17 = a4;
      __int16 v18 = 2048;
      id v19 = v9;
      __int16 v20 = 2112;
      unint64_t v21 = v10;
      __int16 v22 = 2112;
      unint64_t v23 = v11;
      id v12 = "deleteConversationLink: current reason: %ld, link is already deleted with reason: %ld, deletionDate: %@ for %@";
      id v13 = v8;
      uint32_t v14 = 42;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
  }
  else
  {
    uint64_t v15 = +[NSDate date];
    [v6 setDeletionDate:v15];

    [v6 setDeleteReason:(__int16)a4];
    id v8 = FTCServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 deletionDate];
      id v11 = [v6 pseudonym];
      int v16 = 134218498;
      int64_t v17 = a4;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      unint64_t v21 = v11;
      id v12 = "deleteConversationLink: reason: %ld, deletionDate: %@ for %@";
      id v13 = v8;
      uint32_t v14 = 32;
      goto LABEL_6;
    }
  }
}

- (void)removeLinkFromDatabase:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  [a4 deleteObject:v5];
  id v6 = FTCServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "removeLinkFromDatabase: remove link: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (unint64_t)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7
{
  BOOL v10 = a3;
  id v12 = a5;
  id v13 = a6;
  uint32_t v14 = +[FTManagedConversationLink fetchRequest];
  [v14 setPredicate:v12];
  uint64_t v15 = [v13 executeFetchRequest:v14 error:a7];
  int v16 = v15;
  if (!v15) {
    goto LABEL_15;
  }
  long long v25 = self;
  long long v26 = a7;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        unint64_t v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v21 setActivated:v10];
        if (a4 >= 1) {
          [v21 setOriginatorRevision:a4];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v18);
  }
  if (![v13 hasChanges]) {
    goto LABEL_15;
  }
  __int16 v22 = [v13 updatedObjects];
  unint64_t v23 = (unint64_t)[v22 count];

  if (![v13 save:v26])
  {
    [v13 rollback];
LABEL_15:
    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }
  [(FTPersistentDataSource *)v25 notifyDelegatesConversationLinkDescriptorsDidChange];
LABEL_16:

  return v23;
}

- (unint64_t)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = +[FTManagedConversationLink fetchRequest];
  [v15 setPredicate:v13];
  int v16 = [v14 executeFetchRequest:v15 error:a7];
  id v17 = v16;
  if (!v16) {
    goto LABEL_15;
  }
  long long v26 = self;
  long long v27 = a7;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        __int16 v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v22 setExpirationDate:v12];
        if (a4 >= 1) {
          [v22 setOriginatorRevision:a4];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v19);
  }
  if (![v14 hasChanges]) {
    goto LABEL_15;
  }
  unint64_t v23 = [v14 updatedObjects];
  unint64_t v24 = (unint64_t)[v23 count];

  if (![v14 save:v27])
  {
    [v14 rollback];
LABEL_15:
    unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }
  [(FTPersistentDataSource *)v26 notifyDelegatesConversationLinkDescriptorsDidChange];
LABEL_16:

  return v24;
}

- (unint64_t)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = +[FTManagedConversationLink fetchRequest];
  [v15 setPredicate:v13];
  int v16 = [v14 executeFetchRequest:v15 error:a7];
  if (v16)
  {
    long long v27 = self;
    long long v28 = a7;
    id v29 = v13;
    id v30 = v12;
    id v17 = +[FTManagedHandle managedHandlesForTUHandles:v12 inManagedObjectContext:v14];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v18 = v16;
    id v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          unint64_t v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          [v23 setInvitedHandles:v17];
          if (a4 >= 1) {
            [v23 setOriginatorRevision:a4];
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v20);
    }

    if ([v14 hasChanges])
    {
      unint64_t v24 = [v14 updatedObjects];
      unint64_t v25 = (unint64_t)[v24 count];

      id v12 = v30;
      if ([v14 save:v28])
      {
        [(FTPersistentDataSource *)v27 notifyDelegatesConversationLinkDescriptorsDidChange];
      }
      else
      {
        [v14 rollback];
        unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      id v12 = v30;
    }
    id v13 = v29;
  }
  else
  {
    unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v25;
}

- (unint64_t)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = +[FTManagedConversationLink fetchRequest];
  [v15 setPredicate:v13];
  int v16 = [v14 executeFetchRequest:v15 error:a7];
  id v17 = v16;
  if (!v16) {
    goto LABEL_15;
  }
  long long v26 = self;
  long long v27 = a7;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        __int16 v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v22 setName:v12];
        if (a4 >= 1) {
          [v22 setOriginatorRevision:a4];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v19);
  }
  if (![v14 hasChanges]) {
    goto LABEL_15;
  }
  unint64_t v23 = [v14 updatedObjects];
  unint64_t v24 = (unint64_t)[v23 count];

  if (![v14 save:v27])
  {
    [v14 rollback];
LABEL_15:
    unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }
  [(FTPersistentDataSource *)v26 notifyDelegatesConversationLinkDescriptorsDidChange];
LABEL_16:

  return v24;
}

- (void)notifyDelegatesConversationLinkDescriptorsDidChange
{
  v3 = [(FTPersistentDataSource *)self delegateController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000B2C0;
  v4[3] = &unk_100018618;
  v4[4] = self;
  [v3 enumerateDelegatesUsingBlock:v4];
}

- (FTPersistentDataSource)init
{
  return [(FTPersistentDataSource *)self initWithStoreType:0];
}

- (FTPersistentDataSource)initWithStoreType:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)FTPersistentDataSource;
  v4 = [(FTPersistentDataSource *)&v11 init];
  if (v4)
  {
    id v5 = (FTPersistentDataSourceDelegate *)objc_alloc_init((Class)TUDelegateController);
    delegateController = v4->_delegateController;
    v4->_delegateController = v5;

    int v7 = [[FTPersistentContainer alloc] initWithStoreType:a3];
    persistentContainer = v4->_persistentContainer;
    v4->_persistentContainer = v7;

    id v9 = FTCServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100010DCC(v9);
    }

    [(FTPersistentContainer *)v4->_persistentContainer loadPersistentStoresWithCompletionHandler:&stru_100018670];
  }
  return v4;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FTPersistentDataSource *)self delegateController];
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(FTPersistentDataSource *)self delegateController];
  [v5 removeDelegate:v4];
}

- (FTPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (TUDelegateController)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateController, 0);

  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000;
  unint64_t v24 = sub_10000BD0C;
  unint64_t v25 = sub_10000BD1C;
  id v26 = 0;
  id v9 = [(FTPersistentDataSource *)self persistentContainer];
  BOOL v10 = [v9 managedObjectContext];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000BD24;
  v15[3] = &unk_100018500;
  id v18 = &v27;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  int64_t v20 = a3;
  id v12 = v10;
  id v17 = v12;
  id v19 = &v21;
  [v12 performBlockAndWait:v15];
  if (a5) {
    *a5 = (id) v22[5];
  }
  char v13 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(FTPersistentDataSource *)self persistentContainer];
  id v11 = [v10 managedObjectContext];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000BE9C;
  v15[3] = &unk_100018528;
  v15[4] = self;
  id v16 = v8;
  id v18 = v9;
  int64_t v19 = a3;
  id v17 = v11;
  id v12 = v9;
  id v13 = v11;
  id v14 = v8;
  [v13 performBlock:v15];
}

- (void)integerForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FTPersistentDataSource *)self persistentContainer];
  id v9 = [v8 managedObjectContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C018;
  v13[3] = &unk_100018488;
  v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = v6;
  [v11 performBlock:v13];
}

- (int64_t)integerForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v18 = 0;
  int64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_10000BD0C;
  __int16 v22 = sub_10000BD1C;
  id v23 = 0;
  id v7 = [(FTPersistentDataSource *)self persistentContainer];
  id v8 = [v7 managedObjectContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C258;
  v13[3] = &unk_1000186C0;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  id v16 = &v18;
  id v17 = &v24;
  [v10 performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v19[5];
  }
  int64_t v11 = v25[3];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_10000BD0C;
  uint64_t v27 = sub_10000BD1C;
  id v28 = 0;
  id v10 = [(FTPersistentDataSource *)self persistentContainer];
  int64_t v11 = [v10 managedObjectContext];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000C4A8;
  v17[3] = &unk_1000186E8;
  uint64_t v21 = &v29;
  v17[4] = self;
  id v12 = v9;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  id v14 = v11;
  id v20 = v14;
  __int16 v22 = &v23;
  [v14 performBlockAndWait:v17];
  if (a5) {
    *a5 = (id) v24[5];
  }
  char v15 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [(FTPersistentDataSource *)self persistentContainer];
  id v12 = [v11 managedObjectContext];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000C640;
  v17[3] = &unk_100018710;
  v17[4] = self;
  id v18 = v9;
  id v19 = v8;
  id v20 = v12;
  id v21 = v10;
  id v13 = v10;
  id v14 = v12;
  id v15 = v8;
  id v16 = v9;
  [v14 performBlock:v17];
}

- (void)stringForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FTPersistentDataSource *)self persistentContainer];
  id v9 = [v8 managedObjectContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C7BC;
  v13[3] = &unk_100018488;
  v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = v6;
  [v11 performBlock:v13];
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_10000BD0C;
  id v28 = sub_10000BD1C;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10000BD0C;
  __int16 v22 = sub_10000BD1C;
  id v23 = 0;
  id v7 = [(FTPersistentDataSource *)self persistentContainer];
  id v8 = [v7 managedObjectContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000CA58;
  v13[3] = &unk_1000186C0;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  id v16 = &v18;
  id v17 = &v24;
  [v10 performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (id)keyValueForKey:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FTManagedKeyValue fetchRequest];
  id v10 = +[NSPredicate predicateWithFormat:@"key == %@", v8];

  [v9 setPredicate:v10];
  [v9 setReturnsObjectsAsFaults:0];
  id v11 = [v7 executeFetchRequest:v9 error:a5];

  if (v11)
  {
    id v12 = [v11 firstObject];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)addOrUpdateKey:(id)a3 forIntegerValue:(int64_t)a4 stringValue:(id)a5 managedObjectContext:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[FTManagedKeyValue fetchRequest];
  id v15 = +[NSPredicate predicateWithFormat:@"key == %@", v11];
  [v14 setPredicate:v15];

  [v14 setReturnsObjectsAsFaults:0];
  id v16 = [v13 executeFetchRequest:v14 error:a7];
  if ([v16 count])
  {
    id v17 = [v16 firstObject];
    if (!v17) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v19 = [v13 persistentStoreCoordinator];
  uint64_t v20 = [v19 managedObjectModel];

  if (v20)
  {
    id v21 = [v20 entitiesByName];
    __int16 v22 = [v21 objectForKeyedSubscript:@"KeyValue"];

    if (v22)
    {
      id v23 = [[FTManagedKeyValue alloc] initWithEntity:v22 insertIntoManagedObjectContext:v13];
    }
    else
    {
      uint64_t v25 = FTCServiceLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v27 = @"KeyValue";
        __int16 v28 = 2112;
        id v29 = v13;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Could not find entity description with name %@ in managed object context %@. Falling back to convenience initializer.", buf, 0x16u);
      }

      id v23 = [[FTManagedKeyValue alloc] initWithContext:v13];
    }
    id v17 = v23;
    if (v23) {
      [v13 insertObject:v23];
    }
  }
  else
  {
    id v17 = 0;
  }

  if (v17)
  {
LABEL_3:
    [v17 setKey:v11];
    [v17 setStringValue:v12];
    [v17 setIntegerValue:a4];
  }
LABEL_4:
  if (![v13 hasChanges])
  {
LABEL_11:
    BOOL v18 = 0;
    goto LABEL_12;
  }
  if (([v13 save:a7] & 1) == 0)
  {
    [v13 rollback];
    goto LABEL_11;
  }
  BOOL v18 = 1;
LABEL_12:

  return v18;
}

@end
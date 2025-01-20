@interface RMSubscribedStatusKeyPathUpdater
+ (RMSubscribedStatusKeyPathUpdater)sharedUpdater;
- (BOOL)_updateSubscribedStatusKeyPathsWithFetchPredicate:(id)a3;
- (BOOL)notifyStatusDidChangeForDeclarations;
- (BOOL)notifyStatusDidChangeForKeyPath:(id)a3;
- (BOOL)notifyStatusDidChangeForKeyPaths:(id)a3;
- (BOOL)notifyStatusDidChangeForKeyPaths:(id)a3 managementSourceIdentifier:(id)a4;
- (BOOL)notifyStatusDidChangeForKeyPathsByManagementSourceObjectID:(id)a3;
- (NSPersistentContainer)persistentContainer;
- (RMSubscribedStatusKeyPathUpdater)initWithPersistentContainer:(id)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation RMSubscribedStatusKeyPathUpdater

+ (RMSubscribedStatusKeyPathUpdater)sharedUpdater
{
  if (qword_1000DB478 != -1) {
    dispatch_once(&qword_1000DB478, &stru_1000C7140);
  }
  v2 = (void *)qword_1000DB470;

  return (RMSubscribedStatusKeyPathUpdater *)v2;
}

- (RMSubscribedStatusKeyPathUpdater)initWithPersistentContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMSubscribedStatusKeyPathUpdater;
  v6 = [(RMSubscribedStatusKeyPathUpdater *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentContainer, a3);
  }

  return v7;
}

- (BOOL)notifyStatusDidChangeForDeclarations
{
  v3 = +[NSSet setWithObject:RMModelStatusItemManagementDeclarations];
  LOBYTE(self) = [(RMSubscribedStatusKeyPathUpdater *)self notifyStatusDidChangeForKeyPaths:v3];

  return (char)self;
}

- (BOOL)notifyStatusDidChangeForKeyPath:(id)a3
{
  v4 = +[NSSet setWithObject:a3];
  LOBYTE(self) = [(RMSubscribedStatusKeyPathUpdater *)self notifyStatusDidChangeForKeyPaths:v4];

  return (char)self;
}

- (BOOL)notifyStatusDidChangeForKeyPaths:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v38 + 1) + 8 * (void)v9);
        v11 = [v10 pathExtension];
        id v12 = [v11 length];

        if (v12)
        {
          while (([v4 containsObject:v10] & 1) == 0)
          {
            [v4 addObject:v10];
            v13 = [v10 stringByDeletingPathExtension];

            v14 = [v13 pathExtension];
            id v15 = [v14 length];

            id v10 = v13;
            if (!v15) {
              goto LABEL_11;
            }
          }
        }
        v13 = v10;
LABEL_11:
        [v4 addObject:v13];

        objc_super v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v7);
  }

  v36 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"keyPath", v4];

  id v16 = v5;
  v17 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v39;
    do
    {
      v22 = 0;
      do
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [*(id *)(*((void *)&v38 + 1) + 8 * (void)v22) stringByAppendingString:@"."];
        [v17 addObject:v23];

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v20);
  }

  v24 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v25 = v17;
  id v26 = [v25 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v39;
    do
    {
      v29 = 0;
      do
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = +[NSPredicate predicateWithFormat:@"%K BEGINSWITH %@", @"keyPath", *(void *)(*((void *)&v38 + 1) + 8 * (void)v29)];
        [v24 addObject:v30];

        v29 = (char *)v29 + 1;
      }
      while (v27 != v29);
      id v27 = [v25 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v27);
  }

  v31 = +[NSCompoundPredicate orPredicateWithSubpredicates:v24];

  v42[0] = v36;
  v42[1] = v31;
  v32 = +[NSArray arrayWithObjects:v42 count:2];
  v33 = +[NSCompoundPredicate orPredicateWithSubpredicates:v32];

  BOOL v34 = [(RMSubscribedStatusKeyPathUpdater *)self _updateSubscribedStatusKeyPathsWithFetchPredicate:v33];
  return v34;
}

- (BOOL)notifyStatusDidChangeForKeyPathsByManagementSourceObjectID:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100087C68;
  v8[3] = &unk_1000C7168;
  id v9 = (id)objc_opt_new();
  id v5 = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  id v6 = +[NSCompoundPredicate orPredicateWithSubpredicates:v5];

  LOBYTE(self) = [(RMSubscribedStatusKeyPathUpdater *)self _updateSubscribedStatusKeyPathsWithFetchPredicate:v6];
  return (char)self;
}

- (BOOL)notifyStatusDidChangeForKeyPaths:(id)a3 managementSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = +[NSPredicate predicateWithFormat:@"%K == %@", @"managementSource.identifier", a4];
  id v8 = v6;
  id v9 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v26 + 1) + 8 * (void)v14);
        id v16 = [v15 pathExtension];
        id v17 = [v16 length];

        if (v17)
        {
          while (([v9 containsObject:v15] & 1) == 0)
          {
            [v9 addObject:v15];
            id v18 = [v15 stringByDeletingPathExtension];

            id v19 = [v18 pathExtension];
            id v20 = [v19 length];

            id v15 = v18;
            if (!v20) {
              goto LABEL_11;
            }
          }
        }
        id v18 = v15;
LABEL_11:
        [v9 addObject:v18];

        v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  uint64_t v21 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"keyPath", v9, (void)v26];

  v30[0] = v7;
  v30[1] = v21;
  v22 = +[NSArray arrayWithObjects:v30 count:2];
  v23 = +[NSCompoundPredicate andPredicateWithSubpredicates:v22];

  BOOL v24 = [(RMSubscribedStatusKeyPathUpdater *)self _updateSubscribedStatusKeyPathsWithFetchPredicate:v23];
  return v24;
}

- (BOOL)_updateSubscribedStatusKeyPathsWithFetchPredicate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(RMSubscribedStatusKeyPathUpdater *)self persistentContainer];
  id v7 = [v6 newBackgroundContext];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1000879B8;
  id v18 = &unk_1000C5A60;
  id v8 = v4;
  id v19 = v8;
  id v9 = v5;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  [v10 performBlockAndWait:&v15];
  id v11 = objc_msgSend(v9, "count", v15, v16, v17, v18);
  if (v11)
  {
    id v12 = +[NSNotificationCenter defaultCenter];
    CFStringRef v22 = @"RMUserInfoKeyUpdatedManagementSourceObjectIDs";
    id v23 = v9;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [v12 postNotificationName:@"RMSubscribedStatusKeyPathDidChangeNotification" object:self userInfo:v13];
  }
  return v11 != 0;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
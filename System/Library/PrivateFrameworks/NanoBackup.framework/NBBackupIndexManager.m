@interface NBBackupIndexManager
- (BOOL)shouldLoadiCloudBackups;
- (NBBackupIndexManager)initWithiCloudBackup:(id)a3;
- (NBBackupiCloud)iCloudBackup;
- (NSArray)allBackups;
- (NSMutableDictionary)metadataIndex;
- (id)_metadataIndexReadFromDiskIfNeeded;
- (id)metadataIndexReadFromDiskIfNeeded;
- (id)newBackupUUID;
- (id)pathToBackup:(id)a3;
- (id)pathToBackupID:(id)a3;
- (id)pathToBackupIndex;
- (id)persistMetadataIndex;
- (void)allBackupsWithTimeout:(int64_t)a3 completion:(id)a4;
- (void)backupForID:(id)a3 completion:(id)a4;
- (void)createNewBackup:(id)a3;
- (void)deleteBackupWithID:(id)a3 withCompletion:(id)a4;
- (void)iCloudBackupsWithTimeout:(int64_t)a3 completion:(id)a4;
- (void)loadiCloudBackups:(int64_t)a3 completion:(id)a4;
- (void)localBackupsWithCompletion:(id)a3;
- (void)pruneLocalBackups;
- (void)purgeCache;
- (void)removeICloudBackupsFromIndex;
- (void)setICloudBackup:(id)a3;
- (void)setMetadataIndex:(id)a3;
@end

@implementation NBBackupIndexManager

- (void)loadiCloudBackups:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  if ([(NBBackupIndexManager *)self shouldLoadiCloudBackups])
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    char v21 = 0;
    if (a3)
    {
      dispatch_time_t v7 = dispatch_time(0, 1000000000 * a3);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000068E8;
      block[3] = &unk_10002CA68;
      v18 = v20;
      id v17 = v6;
      objc_copyWeak(&v19, &location);
      dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v19);
    }
    v8 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "got iCloud HSA2 account, ask for backups from iCloud", buf, 2u);
    }
    iCloudBackup = self->_iCloudBackup;
    if (!iCloudBackup)
    {
      v10 = (NBBackupiCloud *)objc_opt_new();
      v11 = self->_iCloudBackup;
      self->_iCloudBackup = v10;

      iCloudBackup = self->_iCloudBackup;
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000069A4;
    v12[3] = &unk_10002CA90;
    v14 = v20;
    id v13 = v6;
    [(NBBackupiCloud *)iCloudBackup backupList:v12];

    _Block_object_dispose(v20, 8);
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
  objc_destroyWeak(&location);
}

- (void)iCloudBackupsWithTimeout:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (!self->_metadataIndex)
  {
    dispatch_time_t v7 = (NSMutableDictionary *)objc_opt_new();
    metadataIndex = self->_metadataIndex;
    self->_metadataIndex = v7;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000250C;
  v10[3] = &unk_10002C910;
  id v11 = v6;
  id v9 = v6;
  [(NBBackupIndexManager *)self loadiCloudBackups:a3 completion:v10];
}

- (BOOL)shouldLoadiCloudBackups
{
  id v2 = objc_alloc_init((Class)ACAccountStore);
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  if (v3)
  {
    v4 = +[AKAccountManager sharedInstance];
    v5 = objc_msgSend(v2, "aa_primaryAppleAccount");
    id v6 = objc_msgSend(v5, "aa_altDSID");
    dispatch_time_t v7 = [v4 authKitAccountWithAltDSID:v6];

    id v8 = [v4 securityLevelForAccount:v7];
    BOOL v9 = v8 == (id)4;
    if (v8 != (id)4)
    {
      v10 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found primary account, but not HSA2.  iCloud backups will not be loaded", buf, 2u);
      }
    }
  }
  else
  {
    id v11 = nb_daemon_log;
    BOOL v9 = 0;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No primary account.  iCloud Backups will not be loaded", v13, 2u);
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (NBBackupIndexManager)initWithiCloudBackup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NBBackupIndexManager;
  id v6 = [(NBBackupIndexManager *)&v9 init];
  dispatch_time_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_iCloudBackup, a3);
  }

  return v7;
}

- (void)allBackupsWithTimeout:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  [(NBBackupIndexManager *)self removeICloudBackupsFromIndex];
  id v7 = [(NBBackupIndexManager *)self metadataIndexReadFromDiskIfNeeded];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000058E0;
  v9[3] = &unk_10002C8E8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(NBBackupIndexManager *)self loadiCloudBackups:a3 completion:v9];
}

- (void)localBackupsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  metadataIndex = self->_metadataIndex;
  self->_metadataIndex = 0;

  id v6 = [(NBBackupIndexManager *)self metadataIndexReadFromDiskIfNeeded];
  id v7 = self->_metadataIndex;
  self->_metadataIndex = v6;

  id v8 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v9 = [(NSMutableDictionary *)self->_metadataIndex allValues];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (![v14 backupType]) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  v4[2](v4, v8);
}

- (void)backupForID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(NBBackupIndexManager *)self metadataIndexReadFromDiskIfNeeded];
  objc_super v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    id v10 = [v8 objectForKeyedSubscript:v6];
    v7[2](v7, v10);
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100005CCC;
    v11[3] = &unk_10002C938;
    id v13 = v7;
    id v12 = v6;
    [(NBBackupIndexManager *)self loadiCloudBackups:0 completion:v11];
  }
}

- (id)pathToBackup:(id)a3
{
  v4 = [a3 uuid];
  id v5 = [(NBBackupIndexManager *)self pathToBackupID:v4];

  return v5;
}

- (id)pathToBackupID:(id)a3
{
  id v3 = a3;
  v4 = NBBackupDirectoryPath();
  id v5 = [v3 UUIDString];

  id v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

- (void)createNewBackup:(id)a3
{
  v4 = (void (**)(id, id, id, id))a3;
  id v5 = [(NBBackupIndexManager *)self newBackupUUID];
  id v6 = [(NBBackupIndexManager *)self pathToBackupID:v5];
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005F6C;
  v11[3] = &unk_10002C960;
  v14 = &v15;
  void v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  objc_super v9 = objc_retainBlock(v11);
  v4[2](v4, v7, v8, v9);
  if (!*((unsigned char *)v16 + 24)) {
    id v10 = (id)((uint64_t (*)(void *, void))v9[2])(v9, 0);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)deleteBackupWithID:(id)a3 withCompletion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000060D0;
  v8[3] = &unk_10002C9B0;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(NBBackupIndexManager *)self backupForID:v7 completion:v8];
}

- (void)pruneLocalBackups
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000064C8;
  v2[3] = &unk_10002CA40;
  v2[4] = self;
  [(NBBackupIndexManager *)self localBackupsWithCompletion:v2];
}

- (void)purgeCache
{
  metadataIndex = self->_metadataIndex;
  self->_metadataIndex = 0;

  self->_metadataIndex = (NSMutableDictionary *)objc_opt_new();

  _objc_release_x1();
}

- (void)removeICloudBackupsFromIndex
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(NSMutableDictionary *)self->_metadataIndex allValues];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 backupType] == (id)1)
        {
          metadataIndex = self->_metadataIndex;
          id v10 = [v8 uuid];
          [(NSMutableDictionary *)metadataIndex removeObjectForKey:v10];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)metadataIndexReadFromDiskIfNeeded
{
  metadataIndex = self->_metadataIndex;
  if (!metadataIndex || ![(NSMutableDictionary *)metadataIndex count])
  {
    id v4 = [(NBBackupIndexManager *)self _metadataIndexReadFromDiskIfNeeded];
    id v5 = self->_metadataIndex;
    self->_metadataIndex = v4;
  }
  uint64_t v6 = self->_metadataIndex;

  return v6;
}

- (id)_metadataIndexReadFromDiskIfNeeded
{
  id v3 = [(NBBackupIndexManager *)self pathToBackupIndex];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  id v4 = +[NSArray arrayWithObjects:&v13 count:3];
  id v5 = +[NSSet setWithArray:](NSSet, "setWithArray:", v4, v13, v14);

  uint64_t v6 = +[NBKeyedArchiverUtil unarchiveObjectOfClasses:v5 withFile:v3];
  metadataIndex = self->_metadataIndex;
  self->_metadataIndex = v6;

  id v8 = self->_metadataIndex;
  if (!v8)
  {
    id v9 = (NSMutableDictionary *)objc_opt_new();
    id v10 = self->_metadataIndex;
    self->_metadataIndex = v9;

    id v8 = self->_metadataIndex;
  }
  long long v11 = v8;

  return v11;
}

- (id)persistMetadataIndex
{
  id v3 = NBBackupDirectoryPath();
  id v4 = [(NBBackupIndexManager *)self pathToBackupIndex];
  metadataIndex = self->_metadataIndex;
  if (metadataIndex && [(NSMutableDictionary *)metadataIndex count])
  {
    uint64_t v6 = +[NBKeyedArchiverUtil archiveObject:self->_metadataIndex];
    id v15 = 0;
    [v6 writeToFile:v4 options:268435457 error:&v15];
    id v7 = v15;
    if (v7)
    {
      id v8 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v4;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to write index file (%@) with error: (%@)", buf, 0x16u);
      }
    }
  }
  else
  {
    id v9 = +[NSFileManager defaultManager];
    id v14 = 0;
    [v9 removeItemAtPath:v3 error:&v14];
    id v7 = v14;

    if (!v7) {
      goto LABEL_14;
    }
    id v10 = [v7 domain];
    if ([v10 isEqualToString:NSCocoaErrorDomain])
    {
      id v11 = [v7 code];

      if (v11 == (id)4) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    long long v12 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v4;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to delete to-be-empty backup directory (%@) with error: (%@)", buf, 0x16u);
    }
  }
LABEL_14:

  return v7;
}

- (id)pathToBackupIndex
{
  if (qword_100034FB8 != -1) {
    dispatch_once(&qword_100034FB8, &stru_10002CAB0);
  }
  id v2 = (void *)qword_100034FB0;

  return v2;
}

- (id)newBackupUUID
{
  id v3 = [(NBBackupIndexManager *)self _metadataIndexReadFromDiskIfNeeded];
  id v4 = +[NSFileManager defaultManager];
  id v5 = 0;
  do
  {
    while (1)
    {
      do
      {
        uint64_t v6 = v5;
        id v5 = +[NSUUID UUID];
      }
      while (!v5);
      id v7 = [v3 objectForKeyedSubscript:v5];
      if (!v7) {
        break;
      }
    }
    id v8 = [(NBBackupIndexManager *)self pathToBackupID:v5];
    unsigned __int8 v9 = [v4 fileExistsAtPath:v8];
  }
  while ((v9 & 1) != 0);

  return v5;
}

- (NSArray)allBackups
{
  return self->_allBackups;
}

- (NSMutableDictionary)metadataIndex
{
  return self->_metadataIndex;
}

- (void)setMetadataIndex:(id)a3
{
}

- (NBBackupiCloud)iCloudBackup
{
  return self->_iCloudBackup;
}

- (void)setICloudBackup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudBackup, 0);
  objc_storeStrong((id *)&self->_metadataIndex, 0);

  objc_storeStrong((id *)&self->_allBackups, 0);
}

@end
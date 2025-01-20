@interface VMAccountStore
- (CSDBRecordStore)getStore;
- (NSURL)accountDir;
- (NSURL)dbfile;
- (NSUUID)label;
- (OS_dispatch_queue)queue;
- (VMAccountStore)initWithLabel:(id)a3 accountDir:(id)a4;
- (__CFArray)copyOfAllRecordsWithFlags:(unsigned int)a3 flagsToNotHave:(unsigned int)a4;
- (__CFArray)copyOfAllRecordsWithFlagsInRemoteUIDRange:(unsigned int)a3 flagsToNotHave:(unsigned int)a4 lowUid:(unsigned int)a5 highUid:(unsigned int)a6;
- (__CFArray)copyOfAllRemoteUIDsWithTrashState:(BOOL)a3 includeTemp:(BOOL)a4;
- (__CFArray)copyRecordsWithToken:(__CFString *)a3;
- (__CFArray)copyRecordsWithTokenInMailbox:(__CFString *)a3 mailboxType:(int64_t)a4;
- (const)getRecordDescriptor;
- (id)description;
- (id)getDataFiles;
- (int)copyOfAllRecordsWithFlagsInRemoteUIDRangeByStatement:(unsigned int)a3 flagsToNotHave:(unsigned int)a4 lowUid:(unsigned int)a5 highUid:(unsigned int)a6;
- (int)getRecordIdentifier_sync:(void *)a3;
- (unsigned)getRecordIdentifier:(void *)a3;
- (unsigned)getUIDValidity:(__CFString *)a3;
- (void)copyFirstRecordWithToken:(__CFString *)a3;
- (void)copyFirstRecordWithTokenInMailbox:(__CFString *)a3 mailboxType:(int64_t)a4;
- (void)copyRecordWithIdentifier:(unsigned int)a3;
- (void)copyRecordWithRemoteUID:(unsigned int)a3 flagsToHave:(unsigned int)a4 flagsToNotHave:(unsigned int)a5;
- (void)createAndAddRecord:(unsigned int)a3 date:(int)a4 token:(id)a5 sender:(id)a6 callbackNumber:(id)a7 duration:(int)a8 expirationDate:(int)a9 flags:(int)a10 receiver:(id)a11;
- (void)dealloc;
- (void)getRecordProperty:(void *)a3 property:(int)a4;
- (void)getRecordProperty_sync:(void *)a3 property:(int)a4;
- (void)removeAllRecords;
- (void)removeRecord:(void *)a3;
- (void)resetLocalFlag:(void *)a3 flag:(unsigned int)a4;
- (void)save;
- (void)setAccountDir:(id)a3;
- (void)setDbfile:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLocalFlag:(void *)a3 flag:(unsigned int)a4;
- (void)setQueue:(id)a3;
- (void)setRecordProperty:(void *)a3 property:(int)a4 value:(void *)a5;
- (void)setRecordProperty_sync:(void *)a3 property:(int)a4 value:(void *)a5;
- (void)setUIDValidity:(__CFString *)a3 uidValidity:(unsigned int)a4;
@end

@implementation VMAccountStore

- (VMAccountStore)initWithLabel:(id)a3 accountDir:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)VMAccountStore;
  v8 = [(VMAccountStore *)&v37 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.voicemail.VMAccountStore.queue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    [(VMAccountStore *)v8 setLabel:v6];
    [(VMAccountStore *)v8 setAccountDir:v7];
    v12 = sub_10006D9F8(v7, v11);
    [(VMAccountStore *)v8 setDbfile:v12];

    v13 = +[NSFileManager defaultManager];
    v14 = [(VMAccountStore *)v8 dbfile];
    v15 = [v14 path];
    unsigned __int8 v16 = [v13 fileExistsAtPath:v15];

    if ((v16 & 1) == 0)
    {
      v17 = +[NSFileManager defaultManager];
      v18 = [(VMAccountStore *)v8 accountDir];
      v19 = [v18 path];
      id v36 = 0;
      unsigned __int8 v20 = [v17 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:0 error:&v36];
      id v21 = v36;

      if ((v20 & 1) == 0)
      {
        v22 = vm_vmd_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100081C90(v8, (uint64_t)v21, v22);
        }
      }
    }
    v23 = [(VMAccountStore *)v8 dbfile];
    [v23 path];
    v8->store = (CSDBRecordStore *)CSDBRecordStoreCreateWithPath();

    if (v8->store)
    {
      CSDBRecordStoreRegisterClass();
      CSDBRecordStoreSetSetupHandler();
      uint64_t Database = CSDBRecordStoreGetDatabase();
      if (Database)
      {
        v25 = (char **)Database;
        CSDBSqliteDatabaseSetDataProtectionClass();
        CSDBSqliteDatabaseSetVersion();
        uint64_t v26 = CSDBSqliteDatabaseConnectionForReading();
        v27 = vm_vmd_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *v25;
          *(_DWORD *)buf = 134218498;
          v39 = v25;
          __int16 v40 = 2112;
          v41 = v28;
          __int16 v42 = 2048;
          uint64_t v43 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Creating account db %p path %@, connection %p", buf, 0x20u);
        }

        v29 = (const void *)CSDBSqliteDatabaseCopyValueForProperty();
        if (v29) {
          CFRelease(v29);
        }
        uint64_t v30 = 0;
        v31 = &off_1000C31E8;
        do
        {
          v32 = *v31;
          dword_1000E0A5C[v30] = CSDBRecordIndexOfPropertyNamed();
          v33 = vm_vmd_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            int v34 = dword_1000E0A5C[v30];
            *(_DWORD *)buf = 134218754;
            v39 = (char **)v30;
            __int16 v40 = 2080;
            v41 = v32;
            __int16 v42 = 2048;
            uint64_t v43 = v30;
            __int16 v44 = 1024;
            int v45 = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[%lu] Property ID of %s (%lu) is %d", buf, 0x26u);
          }

          ++v30;
          v31 += 5;
        }
        while (v30 != 11);
      }
    }
  }
  return v8;
}

- (void)dealloc
{
  CSDBRecordStoreDestroy();
  [(VMAccountStore *)self setLabel:0];
  [(VMAccountStore *)self setAccountDir:0];
  [(VMAccountStore *)self setDbfile:0];
  v3.receiver = self;
  v3.super_class = (Class)VMAccountStore;
  [(VMAccountStore *)&v3 dealloc];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(VMAccountStore *)self label];
  v5 = +[NSString stringWithFormat:@"<%@ %p label=%@>", v3, self, v4];

  return v5;
}

- (CSDBRecordStore)getStore
{
  return self->store;
}

- (const)getRecordDescriptor
{
  return (const $86FA08D3C5D32E3E8DBF538E9D6CCBBA *)&off_1000C3148;
}

- (int)getRecordIdentifier_sync:(void *)a3
{
  return CSDBRecordGetID();
}

- (void)getRecordProperty_sync:(void *)a3 property:(int)a4
{
  if (a3) {
    return (void *)CSDBRecordGetProperty();
  }
  else {
    return 0;
  }
}

- (void)getRecordProperty:(void *)a3 property:(int)a4
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v7 = [(VMAccountStore *)self queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100076C80;
  v10[3] = &unk_1000C33A8;
  v10[4] = self;
  v10[5] = &v12;
  v10[6] = a3;
  int v11 = a4;
  dispatch_sync(v7, v10);

  v8 = (void *)v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (void)setRecordProperty_sync:(void *)a3 property:(int)a4 value:(void *)a5
{
}

- (void)setRecordProperty:(void *)a3 property:(int)a4 value:(void *)a5
{
  dispatch_queue_t v9 = [(VMAccountStore *)self queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100076D80;
  v10[3] = &unk_1000C33D0;
  v10[4] = self;
  v10[5] = a3;
  int v11 = a4;
  v10[6] = a5;
  dispatch_sync(v9, v10);
}

- (unsigned)getRecordIdentifier:(void *)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v4 = [(VMAccountStore *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100076E78;
  v6[3] = &unk_1000C33F8;
  v6[4] = &v7;
  v6[5] = a3;
  dispatch_sync(v4, v6);

  LODWORD(a3) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return a3;
}

- (void)setLocalFlag:(void *)a3 flag:(unsigned int)a4
{
  uint64_t v7 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076F48;
  block[3] = &unk_1000C3420;
  block[4] = self;
  block[5] = a3;
  unsigned int v9 = a4;
  dispatch_sync(v7, block);
}

- (void)resetLocalFlag:(void *)a3 flag:(unsigned int)a4
{
  uint64_t v7 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077048;
  block[3] = &unk_1000C3420;
  block[4] = self;
  block[5] = a3;
  unsigned int v9 = a4;
  dispatch_sync(v7, block);
}

- (void)createAndAddRecord:(unsigned int)a3 date:(int)a4 token:(id)a5 sender:(id)a6 callbackNumber:(id)a7 duration:(int)a8 expirationDate:(int)a9 flags:(int)a10 receiver:(id)a11
{
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a11;
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  id v21 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077244;
  block[3] = &unk_1000C3448;
  unsigned int v34 = a3;
  int v35 = a4;
  block[4] = self;
  id v29 = v17;
  id v30 = v18;
  id v31 = v19;
  int v36 = a8;
  int v37 = a9;
  int v38 = a10;
  id v32 = v20;
  v33 = &v39;
  id v22 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  dispatch_sync(v21, block);

  uint64_t v26 = (void *)v40[3];
  _Block_object_dispose(&v39, 8);
  return v26;
}

- (void)removeRecord:(void *)a3
{
  v5 = [(VMAccountStore *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100077578;
  v6[3] = &unk_1000C1DD0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (id)getDataFiles
{
  uint64_t v3 = +[NSFileManager defaultManager];
  v4 = [(VMAccountStore *)self accountDir];
  v5 = [v4 path];
  id v14 = 0;
  id v6 = [v3 contentsOfDirectoryAtPath:v5 error:&v14];
  id v7 = v14;

  if (v7)
  {
    v8 = vm_vmd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = [(VMAccountStore *)self accountDir];
      int v10 = [v9 path];
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v16 = v10;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Can't retrieve the contents of directory %@, error %@", buf, 0x16u);
    }
  }
  int v11 = +[NSPredicate predicateWithBlock:&stru_1000C3468];
  uint64_t v12 = [v6 filteredArrayUsingPredicate:v11];

  return v12;
}

- (void)removeAllRecords
{
  uint64_t v3 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007795C;
  block[3] = &unk_1000C12C0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)copyRecordWithIdentifier:(unsigned int)a3
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v5 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077E84;
  block[3] = &unk_1000C3490;
  block[4] = self;
  void block[5] = &v10;
  unsigned int v9 = a3;
  dispatch_sync(v5, block);

  id v6 = (void *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)copyRecordWithRemoteUID:(unsigned int)a3 flagsToHave:(unsigned int)a4 flagsToNotHave:(unsigned int)a5
{
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  unsigned int v9 = [(VMAccountStore *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100077FC8;
  v12[3] = &unk_1000C33A8;
  v12[4] = self;
  v12[5] = &v16;
  unsigned int v13 = a3;
  unsigned int v14 = a4;
  unsigned int v15 = a5;
  dispatch_sync(v9, v12);

  uint64_t v10 = (void *)v17[3];
  _Block_object_dispose(&v16, 8);
  return v10;
}

- (int)copyOfAllRecordsWithFlagsInRemoteUIDRangeByStatement:(unsigned int)a3 flagsToNotHave:(unsigned int)a4 lowUid:(unsigned int)a5 highUid:(unsigned int)a6
{
  ppDb = 0;
  uint64_t v10 = [(VMAccountStore *)self dbfile];
  id v11 = [v10 path];
  int v12 = sqlite3_open((const char *)[v11 UTF8String], &ppDb);

  if (v12) {
    return 0;
  }
  unsigned int v14 = +[NSString stringWithFormat:@"SELECT ROWID, remote_uid, date, token, sender, callback_num, duration, expiration, trashed_date, flags, receiver FROM voicemail WHERE (flags & ?) = ? AND remote_uid >= ? AND remote_uid <= ? ORDER BY remote_uid"];;
  ppStmt = 0;
  unsigned int v15 = ppDb;
  id v27 = v14;
  if (sqlite3_prepare_v2(v15, (const char *)[v27 UTF8String], -1, &ppStmt, 0))
  {
    int i = 0;
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, a4 | a3);
    sqlite3_bind_int(ppStmt, 2, a3);
    sqlite3_bind_int(ppStmt, 3, a5);
    sqlite3_bind_int(ppStmt, 4, a6);
    for (int i = 0; ; ++i)
    {
      int v16 = sqlite3_step(ppStmt);
      if (v16 != 100) {
        break;
      }
      int v17 = sqlite3_column_int(ppStmt, 0);
      int v18 = sqlite3_column_int(ppStmt, 1);
      int v19 = sqlite3_column_int(ppStmt, 2);
      id v20 = sqlite3_column_text(ppStmt, 3);
      id v21 = sqlite3_column_text(ppStmt, 4);
      int v22 = sqlite3_column_int(ppStmt, 9);
      id v23 = vm_vmd_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)id v31 = v17;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = v18;
        __int16 v32 = 1024;
        int v33 = v19;
        __int16 v34 = 2080;
        int v35 = v20;
        __int16 v36 = 2080;
        int v37 = v21;
        __int16 v38 = 1024;
        int v39 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%02d|%d|%d|%s|%s|%d", buf, 0x2Eu);
      }
    }
    if (v16 != 101)
    {
      id v24 = vm_vmd_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = sqlite3_errmsg(ppDb);
        *(_DWORD *)buf = 136315138;
        *(void *)id v31 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Step failure: %s", buf, 0xCu);
      }
    }
  }
  sqlite3_finalize(ppStmt);
  sqlite3_close(ppDb);

  return i;
}

- (__CFArray)copyOfAllRecordsWithFlagsInRemoteUIDRange:(unsigned int)a3 flagsToNotHave:(unsigned int)a4 lowUid:(unsigned int)a5 highUid:(unsigned int)a6
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  id v11 = [(VMAccountStore *)self queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000783F4;
  v14[3] = &unk_1000C34B8;
  v14[4] = self;
  v14[5] = &v19;
  unsigned int v15 = a3;
  unsigned int v16 = a4;
  unsigned int v17 = a5;
  unsigned int v18 = a6;
  dispatch_sync(v11, v14);

  int v12 = (__CFArray *)v20[3];
  _Block_object_dispose(&v19, 8);
  return v12;
}

- (__CFArray)copyOfAllRecordsWithFlags:(unsigned int)a3 flagsToNotHave:(unsigned int)a4
{
  uint64_t v13 = 0;
  unsigned int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v7 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078674;
  block[3] = &unk_1000C34E0;
  block[4] = self;
  void block[5] = &v13;
  unsigned int v11 = a3;
  unsigned int v12 = a4;
  dispatch_sync(v7, block);

  v8 = (__CFArray *)v14[3];
  _Block_object_dispose(&v13, 8);
  return v8;
}

- (__CFArray)copyOfAllRemoteUIDsWithTrashState:(BOOL)a3 includeTemp:(BOOL)a4
{
  uint64_t v13 = 0;
  unsigned int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v7 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000787B8;
  block[3] = &unk_1000C3508;
  block[4] = self;
  void block[5] = &v13;
  BOOL v11 = a3;
  BOOL v12 = a4;
  dispatch_sync(v7, block);

  v8 = (__CFArray *)v14[3];
  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)copyFirstRecordWithTokenInMailbox:(__CFString *)a3 mailboxType:(int64_t)a4
{
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v7 = [(VMAccountStore *)self queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000788E8;
  v10[3] = &unk_1000C34B8;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  void v10[7] = a4;
  dispatch_sync(v7, v10);

  v8 = (void *)v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (__CFArray)copyRecordsWithTokenInMailbox:(__CFString *)a3 mailboxType:(int64_t)a4
{
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v7 = [(VMAccountStore *)self queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100078A24;
  v10[3] = &unk_1000C34B8;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  void v10[7] = a4;
  dispatch_sync(v7, v10);

  v8 = (__CFArray *)v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)copyFirstRecordWithToken:(__CFString *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v5 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078B54;
  block[3] = &unk_1000C34E0;
  block[4] = self;
  void block[5] = &v9;
  void block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (void *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (__CFArray)copyRecordsWithToken:(__CFString *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v5 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078C88;
  block[3] = &unk_1000C34E0;
  block[4] = self;
  void block[5] = &v9;
  void block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (__CFArray *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (unsigned)getUIDValidity:(__CFString *)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  v5 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078DBC;
  block[3] = &unk_1000C34E0;
  block[4] = self;
  void block[5] = &v8;
  void block[6] = a3;
  dispatch_sync(v5, block);

  LODWORD(a3) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return a3;
}

- (void)setUIDValidity:(__CFString *)a3 uidValidity:(unsigned int)a4
{
  id v7 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078E94;
  block[3] = &unk_1000C3420;
  block[4] = self;
  void block[5] = a3;
  unsigned int v9 = a4;
  dispatch_sync(v7, block);
}

- (void)save
{
  uint64_t v3 = [(VMAccountStore *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078F5C;
  block[3] = &unk_1000C12C0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (NSUUID)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSURL)accountDir
{
  return self->_accountDir;
}

- (void)setAccountDir:(id)a3
{
}

- (NSURL)dbfile
{
  return self->_dbfile;
}

- (void)setDbfile:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dbfile, 0);
  objc_storeStrong((id *)&self->_accountDir, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
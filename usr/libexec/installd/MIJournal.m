@interface MIJournal
+ (id)sharedInstance;
- (BOOL)purgeJournalEntry:(id)a3 withError:(id *)a4;
- (BOOL)writeJournalEntry:(id)a3 withError:(id *)a4;
- (MIJournal)init;
- (NSSet)journalEntryClasses;
- (NSURL)journalStorageBase;
- (id)_journalStorageURLForUniqueIdentifier:(id)a3;
- (id)journalEntryForUniqueIdentifier:(id)a3;
- (id)journaledEntriesWithError:(id *)a3;
- (void)_enumerateJournaledEntriesContinuingOnFailure:(BOOL)a3 withBlock:(id)a4;
- (void)reconcile;
@end

@implementation MIJournal

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BC60;
  block[3] = &unk_10008CC28;
  block[4] = a1;
  if (qword_1000A5FF8 != -1) {
    dispatch_once(&qword_1000A5FF8, block);
  }
  v2 = (void *)qword_1000A5FF0;

  return v2;
}

- (MIJournal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MIJournal;
  return [(MIJournal *)&v3 init];
}

- (NSSet)journalEntryClasses
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
}

- (NSURL)journalStorageBase
{
  v2 = +[MIDaemonConfiguration sharedInstance];
  objc_super v3 = [v2 journalStorageBaseURL];

  return (NSURL *)v3;
}

- (id)_journalStorageURLForUniqueIdentifier:(id)a3
{
  v4 = [a3 stringByAppendingPathExtension:@"plist"];
  v5 = [(MIJournal *)self journalStorageBase];
  v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:0];

  return v6;
}

- (BOOL)writeJournalEntry:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 shouldPersist];
  if (+[ICLFeatureFlags twoStageAppInstallEnabled])BOOL v8 = v7 == 0; {
  else
  }
    BOOL v8 = 1;
  if (v8)
  {
    id v9 = 0;
    v10 = 0;
    v11 = 0;
    BOOL v12 = 1;
  }
  else
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
    {
      id v21 = v6;
      MOLogWrite();
    }
    id v24 = 0;
    v10 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v24, v21);
    id v13 = v24;
    v14 = v13;
    if (!v10)
    {
      v11 = 0;
      id v9 = v13;
      if (a4)
      {
LABEL_18:
        id v9 = v9;
        BOOL v12 = 0;
        *a4 = v9;
        goto LABEL_21;
      }
LABEL_20:
      BOOL v12 = 0;
      goto LABEL_21;
    }
    v15 = [v6 uniqueIdentifier];
    v11 = [(MIJournal *)self _journalStorageURLForUniqueIdentifier:v15];

    v16 = +[MIDaemonConfiguration sharedInstance];
    id v17 = [v16 uid];
    v18 = +[MIDaemonConfiguration sharedInstance];
    id v23 = v14;
    BOOL v12 = 1;
    unsigned __int8 v19 = [v10 MI_writeAtomicallyToURL:v11 withMode:420 owner:v17 group:[v18 gid] protectionClass:4 withBarrier:1 error:&v23];
    id v9 = v23;

    if ((v19 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100058D5C((uint64_t)v6, v11);
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        v22 = [v11 path];
        MOLogWrite();
      }
      if (a4) {
        goto LABEL_18;
      }
      goto LABEL_20;
    }
  }
LABEL_21:

  return v12;
}

- (BOOL)purgeJournalEntry:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!+[ICLFeatureFlags twoStageAppInstallEnabled])
  {
    id v13 = 0;
    v10 = 0;
LABEL_19:
    BOOL v14 = 1;
    goto LABEL_20;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    id v16 = v6;
    MOLogWrite();
  }
  id v20 = 0;
  unsigned __int8 v7 = [v6 cleanUpJournaledDataOnDiskWithError:&v20, v16];
  id v8 = v20;
  if ((v7 & 1) == 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v17 = v8;
      MOLogWrite();
    }

    id v8 = 0;
  }
  id v9 = [v6 uniqueIdentifier:v17];
  v10 = [(MIJournal *)self _journalStorageURLForUniqueIdentifier:v9];

  v11 = +[MIFileManager defaultManager];
  id v19 = v8;
  unsigned __int8 v12 = [v11 removeItemAtURL:v10 error:&v19];
  id v13 = v19;

  if (v12) {
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_100058E10((uint64_t)v6, v10);
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    v18 = [v10 path];
    MOLogWrite();
  }
  if (a4)
  {
    id v13 = v13;
    BOOL v14 = 0;
    *a4 = v13;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_20:

  return v14;
}

- (void)_enumerateJournaledEntriesContinuingOnFailure:(BOOL)a3 withBlock:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = [(MIJournal *)self journalEntryClasses];
  id v8 = +[MIFileManager defaultManager];
  id v9 = [(MIJournal *)self journalStorageBase];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002C368;
  v13[3] = &unk_10008D548;
  BOOL v16 = a3;
  id v14 = v7;
  id v15 = v6;
  id v10 = v7;
  id v11 = v6;
  id v12 = [v8 enumerateURLsForItemsInDirectoryAtURL:v9 ignoreSymlinks:1 withBlock:v13];
}

- (void)reconcile
{
  if (_os_feature_enabled_impl())
  {
    [(MIJournal *)self _enumerateJournaledEntriesContinuingOnFailure:1 withBlock:&stru_10008D588];
  }
  else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    MOLogWrite();
  }
}

- (id)journalEntryForUniqueIdentifier:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10002C8A0;
  id v14 = sub_10002C8B0;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C8B8;
  v7[3] = &unk_10008D5B0;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  [(MIJournal *)self _enumerateJournaledEntriesContinuingOnFailure:1 withBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (id)journaledEntriesWithError:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_10002C8A0;
  v18 = sub_10002C8B0;
  id v19 = 0;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_10002CA98;
  id v11 = &unk_10008D5B0;
  id v5 = (id)objc_opt_new();
  id v12 = v5;
  id v13 = &v14;
  [(MIJournal *)self _enumerateJournaledEntriesContinuingOnFailure:0 withBlock:&v8];
  if (v15[5])
  {
    id v6 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    id v6 = [v5 copy:v8, v9, v10, v11];
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v6) {
    *a3 = (id) v15[5];
  }
LABEL_7:

  _Block_object_dispose(&v14, 8);

  return v6;
}

@end
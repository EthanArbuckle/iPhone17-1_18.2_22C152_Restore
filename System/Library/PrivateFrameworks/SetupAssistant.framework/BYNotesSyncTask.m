@interface BYNotesSyncTask
- (BYNotesSyncTask)selfReference;
- (ICCloudKitSyncer)notesSyncer;
- (ICCloudKitSyncerDelegate)delegate;
- (OS_os_transaction)transaction;
- (id)initAndStartSyncWithDelegate:(id)a3;
- (void)cancel;
- (void)cloudKitSyncer:(id)a3 didFinishWithError:(id)a4;
- (void)cloudKitSyncer:(id)a3 didUpdateProgress:(double)a4;
- (void)setDelegate:(id)a3;
- (void)setNotesSyncer:(id)a3;
- (void)setSelfReference:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation BYNotesSyncTask

- (id)initAndStartSyncWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BYNotesSyncTask;
  v5 = [(BYNotesSyncTask *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(BYNotesSyncTask *)v5 setDelegate:v4];
    v7 = (void *)os_transaction_create();
    [(BYNotesSyncTask *)v6 setTransaction:v7];

    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v8 = (void *)qword_100024CD8;
    uint64_t v19 = qword_100024CD8;
    if (!qword_100024CD8)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100002CF4;
      v15[3] = &unk_10001C560;
      v15[4] = &v16;
      sub_100002CF4((uint64_t)v15);
      v8 = (void *)v17[3];
    }
    v9 = v8;
    _Block_object_dispose(&v16, 8);
    id v10 = objc_alloc_init(v9);
    [(BYNotesSyncTask *)v6 setNotesSyncer:v10];

    v11 = [(BYNotesSyncTask *)v6 notesSyncer];
    [v11 setDelegate:v6];

    v12 = [(BYNotesSyncTask *)v6 notesSyncer];
    [v12 saveUnsyncedObjects];

    [(BYNotesSyncTask *)v6 setSelfReference:v6];
  }

  return v6;
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  [(BYNotesSyncTask *)obj setDelegate:0];
  objc_sync_exit(obj);
}

- (void)cloudKitSyncer:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v20 = _BYLoggingFacility();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_1000104C8(v20);
    }
    goto LABEL_15;
  }
  v8 = v7;
  v9 = [v7 domain];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  id v10 = (id *)qword_100024CE8;
  uint64_t v30 = qword_100024CE8;
  if (!qword_100024CE8)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v32 = sub_100002EC0;
    v33 = &unk_10001C560;
    v34 = &v27;
    v11 = (void *)sub_100002D4C();
    v12 = dlsym(v11, "ICCloudContextErrorDomain");
    *(void *)(v34[1] + 24) = v12;
    qword_100024CE8 = *(void *)(v34[1] + 24);
    id v10 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v10) {
    goto LABEL_25;
  }
  id v13 = *v10;
  if (![v9 isEqualToString:v13])
  {

    goto LABEL_17;
  }
  id v14 = [v8 code];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v15 = (id *)qword_100024CF0;
  uint64_t v30 = qword_100024CF0;
  if (!qword_100024CF0)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v32 = sub_100002F10;
    v33 = &unk_10001C560;
    v34 = &v27;
    uint64_t v16 = (void *)sub_100002D4C();
    v17 = dlsym(v16, "ICCloudContextErrorSyncingDisabled");
    *(void *)(v34[1] + 24) = v17;
    qword_100024CF0 = *(void *)(v34[1] + 24);
    v15 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v15)
  {
LABEL_25:
    sub_10001050C();
    __break(1u);
  }
  BOOL v18 = v14 == *v15;

  if (v18)
  {
    uint64_t v19 = _BYLoggingFacility();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Notes syncing disabled; treating as success",
        (uint8_t *)&buf,
        2u);
    }

    v20 = v8;
LABEL_15:
    v8 = 0;
    goto LABEL_22;
  }
LABEL_17:
  v20 = _BYLoggingFacility();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    char v21 = _BYIsInternalInstall();
    v22 = v8;
    if ((v21 & 1) == 0)
    {
      id v13 = [v8 domain];
      id v23 = [v8 code];
      v22 = +[NSString stringWithFormat:@"<Error domain: %@, code %ld>", v13, v23, v27];
    }
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Notes sync task failed: %{public}@", (uint8_t *)&buf, 0xCu);
    if ((v21 & 1) == 0)
    {
    }
  }
LABEL_22:

  v24 = self;
  objc_sync_enter(v24);
  v25 = [(BYNotesSyncTask *)v24 delegate];
  v26 = v25;
  if (v25) {
    [v25 cloudKitSyncer:v6 didFinishWithError:v8];
  }

  objc_sync_exit(v24);
  [(BYNotesSyncTask *)v24 setDelegate:0];
  [(BYNotesSyncTask *)v24 setTransaction:0];
  [(BYNotesSyncTask *)v24 setSelfReference:0];
}

- (void)cloudKitSyncer:(id)a3 didUpdateProgress:(double)a4
{
  id v9 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  v7 = [(BYNotesSyncTask *)v6 delegate];
  v8 = v7;
  if (v7) {
    [v7 cloudKitSyncer:v9 didUpdateProgress:a4];
  }

  objc_sync_exit(v6);
}

- (ICCloudKitSyncer)notesSyncer
{
  return (ICCloudKitSyncer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNotesSyncer:(id)a3
{
}

- (ICCloudKitSyncerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICCloudKitSyncerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTransaction:(id)a3
{
}

- (BYNotesSyncTask)selfReference
{
  return (BYNotesSyncTask *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSelfReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfReference, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notesSyncer, 0);
}

@end
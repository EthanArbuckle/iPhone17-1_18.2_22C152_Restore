@interface mountTable
- (id)list:(BOOL)a3;
- (id)lookup:(unsigned int)a3;
- (id)lookupByPath:(id)a3;
- (id)lookupName:(id)a3 provider:(id)a4;
- (id)preflightMountWithName:(id)a3 displayName:(id)a4 storageName:(id)a5 provider:(id)a6 path:(id)a7 error:(id *)a8;
- (mountTable)init;
- (unsigned)nextIndex;
- (void)add:(id)a3;
- (void)performExclusive:(id)a3;
- (void)performShared:(id)a3;
- (void)remove:(id)a3;
- (void)resetIndex;
- (void)tearDownDaemon:(BOOL)a3 withPath:(id)a4;
@end

@implementation mountTable

- (mountTable)init
{
  v11.receiver = self;
  v11.super_class = (Class)mountTable;
  v2 = [(mountTable *)&v11 init];
  v3 = v2;
  if (!v2)
  {
LABEL_6:
    v5 = v3;
    goto LABEL_8;
  }
  int v4 = pthread_rwlock_init(&v2->opLock, 0);
  v5 = 0;
  *__error() = v4;
  if (!v4)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mntTable = v3->mntTable;
    v3->mntTable = v6;

    uint64_t v8 = os_transaction_create();
    our_transaction = v3->_our_transaction;
    v3->_our_transaction = (OS_os_transaction *)v8;

    if (!v3->mntTable || !v3->_our_transaction)
    {
      v5 = 0;
      goto LABEL_8;
    }
    atomic_store(0, &v3->mountSelector);
    goto LABEL_6;
  }
LABEL_8:

  return v5;
}

- (void)tearDownDaemon:(BOOL)a3 withPath:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (unmount((const char *)[v6 fileSystemRepresentation], 0x80000))
  {
    v7 = livefs_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100041848();
    }
  }
  else if (v4)
  {
    our_transaction = self->_our_transaction;
    self->_our_transaction = 0;
  }
}

- (void)performExclusive:(id)a3
{
  p_opLock = &self->opLock;
  BOOL v4 = (void (**)(void))a3;
  pthread_rwlock_wrlock(p_opLock);
  v4[2](v4);

  pthread_rwlock_unlock(p_opLock);
}

- (void)performShared:(id)a3
{
  p_opLock = &self->opLock;
  BOOL v4 = (void (**)(void))a3;
  pthread_rwlock_rdlock(p_opLock);
  v4[2](v4);

  pthread_rwlock_unlock(p_opLock);
}

- (id)lookup:(unsigned int)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10002E4C4;
  v19 = sub_10002E4D4;
  id v20 = 0;
  +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100033600;
  v12[3] = &unk_100059540;
  v14 = &v15;
  v12[4] = self;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v4;
  [(mountTable *)self performShared:v12];
  v5 = (void *)v16[5];
  if (!v5)
  {
    id v6 = livefs_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "retrying lookup", v11, 2u);
    }

    uint64_t v7 = [(NSMutableDictionary *)self->mntTable objectForKey:v4];
    uint64_t v8 = (void *)v16[5];
    v16[5] = v7;

    v5 = (void *)v16[5];
  }
  id v9 = v5;

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)lookupByPath:(id)a3
{
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10002E4C4;
  v14 = sub_10002E4D4;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100033778;
  v6[3] = &unk_100059D70;
  uint64_t v7 = self;
  id v9 = &v10;
  id v3 = a3;
  id v8 = v3;
  [(mountTable *)v7 performShared:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

- (id)lookupName:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10002E4C4;
  id v20 = sub_10002E4D4;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003397C;
  v12[3] = &unk_100059D98;
  v12[4] = self;
  id v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(mountTable *)self performShared:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)preflightMountWithName:(id)a3 displayName:(id)a4 storageName:(id)a5 provider:(id)a6 path:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_10002E4C4;
  v44 = sub_10002E4D4;
  id v45 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100033D64;
  v29[3] = &unk_100059E10;
  v29[4] = self;
  id v19 = v17;
  id v30 = v19;
  id v20 = v14;
  id v31 = v20;
  v34 = &v40;
  id v21 = v16;
  id v32 = v21;
  id v22 = v18;
  id v33 = v22;
  v35 = &v36;
  [(mountTable *)self performShared:v29];
  if (*((unsigned char *)v37 + 24))
  {
    if (a8)
    {
      *a8 = +[NSError errorWithDomain:NSCocoaErrorDomain code:516 userInfo:0];
    }
    v23 = (void *)v41[5];
    v41[5] = 0;
  }
  v24 = livefs_std_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = v41[5];
    if (a8) {
      id v28 = *a8;
    }
    else {
      id v28 = 0;
    }
    *(_DWORD *)buf = 138412802;
    id v47 = v20;
    __int16 v48 = 2112;
    uint64_t v49 = v27;
    __int16 v50 = 2112;
    id v51 = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "preflightMountWithName:volume:%@:rv:%@:error:%@", buf, 0x20u);
  }

  id v25 = (id)v41[5];
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v25;
}

- (void)add:(id)a3
{
  id v4 = a3;
  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 midx]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100034188;
  v7[3] = &unk_100059590;
  v7[4] = self;
  id v8 = v4;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v9;
  id v6 = v4;
  [(mountTable *)self performExclusive:v7];
}

- (void)remove:(id)a3
{
  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [a3 midx]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003424C;
  v5[3] = &unk_100059518;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  [(mountTable *)self performExclusive:v5];
}

- (id)list:(BOOL)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10002E4C4;
  objc_super v11 = sub_10002E4D4;
  id v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003435C;
  v5[3] = &unk_100059E38;
  BOOL v6 = a3;
  v5[4] = self;
  void v5[5] = &v7;
  [(mountTable *)self performShared:v5];
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (unsigned)nextIndex
{
  return atomic_fetch_add((atomic_uint *volatile)&self->mountSelector, 1u);
}

- (void)resetIndex
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000347A4;
  v2[3] = &unk_100058D88;
  v2[4] = self;
  [(mountTable *)self performExclusive:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_our_transaction, 0);

  objc_storeStrong((id *)&self->mntTable, 0);
}

@end
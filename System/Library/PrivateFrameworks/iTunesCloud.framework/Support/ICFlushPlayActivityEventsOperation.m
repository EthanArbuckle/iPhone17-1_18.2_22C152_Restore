@interface ICFlushPlayActivityEventsOperation
- (ICFlushPlayActivityEventsOperation)init;
- (ICFlushPlayActivityEventsOperation)initWithPlayActivityTable:(id)a3;
- (void)execute;
@end

@implementation ICFlushPlayActivityEventsOperation

- (void).cxx_destruct
{
}

- (void)execute
{
  if ([(ICFlushPlayActivityEventsOperation *)self isCancelled])
  {
    [(ICFlushPlayActivityEventsOperation *)self finish];
  }
  else
  {
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_10005E028;
    v35[4] = sub_10005E038;
    id v36 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    char v34 = 0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10005E040;
    v28[3] = &unk_1001BAF40;
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICFlushPlayActivityEventsOperation.serialQueue", 0);
    v29 = v3;
    v30 = self;
    v31 = v33;
    v32 = v35;
    v4 = objc_retainBlock(v28);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = sub_10005E028;
    v26 = sub_10005E038;
    id v27 = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_10005E028;
    v20[4] = sub_10005E038;
    id v21 = 0;
    v5 = self->_table;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10005E1CC;
    v16[3] = &unk_1001BCDD8;
    v6 = v5;
    v17 = v6;
    v18 = &v22;
    v19 = v20;
    [(ICPlayActivityTable *)v6 performTransactionWithBlock:v16];
    id v7 = [(id)v23[5] count];
    if (v7)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v38 = 0x2020000000;
      id v39 = v7;
      v8 = (void *)v23[5];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10005E244;
      v10[3] = &unk_1001BB058;
      v11 = v6;
      v12 = v3;
      p_long long buf = &buf;
      v13 = self;
      v14 = v4;
      [v8 enumerateObjectsUsingBlock:v10];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v9 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unexpected empty store account IDs, finishing.", (uint8_t *)&buf, 0xCu);
      }

      ((void (*)(void *, void, uint64_t, uint64_t))v4[2])(v4, 0, 1, 1);
    }

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v35, 8);
  }
}

- (ICFlushPlayActivityEventsOperation)initWithPlayActivityTable:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"ICFlushPlayActivityEventsOperation.m" lineNumber:29 description:@"initWithPlayActivityController called with nil playActivityTable"];
  }
  v11.receiver = self;
  v11.super_class = (Class)ICFlushPlayActivityEventsOperation;
  id v7 = [(ICFlushPlayActivityEventsOperation *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_table, a3);
  }

  return v8;
}

- (ICFlushPlayActivityEventsOperation)init
{
  +[NSException raise:NSInvalidArgumentException format:@"-init is not supported, use initWithPlayActivityTable"];
  v4.receiver = self;
  v4.super_class = (Class)ICFlushPlayActivityEventsOperation;
  return [(ICFlushPlayActivityEventsOperation *)&v4 init];
}

@end
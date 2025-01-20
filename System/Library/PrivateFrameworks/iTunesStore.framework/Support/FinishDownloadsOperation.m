@interface FinishDownloadsOperation
- (FinishDownloadsOperation)initWithFinishedDownloadPredicate:(id)a3;
- (SSSQLitePredicate)finishedDownloadPredicate;
- (void)dealloc;
- (void)run;
@end

@implementation FinishDownloadsOperation

- (FinishDownloadsOperation)initWithFinishedDownloadPredicate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FinishDownloadsOperation;
  v4 = [(FinishDownloadsOperation *)&v6 init];
  if (v4) {
    v4->_predicate = (SSSQLitePredicate *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FinishDownloadsOperation;
  [(FinishDownloadsOperation *)&v3 dealloc];
}

- (SSSQLitePredicate)finishedDownloadPredicate
{
  v2 = self->_predicate;

  return v2;
}

- (void)run
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = +[DownloadsDatabase downloadsDatabase];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000B4FA8;
  v21[3] = &unk_1003A5900;
  v21[4] = self;
  v21[5] = v4;
  v19 = v4;
  v21[6] = v3;
  [v5 readUsingTransactionBlock:v21];
  uint64_t v6 = (uint64_t)[v3 count];
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
    int v10 = v9;
  }
  else {
    int v10 = v9 & 2;
  }
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    *(_DWORD *)v22 = 138412546;
    *(void *)&v22[4] = v11;
    *(_WORD *)&v22[12] = 2048;
    *(void *)&v22[14] = v6;
    LODWORD(v18) = 22;
    v17 = (NSString *)v22;
    uint64_t v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v22, v18);
      free(v13);
      v17 = v14;
      SSFileLog();
    }
  }
  if (v6 < 1)
  {
    BOOL v16 = 1;
  }
  else
  {
    uint64_t v15 = 0;
    LOBYTE(v16) = 1;
    do
    {
      *(void *)v22 = 0;
      *(void *)&v22[8] = v22;
      *(void *)&v22[16] = 0x2020000000;
      unsigned __int8 v23 = 0;
      unsigned __int8 v23 = -[FinishDownloadsOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", objc_msgSend(v3, "objectAtIndex:", v15, v17), 0);
      if (*(unsigned char *)(*(void *)&v22[8] + 24))
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000B5294;
        v20[3] = &unk_1003A5928;
        v20[5] = v22;
        v20[6] = v15;
        v20[4] = v19;
        [v5 modifyUsingTransactionBlock:v20];
      }
      BOOL v16 = v16 && *(unsigned char *)(*(void *)&v22[8] + 24) != 0;
      _Block_object_dispose(v22, 8);
      ++v15;
    }
    while (v6 != v15);
  }
  -[FinishDownloadsOperation setSuccess:](self, "setSuccess:", v16, v17);
}

@end
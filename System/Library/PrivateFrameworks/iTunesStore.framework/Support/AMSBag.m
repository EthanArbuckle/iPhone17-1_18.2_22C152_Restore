@interface AMSBag
- (BOOL)asd_iTunesStoreMetricsIsEnabled;
@end

@implementation AMSBag

- (BOOL)asd_iTunesStoreMetricsIsEnabled
{
  v2 = [(AMSBag *)self BOOLForKey:@"itunesstore-metrics-enabled"];
  id v14 = 0;
  v3 = [v2 valueWithError:&v14];
  id v4 = v14;

  if (!v3)
  {
    if (!v4) {
      goto LABEL_18;
    }
    v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    v9 = [v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      int v10 = v8;
    }
    else {
      int v10 = v8 & 2;
    }
    if (v10)
    {
      int v15 = 138412290;
      id v16 = v4;
      LODWORD(v13) = 12;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_17:

        goto LABEL_18;
      }
      v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v15, v13);
      free(v11);
      SSFileLog();
    }

    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_18:
    unsigned __int8 v5 = 0;
    goto LABEL_19;
  }
  unsigned __int8 v5 = [v3 BOOLValue];
LABEL_19:

  return v5;
}

@end
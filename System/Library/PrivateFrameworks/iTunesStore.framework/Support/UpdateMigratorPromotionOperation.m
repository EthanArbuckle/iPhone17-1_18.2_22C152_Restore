@interface UpdateMigratorPromotionOperation
- (UpdateMigratorPromotionOperation)initWithBundleIdentifiers:(id)a3 options:(id)a4;
- (void)performMigration;
@end

@implementation UpdateMigratorPromotionOperation

- (UpdateMigratorPromotionOperation)initWithBundleIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UpdateMigratorPromotionOperation;
  v8 = [(UpdateMigratorPromotionOperation *)&v14 init];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    bundleIDs = v8->_bundleIDs;
    v8->_bundleIDs = v9;

    v11 = (NSDictionary *)[v7 copy];
    options = v8->_options;
    v8->_options = v11;
  }
  return v8;
}

- (void)performMigration
{
  bundleIDs = self->_bundleIDs;
  if (bundleIDs && [(NSArray *)bundleIDs count])
  {
    v4 = +[SSLogConfig sharedDaemonConfig];
    if (!v4)
    {
      v4 = +[SSLogConfig sharedConfig];
    }
    unsigned int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    id v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v6 &= 2u;
    }
    if (!v6) {
      goto LABEL_23;
    }
    v8 = objc_opt_class();
    v9 = self->_bundleIDs;
    id v10 = v8;
    [(NSArray *)v9 componentsJoinedByString:@", "];
    int v21 = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 22;
    v11 = (void *)_os_log_send_and_compose_impl();
  }
  else
  {
    v4 = +[SSLogConfig sharedDaemonConfig];
    if (!v4)
    {
      v4 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    id v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v13 &= 2u;
    }
    if (!v13) {
      goto LABEL_23;
    }
    int v21 = 138412290;
    id v22 = (id)objc_opt_class();
    id v14 = v22;
    LODWORD(v18) = 12;
    v11 = (void *)_os_log_send_and_compose_impl();
  }
  if (v11)
  {
    id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v21, v18);
    free(v11);
    SSFileLog();
LABEL_23:
  }
  v15 = +[NetworkRequestQueue sharedNetworkRequestQueue];
  v16 = [[RestoreDemotedApplicationsOperation alloc] initWithBundleIdentifiers:self->_bundleIDs options:self->_options];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000ACAEC;
  v19[3] = &unk_1003A3140;
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  v17 = v20;
  [(RestoreDemotedApplicationsOperation *)v16 setCompletionBlock:v19];
  [v15 addOperation:v16];
  dispatch_semaphore_wait(v17, 0x6FC23AC00uLL);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end
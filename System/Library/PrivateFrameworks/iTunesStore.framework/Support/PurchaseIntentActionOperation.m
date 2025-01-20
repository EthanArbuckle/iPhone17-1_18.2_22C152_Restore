@interface PurchaseIntentActionOperation
- (PurchaseIntentActionOperation)initWithRequest:(id)a3;
- (void)run;
@end

@implementation PurchaseIntentActionOperation

- (PurchaseIntentActionOperation)initWithRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PurchaseIntentActionOperation;
  v5 = [(PurchaseIntentActionOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 appBundleId];
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v6;

    v5->_action = (unint64_t)[v4 action];
  }

  return v5;
}

- (void)run
{
  unint64_t action = self->_action;
  if (action == 1)
  {
    id v7 = +[PurchaseActionsManager sharedInstance];
    [v7 deletePurchaseIntentsForApp:self->_appBundleId];
    goto LABEL_17;
  }
  if (action == 2)
  {
    id v4 = +[PurchaseActionsManager sharedInstance];
    [v4 resetTimestampsForApp:self->_appBundleId];

    v5 = +[SpringBoardUtility sharedInstance];
    appBundleId = self->_appBundleId;
    id v18 = 0;
    [v5 launchApplicationWithIdentifier:appBundleId options:0 error:&v18];
    id v7 = v18;

    if (!v7)
    {
LABEL_17:

      goto LABEL_18;
    }
    v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8)
    {
      v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      v12 = objc_opt_class();
      v13 = self->_appBundleId;
      int v19 = 138543874;
      v20 = v12;
      __int16 v21 = 2114;
      v22 = v13;
      __int16 v23 = 2114;
      id v24 = v7;
      id v14 = v12;
      LODWORD(v17) = 32;
      v16 = &v19;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_17;
      }
      v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v19, v17);
      free(v15);
      v16 = (int *)v11;
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_18:
  -[PurchaseIntentActionOperation setSuccess:](self, "setSuccess:", 1, v16);
  [(PurchaseIntentActionOperation *)self setError:0];
}

- (void).cxx_destruct
{
}

@end
@interface FRAccountActionQueueBasedDataActionProvider
- (BOOL)destructiveHasBeenConsumed;
- (BOOL)nonDestructiveHaveBeenConsumed;
- (FCAccountActionQueue)accountActionQueue;
- (FRAccountActionQueueBasedDataActionProvider)init;
- (void)_consumeActionsUpToActionPassingTest:(id)a3 withBlock:(id)a4;
- (void)consumeActionsUpToDestructiveActionSyncWithBlock:(id)a3;
- (void)consumeNonDestructiveActionsSyncWithBlock:(id)a3;
- (void)dealloc;
- (void)setAccountActionQueue:(id)a3;
- (void)setDestructiveHasBeenConsumed:(BOOL)a3;
- (void)setNonDestructiveHaveBeenConsumed:(BOOL)a3;
@end

@implementation FRAccountActionQueueBasedDataActionProvider

- (void)consumeNonDestructiveActionsSyncWithBlock:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100078FC8();
  }
  if (![(FRAccountActionQueueBasedDataActionProvider *)self destructiveHasBeenConsumed]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100078F0C();
  }
  if ([(FRAccountActionQueueBasedDataActionProvider *)self nonDestructiveHaveBeenConsumed]&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100078E50();
  }
  [(FRAccountActionQueueBasedDataActionProvider *)self _consumeActionsUpToActionPassingTest:&stru_1000C9868 withBlock:v4];
  [(FRAccountActionQueueBasedDataActionProvider *)self setNonDestructiveHaveBeenConsumed:1];
}

- (void)consumeActionsUpToDestructiveActionSyncWithBlock:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100078D88();
  }
  if ([(FRAccountActionQueueBasedDataActionProvider *)self destructiveHasBeenConsumed]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100078CCC();
  }
  if ([(FRAccountActionQueueBasedDataActionProvider *)self nonDestructiveHaveBeenConsumed]&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100078C10();
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018B70;
  v6[3] = &unk_1000C9848;
  id v7 = v4;
  id v5 = v4;
  [(FRAccountActionQueueBasedDataActionProvider *)self _consumeActionsUpToActionPassingTest:&stru_1000C9820 withBlock:v6];
  [(FRAccountActionQueueBasedDataActionProvider *)self setDestructiveHasBeenConsumed:1];
}

- (FRAccountActionQueueBasedDataActionProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)FRAccountActionQueueBasedDataActionProvider;
  v2 = [(FRAccountActionQueueBasedDataActionProvider *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)FCAccountActionQueue);
    id v4 = FCURLForAccountActionQueue();
    id v5 = (FCAccountActionQueue *)[v3 initWithFileURL:v4];
    accountActionQueue = v2->_accountActionQueue;
    v2->_accountActionQueue = v5;
  }
  return v2;
}

- (void)_consumeActionsUpToActionPassingTest:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100079214();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007914C();
  }
LABEL_6:
  objc_super v8 = [(FRAccountActionQueueBasedDataActionProvider *)self accountActionQueue];
  v9 = [v8 peekAtActionTypes];
  v10 = +[NSArray arrayWithArray:v9];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005A17C;
  v21[3] = &unk_1000C9890;
  id v22 = v6;
  id v11 = v6;
  v12 = (char *)[v10 indexOfObjectWithOptions:2 passingTest:v21];
  if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    v13 = 0;
  }
  else {
    v13 = v12 + 1;
  }
  v14 = [v10 fc_subarrayUpToCountInclusive:v13];
  v15 = FRPrivateDataActionsForDataclassActionTypes(v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100018BDC;
  v18[3] = &unk_1000C98B8;
  id v19 = v8;
  v20 = v13;
  v16 = (void (*)(void *, void *, void *))v7[2];
  id v17 = v8;
  v16(v7, v15, v18);
}

- (FCAccountActionQueue)accountActionQueue
{
  return self->_accountActionQueue;
}

- (void)setNonDestructiveHaveBeenConsumed:(BOOL)a3
{
  self->_nonDestructiveHaveBeenConsumed = a3;
}

- (void)setDestructiveHasBeenConsumed:(BOOL)a3
{
  self->_destructiveHasBeenConsumed = a3;
}

- (BOOL)nonDestructiveHaveBeenConsumed
{
  return self->_nonDestructiveHaveBeenConsumed;
}

- (BOOL)destructiveHasBeenConsumed
{
  return self->_destructiveHasBeenConsumed;
}

- (void)dealloc
{
  if ((![(FRAccountActionQueueBasedDataActionProvider *)self destructiveHasBeenConsumed]
     || ![(FRAccountActionQueueBasedDataActionProvider *)self nonDestructiveHaveBeenConsumed])&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100079090();
  }
  v3.receiver = self;
  v3.super_class = (Class)FRAccountActionQueueBasedDataActionProvider;
  [(FRAccountActionQueueBasedDataActionProvider *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

- (void)setAccountActionQueue:(id)a3
{
}

@end
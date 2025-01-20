@interface PDSharingStatefulProvisioningManager
- (BOOL)_isPassProvisioningComplete:(id)a3;
- (PDSharingStatefulProvisioningManager)init;
- (PDSharingStatefulProvisioningManager)initWithQueue:(id)a3 replyQueue:(id)a4 databaseManager:(id)a5 delegate:(id)a6;
- (id)operations;
- (id)pendingShares;
- (void)_enumerateOperations:(id)a3;
- (void)_operationDidTimeout:(id)a3;
- (void)_recalculateOperations;
- (void)addOperation:(id)a3;
- (void)channelEndpointWasTerminatedRemotely:(id)a3;
- (void)didReceiverActivationCodeFailureForShare:(id)a3 attemptsRemaining:(unint64_t)a4 transportIdentifier:(id)a5;
- (void)passAddedOrUpdated:(id)a3;
- (void)userDidEnterActivationCodeForShare:(id)a3 activationCode:(id)a4;
- (void)userDidTerminatePendingShareActivationForShare:(id)a3;
@end

@implementation PDSharingStatefulProvisioningManager

- (PDSharingStatefulProvisioningManager)init
{
  return 0;
}

- (PDSharingStatefulProvisioningManager)initWithQueue:(id)a3 replyQueue:(id)a4 databaseManager:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PDSharingStatefulProvisioningManager;
  v15 = [(PDSharingStatefulProvisioningManager *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_replyQueue, a4);
    objc_storeStrong((id *)&v16->_databaseManager, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    operations = v16->_operations;
    v16->_operations = v17;
  }
  return v16;
}

- (id)operations
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100026BBC;
  v6[3] = &unk_10072E0B8;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v7;
  [(PDSharingStatefulProvisioningManager *)self _enumerateOperations:v6];
  id v4 = [v3 copy];

  return v4;
}

- (id)pendingShares
{
  v2 = [(PDDatabaseManager *)self->_databaseManager passSharesWithNoPass];
  id v3 = objc_msgSend(v2, "pk_objectsPassingTest:", &stru_10072E0F8);

  return v3;
}

- (void)didReceiverActivationCodeFailureForShare:(id)a3 attemptsRemaining:(unint64_t)a4 transportIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100026D5C;
  v13[3] = &unk_10072E170;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)passAddedOrUpdated:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027258;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_operationDidTimeout:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_operations indexOfObjectIdenticalTo:v4];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v5;
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 shareIdentifier];
      id v9 = [v4 transportIdentifier];
      v10 = PKSharingLoggableMailboxAddress();
      int v14 = 138412546;
      v15 = v8;
      __int16 v16 = 2112;
      unint64_t v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "StatefulProvisioningManager: Operation timed out for share: '%@' transportIdentifier: '%@'", (uint8_t *)&v14, 0x16u);
    }
    [(NSMutableArray *)self->_operations removeObjectAtIndex:v6];
    id v11 = [v4 completion];
    id v12 = +[NSError pkSharingError:4];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v12);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained provisioningOperationsDidUpdate];
  }
}

- (void)userDidTerminatePendingShareActivationForShare:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000278D8;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)userDidEnterActivationCodeForShare:(id)a3 activationCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027CB8;
  block[3] = &unk_10072E238;
  id v12 = v7;
  id v13 = v6;
  int v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)channelEndpointWasTerminatedRemotely:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027EE4;
  v7[3] = &unk_10072E198;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000282CC;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_enumerateOperations:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  [(PDSharingStatefulProvisioningManager *)self _recalculateOperations];
  id v5 = (char *)[(NSMutableArray *)self->_operations count];
  if (v5)
  {
    id v6 = v5;
    for (unint64_t i = 0; i < (unint64_t)v6; ++i)
    {
      id v8 = [(NSMutableArray *)self->_operations objectAtIndexedSubscript:i];
      char v10 = 0;
      v4[2](v4, v8, &v10);
      if (v10)
      {
        [(NSMutableArray *)self->_operations removeObjectAtIndex:i--];
        --v6;
      }
    }
  }
}

- (void)_recalculateOperations
{
  v25 = [(NSMutableArray *)self->_operations pk_objectsPassingTest:&stru_10072E2C8];
  id v3 = objc_msgSend(v25, "pk_arrayByApplyingBlock:", &stru_10072E308);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v24 = self;
  id v5 = [(PDSharingStatefulProvisioningManager *)self pendingShares];
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v11 = [v10 credentialShares];
        id v12 = [v11 firstObject];
        id v13 = [v12 channelTransportIdentifier];

        if (v13)
        {
          int v14 = [v10 identifier];
          unsigned __int8 v15 = [v3 containsObject:v14];

          if ((v15 & 1) == 0)
          {
            __int16 v16 = objc_alloc_init(PDSharingStatefulProvisioningOperation);
            unint64_t v17 = [v10 identifier];
            [(PDSharingStatefulProvisioningOperation *)v16 setShareIdentifier:v17];

            [(PDSharingStatefulProvisioningOperation *)v16 setTransportIdentifier:v13];
            [(PDSharingStatefulProvisioningOperation *)v16 setCompletion:&stru_10072E348];
            -[PDSharingStatefulProvisioningOperation setIsWaitingOnUserAction:](v16, "setIsWaitingOnUserAction:", [v10 status] == (id)5);
            v18 = [v10 activationOptions];
            [(PDSharingStatefulProvisioningOperation *)v16 setRequiresSenderActivationVerification:v18 != 0];

            v19 = [v10 activationOptions];
            objc_super v20 = [v19 activationCode];

            [(PDSharingStatefulProvisioningOperation *)v16 setIsForegroundOperation:v20 == 0];
            [v4 addObject:v16];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  v21 = [v25 arrayByAddingObjectsFromArray:v4];
  v22 = (NSMutableArray *)[v21 mutableCopy];
  operations = v24->_operations;
  v24->_operations = v22;
}

- (BOOL)_isPassProvisioningComplete:(id)a3
{
  id v3 = a3;
  if ([v3 isCarKeyPass]) {
    BOOL v4 = [v3 contactlessActivationState] == 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end
@interface DaemonProtocolDataProvider
- (BOOL)processDictionary:(id)a3 error:(id *)a4;
- (id)willBeginProcessingDictionaryHandler;
- (void)_presentDialog:(id)a3;
- (void)dealloc;
- (void)setWillBeginProcessingDictionaryHandler:(id)a3;
@end

@implementation DaemonProtocolDataProvider

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DaemonProtocolDataProvider;
  [(DaemonProtocolDataProvider *)&v3 dealloc];
}

- (void)_presentDialog:(id)a3
{
  v4 = [[DaemonDialogOperation alloc] initWithDialog:a3];
  -[DaemonDialogOperation setDisplaysOnLockscreen:](v4, "setDisplaysOnLockscreen:", objc_msgSend(-[DaemonProtocolDataProvider authenticationContext](self, "authenticationContext"), "displaysOnLockScreen"));
  objc_msgSend(+[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue"), "addOperation:", v4);
}

- (BOOL)processDictionary:(id)a3 error:(id *)a4
{
  id v7 = [self->_willBeginProcessingDictionaryHandler copy];
  if (v7)
  {
    v8 = v7;
    (*((void (**)(void))v7 + 2))();
  }
  v27 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  unsigned __int8 v26 = 0;
  v22.receiver = self;
  v22.super_class = (Class)DaemonProtocolDataProvider;
  unsigned __int8 v26 = [(DaemonProtocolDataProvider *)&v22 processDictionary:a3 error:&v27];
  uint64_t v9 = SSErrorSessionPropertyFailureType;
  id v10 = [a3 objectForKey:SSErrorSessionPropertyFailureType];
  if (v10)
  {
    v11 = objc_alloc_init(ErrorHandlerSession);
    [(ErrorHandlerSession *)v11 setValue:v10 forSessionProperty:v9];
    uint64_t v12 = 0;
    v28[0] = SSErrorSessionPropertyCustomerMessage;
    v28[1] = SSErrorSessionPropertyCustomerMessageTitle;
    v28[2] = SSErrorSessionPropertyNextActionURL;
    v28[3] = SSErrorSessionPropertyFailureClientInfo;
    do
    {
      uint64_t v13 = v28[v12];
      id v14 = [a3 objectForKey:v13];
      if (v14) {
        [(ErrorHandlerSession *)v11 setValue:v14 forSessionProperty:v13];
      }
      ++v12;
    }
    while (v12 != 4);
    v15 = dispatch_semaphore_create(0);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10018B3CC;
    v21[3] = &unk_1003A8648;
    v21[5] = v15;
    v21[6] = &v23;
    v21[4] = self;
    objc_msgSend(+[ErrorHandlerManager errorHandlerManager](ErrorHandlerManager, "errorHandlerManager"), "openSession:withCompletionBlock:", v11, v21);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v15);
  }
  id v16 = [(DaemonProtocolDataProvider *)self authenticatedAccountDSID];
  if (!v16)
  {
    id v16 = objc_msgSend(-[DaemonProtocolDataProvider authenticationContext](self, "authenticationContext"), "requiredUniqueIdentifier");
    if (!v16) {
      id v16 = objc_msgSend(objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier");
    }
  }
  +[SSVSubscriptionStatusCoordinator updateWithResponseDictionary:a3 accountIdentifier:v16];
  v17 = v24;
  int v18 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((unsigned char *)v24 + 24))
  {
    *a4 = v27;
    int v18 = *((unsigned __int8 *)v17 + 24);
  }
  BOOL v19 = v18 != 0;
  _Block_object_dispose(&v23, 8);
  return v19;
}

- (id)willBeginProcessingDictionaryHandler
{
  return self->_willBeginProcessingDictionaryHandler;
}

- (void)setWillBeginProcessingDictionaryHandler:(id)a3
{
}

@end
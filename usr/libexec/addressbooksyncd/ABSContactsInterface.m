@interface ABSContactsInterface
+ (id)sharedInstance;
- (ABSContactsInterface)init;
- (id)description;
- (void)_decrementInUse;
- (void)_incrementInUseForMutation:(BOOL)a3;
- (void)accessAssert:(id)a3;
- (void)accessAsync:(id)a3;
- (void)accessSync:(id)a3;
- (void)decrementInUse;
- (void)incrementInUse;
- (void)mutateAssert:(id)a3;
- (void)mutateAsync:(id)a3;
- (void)mutateSync:(id)a3;
- (void)registerPostSaveBlock:(id)a3;
- (void)sendMultisaveFinished;
@end

@implementation ABSContactsInterface

+ (id)sharedInstance
{
  if (qword_100069C38 != -1) {
    dispatch_once(&qword_100069C38, &stru_100054F10);
  }
  v2 = (void *)qword_100069C40;

  return v2;
}

- (ABSContactsInterface)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABSContactsInterface;
  v2 = [(ABSContactsInterface *)&v8 init];
  if (v2)
  {
    uint64_t v3 = sub_100028AC4("ABSContactsInterface");
    q = v2->_q;
    v2->_q = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    postSaveActions = v2->_postSaveActions;
    v2->_postSaveActions = (NSMutableArray *)v5;
  }
  return v2;
}

- (id)description
{
  return +[NSString stringWithFormat:@"ABSContactsInterace: %p, _inUse = %d, _cnStore = %p, _cnSaveRequest = %p", self, self->_inUse, self->_cnStore, self->_cnSaveRequest];
}

- (void)accessSync:(id)a3
{
  id v4 = a3;
  q = self->_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000111A4;
  v7[3] = &unk_100054F38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(q, v7);
}

- (void)accessAsync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)os_transaction_create();
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000112D0;
  block[3] = &unk_100054F60;
  id v10 = v5;
  id v11 = v4;
  block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(q, block);
}

- (void)accessAssert:(id)a3
{
  uint64_t v5 = (void (**)(id, CNContactStore *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  [(ABSContactsInterface *)self _incrementInUseForMutation:0];
  v5[2](v5, self->_cnStore);
  [(ABSContactsInterface *)self _decrementInUse];
}

- (void)mutateSync:(id)a3
{
  id v4 = a3;
  q = self->_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011454;
  v7[3] = &unk_100054F38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(q, v7);
}

- (void)mutateAsync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)os_transaction_create();
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000115A8;
  block[3] = &unk_100054F60;
  id v10 = v5;
  id v11 = v4;
  block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(q, block);
}

- (void)mutateAssert:(id)a3
{
  id v6 = (unsigned int (**)(id, CNContactStore *, CNSaveRequest *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  [(ABSContactsInterface *)self _incrementInUseForMutation:1];
  if (v6[2](v6, self->_cnStore, self->_cnSaveRequest))
  {
    cnSaveRequest = self->_cnSaveRequest;
    self->_cnSaveRequest = 0;

    self->_didSave = 1;
  }
  [(ABSContactsInterface *)self _decrementInUse];
}

- (void)incrementInUse
{
  if (self->_inDecrementInUse)
  {
    [(ABSContactsInterface *)self _incrementInUseForMutation:0];
  }
  else
  {
    q = self->_q;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011778;
    block[3] = &unk_100054DD0;
    block[4] = self;
    dispatch_sync(q, block);
  }
}

- (void)decrementInUse
{
  if (self->_inDecrementInUse)
  {
    [(ABSContactsInterface *)self _decrementInUse];
  }
  else
  {
    q = self->_q;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001181C;
    block[3] = &unk_100054DD0;
    block[4] = self;
    dispatch_sync(q, block);
  }
}

- (void)_incrementInUseForMutation:(BOOL)a3
{
  BOOL v3 = a3;
  ++self->_inUse;
  if (self->_inUse == 1)
  {
    id v6 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    cnStore = self->_cnStore;
    self->_cnStore = v6;

    self->_didSave = 0;
  }
  if (v3 && !self->_cnSaveRequest)
  {
    id v8 = +[CNSaveRequest abs_new];
    cnSaveRequest = self->_cnSaveRequest;
    self->_cnSaveRequest = v8;
  }
}

- (void)_decrementInUse
{
  int v2 = self->_inUse - 1;
  self->_inUse = v2;
  if (!v2)
  {
    if (self->_cnSaveRequest)
    {
      [(ABSContactsInterface *)self _sendMultisaveBegin];
      kdebug_trace();
      cnStore = self->_cnStore;
      cnSaveRequest = self->_cnSaveRequest;
      id v21 = 0;
      unsigned __int8 v7 = [(CNContactStore *)cnStore ABSexecuteSaveRequest:cnSaveRequest error:&v21];
      id v8 = v21;
      if (v7)
      {
        self->_didSave = 1;
      }
      else
      {
        v9 = *(NSObject **)(qword_100069D78 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100037370((uint64_t)v8, v9);
        }
      }
      kdebug_trace();
      id v10 = self->_cnSaveRequest;
      self->_cnSaveRequest = 0;
    }
    id v11 = self->_cnStore;
    self->_cnStore = 0;

    if (self->_didSave && !self->_inDecrementInUse)
    {
      self->_inDecrementInUse = 1;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v12 = self->_postSaveActions;
      id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v12);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * i));
          }
          id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v14);
      }

      self->_inDecrementInUse = 0;
    }
  }
}

- (void)registerPostSaveBlock:(id)a3
{
  postSaveActions = self->_postSaveActions;
  id v4 = [a3 copy];
  [(NSMutableArray *)postSaveActions addObject:v4];
}

- (void)sendMultisaveFinished
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postSaveActions, 0);
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_cnSaveRequest, 0);

  objc_storeStrong((id *)&self->_cnStore, 0);
}

@end
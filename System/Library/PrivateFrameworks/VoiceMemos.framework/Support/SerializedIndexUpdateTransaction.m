@interface SerializedIndexUpdateTransaction
- (CSSearchableIndex)searchIndex;
- (NSError)transactionError;
- (NSString)identifier;
- (SerializedIndexUpdateTransaction)initWithSearchIndex:(id)a3 identifier:(id)a4;
- (id)_waitWithReasonableTimeoutOnSemaphore:(id)a3 stepDescription:(id)a4;
- (void)performSynchronizedStepWithDescription:(id)a3 block:(id)a4;
- (void)performSynchronizedStepWithDescription:(id)a3 isSkippedIfPreviousErrors:(BOOL)a4 isIndexUpdatingStep:(BOOL)a5 block:(id)a6;
- (void)performTransactionOnQueue:(id)a3 processingBlock:(id)a4 finishedBlock:(id)a5;
@end

@implementation SerializedIndexUpdateTransaction

- (SerializedIndexUpdateTransaction)initWithSearchIndex:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SerializedIndexUpdateTransaction;
  v9 = [(SerializedIndexUpdateTransaction *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchIndex, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
    dispatch_queue_t v11 = dispatch_queue_create(0, 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = +[NSMutableArray array];
    operationTimeoutErrors = v10->_operationTimeoutErrors;
    v10->_operationTimeoutErrors = (NSMutableArray *)v13;

    uint64_t v15 = +[NSMutableArray array];
    operationStepErrors = v10->_operationStepErrors;
    v10->_operationStepErrors = (NSMutableArray *)v15;

    v10->_canBatch = 0;
  }

  return v10;
}

- (void)performTransactionOnQueue:(id)a3 processingBlock:(id)a4 finishedBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  identifier = self->_identifier;
  dispatch_queue_t v11 = a3;
  [(NSString *)identifier UTF8String];
  v12 = (OS_os_transaction *)os_transaction_create();
  XPCKeepAliveTransaction = self->_XPCKeepAliveTransaction;
  self->_XPCKeepAliveTransaction = v12;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F748;
  block[3] = &unk_100038F30;
  block[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v11, block);
}

- (void)performSynchronizedStepWithDescription:(id)a3 isSkippedIfPreviousErrors:(BOOL)a4 isIndexUpdatingStep:(BOOL)a5 block:(id)a6
{
  id v10 = a3;
  dispatch_queue_t v11 = (void (**)(id, void ***))a6;
  if (a4
    || ![(NSMutableArray *)self->_operationTimeoutErrors count]
    && ![(NSMutableArray *)self->_operationStepErrors count])
  {
    p_currentStepDescription = &self->_currentStepDescription;
    if ([(NSString *)self->_currentStepDescription length]) {
      uint64_t v13 = (__CFString *)*p_currentStepDescription;
    }
    else {
      uint64_t v13 = @"unknown operation";
    }
    objc_storeStrong((id *)&self->_currentStepDescription, v13);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000FCF0;
    block[3] = &unk_100038F58;
    BOOL v25 = a5;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)queue, block);
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_10000FD40;
    v21 = &unk_100038F80;
    v22 = self;
    id v15 = dispatch_semaphore_create(0);
    v23 = v15;
    v11[2](v11, &v18);
    v16 = -[SerializedIndexUpdateTransaction _waitWithReasonableTimeoutOnSemaphore:stepDescription:](self, "_waitWithReasonableTimeoutOnSemaphore:stepDescription:", v15, v10, v18, v19, v20, v21, v22);
    if (v16) {
      [(NSMutableArray *)self->_operationTimeoutErrors addObject:v16];
    }
    id v17 = *p_currentStepDescription;
    *p_currentStepDescription = 0;
  }
}

- (void)performSynchronizedStepWithDescription:(id)a3 block:(id)a4
{
}

- (id)_waitWithReasonableTimeoutOnSemaphore:(id)a3 stepDescription:(id)a4
{
  v5 = (__CFString *)a4;
  v6 = a3;
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  intptr_t v8 = dispatch_semaphore_wait(v6, v7);

  if (v8)
  {
    id v9 = [(__CFString *)v5 length];
    id v10 = @"unknown operation";
    if (v9) {
      id v10 = v5;
    }
    dispatch_queue_t v11 = v10;

    v12 = +[NSString stringWithFormat:@"Couldn’t communicate with a helper 'CoreSpotlight' while handling '%@'", v11];
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    id v17 = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v14 = +[NSError errorWithDomain:RCSSavedRecordingServiceErrorDomain code:501 userInfo:v13];

    v5 = v11;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (CSSearchableIndex)searchIndex
{
  return self->_searchIndex;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSError)transactionError
{
  return self->_transactionError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionError, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_currentStepDescription, 0);
  objc_storeStrong((id *)&self->_operationStepErrors, 0);
  objc_storeStrong((id *)&self->_operationTimeoutErrors, 0);
  objc_storeStrong((id *)&self->_XPCKeepAliveTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
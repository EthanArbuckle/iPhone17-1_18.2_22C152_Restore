@interface PDApplePayCloudStoreRecordFetchOperation
- (PDApplePayCloudStoreRecordFetchOperation)init;
- (id)description;
- (id)identifier;
- (id)task;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithError:(id)a3 cloudStoreRecords:(id)a4;
- (void)updateTask:(id)a3;
@end

@implementation PDApplePayCloudStoreRecordFetchOperation

- (PDApplePayCloudStoreRecordFetchOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDApplePayCloudStoreRecordFetchOperation;
  v2 = [(PDApplePayCloudStoreRecordFetchOperation *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completions = v2->_completions;
    v2->_completions = v3;
  }
  return v2;
}

- (id)identifier
{
  return [(PKCloudStoreRecordFetchTask *)self->_task identifier];
}

- (void)updateTask:(id)a3
{
}

- (id)task
{
  return self->_task;
}

- (void)addCompletion:(id)a3
{
  completions = self->_completions;
  id v4 = objc_retainBlock(a3);
  [(NSMutableSet *)completions pk_safelyAddObject:v4];
}

- (void)callCompletionsWithError:(id)a3 cloudStoreRecords:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableSet *)self->_completions copy];
  [(NSMutableSet *)self->_completions removeAllObjects];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13));
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  id v4 = [(PDApplePayCloudStoreRecordFetchOperation *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];

  [v3 appendFormat:@"task: '%@'; ", self->_task];
  objc_msgSend(v3, "appendFormat:", @"completions: %ld; ", -[NSMutableSet count](self->_completions, "count"));
  [v3 appendFormat:@">"];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end
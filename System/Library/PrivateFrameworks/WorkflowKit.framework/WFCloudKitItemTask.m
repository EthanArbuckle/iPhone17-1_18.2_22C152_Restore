@interface WFCloudKitItemTask
- (CKOperation)cloudOperation;
- (NSError)error;
- (NSOperationQueue)operationQueue;
- (WFCloudKitItemTask)init;
- (void)cancel;
- (void)setCloudOperation:(id)a3;
- (void)setError:(id)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation WFCloudKitItemTask

- (void)setCloudOperation:(id)a3
{
}

- (WFCloudKitItemTask)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFCloudKitItemTask;
  v2 = [(WFCloudKitItemTask *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(WFCloudKitItemTask *)v2 setOperationQueue:v3];

    v4 = [(WFCloudKitItemTask *)v2 operationQueue];
    [v4 setQualityOfService:25];

    v5 = v2;
  }

  return v2;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cloudOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)setError:(id)a3
{
}

- (CKOperation)cloudOperation
{
  return self->_cloudOperation;
}

- (void)cancel
{
  id v3 = [(WFCloudKitItemTask *)self operationQueue];
  [v3 cancelAllOperations];

  v4 = [(WFCloudKitItemTask *)self cloudOperation];
  [v4 cancel];

  v5.receiver = self;
  v5.super_class = (Class)WFCloudKitItemTask;
  [(WFCloudKitTask *)&v5 cancel];
}

@end
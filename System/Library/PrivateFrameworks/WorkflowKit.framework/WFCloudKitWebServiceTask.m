@interface WFCloudKitWebServiceTask
- (NSOperationQueue)operationQueue;
- (NSURLSessionTask)dataTask;
- (WFCloudKitWebServiceTask)init;
- (void)cancel;
- (void)setDataTask:(id)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation WFCloudKitWebServiceTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setDataTask:(id)a3
{
}

- (NSURLSessionTask)dataTask
{
  return self->_dataTask;
}

- (void)cancel
{
  v3 = [(WFCloudKitWebServiceTask *)self dataTask];
  [v3 cancel];

  v4 = [(WFCloudKitWebServiceTask *)self operationQueue];
  [v4 cancelAllOperations];

  v5.receiver = self;
  v5.super_class = (Class)WFCloudKitWebServiceTask;
  [(WFCloudKitTask *)&v5 cancel];
}

- (WFCloudKitWebServiceTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFCloudKitWebServiceTask;
  v2 = [(WFCloudKitWebServiceTask *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(WFCloudKitWebServiceTask *)v2 setOperationQueue:v3];

    v4 = v2;
  }

  return v2;
}

@end
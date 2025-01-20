@interface ICRequestOperation
- (ICRequestOperation)init;
- (NSProgress)progress;
- (void)finishWithError:(id)a3;
- (void)performRequestOnOperationQueue:(id)a3 withCompletionHandler:(id)a4;
- (void)performRequestWithCompletionHandler:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation ICRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICRequestOperation;
  [(ICAsyncOperation *)&v7 finishWithError:v4];
  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, v4);
    id v6 = self->_completionHandler;
    self->_completionHandler = 0;
  }
}

- (void)performRequestOnOperationQueue:(id)a3 withCompletionHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void *)MEMORY[0x1A6240BF0](a4);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  if (v9)
  {
    [v9 addOperation:self];
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", -1);
    [v8 addOperation:self];
  }
}

- (void)performRequestWithCompletionHandler:(id)a3
{
}

- (ICRequestOperation)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICRequestOperation;
  v2 = [(ICAsyncOperation *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    [(ICRequestOperation *)v2 setProgress:v3];
  }
  return v2;
}

@end
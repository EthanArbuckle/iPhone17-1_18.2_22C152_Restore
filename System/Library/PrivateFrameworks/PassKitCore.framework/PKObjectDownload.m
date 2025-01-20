@interface PKObjectDownload
- (NSMutableSet)completionHandlers;
- (NSURLSessionDataTask)task;
- (PKObjectDownload)init;
- (void)setCompletionHandlers:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation PKObjectDownload

- (PKObjectDownload)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKObjectDownload;
  v2 = [(PKObjectDownload *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;
  }
  return v2;
}

- (NSMutableSet)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end
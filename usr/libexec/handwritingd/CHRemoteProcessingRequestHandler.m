@interface CHRemoteProcessingRequestHandler
- (CHRemoteProcessingRequestHandler)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5;
- (OS_dispatch_queue)highPriorityQueue;
- (OS_dispatch_queue)lowPriorityQueue;
@end

@implementation CHRemoteProcessingRequestHandler

- (CHRemoteProcessingRequestHandler)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CHRemoteProcessingRequestHandler;
  v11 = [(CHRemoteBasicRequestHandler *)&v14 initWithServerQueue:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_lowPriorityQueue, a4);
    objc_storeStrong((id *)&v12->_highPriorityQueue, a5);
  }

  return v12;
}

- (OS_dispatch_queue)lowPriorityQueue
{
  return self->_lowPriorityQueue;
}

- (OS_dispatch_queue)highPriorityQueue
{
  return self->_highPriorityQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highPriorityQueue, 0);

  objc_storeStrong((id *)&self->_lowPriorityQueue, 0);
}

@end
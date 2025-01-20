@interface SKDelegateResponseQueue
- (OS_dispatch_queue)dispatchQueue;
- (SKDelegateResponseQueue)initWithQueue:(id)a3;
@end

@implementation SKDelegateResponseQueue

- (SKDelegateResponseQueue)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKDelegateResponseQueue;
  v6 = [(SKDelegateResponseQueue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
  }

  return v7;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end
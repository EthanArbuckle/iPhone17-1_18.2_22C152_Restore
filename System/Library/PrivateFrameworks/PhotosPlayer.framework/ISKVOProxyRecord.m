@interface ISKVOProxyRecord
- (ISKVOProxy)proxy;
- (ISKVOProxyRecord)initWithProxy:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
@end

@implementation ISKVOProxyRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_proxy, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (ISKVOProxy)proxy
{
  return self->_proxy;
}

- (ISKVOProxyRecord)initWithProxy:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISKVOProxyRecord;
  v9 = [(ISKVOProxyRecord *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_proxy, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

@end
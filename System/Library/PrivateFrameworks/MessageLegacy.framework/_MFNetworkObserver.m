@interface _MFNetworkObserver
- (_MFNetworkObserver)initWithBlock:(id)a3 queue:(id)a4;
- (void)execute;
@end

@implementation _MFNetworkObserver

- (_MFNetworkObserver)initWithBlock:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MFNetworkObserver;
  v8 = [(_MFNetworkObserver *)&v12 init];
  if (v8)
  {
    v9 = _Block_copy(v6);
    id block = v8->_block;
    v8->_id block = v9;

    objc_storeStrong((id *)&v8->_queue, a4);
  }

  return v8;
}

- (void)execute
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
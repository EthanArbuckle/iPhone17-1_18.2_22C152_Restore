@interface PKIDSServiceListener
- (OS_dispatch_queue)replyQueue;
- (PKIDSServiceListener)initWithReferenceObject:(id)a3 onMessageReceived:(id)a4;
- (id)onMessageReceived;
- (id)referenceObject;
- (void)setReplyQueue:(id)a3;
@end

@implementation PKIDSServiceListener

- (PKIDSServiceListener)initWithReferenceObject:(id)a3 onMessageReceived:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKIDSServiceListener;
  v8 = [(PKIDSServiceListener *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_referenceObject, v6);
    v10 = _Block_copy(v7);
    id onMessageReceived = v9->_onMessageReceived;
    v9->_id onMessageReceived = v10;
  }
  return v9;
}

- (id)onMessageReceived
{
  return self->_onMessageReceived;
}

- (id)referenceObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_referenceObject);
  return WeakRetained;
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
  self->_replyQueue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_referenceObject);
  objc_storeStrong(&self->_onMessageReceived, 0);
}

@end
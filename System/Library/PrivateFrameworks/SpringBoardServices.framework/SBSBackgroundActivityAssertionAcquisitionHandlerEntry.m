@interface SBSBackgroundActivityAssertionAcquisitionHandlerEntry
- (OS_dispatch_queue)queue;
- (SBSBackgroundActivityAssertionAcquisitionHandlerEntry)init;
- (SBSBackgroundActivityAssertionAcquisitionHandlerEntry)initWithHandler:(id)a3 queue:(id)a4;
- (id)handler;
@end

@implementation SBSBackgroundActivityAssertionAcquisitionHandlerEntry

- (SBSBackgroundActivityAssertionAcquisitionHandlerEntry)init
{
  return [(SBSBackgroundActivityAssertionAcquisitionHandlerEntry *)self initWithHandler:0 queue:0];
}

- (SBSBackgroundActivityAssertionAcquisitionHandlerEntry)initWithHandler:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSBackgroundActivityAssertionAcquisitionHandlerEntry;
  v8 = [(SBSBackgroundActivityAssertionAcquisitionHandlerEntry *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id handler = v8->_handler;
    v8->_id handler = (id)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
  }

  return v8;
}

- (id)handler
{
  return self->_handler;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
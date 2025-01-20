@interface _MFContentProtectionObserverWrapper
- (MFContentProtectionObserver)observer;
- (OS_dispatch_queue)queue;
- (_MFContentProtectionObserverWrapper)initWithObserver:(id)a3 queue:(id)a4;
- (void)dealloc;
@end

@implementation _MFContentProtectionObserverWrapper

- (_MFContentProtectionObserverWrapper)initWithObserver:(id)a3 queue:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_MFContentProtectionObserverWrapper;
  v6 = [(_MFContentProtectionObserverWrapper *)&v8 init];
  if (v6)
  {
    v6->_observerReference = (MFWeakReferenceHolder *)(id)[MEMORY[0x1E4F73598] weakReferenceWithObject:a3];
    dispatch_retain((dispatch_object_t)a4);
    v6->_queue = (OS_dispatch_queue *)a4;
  }
  return v6;
}

- (MFContentProtectionObserver)observer
{
  v2 = (void *)[(MFWeakReferenceHolder *)self->_observerReference retainedReference];
  return (MFContentProtectionObserver *)v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)_MFContentProtectionObserverWrapper;
  [(_MFContentProtectionObserverWrapper *)&v3 dealloc];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end
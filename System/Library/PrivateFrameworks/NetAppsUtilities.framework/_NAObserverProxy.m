@interface _NAObserverProxy
- (BOOL)isValid;
- (_NAObserverProxy)initWithWeakObserver:(id)a3;
- (id)weakObserver;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _NAObserverProxy

- (_NAObserverProxy)initWithWeakObserver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_NAObserverProxy;
  v5 = [(_NAObserverProxy *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_weakObserver, v4);
    v6->_valid = 1;
  }

  return v6;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (void)dealloc
{
  [(_NAObserverProxy *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_NAObserverProxy;
  [(_NAObserverProxy *)&v3 dealloc];
}

- (id)weakObserver
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakObserver);
  return WeakRetained;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
}

@end
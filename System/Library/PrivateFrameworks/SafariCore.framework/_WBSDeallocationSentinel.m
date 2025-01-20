@interface _WBSDeallocationSentinel
- (WBSDeallocationSentinelObserver)observer;
- (_WBSDeallocationSentinel)initWithObserver:(id)a3 context:(id)a4;
- (id)context;
- (void)dealloc;
- (void)setObserver:(id)a3;
@end

@implementation _WBSDeallocationSentinel

- (_WBSDeallocationSentinel)initWithObserver:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_WBSDeallocationSentinel;
  v8 = [(_WBSDeallocationSentinel *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong(&v9->_context, a4);
    v10 = v9;
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained sentinelDidDeallocateWithContext:self->_context];
  }

  v5.receiver = self;
  v5.super_class = (Class)_WBSDeallocationSentinel;
  [(_WBSDeallocationSentinel *)&v5 dealloc];
}

- (WBSDeallocationSentinelObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (WBSDeallocationSentinelObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
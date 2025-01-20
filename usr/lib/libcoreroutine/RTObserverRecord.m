@interface RTObserverRecord
- (RTObserverRecord)initWithObserver:(id)a3 selector:(SEL)a4;
- (SEL)selector;
- (id)observer;
- (void)setObserver:(id)a3;
- (void)setSelector:(SEL)a3;
@end

@implementation RTObserverRecord

- (id)observer
{
  id WeakRetained = objc_loadWeakRetained(&self->_observer);

  return WeakRetained;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (RTObserverRecord)initWithObserver:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTObserverRecord;
  v7 = [(RTObserverRecord *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_observer, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_selector = v9;
  }

  return v8;
}

- (void)setObserver:(id)a3
{
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (void).cxx_destruct
{
}

@end
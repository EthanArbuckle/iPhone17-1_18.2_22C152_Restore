@interface ULObserverRecord
- (SEL)selector;
- (ULObserverRecord)initWithObserver:(id)a3 selector:(SEL)a4;
- (id)observer;
- (void)setObserver:(id)a3;
- (void)setSelector:(SEL)a3;
@end

@implementation ULObserverRecord

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (id)observer
{
  id WeakRetained = objc_loadWeakRetained(&self->_observer);
  return WeakRetained;
}

- (ULObserverRecord)initWithObserver:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULObserverRecord;
  v7 = [(ULObserverRecord *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(ULObserverRecord *)v7 setObserver:v6];
    [(ULObserverRecord *)v8 setSelector:a4];
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
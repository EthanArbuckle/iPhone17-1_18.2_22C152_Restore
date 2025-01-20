@interface REObservableSingleton
- (id)_init;
- (unint64_t)numberOfObservers;
- (void)addObserver:(id)a3;
- (void)enumerateObservers:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation REObservableSingleton

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)REObservableSingleton;
  v2 = [(RESingleton *)&v6 _init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)v2[1];
    v2[1] = v3;
  }
  return v2;
}

- (unint64_t)numberOfObservers
{
  return [(REObserverStore *)self->_store count];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)enumerateObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface SFChangePublisher
- (NSPointerArray)observers;
- (SFChangePublisher)init;
- (void)publishChangeDescriptor:(unint64_t)a3 forObservable:(id)a4;
- (void)registerChangeObserver:(id)a3;
- (void)unregisterChangeObserver:(id)a3;
@end

@implementation SFChangePublisher

- (SFChangePublisher)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFChangePublisher;
  v2 = [(SFChangePublisher *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;
  }
  return v2;
}

- (void)registerChangeObserver:(id)a3
{
}

- (void)unregisterChangeObserver:(id)a3
{
  id v10 = a3;
  v4 = [(SFChangePublisher *)self observers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = 0;
    while (1)
    {
      v7 = [(SFChangePublisher *)self observers];
      uint64_t v8 = [v7 pointerAtIndex:v6];

      if ((id)v8 == v10) {
        break;
      }
      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
    v9 = [(SFChangePublisher *)self observers];
    [v9 removePointerAtIndex:v6];
  }
LABEL_7:
}

- (void)publishChangeDescriptor:(unint64_t)a3 forObservable:(id)a4
{
  id v11 = a4;
  uint64_t v6 = [(SFChangePublisher *)self observers];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      v9 = [(SFChangePublisher *)self observers];
      id v10 = [v9 pointerAtIndex:i];

      [v10 observable:v11 didChange:a3];
    }
  }
}

- (NSPointerArray)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end
@interface TLKObject
- (TLKObserver)observer;
- (int64_t)batchUpdateCount;
- (void)propertiesDidChange;
- (void)setBatchUpdateCount:(int64_t)a3;
- (void)setObserver:(id)a3;
@end

@implementation TLKObject

- (void).cxx_destruct
{
}

- (TLKObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->observer);
  return (TLKObserver *)WeakRetained;
}

- (void)propertiesDidChange
{
  uint64_t v3 = [(TLKObject *)self observer];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(TLKObject *)self observer];
    uint64_t v6 = [v5 batchUpdateCount];

    if (!v6)
    {
      id v7 = [(TLKObject *)self observer];
      [v7 propertiesDidChange];
    }
  }
}

- (void)setObserver:(id)a3
{
}

- (int64_t)batchUpdateCount
{
  return self->batchUpdateCount;
}

- (void)setBatchUpdateCount:(int64_t)a3
{
  self->batchUpdateCount = a3;
}

@end
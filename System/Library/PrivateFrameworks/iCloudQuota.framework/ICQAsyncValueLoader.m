@interface ICQAsyncValueLoader
- (ICQAsyncValueLoader)initWithDefaultValue:(id)a3 valueFetcher:(id)a4;
- (id)didUpdate;
- (id)fetchValue;
- (id)value;
- (void)fetchValueAsynchronously;
- (void)setDidUpdate:(id)a3;
- (void)setFetchValue:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation ICQAsyncValueLoader

- (ICQAsyncValueLoader)initWithDefaultValue:(id)a3 valueFetcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQAsyncValueLoader;
  v9 = [(ICQAsyncValueLoader *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id fetchValue = v9->_fetchValue;
    v9->_id fetchValue = (id)v10;

    v9->_valueLock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v9->_value, a3);
    [(ICQAsyncValueLoader *)v9 fetchValueAsynchronously];
  }

  return v9;
}

- (void)fetchValueAsynchronously
{
  v3 = [(ICQAsyncValueLoader *)self fetchValue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__ICQAsyncValueLoader_fetchValueAsynchronously__block_invoke;
  v4[3] = &unk_1E6A53848;
  v4[4] = self;
  ((void (**)(void, void *))v3)[2](v3, v4);
}

void __47__ICQAsyncValueLoader_fetchValueAsynchronously__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v4 = [*(id *)(a1 + 32) didUpdate];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) didUpdate];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)value
{
  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  id v4 = self->_value;
  os_unfair_lock_unlock(p_valueLock);
  return v4;
}

- (void)setValue:(id)a3
{
}

- (id)didUpdate
{
  return self->_didUpdate;
}

- (void)setDidUpdate:(id)a3
{
}

- (id)fetchValue
{
  return self->_fetchValue;
}

- (void)setFetchValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchValue, 0);
  objc_storeStrong(&self->_didUpdate, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
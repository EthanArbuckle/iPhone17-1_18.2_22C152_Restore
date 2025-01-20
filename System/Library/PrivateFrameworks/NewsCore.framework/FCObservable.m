@interface FCObservable
- (FCObservable)init;
- (FCObservable)initWithValue:(id)a3;
- (NSMutableArray)observers;
- (id)observe:(id)a3;
- (id)value;
- (unint64_t)token;
- (void)dealloc;
- (void)next:(id)a3;
- (void)quietNext:(id)a3;
- (void)setObservers:(id)a3;
- (void)setToken:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation FCObservable

- (id)observe:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  v6 = [FCObserver alloc];
  unint64_t v7 = [(FCObservable *)self token];
  [(FCObservable *)self setToken:v7 + 1];
  v8 = [(FCObserver *)v6 initWithToken:v7];
  [(FCObserver *)v8 setObserverBlock:v5];

  [(FCObserver *)v8 setKeepAliveObject:self];
  v9 = [(FCObservable *)self observers];
  [v9 addObject:v8];

  return v8;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (FCObservable)initWithValue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCObservable;
  v6 = [(FCObservable *)&v11 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_value, a3);
    v7->_token = 0;
    uint64_t v8 = objc_opt_new();
    observers = v7->_observers;
    v7->_observers = (NSMutableArray *)v8;
  }
  return v7;
}

- (FCObservable)init
{
  return [(FCObservable *)self initWithValue:0];
}

- (void)dealloc
{
  observers = self->_observers;
  self->_observers = 0;

  id value = self->_value;
  self->_id value = 0;

  v5.receiver = self;
  v5.super_class = (Class)FCObservable;
  [(FCObservable *)&v5 dealloc];
}

- (void)setValue:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  [(FCObservable *)self next:v5];
}

- (void)quietNext:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  id value = self->_value;
  self->_id value = v4;
}

- (void)next:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  objc_storeStrong(&self->_value, a3);
  v6 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v7 = [(FCObservable *)self observers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v13 = [v12 keepAliveObject];

        if (v13)
        {
          v14 = [v12 observerBlock];
          ((void (**)(void, id))v14)[2](v14, self->_value);
        }
        else
        {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        v21 = [(FCObservable *)self observers];
        [v21 removeObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }
}

- (id)value
{
  return self->_value;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
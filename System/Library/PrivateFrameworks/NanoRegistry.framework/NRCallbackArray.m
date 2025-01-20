@interface NRCallbackArray
- (NRCallbackArray)init;
- (void)addObject:(id)a3;
- (void)sweepWithCollection:(id)a3;
@end

@implementation NRCallbackArray

- (NRCallbackArray)init
{
  v3.receiver = self;
  v3.super_class = (Class)NRCallbackArray;
  result = [(NRCallbackArray *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)addObject:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  callbacks = self->_callbacks;
  if (callbacks)
  {
    v5 = (void *)MEMORY[0x1A624A7E0](v9);
    [(NSMutableArray *)callbacks addObject:v5];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v5 = (void *)MEMORY[0x1A624A7E0](v9);
    v7 = (NSMutableArray *)objc_msgSend(v6, "initWithObjects:", v5, 0);
    v8 = self->_callbacks;
    self->_callbacks = v7;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)sweepWithCollection:(id)a3
{
  id v14 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  callbacks = self->_callbacks;
  p_callbacks = (id *)&self->_callbacks;
  id v6 = callbacks;
  v8 = callbacks;
  id v9 = *p_callbacks;
  id *p_callbacks = 0;

  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    if ([(NSMutableArray *)v8 count])
    {
      uint64_t v10 = 0;
      int v11 = 0;
      do
      {
        v12 = [(NSMutableArray *)v8 objectAtIndexedSubscript:v10];
        int v13 = ((uint64_t (**)(void, id))v12)[2](v12, v14);

        if (v13) {
          [(NSMutableArray *)v8 removeObjectAtIndex:v10];
        }
        else {
          ++v11;
        }
        uint64_t v10 = v11;
      }
      while ([(NSMutableArray *)v8 count] > (unint64_t)v11);
    }
    if ([(NSMutableArray *)v8 count])
    {
      os_unfair_lock_lock(p_lock);
      if (*p_callbacks) {
        [*p_callbacks addObjectsFromArray:v8];
      }
      else {
        objc_storeStrong(p_callbacks, v6);
      }
      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (void).cxx_destruct
{
}

@end
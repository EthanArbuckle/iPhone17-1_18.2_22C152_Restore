@interface WFImageCache
- (CGImage)imageForKey:(id)a3;
- (NSMutableDictionary)backingStore;
- (WFImageCache)init;
- (os_unfair_lock_s)lock;
- (void)removeAllObjects;
- (void)setImage:(CGImage *)a3 forKey:(id)a4;
@end

@implementation WFImageCache

- (void).cxx_destruct
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableDictionary)backingStore
{
  return self->_backingStore;
}

- (void)removeAllObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(WFImageCache *)self backingStore];
  [v4 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (CGImage)imageForKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFImageCache.m", 155, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = [(WFImageCache *)self backingStore];
  v8 = [v7 objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    v9 = (CGImage *)[v8 copyImage];
    if (!v9)
    {
      os_unfair_lock_lock(&self->_lock);
      v10 = [(WFImageCache *)self backingStore];
      [v10 setObject:0 forKeyedSubscript:v5];

      os_unfair_lock_unlock(p_lock);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setImage:(CGImage *)a3 forKey:(id)a4
{
  id v7 = a4;
  id v13 = v7;
  if (a3)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFImageCache.m", 145, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"WFImageCache.m", 146, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

LABEL_3:
  v8 = [[WFPurgeableImage alloc] initWithCGImage:a3];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v10 = [(WFImageCache *)self backingStore];
  [v10 setObject:v8 forKeyedSubscript:v13];

  os_unfair_lock_unlock(p_lock);
}

- (WFImageCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFImageCache;
  v2 = [(WFImageCache *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    backingStore = v2->_backingStore;
    v2->_backingStore = (NSMutableDictionary *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    id v5 = v2;
  }

  return v2;
}

@end
@interface _BSUIMappedImageCacheCanary
- (_BSUIMappedImageCacheCanary)initWithCacheManager:(id)a3 key:(id)a4;
- (void)dealloc;
@end

@implementation _BSUIMappedImageCacheCanary

- (_BSUIMappedImageCacheCanary)initWithCacheManager:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_BSUIMappedImageCacheCanary;
  v8 = [(_BSUIMappedImageCacheCanary *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_cacheManager, v6);
    uint64_t v10 = [v7 copy];
    key = v9->_key;
    v9->_key = (NSString *)v10;
  }
  return v9;
}

- (void)dealloc
{
  p_cacheManager = &self->_cacheManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cacheManager);

  if (WeakRetained)
  {
    objc_copyWeak(&to, (id *)p_cacheManager);
    v5 = self->_key;
    id v6 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38___BSUIMappedImageCacheCanary_dealloc__block_invoke;
    block[3] = &unk_265471C58;
    objc_copyWeak(&v11, &to);
    uint64_t v10 = v5;
    id v7 = v5;
    dispatch_async(v6, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&to);
  }
  v8.receiver = self;
  v8.super_class = (Class)_BSUIMappedImageCacheCanary;
  [(_BSUIMappedImageCacheCanary *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_cacheManager);
}

@end
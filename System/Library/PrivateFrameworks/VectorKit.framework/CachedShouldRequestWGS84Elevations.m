@interface CachedShouldRequestWGS84Elevations
- (BOOL)value;
- (CachedShouldRequestWGS84Elevations)init;
- (void)dealloc;
@end

@implementation CachedShouldRequestWGS84Elevations

- (void).cxx_destruct
{
}

- (BOOL)value
{
  return self->_shouldRequestWGS84Elevations;
}

- (void)dealloc
{
  GEOConfigRemoveBlockListener();
  v3.receiver = self;
  v3.super_class = (Class)CachedShouldRequestWGS84Elevations;
  [(CachedShouldRequestWGS84Elevations *)&v3 dealloc];
}

- (CachedShouldRequestWGS84Elevations)init
{
  v10.receiver = self;
  v10.super_class = (Class)CachedShouldRequestWGS84Elevations;
  v2 = [(CachedShouldRequestWGS84Elevations *)&v10 init];
  if (v2)
  {
    v2->_shouldRequestWGS84Elevations = GEOConfigGetBOOL();
    objc_initWeak(&location, v2);
    id v3 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v8, &location);
    uint64_t v4 = _GEOConfigAddBlockListenerForKey();
    id subscription = v2->_subscription;
    v2->_id subscription = (id)v4;

    v6 = v2;
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __42__CachedShouldRequestWGS84Elevations_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    WeakRetained[8] = GEOConfigGetBOOL();
    WeakRetained = v2;
  }
}

@end
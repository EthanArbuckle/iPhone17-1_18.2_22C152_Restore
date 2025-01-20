@interface VisionCoreObjectCache
- (VisionCoreObjectCache)init;
- (id)objectForIdentifier:(id)a3 creationBlock:(id)a4 error:(id *)a5;
- (void)removeAllObjects;
@end

@implementation VisionCoreObjectCache

- (id)objectForIdentifier:(id)a3 creationBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id *))a4;
  os_unfair_lock_lock(&self->_accessLock);
  v10 = [(NSMutableDictionary *)self->_objects objectForKey:v8];
  if (v10)
  {
    id v11 = v10;
LABEL_12:

    os_unfair_lock_unlock(&self->_accessLock);
    goto LABEL_13;
  }
  if (v9)
  {
    v12 = (void *)MEMORY[0x230F41A40]();
    id v17 = 0;
    v9[2](v9, &v17);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v17;
    if (v11)
    {
      [(NSMutableDictionary *)self->_objects setObject:v11 forKey:v8];
      id v14 = v11;
    }
    else if (a5)
    {
      *a5 = v13;
    }

    goto LABEL_12;
  }
  os_unfair_lock_unlock(&self->_accessLock);
  if (a5)
  {
    v15 = (void *)[[NSString alloc] initWithFormat:@"could not locate object '%@'", v8];
    *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v15];
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (VisionCoreObjectCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)VisionCoreObjectCache;
  v2 = [(VisionCoreObjectCache *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    objects = v3->_objects;
    v3->_objects = v4;
  }
  return v3;
}

- (void).cxx_destruct
{
}

- (void)removeAllObjects
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  [(NSMutableDictionary *)self->_objects removeAllObjects];
  os_unfair_lock_unlock(p_accessLock);
}

@end
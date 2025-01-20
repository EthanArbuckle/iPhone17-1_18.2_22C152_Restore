@interface SDShareSheetAccessibilityCache
- (SDShareSheetAccessibilityCache)init;
- (id)labelForSlotID:(id)a3;
- (void)addEntriesFromDictionary:(id)a3;
- (void)removeLabelForSlotID:(id)a3;
- (void)removeLabelsForSlotIDs:(id)a3;
- (void)setLabel:(id)a3 forSlotID:(id)a4;
@end

@implementation SDShareSheetAccessibilityCache

- (SDShareSheetAccessibilityCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)SDShareSheetAccessibilityCache;
  v2 = [(SDShareSheetAccessibilityCache *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableDictionary dictionary];
    cache = v3->_cache;
    v3->_cache = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (void)setLabel:(id)a3 forSlotID:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_cache setObject:v8 forKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_cache addEntriesFromDictionary:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)removeLabelForSlotID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_cache removeObjectForKey:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeLabelsForSlotIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_cache removeObjectsForKeys:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (id)labelForSlotID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = [(NSMutableDictionary *)self->_cache objectForKey:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void).cxx_destruct
{
}

@end
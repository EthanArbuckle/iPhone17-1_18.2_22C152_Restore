@interface _TSF_TSDCallbackRefconMap
+ (id)sharedTSDCallbackRefconMap;
- (_TSF_TSDCallbackRefconMap)init;
- (id)getObject:(unint64_t)a3;
- (unint64_t)allocateRefcon:(id)a3;
- (void)releaseRefcon:(unint64_t)a3;
@end

@implementation _TSF_TSDCallbackRefconMap

+ (id)sharedTSDCallbackRefconMap
{
  if (sharedTSDCallbackRefconMap_onceToken != -1) {
    dispatch_once(&sharedTSDCallbackRefconMap_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)_sharedTSDCallbackRefconMap;
  return v2;
}

- (_TSF_TSDCallbackRefconMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)_TSF_TSDCallbackRefconMap;
  v2 = [(_TSF_TSDCallbackRefconMap *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    refcons = v2->_refcons;
    v2->_refcons = (NSMutableDictionary *)v3;

    v2->_nextRefcon = 1;
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (unint64_t)allocateRefcon:(id)a3
{
  v4 = NSNumber;
  unint64_t v5 = self->_nextRefcon + 1;
  self->_nextRefcon = v5;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedLongLong:v5];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_refcons setObject:v6 forKeyedSubscript:v7];

  os_unfair_lock_unlock(&self->_lock);
  unint64_t v8 = [v7 unsignedLongLongValue];

  return v8;
}

- (void)releaseRefcon:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  refcons = self->_refcons;
  v7 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)refcons removeObjectForKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (id)getObject:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  refcons = self->_refcons;
  v7 = [NSNumber numberWithUnsignedLongLong:a3];
  unint64_t v8 = [(NSMutableDictionary *)refcons objectForKey:v7];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void).cxx_destruct
{
}

@end
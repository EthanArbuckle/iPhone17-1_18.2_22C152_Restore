@interface TSDCallbackRefconMap
+ (id)sharedTSDCallbackRefconMap;
- (TSDCallbackRefconMap)init;
- (id)getObject:(unint64_t)a3;
- (unint64_t)allocateRefcon:(id)a3;
- (void)releaseRefcon:(unint64_t)a3;
@end

@implementation TSDCallbackRefconMap

- (id)getObject:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  refcons = self->_refcons;
  v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  v8 = [(NSMutableDictionary *)refcons objectForKey:v7];

  os_unfair_lock_unlock(p_lock);

  return v8;
}

+ (id)sharedTSDCallbackRefconMap
{
  if (qword_100047BF8 != -1) {
    dispatch_once(&qword_100047BF8, &stru_10003C4F0);
  }
  v2 = (void *)qword_100047BF0;

  return v2;
}

- (TSDCallbackRefconMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSDCallbackRefconMap;
  v2 = [(TSDCallbackRefconMap *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    refcons = v2->_refcons;
    v2->_refcons = (NSMutableDictionary *)v3;

    v2->_nextRefcon = 1;
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (unint64_t)allocateRefcon:(id)a3
{
  unint64_t v4 = self->_nextRefcon + 1;
  self->_nextRefcon = v4;
  id v5 = a3;
  objc_super v6 = +[NSNumber numberWithUnsignedLongLong:v4];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_refcons setObject:v5 forKeyedSubscript:v6];

  os_unfair_lock_unlock(&self->_lock);
  id v7 = [v6 unsignedLongLongValue];

  return (unint64_t)v7;
}

- (void)releaseRefcon:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  refcons = self->_refcons;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)refcons removeObjectForKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end
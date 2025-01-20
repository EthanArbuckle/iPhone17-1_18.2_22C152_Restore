@interface TSDClockSyncManager
+ (id)sharedClockSyncManager;
- (TSDClockSyncManager)init;
- (id)clockSyncForClockIdentifier:(unint64_t)a3 pid:(int)a4;
- (void)releaseClockSyncForClockIdentifier:(unint64_t)a3;
@end

@implementation TSDClockSyncManager

+ (id)sharedClockSyncManager
{
  if (qword_100047CD8 != -1) {
    dispatch_once(&qword_100047CD8, &stru_10003CEF0);
  }
  v2 = (void *)qword_100047CE0;

  return v2;
}

- (TSDClockSyncManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSDClockSyncManager;
  v2 = [(TSDClockSyncManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    clockSyncs = v2->_clockSyncs;
    v2->_clockSyncs = (NSMutableDictionary *)v3;

    v2->_clockSyncsLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)clockSyncForClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  os_unfair_lock_lock(&self->_clockSyncsLock);
  v8 = [(NSMutableDictionary *)self->_clockSyncs objectForKeyedSubscript:v7];
  if (v8)
  {
    v9 = v8;
    [(TSDClockSync *)v8 addReference];
  }
  else
  {
    v9 = [[TSDClockSync alloc] initWithClockIdentifier:a3 pid:v4];
    if (v9) {
      [(NSMutableDictionary *)self->_clockSyncs setObject:v9 forKeyedSubscript:v7];
    }
  }
  os_unfair_lock_unlock(&self->_clockSyncsLock);

  return v9;
}

- (void)releaseClockSyncForClockIdentifier:(unint64_t)a3
{
  id v6 = +[NSNumber numberWithUnsignedLongLong:a3];
  os_unfair_lock_lock(&self->_clockSyncsLock);
  uint64_t v4 = [(NSMutableDictionary *)self->_clockSyncs objectForKeyedSubscript:v6];
  v5 = v4;
  if (v4 && ![v4 releaseReference])
  {
    [(NSMutableDictionary *)self->_clockSyncs removeObjectForKey:v6];
    [v5 finalizeNotifications];
  }
  os_unfair_lock_unlock(&self->_clockSyncsLock);
}

- (void).cxx_destruct
{
}

@end
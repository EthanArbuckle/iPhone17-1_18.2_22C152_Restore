@interface BKTouchDeliveryGenericGestureFocusObserver
+ (id)sharedInstance;
- (BKHIDSystemInterface)HIDSystem;
- (BKTouchDeliveryGenericGestureFocusObserver)initWithHIDSystem:(id)a3;
- (BOOL)destinationPIDMatchesHapticFeedbackRequestPID:(int)a3;
- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 overrideSenderDescriptor:(id)a5;
- (id)eventDestinationForDisplayUUID:(id)a3;
- (void)postEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4;
- (void)setEventDestination:(id)a3 forDisplayUUID:(id)a4;
- (void)setHIDSystem:(id)a3;
@end

@implementation BKTouchDeliveryGenericGestureFocusObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HIDSystem, 0);

  objc_storeStrong((id *)&self->_lock_destinationPerDisplayUUID, 0);
}

- (void)setHIDSystem:(id)a3
{
}

- (BKHIDSystemInterface)HIDSystem
{
  return self->_HIDSystem;
}

- (void)postEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  v6 = [(BKTouchDeliveryGenericGestureFocusObserver *)self destinationsForEvent:a3 fromSender:a4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(BKTouchDeliveryGenericGestureFocusObserver *)self postEvent:a3 toDestination:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4
{
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 overrideSenderDescriptor:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v10 = [v8 displayUUID];
  id v11 = [v10 length];
  long long v12 = (void *)BKSDisplayUUIDMainKey;
  if (v11) {
    long long v12 = v10;
  }
  id v13 = v12;

  long long v14 = [(NSMutableDictionary *)self->_lock_destinationPerDisplayUUID objectForKey:v13];
  if (IOHIDEventGetType() == 39 && v14)
  {
    uint64_t v15 = +[NSSet setWithObject:v14];
  }
  else
  {
    uint64_t v15 = [(BKHIDSystemInterface *)self->_HIDSystem destinationsForEvent:a3 fromSender:v8 overrideSenderDescriptor:v9];
  }
  v16 = (void *)v15;
  os_unfair_lock_unlock(&self->_lock);

  return v16;
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  return [(BKTouchDeliveryGenericGestureFocusObserver *)self destinationsForEvent:a3 fromSender:a4 overrideSenderDescriptor:0];
}

- (BOOL)destinationPIDMatchesHapticFeedbackRequestPID:(int)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_destinationPerDisplayUUID = self->_lock_destinationPerDisplayUUID;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100066DA8;
  v8[3] = &unk_1000F7910;
  int v9 = a3;
  v8[4] = &v10;
  [(NSMutableDictionary *)lock_destinationPerDisplayUUID enumerateKeysAndObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_lock;
}

- (void)setEventDestination:(id)a3 forDisplayUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 length];
  int v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8) {
    int v9 = v7;
  }
  id v10 = v9;

  id v11 = BKLogTouchEvents();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "set focus-follows-touch destination:%{public}@ for display:%{public}@", (uint8_t *)&v12, 0x16u);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_lock_destinationPerDisplayUUID setObject:v6 forKey:v10];
  os_unfair_lock_unlock(&self->_lock);
}

- (id)eventDestinationForDisplayUUID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  id v6 = (void *)BKSDisplayUUIDMainKey;
  if (v5) {
    id v6 = v4;
  }
  id v7 = v6;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  int v9 = [(NSMutableDictionary *)self->_lock_destinationPerDisplayUUID objectForKey:v7];
  id v10 = [v9 copy];

  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (BKTouchDeliveryGenericGestureFocusObserver)initWithHIDSystem:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKTouchDeliveryGenericGestureFocusObserver;
  id v6 = [(BKTouchDeliveryGenericGestureFocusObserver *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_HIDSystem, a3);
    uint64_t v8 = objc_opt_new();
    lock_destinationPerDisplayUUID = v7->_lock_destinationPerDisplayUUID;
    v7->_lock_destinationPerDisplayUUID = (NSMutableDictionary *)v8;
  }
  return v7;
}

+ (id)sharedInstance
{
  if (qword_100123040 != -1) {
    dispatch_once(&qword_100123040, &stru_1000F78E8);
  }
  v2 = (void *)qword_100123048;

  return v2;
}

@end
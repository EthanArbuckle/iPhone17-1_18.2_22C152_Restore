@interface MGNotificationRegistration
- (BOOL)registerForNotification:(int)a3 argument:(const char *)a4 question:(id)a5;
- (BOOL)start;
- (MGNotificationRegistration)initWithQueue:(id)global_queue block:(id)a4;
- (void)cancel;
- (void)dealloc;
@end

@implementation MGNotificationRegistration

- (MGNotificationRegistration)initWithQueue:(id)global_queue block:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MGNotificationRegistration;
  v6 = [(MGNotificationRegistration *)&v12 init];
  if (v6)
  {
    v6->_observers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (!global_queue) {
      global_queue = dispatch_get_global_queue(0, 0);
    }
    v6->_queue = (OS_dispatch_queue *)global_queue;
    dispatch_retain((dispatch_object_t)global_queue);
    v6->_block = (id)[a4 copyWithZone:v7, v8, v9, v10];
    v6->_requestedRegistrations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v6;
}

- (BOOL)registerForNotification:(int)a3 argument:(const char *)a4 question:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  v27[2] = *MEMORY[0x1E4F143B8];
  objc_super v12 = (void *)MEMORY[0x1AD0C6360](self, a2);
  if (a4) {
    v13 = (__CFString *)[NSString stringWithUTF8String:v9];
  }
  else {
    v13 = &stru_1EFC37390;
  }
  v27[0] = [NSNumber numberWithInt:v9, v7, v10, v11];
  v27[1] = v13;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14, v27, count:2, v15];
  id v23 = (id)[self->_requestedRegistrations objectForKeyedSubscript:v17, v16, v18, v19];
  if (!v23)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [self->_requestedRegistrations setObject:v16 forKeyedSubscript:v24];
  }
  [v23 addObject:v20, (uint64_t)a5, v21, v22];
  return 1;
}

- (BOOL)start
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD0C6360](self, a2);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obj = self->_requestedRegistrations;
  uint64_t v4 = [obj countByEnumeratingWithState:v3 objects:(id *)&v43 count:16];
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v41 = *(void *)v44;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
        uint64_t v11 = [v10 objectAtIndexedSubscript:v5];
        int v16 = [v11 v12:v13:v14:v15];
        uint64_t v20 = [v10 objectAtIndexedSubscript:v17];
        v24 = [self->_requestedRegistrations objectForKey:v21, v22, v23];
        uint64_t v29 = [v24 v25:v26 v27:v28];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = sub_1A6ED9500;
        v42[3] = &unk_1E5CB2540;
        v42[4] = self;
        v42[5] = v29;
        v34 = [v42 v30:v31 v32:v33];
        if (qword_1EB283CE8 != -1) {
          dispatch_once(&qword_1EB283CE8, &unk_1EFC370D0);
        }
        uint64_t v49 = 0;
        v50 = &v49;
        uint64_t v51 = 0x3052000000;
        v52 = sub_1A6ED6828;
        v53 = sub_1A6ED6810;
        uint64_t v54 = 0;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1A6ED68FC;
        block[3] = &unk_1E5CB2588;
        int v48 = v16;
        block[5] = v34;
        block[6] = &v49;
        block[4] = v20;
        dispatch_sync((dispatch_queue_t)qword_1EB283CF0, block);
        v35 = (void *)v50[5];
        _Block_object_dispose(&v49, 8);
        [self->_observers setObject:v36 forKey:(uint64_t)v34];

        ++v9;
      }
      while (v8 != v9);
      uint64_t v8 = [obj countByEnumeratingWithState:v5 objects:v55 count:16];
    }
    while (v8);
  }

  self->_requestedRegistrations = 0;
  self->_deliverNotifications = 1;
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MGNotificationRegistration;
  [(MGNotificationRegistration *)&v3 dealloc];
}

- (void)cancel
{
  objc_super v3 = (void *)MEMORY[0x1AD0C6360](self, a2);
  self->_deliverNotifications = 0;
  if (qword_1EB283CF0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A6ED9634;
    block[3] = &unk_1E5CB24A8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)qword_1EB283CF0, block);
  }
}

@end
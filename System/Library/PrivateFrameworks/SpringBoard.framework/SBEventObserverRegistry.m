@interface SBEventObserverRegistry
+ (id)sharedInstance;
- (void)addObserverWithToken:(unint64_t)a3 forEvent:(id)a4;
- (void)handleEvent:(id)a3 token:(unint64_t)a4 action:(int64_t)a5;
- (void)postEventToInterestedObservers:(__CFString *)a3;
- (void)removeObserverWithToken:(unint64_t)a3 forEvent:(id)a4;
- (void)setValue:(BOOL)a3 forState:(__CFString *)a4;
@end

@implementation SBEventObserverRegistry

+ (id)sharedInstance
{
  v2 = (void *)sharedInstance_instance;
  if (!sharedInstance_instance)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBEventObserverRegistry);
    v4 = (void *)sharedInstance_instance;
    sharedInstance_instance = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)sharedInstance_instance;
  }
  return v2;
}

- (void)handleEvent:(id)a3 token:(unint64_t)a4 action:(int64_t)a5
{
  uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x1E4F14560]), 4);
  v10 = (void *)v9;
  if (a3)
  {
    v11 = (void *)v9;
    if (a5 == 1) {
      [(SBEventObserverRegistry *)self addObserverWithToken:a4 forEvent:v9];
    }
    else {
      [(SBEventObserverRegistry *)self removeObserverWithToken:a4 forEvent:v9];
    }
    v10 = v11;
  }
}

- (void)addObserverWithToken:(unint64_t)a3 forEvent:(id)a4
{
  id v12 = a4;
  v6 = -[NSMutableDictionary objectForKey:](self->_observers, "objectForKey:");
  v7 = v6;
  if (v6)
  {
    [v6 addIndex:a3];
  }
  else
  {
    observers = self->_observers;
    if (!observers)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v10 = self->_observers;
      self->_observers = v9;

      observers = self->_observers;
    }
    v11 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a3];
    [(NSMutableDictionary *)observers setObject:v11 forKey:v12];
  }
}

- (void)removeObserverWithToken:(unint64_t)a3 forEvent:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_observers objectForKey:a4];
  [v5 removeIndex:a3];
}

- (void)postEventToInterestedObservers:(__CFString *)a3
{
  v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SBEventObserverRegistry_postEventToInterestedObservers___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(v4, block);
}

void __58__SBEventObserverRegistry_postEventToInterestedObservers___block_invoke()
{
  CFStringRef DarwinNotificationFromEvent = (const __CFString *)__SBSEventObserverGetDarwinNotificationFromEvent();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, DarwinNotificationFromEvent, 0, 0, 1u);
}

- (void)setValue:(BOOL)a3 forState:(__CFString *)a4
{
  if (setValue_forState__onceToken != -1) {
    dispatch_once(&setValue_forState__onceToken, &__block_literal_global_285);
  }
  v6 = (const char *)[ (id) __SBSEventObserverGetDarwinNotificationFromEvent() UTF8String];
  int out_token = -1;
  v7 = [(id)setValue_forState__tokenMap valueForKey:a4];
  v8 = v7;
  if (v7)
  {
    int v9 = [v7 unsignedIntValue];
    int out_token = v9;
  }
  else
  {
    if (!notify_register_check(v6, &out_token))
    {
      v10 = (void *)setValue_forState__tokenMap;
      v11 = [NSNumber numberWithInt:out_token];
      [v10 setValue:v11 forKey:a4];
    }
    int v9 = out_token;
  }
  if (v9 != -1)
  {
    id v12 = dispatch_get_global_queue(25, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__SBEventObserverRegistry_setValue_forState___block_invoke_2;
    v13[3] = &__block_descriptor_37_e5_v8__0l;
    int v14 = v9;
    BOOL v15 = a3;
    dispatch_async(v12, v13);
  }
}

void __45__SBEventObserverRegistry_setValue_forState___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  v1 = (void *)setValue_forState__tokenMap;
  setValue_forState__tokenMap = v0;
}

uint64_t __45__SBEventObserverRegistry_setValue_forState___block_invoke_2(uint64_t a1)
{
  return notify_set_state(*(_DWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 36));
}

- (void).cxx_destruct
{
}

@end
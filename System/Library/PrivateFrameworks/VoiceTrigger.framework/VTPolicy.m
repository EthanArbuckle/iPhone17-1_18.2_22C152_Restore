@interface VTPolicy
+ (id)defaultVoiceTriggerEnablePolicy;
- (BOOL)_checkAllConditionsEnabled;
- (BOOL)isEnabled;
- (VTPolicy)init;
- (void)VTEventMonitorDidReceiveEvent:(id)a3;
- (void)addConditions:(id)a3;
- (void)dealloc;
- (void)notifyCallback:(BOOL)a3;
- (void)setCallback:(id)a3;
- (void)subscribeEventMonitor:(id)a3;
@end

@implementation VTPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_conditions, 0);

  objc_storeStrong((id *)&self->_monitors, 0);
}

- (void)VTEventMonitorDidReceiveEvent:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__VTPolicy_VTEventMonitorDidReceiveEvent___block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_async(queue, block);
}

void *__42__VTPolicy_VTEventMonitorDidReceiveEvent___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  uint64_t v2 = result[3];
  if (v2)
  {
    uint64_t v3 = [result _checkAllConditionsEnabled];
    v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return (void *)v4(v2, v3);
  }
  return result;
}

- (void)notifyCallback:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__VTPolicy_notifyCallback___block_invoke;
  v4[3] = &unk_264325FC8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __27__VTPolicy_notifyCallback___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (BOOL)isEnabled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __21__VTPolicy_isEnabled__block_invoke;
  v5[3] = &unk_264325F50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__VTPolicy_isEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _checkAllConditionsEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_checkAllConditionsEnabled
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = self->_conditions;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!(*(unsigned int (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * i)))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)subscribeEventMonitor:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__VTPolicy_subscribeEventMonitor___block_invoke;
  v7[3] = &unk_264325FF0;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __34__VTPolicy_subscribeEventMonitor___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);

  return [v3 addObject:v2];
}

- (void)addConditions:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__VTPolicy_addConditions___block_invoke;
  v7[3] = &unk_264325C08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __26__VTPolicy_addConditions___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = (id)MEMORY[0x21D46B9F0](*(void *)(a1 + 40));
  [v1 addObject:v2];
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __19__VTPolicy_dealloc__block_invoke;
  block[3] = &unk_264325ED0;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)VTPolicy;
  [(VTPolicy *)&v4 dealloc];
}

void __19__VTPolicy_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "removeObserver:", *(void *)(a1 + 32), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setCallback:(id)a3
{
  self->_callback = (id)MEMORY[0x21D46B9F0](a3, a2);

  MEMORY[0x270F9A758]();
}

- (VTPolicy)init
{
  v10.receiver = self;
  v10.super_class = (Class)VTPolicy;
  id v2 = [(VTPolicy *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    monitors = v2->_monitors;
    v2->_monitors = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    conditions = v2->_conditions;
    v2->_conditions = (NSMutableArray *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("Serial VTPolicy queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)defaultVoiceTriggerEnablePolicy
{
  if (+[VTUtilities isNano])
  {
    id v2 = off_2643250E0;
  }
  else if (+[VTUtilities VTIsHorseman])
  {
    id v2 = off_2643250D0;
  }
  else
  {
    BOOL v3 = +[VTUtilities isAlwaysOn];
    id v2 = off_2643250D8;
    if (v3) {
      id v2 = off_2643250C8;
    }
  }
  id v4 = objc_alloc_init(*v2);

  return v4;
}

@end
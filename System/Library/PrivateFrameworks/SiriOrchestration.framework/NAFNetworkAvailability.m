@interface NAFNetworkAvailability
+ (id)sharedAvailability;
- (BOOL)isAvailable;
- (NAFNetworkAvailability)init;
- (void)_availabilityChanged;
- (void)_clearState;
- (void)_notifyObservers;
- (void)_startObservingAvailability;
- (void)_stopObservingAvailability;
- (void)_updateState;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NAFNetworkAvailability

+ (id)sharedAvailability
{
  if (sharedAvailability_onceToken != -1) {
    dispatch_once(&sharedAvailability_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedAvailability_sAvailability;
  return v2;
}

uint64_t __44__NAFNetworkAvailability_sharedAvailability__block_invoke()
{
  sharedAvailability_sAvailability = objc_alloc_init(NAFNetworkAvailability);
  return MEMORY[0x270F9A758]();
}

- (NAFNetworkAvailability)init
{
  v8.receiver = self;
  v8.super_class = (Class)NAFNetworkAvailability;
  v2 = [(NAFNetworkAvailability *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v5 = dispatch_queue_create("NAFNetworkAvailability", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_notifyToken = -1;
  }
  return v2;
}

- (void)_updateState
{
  uint64_t v3 = nwi_state_copy();
  if (!v3) {
    goto LABEL_8;
  }
  if (nwi_state_get_first_ifstate() && (nwi_ifstate_get_flags() & 4) != 0)
  {
    char state = (char)self->_state;
    p_char state = &self->_state;
    char v5 = state;
    goto LABEL_13;
  }
  if (!nwi_state_get_first_ifstate())
  {
LABEL_8:
    char v8 = (char)self->_state;
    p_char state = &self->_state;
    *(unsigned char *)p_char state = v8 & 0xFD;
    if ((AFIsNano() & 1) == 0) {
      goto LABEL_18;
    }
    if (!v3)
    {
      char v11 = 0;
      char v9 = *(unsigned char *)p_state;
      goto LABEL_17;
    }
LABEL_10:
    if (nwi_state_get_reachability_flags())
    {
      char v9 = *(unsigned char *)p_state;
    }
    else
    {
      reachability_char flags = nwi_state_get_reachability_flags();
      char v9 = *(unsigned char *)p_state;
      if (!reachability_flags)
      {
        char v11 = 0;
        goto LABEL_17;
      }
    }
    char v11 = 2;
LABEL_17:
    *(unsigned char *)p_char state = v11 | v9 & 0xFD;
LABEL_18:
    if (!v3) {
      return;
    }
    goto LABEL_19;
  }
  char flags = nwi_ifstate_get_flags();
  char v7 = (char)self->_state;
  p_char state = &self->_state;
  char v5 = v7;
  if ((flags & 4) == 0)
  {
    *(unsigned char *)p_char state = v5 & 0xFD;
    if ((AFIsNano() & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_10;
  }
LABEL_13:
  *(unsigned char *)p_char state = v5 | 2;
LABEL_19:
  MEMORY[0x270EDA820](v3);
}

- (void)_clearState
{
  *(unsigned char *)&self->_state &= ~1u;
}

- (void)_availabilityChanged
{
  AvailabilityState state = self->_state;
  [(NAFNetworkAvailability *)self _updateState];
  if (self->_notifyToken != -1 && (*(unsigned char *)&self->_state & 1) == 0) {
    *(unsigned char *)&self->_state |= 1u;
  }
  if ((*(unsigned char *)&state & 1) == 0 || ((*(unsigned char *)&self->_state ^ *(unsigned int *)&state) & 2) != 0)
  {
    [(NAFNetworkAvailability *)self _notifyObservers];
  }
}

- (void)_notifyObservers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "networkAvailability:isAvailable:", self, (*(unsigned char *)&self->_state >> 1) & 1, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_startObservingAvailability
{
  if (self->_notifyToken == -1)
  {
    notify_key = (const char *)nwi_state_get_notify_key();
    int out_token = -1;
    queue = self->_queue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __53__NAFNetworkAvailability__startObservingAvailability__block_invoke;
    v5[3] = &unk_26550E108;
    v5[4] = self;
    if (!notify_register_dispatch(notify_key, &out_token, queue, v5)) {
      self->_notifyToken = out_token;
    }
  }
}

uint64_t __53__NAFNetworkAvailability__startObservingAvailability__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _availabilityChanged];
}

- (void)_stopObservingAvailability
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    [(NAFNetworkAvailability *)self _clearState];
  }
}

- (BOOL)isAvailable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__NAFNetworkAvailability_isAvailable__block_invoke;
  v5[3] = &unk_26550E130;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

unsigned char *__37__NAFNetworkAvailability_isAvailable__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  char v3 = result[20];
  if ((v3 & 1) == 0)
  {
    result = (unsigned char *)[result _updateState];
    char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 20);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (v3 & 2) != 0;
  return result;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__NAFNetworkAvailability_addObserver___block_invoke;
    v7[3] = &unk_26550E158;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

_DWORD *__38__NAFNetworkAvailability_addObserver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:0];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  [v2 addObject:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) count];
  result = *(_DWORD **)(a1 + 32);
  if (v6 == 1 || result[4] == -1)
  {
    [result _startObservingAvailability];
    id v8 = *(void **)(a1 + 32);
    return (_DWORD *)[v8 _availabilityChanged];
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__NAFNetworkAvailability_removeObserver___block_invoke;
    v7[3] = &unk_26550E158;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __41__NAFNetworkAvailability_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  if (!result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0;

    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 _stopObservingAvailability];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
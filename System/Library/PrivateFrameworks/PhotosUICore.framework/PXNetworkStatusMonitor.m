@interface PXNetworkStatusMonitor
+ (PXNetworkStatusMonitor)sharedInstance;
- ($CE86B1AE65D1A4A4B278E4ED99C18EFC)bestAvailableNetworkType;
- (PXNetworkStatusMonitor)init;
- (void)_queue_handlePathUpdate:(id)a3;
- (void)_queue_notifyObserversOfBestAvailableNetworkType:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
@end

@implementation PXNetworkStatusMonitor

void __40__PXNetworkStatusMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PXNetworkStatusMonitor);
  v1 = (void *)sharedInstance_sharedInstance_283000;
  sharedInstance_sharedInstance_283000 = (uint64_t)v0;
}

+ (PXNetworkStatusMonitor)sharedInstance
{
  if (sharedInstance_onceToken_282998 != -1) {
    dispatch_once(&sharedInstance_onceToken_282998, &__block_literal_global_282999);
  }
  v2 = (void *)sharedInstance_sharedInstance_283000;
  return (PXNetworkStatusMonitor *)v2;
}

uint64_t __30__PXNetworkStatusMonitor_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handlePathUpdate:", a2);
}

- (PXNetworkStatusMonitor)init
{
  if (self)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.PXNetworkStatusMonitor", v3);
    queue = self->_queue;
    self->_queue = v4;

    v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    queue_observers = self->_queue_observers;
    self->_queue_observers = v6;

    v8 = (OS_nw_path_monitor *)nw_path_monitor_create();
    defaultPathMonitor = self->_defaultPathMonitor;
    self->_defaultPathMonitor = v8;

    if (self->_defaultPathMonitor)
    {
      v10 = self;
      v11 = self->_defaultPathMonitor;
      update_handler[0] = MEMORY[0x1E4F143A8];
      update_handler[1] = 3221225472;
      update_handler[2] = __30__PXNetworkStatusMonitor_init__block_invoke;
      update_handler[3] = &unk_1E5DD0560;
      v16 = v10;
      nw_path_monitor_set_update_handler(v11, update_handler);
      nw_path_monitor_set_queue((nw_path_monitor_t)self->_defaultPathMonitor, (dispatch_queue_t)self->_queue);
      nw_path_monitor_start((nw_path_monitor_t)self->_defaultPathMonitor);
      dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_28_282989);
      p_super = &v16->super;
    }
    else
    {
      p_super = PLUIGetLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1A9AE7000, p_super, OS_LOG_TYPE_ERROR, "nw_path_monitor_create() failed", v14, 2u);
      }
    }
  }
  return self;
}

- (void)_queue_notifyObserversOfBestAvailableNetworkType:(id)a3
{
  uint64_t v3 = *(void *)&a3.var1;
  unint64_t var0 = a3.var0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(NSMapTable *)self->_queue_observers keyEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        if (v11)
        {
          v12 = [(NSMapTable *)self->_queue_observers objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * v10)];
          v13 = v12;
          if (v12)
          {
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = __75__PXNetworkStatusMonitor__queue_notifyObserversOfBestAvailableNetworkType___block_invoke;
            v14[3] = &unk_1E5DD05B0;
            v14[4] = v11;
            v14[5] = self;
            v14[6] = var0;
            v14[7] = v3;
            dispatch_async(v12, v14);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)_queue_handlePathUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  nw_path_status_t status = nw_path_get_status(v4);
  if (nw_path_uses_interface_type(v4, nw_interface_type_wired))
  {
    unint64_t v6 = 4;
  }
  else if (nw_path_uses_interface_type(v4, nw_interface_type_wifi))
  {
    unint64_t v6 = 2;
  }
  else if (nw_path_uses_interface_type(v4, nw_interface_type_cellular))
  {
    unint64_t v6 = 3;
  }
  else if (nw_path_uses_interface_type(v4, nw_interface_type_other))
  {
    unint64_t v6 = 5;
  }
  else
  {
    unint64_t v6 = 1;
  }
  uint64_t v7 = @"invalid";
  uint64_t v8 = @" reason:notAvailable";
  uint64_t v9 = @"unsatisfied";
  switch(status)
  {
    case nw_path_status_invalid:
      goto LABEL_14;
    case nw_path_status_satisfied:
      uint64_t v7 = @"satisfied";
      goto LABEL_14;
    case nw_path_status_unsatisfied:
      break;
    case nw_path_status_satisfiable:
      uint64_t v7 = @"satisfiable";
LABEL_14:
      uint64_t v8 = &stru_1F00B0030;
      uint64_t v9 = v7;
      break;
    default:
      uint64_t v9 = 0;
      uint64_t v8 = &stru_1F00B0030;
      break;
  }
  BOOL is_constrained = nw_path_is_constrained(v4);
  BOOL is_expensive = nw_path_is_expensive(v4);
  uint64_t v12 = 256;
  if (!is_expensive) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v12 | is_constrained;
  v14 = PLUIGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = PXNetworkDetailsDescription(v6, v13);
    int v17 = 138412802;
    long long v18 = v15;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "PXNetworkStatusMonitor %@ status:%@%@", (uint8_t *)&v17, 0x20u);
  }
  if ((status & 0xFFFFFFFD) == 1) {
    unint64_t v16 = v6;
  }
  else {
    unint64_t v16 = 1;
  }
  self->queue_bestAvailableNetworkType.type = v16;
  *(void *)&self->queue_bestAvailableNetworkType.isConstrained = v13;
  -[PXNetworkStatusMonitor _queue_notifyObserversOfBestAvailableNetworkType:](self, "_queue_notifyObserversOfBestAvailableNetworkType:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaultPathMonitor, 0);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PXNetworkStatusMonitor_registerObserver_queue___block_invoke;
  block[3] = &unk_1E5DD0F30;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

uint64_t __49__PXNetworkStatusMonitor_registerObserver_queue___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) setObject:a1[5] forKey:a1[6]];
}

uint64_t __75__PXNetworkStatusMonitor__queue_notifyObserversOfBestAvailableNetworkType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkStatusMonitor:didChangeBestAvailableNetworkType:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- ($CE86B1AE65D1A4A4B278E4ED99C18EFC)bestAvailableNetworkType
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = &unk_1AB5D584F;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PXNetworkStatusMonitor_bestAvailableNetworkType__block_invoke;
  v7[3] = &unk_1E5DD0588;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  unint64_t v3 = v9[4];
  uint64_t v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  unint64_t v5 = v3;
  BOOL v6 = v4;
  result.var1 = v6;
  result.var2 = BYTE1(v6);
  result.unint64_t var0 = v5;
  return result;
}

__n128 __50__PXNetworkStatusMonitor_bestAvailableNetworkType__block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 32);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

@end
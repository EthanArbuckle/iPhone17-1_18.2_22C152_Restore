@interface SBFMotionGestureController
+ (id)sharedInstance;
- (BOOL)_hasObservers;
- (SBFMotionGestureController)init;
- (id)_highestPriorityObservers;
- (id)_observersForPriority:(unint64_t)a3;
- (void)_addGestureManager;
- (void)_addGestureObserver:(id)a3 withPriority:(unint64_t)a4;
- (void)_enumerateObserversByPriority:(id)a3;
- (void)_notifyObserversOfGesture:(int)a3;
- (void)_removeGestureManager;
- (void)_removeGestureObserver:(id)a3;
- (void)_updateGestureManager;
- (void)addGestureObserver:(id)a3;
- (void)addGestureObserver:(id)a3 withPriority:(unint64_t)a4;
- (void)dealloc;
- (void)removeGestureObserver:(id)a3;
@end

@implementation SBFMotionGestureController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SBFMotionGestureController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_sbf_once_token_0 != -1) {
    dispatch_once(&sharedInstance_sbf_once_token_0, block);
  }
  v2 = (void *)sharedInstance_sbf_once_object_0;
  return v2;
}

uint64_t __44__SBFMotionGestureController_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = sharedInstance_sbf_once_object_0;
  sharedInstance_sbf_once_object_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SBFMotionGestureController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBFMotionGestureController;
  v2 = [(SBFMotionGestureController *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersByPriority = v2->_observersByPriority;
    v2->_observersByPriority = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(SBFMotionGestureController *)self _removeGestureManager];
  v3.receiver = self;
  v3.super_class = (Class)SBFMotionGestureController;
  [(SBFMotionGestureController *)&v3 dealloc];
}

- (void)addGestureObserver:(id)a3
{
}

- (void)addGestureObserver:(id)a3 withPriority:(unint64_t)a4
{
  [(SBFMotionGestureController *)self _addGestureObserver:a3 withPriority:a4];
  [(SBFMotionGestureController *)self _updateGestureManager];
}

- (void)removeGestureObserver:(id)a3
{
  [(SBFMotionGestureController *)self _removeGestureObserver:a3];
  [(SBFMotionGestureController *)self _updateGestureManager];
}

- (void)_addGestureObserver:(id)a3 withPriority:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    [(SBFMotionGestureController *)self _removeGestureObserver:v6];
    v7 = [(SBFMotionGestureController *)self _observersForPriority:a4];
    if (([v7 containsObject:v6] & 1) == 0)
    {
      v8 = SBLogMotionGesture();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[SBFMotionGestureController _addGestureObserver:withPriority:]((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
      }

      [v7 addObject:v6];
    }
  }
}

- (void)_removeGestureObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__SBFMotionGestureController__removeGestureObserver___block_invoke;
    v6[3] = &unk_1E548D5F0;
    id v7 = v4;
    [(SBFMotionGestureController *)self _enumerateObserversByPriority:v6];
  }
}

void __53__SBFMotionGestureController__removeGestureObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = (void *)(a1 + 32);
  if ([v3 containsObject:v5])
  {
    id v6 = SBLogMotionGesture();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __53__SBFMotionGestureController__removeGestureObserver___block_invoke_cold_1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }

    [v3 removeObject:*v4];
  }
}

- (void)_notifyObserversOfGesture:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBFMotionGestureController *)self _highestPriorityObservers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!a3)
        {
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
          uint64_t v10 = SBLogMotionGesture();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v9;
            _os_log_debug_impl(&dword_18B52E000, v10, OS_LOG_TYPE_DEBUG, "Notifying observer: %@ of raise gesture", buf, 0xCu);
          }

          [v9 didReceiveRaiseGesture];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v6);
  }
}

- (BOOL)_hasObservers
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__SBFMotionGestureController__hasObservers__block_invoke;
  v4[3] = &unk_1E548D618;
  v4[4] = &v5;
  [(SBFMotionGestureController *)self _enumerateObserversByPriority:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __43__SBFMotionGestureController__hasObservers__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 count];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_enumerateObserversByPriority:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_observersByPriority copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SBFMotionGestureController__enumerateObserversByPriority___block_invoke;
  v7[3] = &unk_1E548D640;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __60__SBFMotionGestureController__enumerateObserversByPriority___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, [a2 integerValue], a4);
}

- (id)_highestPriorityObservers
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__2;
  uint64_t v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SBFMotionGestureController__highestPriorityObservers__block_invoke;
  v4[3] = &unk_1E548D668;
  v4[4] = v11;
  void v4[5] = &v5;
  [(SBFMotionGestureController *)self _enumerateObserversByPriority:v4];
  char v2 = (void *)[(id)v6[5] copy];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(v11, 8);
  return v2;
}

void __55__SBFMotionGestureController__highestPriorityObservers__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v6 = a2;
  if ([v6 count] && *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) <= a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)_observersForPriority:(unint64_t)a3
{
  observersByPriority = self->_observersByPriority;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v7 = [(NSMutableDictionary *)observersByPriority objectForKey:v6];

  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v8 = self->_observersByPriority;
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 setObject:v7 forKey:v9];
  }
  return v7;
}

- (void)_updateGestureManager
{
  if ([(SBFMotionGestureController *)self _hasObservers] && !self->_motionGestureManager)
  {
    [(SBFMotionGestureController *)self _addGestureManager];
  }
  else if (![(SBFMotionGestureController *)self _hasObservers] && self->_motionGestureManager)
  {
    [(SBFMotionGestureController *)self _removeGestureManager];
  }
}

- (void)_addGestureManager
{
}

void __48__SBFMotionGestureController__addGestureManager__block_invoke(uint64_t a1, int a2)
{
  int v3 = a2;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v2);
}

void __48__SBFMotionGestureController__addGestureManager__block_invoke_2(uint64_t a1)
{
  id v2 = SBLogMotionGesture();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __48__SBFMotionGestureController__addGestureManager__block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyObserversOfGesture:*(unsigned int *)(a1 + 40)];
}

- (void)_removeGestureManager
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_18B52E000, log, OS_LOG_TYPE_DEBUG, "Removing motion gesture manager", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionGestureManager, 0);
  objc_storeStrong((id *)&self->_observersByPriority, 0);
}

- (void)_addGestureObserver:(uint64_t)a3 withPriority:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__SBFMotionGestureController__removeGestureObserver___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __48__SBFMotionGestureController__addGestureManager__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
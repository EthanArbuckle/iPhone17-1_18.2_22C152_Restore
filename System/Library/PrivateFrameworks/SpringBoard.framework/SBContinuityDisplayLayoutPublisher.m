@interface SBContinuityDisplayLayoutPublisher
- (BOOL)isTransitioning;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSDisplayLayout)currentLayout;
- (SBContinuityDisplayLayoutPublisher)initWithCoordinator:(id)a3;
- (id)addElement:(id)a3;
- (id)transitionAssertionWithReason:(id)a3;
- (int64_t)backlightLevel;
- (int64_t)interfaceOrientation;
- (void)_removeElementForKey:(id)a3;
- (void)_removeTransitionForKey:(id)a3;
- (void)activate;
- (void)addObserver:(id)a3;
- (void)currentLayout;
- (void)dealloc;
- (void)flush;
- (void)invalidate;
- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setBacklightLevel:(int64_t)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
@end

@implementation SBContinuityDisplayLayoutPublisher

- (SBContinuityDisplayLayoutPublisher)initWithCoordinator:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBContinuityDisplayLayoutPublisher;
  v6 = [(SBContinuityDisplayLayoutPublisher *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coordinator, a3);
    uint64_t v8 = [v5 rootPublisher];
    rootPublisher = v7->_rootPublisher;
    v7->_rootPublisher = (FBSDisplayLayoutPublisher *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    elementsPendingActivation = v7->_elementsPendingActivation;
    v7->_elementsPendingActivation = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeElements = v7->_activeElements;
    v7->_activeElements = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    transitionsPendingActivation = v7->_transitionsPendingActivation;
    v7->_transitionsPendingActivation = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeTransitions = v7->_activeTransitions;
    v7->_activeTransitions = v18;

    v20 = (FBSDisplayLayout *)objc_alloc_init(MEMORY[0x1E4F62930]);
    emptyLayout = v7->_emptyLayout;
    v7->_emptyLayout = v20;

    v7->_pendedBacklightLevel = [(FBSDisplayLayout *)v7->_emptyLayout displayBacklightLevel];
    v7->_pendedInterfaceOrientation = [(FBSDisplayLayout *)v7->_emptyLayout interfaceOrientation];
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"SBContinuityDisplayLayoutPublisher.m";
  __int16 v10 = 1024;
  int v11 = 60;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_displayConfiguration)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBContinuityDisplayLayoutPublisher.m" lineNumber:64 description:@"Alreadying tracking a display configuration"];

    id v5 = v9;
  }
  v6 = (FBSDisplayConfiguration *)[v5 copy];
  displayConfiguration = self->_displayConfiguration;
  self->_displayConfiguration = v6;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (FBSDisplayLayout)currentLayout
{
  if (self->_activated)
  {
    if (self->_invalidated)
    {
      v3 = SBLogContinuitySession();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        -[SBContinuityDisplayLayoutPublisher currentLayout](v3);
      }

      v4 = 0;
    }
    else
    {
      v4 = [(FBSDisplayLayoutPublisher *)self->_rootPublisher currentLayout];
    }
  }
  else
  {
    id v5 = SBLogContinuitySession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBContinuityDisplayLayoutPublisher currentLayout](v5);
    }

    v4 = self->_emptyLayout;
  }
  return v4;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_activated)
  {
    if (self->_invalidated)
    {
      id v5 = SBLogContinuitySession();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = BSInterfaceOrientationDescription();
        int v10 = 138543362;
        int v11 = v6;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring setting interface orientation on display layout publisher to %{public}@ because it is invalid", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      rootPublisher = self->_rootPublisher;
      -[FBSDisplayLayoutPublisher setInterfaceOrientation:](rootPublisher, "setInterfaceOrientation:");
    }
  }
  else
  {
    __int16 v7 = SBLogContinuitySession();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = BSInterfaceOrientationDescription();
      int v10 = 138543362;
      int v11 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Pending setting interface orientation on display layout publisher to %{public}@ because it is not activated", (uint8_t *)&v10, 0xCu);
    }
    self->_pendedInterfaceOrientation = a3;
  }
}

- (int64_t)interfaceOrientation
{
  if (!self->_activated) {
    return self->_pendedInterfaceOrientation;
  }
  if (self->_invalidated) {
    emptyLayout = self->_emptyLayout;
  }
  else {
    emptyLayout = self->_rootPublisher;
  }
  return [(FBSDisplayLayout *)emptyLayout interfaceOrientation];
}

- (void)setBacklightLevel:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_activated)
  {
    if (self->_invalidated)
    {
      id v5 = SBLogContinuitySession();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 134217984;
        int64_t v9 = a3;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring setting backlight level display layout publisher to %ld because it is invalid", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      rootPublisher = self->_rootPublisher;
      -[FBSDisplayLayoutPublisher setBacklightLevel:](rootPublisher, "setBacklightLevel:");
    }
  }
  else
  {
    v6 = SBLogContinuitySession();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      int64_t v9 = a3;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Pending setting backlight level on display layout publisher to %ld because it is not activated", (uint8_t *)&v8, 0xCu);
    }

    self->_pendedBacklightLevel = a3;
  }
}

- (int64_t)backlightLevel
{
  if (!self->_activated) {
    return self->_pendedBacklightLevel;
  }
  if (self->_invalidated) {
    return [(FBSDisplayLayout *)self->_emptyLayout displayBacklightLevel];
  }
  return [(FBSDisplayLayoutPublisher *)self->_rootPublisher backlightLevel];
}

- (void)addObserver:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_observers, "addObject:");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (id)addElement:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  __int16 v7 = NSStringFromClass(v6);
  int v8 = [v4 identifier];
  int64_t v9 = [v5 stringWithFormat:@"<%@:%p %@>", v7, v4, v8];

  if (self->_activated)
  {
    BOOL invalidated = self->_invalidated;
    int v11 = SBLogContinuitySession();
    uint64_t v12 = v11;
    if (invalidated)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v4;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Failed to add element %{public}@ to display layout publisher because it is invalid", buf, 0xCu);
      }

      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F4F838]) initWithIdentifier:@"com.apple.springBoard.continuity.layout.publisher.add-element" forReason:v9 invalidationBlock:&__block_literal_global_311];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[SBContinuityDisplayLayoutPublisher addElement:]((uint64_t)v4, v12);
      }

      v16 = [(FBSDisplayLayoutPublisher *)self->_rootPublisher addElement:v4];
      [(NSMutableDictionary *)self->_activeElements setObject:v16 forKey:v9];
      id v17 = objc_alloc(MEMORY[0x1E4F4F838]);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __49__SBContinuityDisplayLayoutPublisher_addElement___block_invoke_25;
      v19[3] = &unk_1E6AFD050;
      v19[4] = self;
      id v20 = v9;
      uint64_t v13 = (void *)[v17 initWithIdentifier:@"com.apple.springBoard.continuity.layout.publisher.add-element" forReason:v20 invalidationBlock:v19];
    }
  }
  else
  {
    uint64_t v14 = SBLogContinuitySession();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v4;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Pending activation of layout element %{public}@ to display layout publisher because the layout monitor is not activated yet", buf, 0xCu);
    }

    [(NSMutableDictionary *)self->_elementsPendingActivation setObject:v4 forKey:v9];
    id v15 = objc_alloc(MEMORY[0x1E4F4F838]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __49__SBContinuityDisplayLayoutPublisher_addElement___block_invoke;
    v21[3] = &unk_1E6AFD050;
    v21[4] = self;
    id v22 = v9;
    uint64_t v13 = (void *)[v15 initWithIdentifier:@"com.apple.springBoard.continuity.layout.publisher.add-element" forReason:v22 invalidationBlock:v21];
  }
  return v13;
}

uint64_t __49__SBContinuityDisplayLayoutPublisher_addElement___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeElementForKey:*(void *)(a1 + 40)];
}

uint64_t __49__SBContinuityDisplayLayoutPublisher_addElement___block_invoke_25(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeElementForKey:*(void *)(a1 + 40)];
}

- (BOOL)isTransitioning
{
  return [(NSMutableDictionary *)self->_transitionsPendingActivation count]
      || [(NSMutableDictionary *)self->_activeTransitions count] != 0;
}

- (id)transitionAssertionWithReason:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  id v5 = [MEMORY[0x1E4F29128] UUID];
  v6 = NSString;
  uint64_t v7 = [v5 UUIDString];
  int v8 = (void *)v7;
  int64_t v9 = @"nil";
  if (v4) {
    int64_t v9 = v4;
  }
  uint64_t v10 = [v6 stringWithFormat:@"<%@:%p (%@)>", v7, v5, v9];

  if (self->_activated)
  {
    if (self->_invalidated)
    {
      int v11 = SBLogContinuitySession();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v4;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Failed to start transition with reason %{public}@ for display layout publisher because it is invalid", buf, 0xCu);
      }

      id v12 = objc_alloc(MEMORY[0x1E4F4F838]);
      if (v4) {
        uint64_t v13 = v4;
      }
      else {
        uint64_t v13 = @"<nil>";
      }
      uint64_t v14 = (void *)[v12 initWithIdentifier:@"com.apple.springBoard.continuity.layout.publisher.transition" forReason:v13 invalidationBlock:&__block_literal_global_41_4];
    }
    else
    {
      v18 = [(FBSDisplayLayoutPublisher *)self->_rootPublisher transitionAssertionWithReason:v4];
      [(NSMutableDictionary *)self->_activeTransitions setObject:v18 forKey:v10];
      id v19 = objc_alloc(MEMORY[0x1E4F4F838]);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __68__SBContinuityDisplayLayoutPublisher_transitionAssertionWithReason___block_invoke_2;
      v22[3] = &unk_1E6AFD050;
      v22[4] = self;
      id v23 = v10;
      uint64_t v14 = (void *)[v19 initWithIdentifier:@"com.apple.springBoard.continuity.layout.publisher.transition" forReason:v23 invalidationBlock:v22];
    }
  }
  else
  {
    id v15 = SBLogContinuitySession();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v4;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Pending transition with reason %{public}@ to display layout publisher because the layout monitor is not activated yet", buf, 0xCu);
    }

    transitionsPendingActivation = self->_transitionsPendingActivation;
    if (v4)
    {
      id v17 = (void *)[(__CFString *)v4 copy];
      [(NSMutableDictionary *)transitionsPendingActivation setObject:v17 forKey:v10];
    }
    else
    {
      [(NSMutableDictionary *)self->_transitionsPendingActivation setObject:@"__SBContinuityDisplayLayoutPublisherUnknownTransitionReason__" forKey:v10];
    }
    id v20 = objc_alloc(MEMORY[0x1E4F4F838]);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __68__SBContinuityDisplayLayoutPublisher_transitionAssertionWithReason___block_invoke;
    v24[3] = &unk_1E6AFD050;
    v24[4] = self;
    id v25 = v10;
    uint64_t v14 = (void *)[v20 initWithIdentifier:@"com.apple.springBoard.continuity.layout.publisher.transition" forReason:v25 invalidationBlock:v24];
  }
  return v14;
}

uint64_t __68__SBContinuityDisplayLayoutPublisher_transitionAssertionWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeTransitionForKey:*(void *)(a1 + 40)];
}

uint64_t __68__SBContinuityDisplayLayoutPublisher_transitionAssertionWithReason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeTransitionForKey:*(void *)(a1 + 40)];
}

- (void)flush
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_activated && !self->_invalidated)
  {
    rootPublisher = self->_rootPublisher;
    [(FBSDisplayLayoutPublisher *)rootPublisher flush];
  }
  else
  {
    v3 = SBLogContinuitySession();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_invalidated) {
        id v4 = @"invalid";
      }
      else {
        id v4 = @"not activated";
      }
      int v6 = 138543362;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Failed to flush display layout publisher because it is %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)invalidate
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  self->_BOOL invalidated = 1;
  [(FBSDisplayLayoutPublisher *)self->_rootPublisher removeObserver:self];
  v3 = [(FBSDisplayLayoutPublisher *)self->_rootPublisher transitionAssertionWithReason:@"invalidating continuity publisher"];
  [(FBSDisplayLayoutPublisher *)self->_rootPublisher setDisplayConfiguration:0];
  [(FBSDisplayLayoutPublisher *)self->_rootPublisher setBacklightLevel:[(FBSDisplayLayout *)self->_emptyLayout displayBacklightLevel]];
  [(FBSDisplayLayoutPublisher *)self->_rootPublisher setInterfaceOrientation:[(FBSDisplayLayout *)self->_emptyLayout interfaceOrientation]];
  [(NSMutableDictionary *)self->_elementsPendingActivation removeAllObjects];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(NSMutableDictionary *)self->_activeElements allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = [(NSMutableDictionary *)self->_activeElements objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * v8)];
        [v9 invalidate];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_activeElements removeAllObjects];
  [(NSMutableDictionary *)self->_transitionsPendingActivation removeAllObjects];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [(NSMutableDictionary *)self->_activeTransitions allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [(NSMutableDictionary *)self->_activeTransitions objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * v14)];
        [v15 invalidate];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }

  [(NSMutableDictionary *)self->_activeTransitions removeAllObjects];
  [(BSInvalidatable *)self->_coordinatorActivation invalidate];
  [v3 invalidate];
  rootPublisher = self->_rootPublisher;
  id v17 = [(SBContinuityDisplayLayoutPublisher *)self currentLayout];
  [(SBContinuityDisplayLayoutPublisher *)self publisher:rootPublisher didUpdateLayout:v17 withTransition:0];
}

- (void)activate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  int64_t v9 = @"SBContinuityDisplayLayoutPublisher.m";
  __int16 v10 = 1024;
  int v11 = 263;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_removeElementForKey:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [(NSMutableDictionary *)self->_elementsPendingActivation objectForKey:v4];
  if (v5)
  {
    uint64_t v6 = SBLogContinuitySession();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SBContinuityDisplayLayoutPublisher _removeElementForKey:]((uint64_t)v5, v6);
    }
  }
  [(NSMutableDictionary *)self->_elementsPendingActivation removeObjectForKey:v4];
  __int16 v7 = [(NSMutableDictionary *)self->_activeElements objectForKey:v4];
  [v7 invalidate];
  [(NSMutableDictionary *)self->_activeElements removeObjectForKey:v4];
}

- (void)_removeTransitionForKey:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [(NSMutableDictionary *)self->_transitionsPendingActivation objectForKey:v4];
  if (v5)
  {
    uint64_t v6 = SBLogContinuitySession();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SBContinuityDisplayLayoutPublisher _removeTransitionForKey:](v5, v6);
    }
  }
  [(NSMutableDictionary *)self->_transitionsPendingActivation removeObjectForKey:v4];
  __int16 v7 = [(NSMutableDictionary *)self->_activeTransitions objectForKey:v4];
  [v7 invalidate];
  [(NSMutableDictionary *)self->_activeTransitions removeObjectForKey:v4];
}

- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v11 = self->_observers;
  uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "publisher:didUpdateLayout:withTransition:", v8, v9, v10, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTransitions, 0);
  objc_storeStrong((id *)&self->_transitionsPendingActivation, 0);
  objc_storeStrong((id *)&self->_activeElements, 0);
  objc_storeStrong((id *)&self->_elementsPendingActivation, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_emptyLayout, 0);
  objc_storeStrong((id *)&self->_rootPublisher, 0);
  objc_storeStrong((id *)&self->_coordinatorActivation, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

- (void)currentLayout
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "display layout publisher is returning a nil currentLayout because it is invalid", v1, 2u);
}

- (void)addElement:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Adding element %{public}@ to display layout publisher", (uint8_t *)&v2, 0xCu);
}

- (void)_removeElementForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "removed pended element %@", (uint8_t *)&v2, 0xCu);
}

- (void)_removeTransitionForKey:(__CFString *)a1 .cold.1(__CFString *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = [(__CFString *)a1 isEqualToString:@"__SBContinuityDisplayLayoutPublisherUnknownTransitionReason__"];
  uint64_t v5 = @"nil";
  if (!v4) {
    uint64_t v5 = a1;
  }
  int v6 = 138412290;
  __int16 v7 = v5;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Finished pended transition for reason %@", (uint8_t *)&v6, 0xCu);
}

@end
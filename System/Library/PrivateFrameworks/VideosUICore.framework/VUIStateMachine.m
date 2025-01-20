@interface VUIStateMachine
+ (id)stateMachineWithName:(id)a3;
+ (id)stateMachinesOfType:(Class)a3;
+ (void)deregisterStateMachine:(id)a3;
+ (void)initialize;
+ (void)registerStateMachine:(id)a3;
- (BOOL)callsStateChangeHandlerSynchronously;
- (BOOL)shouldAcceptEvents;
- (NSArray)ignorableEvents;
- (NSString)currentState;
- (NSString)name;
- (OS_os_log)logObject;
- (VUIStateMachine)initWithName:(id)a3 initialState:(id)a4 mode:(int64_t)a5;
- (VUIStateMachine)initWithName:(id)a3 initialState:(id)a4 mode:(int64_t)a5 stateChangeHandler:(id)a6;
- (id)_eventHandlerForEvent:(id)a3;
- (int64_t)mode;
- (void)_dispatchEvent:(id)a3;
- (void)_executePostTransitionBlocks;
- (void)_processEvent:(id)a3;
- (void)_processNextEvent;
- (void)_transitionToState:(id)a3 withEvent:(id)a4 context:(id)a5 userInfo:(id)a6;
- (void)deregisterHandlers;
- (void)executeBlockAfterCurrentStateTransition:(id)a3;
- (void)logUnhandledEvents;
- (void)postEvent:(id)a3;
- (void)postEvent:(id)a3 withContext:(id)a4;
- (void)postEvent:(id)a3 withContext:(id)a4 userInfo:(id)a5;
- (void)purgeEventQueue;
- (void)registerDefaultHandlerForEvent:(id)a3 withBlock:(id)a4;
- (void)registerHandlerForEvent:(id)a3 onState:(id)a4 withBlock:(id)a5;
- (void)registerHandlerForEvent:(id)a3 onStates:(id)a4 withBlock:(id)a5;
- (void)registerHandlerForEvents:(id)a3 onStates:(id)a4 withBlock:(id)a5;
- (void)registerStateTransitionFromState:(id)a3 onEvent:(id)a4 toState:(id)a5;
- (void)setCallsStateChangeHandlerSynchronously:(BOOL)a3;
- (void)setCurrentState:(id)a3;
- (void)setIgnorableEvents:(id)a3;
- (void)setLogObject:(id)a3;
- (void)setShouldAcceptEvents:(BOOL)a3;
@end

@implementation VUIStateMachine

- (void)postEvent:(id)a3 withContext:(id)a4 userInfo:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [(VUIStateMachine *)self shouldAcceptEvents])
  {
    v11 = [(VUIStateMachine *)self ignorableEvents];
    int v12 = [v11 containsObject:v8];

    if (!v12)
    {
      v16 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v8 forKey:@"VUIStateMachineEventKey"];
      v14 = v16;
      if (v9) {
        [v16 setObject:v9 forKey:@"VUIStateMachineContextKey"];
      }
      if (v10) {
        [v14 setObject:v10 forKey:@"VUIStateMachineUserInfoKey"];
      }
      v17 = self->_events;
      objc_sync_enter(v17);
      [(NSMutableArray *)self->_events addObject:v14];
      uint64_t v18 = [(NSMutableArray *)self->_events count];
      objc_sync_exit(v17);

      if (v18 == 1)
      {
        v19 = [(VUIStateMachine *)self logObject];

        if (v19)
        {
          v20 = [(VUIStateMachine *)self logObject];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = [(VUIStateMachine *)self name];
            int v22 = 138412546;
            v23 = v21;
            __int16 v24 = 2112;
            id v25 = v8;
            _os_log_impl(&dword_1E29E1000, v20, OS_LOG_TYPE_DEFAULT, "State machine [%@] received event [%@], initiating event processing", (uint8_t *)&v22, 0x16u);
          }
        }
        [(VUIStateMachine *)self _processNextEvent];
      }
      goto LABEL_17;
    }
    v13 = [(VUIStateMachine *)self logObject];

    if (v13)
    {
      v14 = [(VUIStateMachine *)self logObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [(VUIStateMachine *)self name];
        int v22 = 138412546;
        v23 = v15;
        __int16 v24 = 2112;
        id v25 = v8;
        _os_log_impl(&dword_1E29E1000, v14, OS_LOG_TYPE_DEFAULT, "State machine named [%@] received ignorable event [%@]", (uint8_t *)&v22, 0x16u);
      }
LABEL_17:
    }
  }
}

- (void)_processNextEvent
{
  v3 = self->_events;
  objc_sync_enter(v3);
  if ([(NSMutableArray *)self->_events count])
  {
    id v5 = [(NSMutableArray *)self->_events objectAtIndex:0];
  }
  else
  {
    id v5 = 0;
  }
  objc_sync_exit(v3);

  v4 = v5;
  if (v5)
  {
    if (self->_mode) {
      [(VUIStateMachine *)self _dispatchEvent:v5];
    }
    else {
      [(VUIStateMachine *)self _processEvent:v5];
    }
    v4 = v5;
  }
}

- (void)_processEvent:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  if (v20)
  {
    v4 = v20;
    do
    {
      id v5 = [v4 objectForKey:@"VUIStateMachineEventKey"];
      v6 = [v4 objectForKey:@"VUIStateMachineUserInfoKey"];
      v7 = [v4 objectForKey:@"VUIStateMachineContextKey"];
      id v8 = [(VUIStateMachine *)self _eventHandlerForEvent:v5];
      id v9 = [(VUIStateMachine *)self logObject];
      BOOL v10 = v9 == 0;

      if (!v10)
      {
        v11 = [(VUIStateMachine *)self logObject];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          name = self->_name;
          v13 = [(VUIStateMachine *)self currentState];
          *(_DWORD *)buf = 138412802;
          int v22 = name;
          __int16 v23 = 2112;
          __int16 v24 = v5;
          __int16 v25 = 2112;
          uint64_t v26 = v13;
          _os_log_impl(&dword_1E29E1000, v11, OS_LOG_TYPE_DEFAULT, "State machine [%@] processing event [%@] in state [%@]", buf, 0x20u);
        }
      }
      v14 = self;
      objc_sync_enter(v14);
      self->_handlingEvent = 1;
      objc_sync_exit(v14);

      v15 = ((void (**)(void, VUIStateMachine *, void *, void *, void *))v8)[2](v8, v14, v5, v7, v6);
      v16 = v14;
      objc_sync_enter(v16);
      self->_handlingEvent = 0;
      objc_sync_exit(v16);

      [(VUIStateMachine *)v16 _transitionToState:v15 withEvent:v5 context:v7 userInfo:v6];
      v17 = self->_events;
      objc_sync_enter(v17);
      uint64_t v18 = [(NSMutableArray *)self->_events count];
      if (v18)
      {
        if (v18 == 1)
        {
          [(NSMutableArray *)self->_events removeObjectAtIndex:0];
          uint64_t v19 = 0;
        }
        else
        {
          [(NSMutableArray *)self->_events removeObjectAtIndex:0];
          uint64_t v19 = [(NSMutableArray *)self->_events objectAtIndex:0];
        }
      }
      else
      {
        uint64_t v19 = 0;
      }

      objc_sync_exit(v17);
      v4 = (void *)v19;
    }
    while (v19);
  }
}

- (void)_transitionToState:(id)a3 withEvent:(id)a4 context:(id)a5 userInfo:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(VUIStateMachine *)self currentState];
  v15 = (void *)[v14 copy];

  if ([v15 isEqualToString:v10])
  {
    v16 = [(VUIStateMachine *)self logObject];

    if (v16)
    {
      v17 = [(VUIStateMachine *)self logObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412802;
        v34 = name;
        __int16 v35 = 2112;
        v36 = v15;
        __int16 v37 = 2112;
        id v38 = v11;
        _os_log_impl(&dword_1E29E1000, v17, OS_LOG_TYPE_DEFAULT, "State machine [%@] remaining at state [%@] on event [%@]", buf, 0x20u);
      }
    }
  }
  else
  {
    [(VUIStateMachine *)self setCurrentState:v10];
    uint64_t v19 = [(VUIStateMachine *)self logObject];

    if (v19)
    {
      id v20 = [(VUIStateMachine *)self logObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_name;
        *(_DWORD *)buf = 138412802;
        v34 = v21;
        __int16 v35 = 2112;
        v36 = v15;
        __int16 v37 = 2112;
        id v38 = v10;
        _os_log_impl(&dword_1E29E1000, v20, OS_LOG_TYPE_DEFAULT, "State machine [%@] transitioning from state [%@] to [%@]", buf, 0x20u);
      }
    }
    stateChangeHandler = (void (**)(id, VUIStateMachine *, void *, id, id, id, id))self->_stateChangeHandler;
    if (stateChangeHandler)
    {
      if (self->_callsStateChangeHandlerSynchronously)
      {
        stateChangeHandler[2](stateChangeHandler, self, v15, v10, v11, v12, v13);
      }
      else
      {
        uint64_t v23 = MEMORY[0x1E4F143A8];
        uint64_t v24 = 3221225472;
        __int16 v25 = __74__VUIStateMachine_Private___transitionToState_withEvent_context_userInfo___block_invoke;
        uint64_t v26 = &unk_1E6DDD408;
        uint64_t v27 = self;
        id v28 = v15;
        id v29 = v10;
        id v30 = v11;
        id v31 = v12;
        id v32 = v13;
        dispatch_async(MEMORY[0x1E4F14428], &v23);
      }
    }
  }
  [(VUIStateMachine *)self _executePostTransitionBlocks];
}

- (void)_executePostTransitionBlocks
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = self->_blocksToExecuteAfterStateTransition;
  objc_sync_enter(v3);
  v4 = (void *)[(NSMutableArray *)self->_blocksToExecuteAfterStateTransition copy];
  [(NSMutableArray *)self->_blocksToExecuteAfterStateTransition removeAllObjects];
  objc_sync_exit(v3);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_eventHandlerForEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self->_handlers;
    objc_sync_enter(v5);
    handlers = self->_handlers;
    uint64_t v7 = [(VUIStateMachine *)self currentState];
    uint64_t v8 = [(NSMutableDictionary *)handlers objectForKey:v7];

    long long v9 = [v8 objectForKey:v4];
    if (!v9)
    {
      long long v9 = [(NSMutableDictionary *)self->_defaultHandlers objectForKey:v4];
    }

    objc_sync_exit(v5);
  }
  else
  {
    long long v9 = 0;
  }
  if (v9) {
    long long v10 = v9;
  }
  else {
    long long v10 = &__block_literal_global_12;
  }
  long long v11 = (void *)MEMORY[0x1E4E604D0](v10);

  return v11;
}

- (NSString)currentState
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)ignorableEvents
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentState:(id)a3
{
}

- (void)registerHandlerForEvent:(id)a3 onStates:(id)a4 withBlock:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(VUIStateMachine *)self shouldAcceptEvents])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
          -[VUIStateMachine registerHandlerForEvent:onState:withBlock:](self, "registerHandlerForEvent:onState:withBlock:", v8, *(void *)(*((void *)&v16 + 1) + 8 * v15++), v10, (void)v16);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

- (void)registerHandlerForEvent:(id)a3 onState:(id)a4 withBlock:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(VUIStateMachine *)self shouldAcceptEvents])
  {
    if (!v9) {
      goto LABEL_16;
    }
    uint64_t v14 = self->_handlers;
    objc_sync_enter(v14);
    uint64_t v15 = [(NSMutableDictionary *)self->_handlers objectForKey:v9];
    long long v16 = v15;
    if (!v15 && v8 && v10)
    {
      long long v16 = objc_opt_new();
      [(NSMutableDictionary *)self->_handlers setObject:v16 forKey:v9];
      goto LABEL_14;
    }
    if (v8)
    {
      if (v10)
      {
LABEL_14:
        long long v17 = (void *)[v10 copy];
        [v16 setObject:v17 forKey:v8];

        goto LABEL_15;
      }
      [v15 removeObjectForKey:v8];
    }
LABEL_15:

    objc_sync_exit(v14);
    goto LABEL_16;
  }
  id v11 = [(VUIStateMachine *)self logObject];

  if (v11)
  {
    uint64_t v12 = [(VUIStateMachine *)self logObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      int v18 = 138412290;
      long long v19 = name;
      _os_log_impl(&dword_1E29E1000, v12, OS_LOG_TYPE_DEFAULT, "State machine [%@] can not register event handlers when it is accepting events", (uint8_t *)&v18, 0xCu);
    }
  }
LABEL_16:
}

- (BOOL)shouldAcceptEvents
{
  return self->_shouldAcceptEvents;
}

- (void)logUnhandledEvents
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  __int16 v35 = [(NSMutableDictionary *)self->_handlers allKeys];
  v3 = objc_msgSend(v35, "sortedArrayUsingSelector:");
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v58 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [(NSMutableDictionary *)self->_handlers objectForKey:*(void *)(*((void *)&v57 + 1) + 8 * i)];
        id v10 = [v9 allKeys];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v68 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v54;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v54 != v13) {
                objc_enumerationMutation(v10);
              }
              [v4 addObject:*(void *)(*((void *)&v53 + 1) + 8 * j)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v68 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v6);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v15 = [(NSMutableDictionary *)self->_defaultHandlers allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v67 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v50 != v18) {
          objc_enumerationMutation(v15);
        }
        [v4 addObject:*(void *)(*((void *)&v49 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v49 objects:v67 count:16];
    }
    while (v17);
  }

  uint64_t v20 = [v4 allObjects];
  uint64_t v21 = [v20 sortedArrayUsingSelector:sel_compare_];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v36 = v21;
  uint64_t v38 = [v36 countByEnumeratingWithState:&v45 objects:v66 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v46;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v46 != v37) {
          objc_enumerationMutation(v36);
        }
        uint64_t v40 = v22;
        uint64_t v23 = *(void *)(*((void *)&v45 + 1) + 8 * v22);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v24 = obj;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v65 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v42;
          do
          {
            for (uint64_t m = 0; m != v26; ++m)
            {
              if (*(void *)v42 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v41 + 1) + 8 * m);
              id v30 = [(NSMutableDictionary *)self->_handlers objectForKey:v29];
              id v31 = [v30 objectForKey:v23];

              if (!v31)
              {
                id v32 = [(NSMutableDictionary *)self->_defaultHandlers objectForKey:v23];

                if (!v32)
                {
                  v33 = [(VUIStateMachine *)self logObject];

                  if (v33)
                  {
                    v34 = [(VUIStateMachine *)self logObject];
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v62 = v23;
                      __int16 v63 = 2112;
                      uint64_t v64 = v29;
                      _os_log_impl(&dword_1E29E1000, v34, OS_LOG_TYPE_INFO, "[%@] is unhandled for [%@]", buf, 0x16u);
                    }
                  }
                }
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v65 count:16];
          }
          while (v26);
        }

        uint64_t v22 = v40 + 1;
      }
      while (v40 + 1 != v38);
      uint64_t v38 = [v36 countByEnumeratingWithState:&v45 objects:v66 count:16];
    }
    while (v38);
  }
}

- (OS_os_log)logObject
{
  return self->_logObject;
}

uint64_t __74__VUIStateMachine_Private___transitionToState_withEvent_context_userInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))(*(void *)(*(void *)(a1 + 32) + 8));
}

- (void)setShouldAcceptEvents:(BOOL)a3
{
  self->_shouldAcceptEvents = a3;
}

- (void)setLogObject:(id)a3
{
}

- (void)postEvent:(id)a3
{
}

- (void)registerDefaultHandlerForEvent:(id)a3 withBlock:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(VUIStateMachine *)self shouldAcceptEvents])
  {
    id v8 = [(VUIStateMachine *)self logObject];

    if (v8)
    {
      id v9 = [(VUIStateMachine *)self logObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        int v14 = 138412290;
        uint64_t v15 = name;
        _os_log_impl(&dword_1E29E1000, v9, OS_LOG_TYPE_DEFAULT, "State machine [%@] can not register default handlers when it is accepting events", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v11 = self->_handlers;
    objc_sync_enter(v11);
    if (v6 && v7)
    {
      defaultHandlers = self->_defaultHandlers;
      uint64_t v13 = (void *)[v7 copy];
      [(NSMutableDictionary *)defaultHandlers setObject:v13 forKey:v6];
    }
    objc_sync_exit(v11);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = sStateMachines;
    sStateMachines = v2;
    MEMORY[0x1F41817F8](v2, v3);
  }
}

- (void)executeBlockAfterCurrentStateTransition:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    id v10 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    BOOL handlingEvent = v5->_handlingEvent;
    objc_sync_exit(v5);

    if (handlingEvent)
    {
      id v7 = v5->_blocksToExecuteAfterStateTransition;
      objc_sync_enter(v7);
      blocksToExecuteAfterStateTransition = v5->_blocksToExecuteAfterStateTransition;
      id v9 = (void *)[v10 copy];
      [(NSMutableArray *)blocksToExecuteAfterStateTransition addObject:v9];

      objc_sync_exit(v7);
    }
    else
    {
      v10[2]();
    }
    id v4 = v10;
  }
}

- (VUIStateMachine)initWithName:(id)a3 initialState:(id)a4 mode:(int64_t)a5 stateChangeHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v31.receiver = self;
  v31.super_class = (Class)VUIStateMachine;
  uint64_t v13 = [(VUIStateMachine *)&v31 init];
  if (!v13)
  {
LABEL_10:
    uint64_t v27 = v13;
    goto LABEL_11;
  }
  if ([v10 length] && objc_msgSend(v11, "length"))
  {
    uint64_t v14 = [v10 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    [(VUIStateMachine *)v13 setCurrentState:v11];
    v13->_mode = a5;
    uint64_t v16 = objc_opt_new();
    events = v13->_events;
    v13->_events = (NSMutableArray *)v16;

    uint64_t v18 = objc_opt_new();
    handlers = v13->_handlers;
    v13->_handlers = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_opt_new();
    defaultHandlers = v13->_defaultHandlers;
    v13->_defaultHandlers = (NSMutableDictionary *)v20;

    uint64_t v22 = objc_opt_new();
    blocksToExecuteAfterStateTransition = v13->_blocksToExecuteAfterStateTransition;
    v13->_blocksToExecuteAfterStateTransition = (NSMutableArray *)v22;

    if (v12)
    {
      id v24 = (id)[v12 copy];
      uint64_t v25 = MEMORY[0x1E4E604D0]();
      id stateChangeHandler = v13->_stateChangeHandler;
      v13->_id stateChangeHandler = (id)v25;
    }
    else
    {
      id v24 = v13->_stateChangeHandler;
      v13->_id stateChangeHandler = 0;
    }

    objc_storeStrong((id *)&v13->_logObject, MEMORY[0x1E4F14500]);
    if (a5 == 1)
    {
      uint64_t v28 = dispatch_get_global_queue(21, 0);
      dispatchQueue = v13->_dispatchQueue;
      v13->_dispatchQueue = (OS_dispatch_queue *)v28;
    }
    goto LABEL_10;
  }
  uint64_t v27 = 0;
LABEL_11:

  return v27;
}

+ (void)registerStateMachine:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v7 = v3;
    id v4 = v3;
    objc_sync_enter(v4);
    [v4 setShouldAcceptEvents:1];
    uint64_t v5 = (void *)sStateMachines;
    id v6 = [v4 name];
    [v5 setObject:v4 forKey:v6];

    objc_sync_exit(v4);
    id v3 = v7;
  }
}

+ (id)stateMachineWithName:(id)a3
{
  return (id)[(id)sStateMachines objectForKey:a3];
}

+ (void)deregisterStateMachine:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    [v3 setShouldAcceptEvents:0];
    [v3 purgeEventQueue];
    [v3 deregisterHandlers];
    id v4 = (void *)sStateMachines;
    id v5 = [v3 name];

    [v4 removeObjectForKey:v5];
  }
}

+ (id)stateMachinesOfType:(Class)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend((id)sStateMachines, "allValues", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return v10;
}

- (VUIStateMachine)initWithName:(id)a3 initialState:(id)a4 mode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __50__VUIStateMachine_initWithName_initialState_mode___block_invoke;
  uint64_t v16 = &unk_1E6DDD3B8;
  objc_copyWeak(&v17, &location);
  id v10 = (void *)MEMORY[0x1E4E604D0](&v13);
  id v11 = -[VUIStateMachine initWithName:initialState:mode:stateChangeHandler:](self, "initWithName:initialState:mode:stateChangeHandler:", v8, v9, a5, v10, v13, v14, v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __50__VUIStateMachine_initWithName_initialState_mode___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v17 = a6;
  id v11 = a7;
  long long v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a3, @"VUIStateMachineOldStateKey", a4, @"VUIStateMachineNewStateKey", 0);
  if (v17) {
    [v12 setObject:v17 forKey:@"VUIStateMachineContextKey"];
  }
  if (v11) {
    [v12 setObject:v11 forKey:@"VUIStateMachineUserInfoKey"];
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F28EA0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v15 = [v13 notificationWithName:@"VUIStateMachineStateChangedNotification" object:WeakRetained userInfo:v12];

  uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 postNotification:v15];
}

- (void)postEvent:(id)a3 withContext:(id)a4
{
}

- (void)purgeEventQueue
{
  obuint64_t j = self->_events;
  objc_sync_enter(obj);
  [(NSMutableArray *)self->_events removeAllObjects];
  objc_sync_exit(obj);
}

- (void)registerHandlerForEvents:(id)a3 onStates:(id)a4 withBlock:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v22 = a4;
  id v9 = a5;
  if (![(VUIStateMachine *)self shouldAcceptEvents])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = v8;
    obuint64_t j = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * v13);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v15 = v22;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v24;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v24 != v18) {
                  objc_enumerationMutation(v15);
                }
                [(VUIStateMachine *)self registerHandlerForEvent:v14 onState:*(void *)(*((void *)&v23 + 1) + 8 * v19++) withBlock:v9];
              }
              while (v17 != v19);
              uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v17);
          }

          ++v13;
        }
        while (v13 != v11);
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }

    id v8 = v20;
  }
}

- (void)registerStateTransitionFromState:(id)a3 onEvent:(id)a4 toState:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(VUIStateMachine *)self shouldAcceptEvents])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__VUIStateMachine_registerStateTransitionFromState_onEvent_toState___block_invoke;
    v14[3] = &unk_1E6DDD3E0;
    id v15 = v10;
    [(VUIStateMachine *)self registerHandlerForEvent:v9 onState:v8 withBlock:v14];
    uint64_t v12 = v15;
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v11 = [(VUIStateMachine *)self logObject];

  if (v11)
  {
    uint64_t v12 = [(VUIStateMachine *)self logObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = name;
      _os_log_impl(&dword_1E29E1000, v12, OS_LOG_TYPE_DEFAULT, "State machine [%@] can not register state transitions when it is accepting events", buf, 0xCu);
    }
    goto LABEL_6;
  }
LABEL_7:
}

id __68__VUIStateMachine_registerStateTransitionFromState_onEvent_toState___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)deregisterHandlers
{
  obuint64_t j = self->_handlers;
  objc_sync_enter(obj);
  [(VUIStateMachine *)self setShouldAcceptEvents:0];
  [(VUIStateMachine *)self purgeEventQueue];
  [(NSMutableDictionary *)self->_handlers removeAllObjects];
  [(NSMutableDictionary *)self->_defaultHandlers removeAllObjects];
  objc_sync_exit(obj);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setIgnorableEvents:(id)a3
{
}

- (BOOL)callsStateChangeHandlerSynchronously
{
  return self->_callsStateChangeHandlerSynchronously;
}

- (void)setCallsStateChangeHandlerSynchronously:(BOOL)a3
{
  self->_callsStateChangeHandlerSynchronously = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignorableEvents, 0);
  objc_storeStrong((id *)&self->_logObject, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_blocksToExecuteAfterStateTransition, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_defaultHandlers, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong(&self->_stateChangeHandler, 0);
}

- (void)_dispatchEvent:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__VUIStateMachine_Private___dispatchEvent___block_invoke;
  v7[3] = &unk_1E6DDD458;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __43__VUIStateMachine_Private___dispatchEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"VUIStateMachineEventKey"];
  id v3 = [*(id *)(a1 + 32) objectForKey:@"VUIStateMachineUserInfoKey"];
  id v4 = [*(id *)(a1 + 32) objectForKey:@"VUIStateMachineContextKey"];
  uint64_t v5 = [*(id *)(a1 + 40) _eventHandlerForEvent:v2];
  id v6 = ((void (**)(void, void, void *, void *, void *))v5)[2](v5, *(void *)(a1 + 40), v2, v4, v3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VUIStateMachine_Private___dispatchEvent___block_invoke_2;
  block[3] = &unk_1E6DDD430;
  block[4] = *(void *)(a1 + 40);
  id v7 = v6;
  id v14 = v7;
  id v8 = v2;
  id v15 = v8;
  id v9 = v4;
  id v16 = v9;
  id v10 = v3;
  id v17 = v10;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  id v11 = *(id *)(*(void *)(a1 + 40) + 16);
  objc_sync_enter(v11);
  [*(id *)(*(void *)(a1 + 40) + 16) removeObjectAtIndex:0];
  uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 16) count];
  objc_sync_exit(v11);

  if (v12) {
    [*(id *)(a1 + 40) _processNextEvent];
  }
}

uint64_t __43__VUIStateMachine_Private___dispatchEvent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToState:*(void *)(a1 + 40) withEvent:*(void *)(a1 + 48) context:*(void *)(a1 + 56) userInfo:*(void *)(a1 + 64)];
}

@end
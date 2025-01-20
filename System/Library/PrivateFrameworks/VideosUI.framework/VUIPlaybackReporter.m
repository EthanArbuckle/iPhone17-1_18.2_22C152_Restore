@interface VUIPlaybackReporter
- (BOOL)_isTransitionValidForPlayer:(id)a3 fromState:(id)a4 toState:(id)a5;
- (BOOL)enforceSinglePlaybackSession;
- (NSMutableArray)sessions;
- (OS_os_log)logObject;
- (VUIPlaybackReporter)init;
- (id)_createSessionForPlayer:(id)a3;
- (id)_sessionForPlayer:(id)a3;
- (void)_beginSession:(id)a3;
- (void)_endSession:(id)a3;
- (void)_endSessions:(id)a3;
- (void)_handlePlaybackChangeForPlayer:(id)a3 fromState:(id)a4 toState:(id)a5 reason:(id)a6;
- (void)_logWithFormat:(id)a3;
- (void)_playerCurrentMediaItemWillChange:(id)a3;
- (void)_playerStateWillChange:(id)a3;
- (void)_registerObservers;
- (void)_removeObservers;
- (void)_reportForSession:(id)a3 state:(id)a4 reason:(id)a5;
- (void)dealloc;
- (void)setLogObject:(id)a3;
- (void)setSessions:(id)a3;
@end

@implementation VUIPlaybackReporter

- (VUIPlaybackReporter)init
{
  v9.receiver = self;
  v9.super_class = (Class)VUIPlaybackReporter;
  v2 = [(VUIPlaybackReporter *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(VUIPlaybackReporter *)v2 _registerObservers];
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sessions = v3->_sessions;
    v3->_sessions = v4;

    v3->_enforceSinglePlaybackSession = 1;
    uint64_t v6 = VUIDefaultLogObject();
    logObject = v3->_logObject;
    v3->_logObject = (OS_os_log *)v6;
  }
  return v3;
}

- (void)_registerObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__playerStateWillChange_ name:*MEMORY[0x1E4FAA3D8] object:0];
  [v3 addObserver:self selector:sel__playerCurrentMediaItemWillChange_ name:*MEMORY[0x1E4FAA248] object:0];
}

- (void)setLogObject:(id)a3
{
}

- (void)dealloc
{
  [(VUIPlaybackReporter *)self _removeObservers];
  v3.receiver = self;
  v3.super_class = (Class)VUIPlaybackReporter;
  [(VUIPlaybackReporter *)&v3 dealloc];
}

- (void)_logWithFormat:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v12];

  v7 = [(VUIPlaybackReporter *)self logObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [NSString stringWithFormat:@"%@ - %@", objc_opt_class(), v6];
    *(_DWORD *)buf = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (void)_removeObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (id)_sessionForPlayer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(VUIPlaybackReporter *)self sessions];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 player];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_endSessions:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = [(VUIPlaybackReporter *)self sessions];
    [v4 removeObjectsInArray:v5];
  }
}

- (void)_endSession:(id)a3
{
  id v4 = a3;
  [(VUIPlaybackReporter *)self _logWithFormat:@"Will end reporting for %@", v4];
  id v5 = [(VUIPlaybackReporter *)self sessions];
  [v5 removeObject:v4];
}

- (void)_beginSession:(id)a3
{
  id v4 = a3;
  [(VUIPlaybackReporter *)self _logWithFormat:@"Will begin reporting for %@", v4];
  id v5 = [(VUIPlaybackReporter *)self sessions];
  [v5 addObject:v4];
}

- (void)_playerStateWillChange:(id)a3
{
  id v4 = a3;
  id v9 = [v4 object];
  id v5 = [v4 userInfo];

  [(VUIPlaybackReporter *)self _logWithFormat:@"_playerStateWillChange %@", v5];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4FAA3C8]];
  uint64_t v7 = [v9 state];
  v8 = [v5 objectForKey:*MEMORY[0x1E4FAA3B8]];
  [(VUIPlaybackReporter *)self _handlePlaybackChangeForPlayer:v9 fromState:v7 toState:v6 reason:v8];
}

- (void)_playerCurrentMediaItemWillChange:(id)a3
{
  id v4 = a3;
  id v10 = [v4 object];
  id v5 = -[VUIPlaybackReporter _sessionForPlayer:](self, "_sessionForPlayer:");
  id v6 = [v4 userInfo];

  [(VUIPlaybackReporter *)self _logWithFormat:@"_playerCurrentMediaItemWillChange %@", v6];
  uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4FAA238]];
  if (v5)
  {
    [(VUIPlaybackReporter *)self _logWithFormat:@"Stopping %@", v10];
    v8 = [v10 state];
    id v9 = [MEMORY[0x1E4FA9D88] stopped];
    [(VUIPlaybackReporter *)self _handlePlaybackChangeForPlayer:v10 fromState:v8 toState:v9 reason:v7];

    [(VUIPlaybackReporter *)self _endSession:v5];
  }
}

- (void)_handlePlaybackChangeForPlayer:(id)a3 fromState:(id)a4 toState:(id)a5 reason:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v35 = a6;
  long long v13 = [(VUIPlaybackReporter *)self _sessionForPlayer:v10];
  BOOL v14 = [(VUIPlaybackReporter *)self _isTransitionValidForPlayer:v10 fromState:v11 toState:v12];
  id v15 = [MEMORY[0x1E4FA9D88] playing];

  if (v15 == v12)
  {
    if ([(VUIPlaybackReporter *)self enforceSinglePlaybackSession])
    {
      BOOL v31 = v14;
      v32 = v13;
      id v33 = v12;
      id v34 = v11;
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = [(VUIPlaybackReporter *)self sessions];
      uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v38;
        v20 = @"End session (enforcing single session) %@";
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            uint64_t v23 = [v22 player];
            v24 = (void *)v23;
            if ((id)v23 != v10)
            {
              -[VUIPlaybackReporter _logWithFormat:](self, "_logWithFormat:", v20, v23);
              if ([v22 reportingEnabled])
              {
                [MEMORY[0x1E4FA9D88] stopped];
                id v25 = v10;
                v27 = v26 = v20;
                [(VUIPlaybackReporter *)self _reportForSession:v22 state:v27 reason:v35];

                v20 = v26;
                id v10 = v25;
              }
              [v16 addObject:v22];
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v18);
      }

      [(VUIPlaybackReporter *)self _endSessions:v16];
      id v12 = v33;
      id v11 = v34;
      long long v13 = v32;
      BOOL v14 = v31;
    }
    if (!v13)
    {
      long long v13 = [(VUIPlaybackReporter *)self _createSessionForPlayer:v10];
      if (v13)
      {
        [(VUIPlaybackReporter *)self _beginSession:v13];
        id v28 = v13;
      }
      else
      {
        [(VUIPlaybackReporter *)self _logWithFormat:@"Invalid player. Not creating session %@", v10];
      }
    }
  }
  v29 = @"Invalid";
  if (v14) {
    v29 = @"Valid";
  }
  [(VUIPlaybackReporter *)self _logWithFormat:@"Transition: %@ --> %@ (%@), %@, reason:%@", v11, v12, v29, v10, v35];
  if (v14)
  {
    if (v13)
    {
      if ([v13 reportingEnabled]) {
        [(VUIPlaybackReporter *)self _reportForSession:v13 state:v12 reason:v35];
      }
    }
    else
    {
      [(VUIPlaybackReporter *)self _logWithFormat:@"Ignoring event for un-matched session %@", v10];
    }
  }
  id v30 = [MEMORY[0x1E4FA9D88] stopped];

  if (v30 == v12 && v13) {
    [(VUIPlaybackReporter *)self _endSession:v13];
  }
}

- (BOOL)_isTransitionValidForPlayer:(id)a3 fromState:(id)a4 toState:(id)a5
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4FA9D88];
  id v8 = a5;
  id v9 = [v7 playing];

  if (v9 == v8)
  {
    BOOL v11 = 1;
  }
  else
  {
    id v10 = [MEMORY[0x1E4FA9D88] playing];
    BOOL v11 = v10 == v6;
  }
  return v11;
}

- (void)_reportForSession:(id)a3 state:(id)a4 reason:(id)a5
{
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = NSString;
  NSStringFromSelector(a2);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 stringWithFormat:@"You must override %@ in a subclass", v10];
  id v9 = [v5 exceptionWithName:v6 reason:v8 userInfo:0];
  [v9 raise];
}

- (id)_createSessionForPlayer:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  uint64_t v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];
  [v8 raise];

  return 0;
}

- (BOOL)enforceSinglePlaybackSession
{
  return self->_enforceSinglePlaybackSession;
}

- (OS_os_log)logObject
{
  return self->_logObject;
}

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_logObject, 0);
}

@end
@interface MBStatefulEngine
- (BOOL)cancelWithError:(id)a3;
- (BOOL)engineWillTransitionToNextState:(id *)a3;
- (BOOL)handleCancelation:(id *)a3;
- (BOOL)hasError;
- (BOOL)isFinished;
- (BOOL)isNetworkAvailable;
- (BOOL)runWithError:(id *)a3;
- (BOOL)setUpWithError:(id *)a3;
- (BOOL)shouldAdvanceState;
- (MBRetryStrategy)retryStrategy;
- (MBStatefulEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5;
- (NSError)engineError;
- (NSError)injectedError;
- (void)makeStateTransition;
- (void)performRetryablePhase:(id)a3;
- (void)replenishRetryTokens;
- (void)setEngineError:(id)a3;
- (void)setInjectedError:(id)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setShouldAdvanceState:(BOOL)a3;
@end

@implementation MBStatefulEngine

- (MBStatefulEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MBStatefulEngine;
  v5 = [(MBEngine *)&v8 initWithSettingsContext:a3 debugContext:a4 domainManager:a5];
  v6 = v5;
  if (v5) {
    [(MBStatefulEngine *)v5 setShouldAdvanceState:1];
  }
  return v6;
}

- (BOOL)hasError
{
  v2 = [(MBStatefulEngine *)self engineError];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)handleCancelation:(id *)a3
{
  BOOL v5 = [(MBEngine *)self isCanceled];
  if (v5)
  {
    uint64_t v6 = [(MBEngine *)self cancelError];
    if (!v6) {
      __assert_rtn("-[MBStatefulEngine handleCancelation:]", "MBStatefulEngine.m", 44, "cancelError");
    }
    v7 = (void *)v6;
    [(MBStatefulEngine *)self cleanUpAfterError:v6];
    if (a3) {
      *a3 = v7;
    }
  }
  return v5;
}

- (BOOL)setUpWithError:(id *)a3
{
  return 1;
}

- (BOOL)cancelWithError:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MBStatefulEngine;
  BOOL v4 = [(MBEngine *)&v7 cancelWithError:a3];
  if (!v4)
  {
    BOOL v5 = [(MBStatefulEngine *)self retryStrategy];
    [v5 cancel];
  }
  return v4;
}

- (BOOL)runWithError:(id *)a3
{
  return 0;
}

- (BOOL)engineWillTransitionToNextState:(id *)a3
{
  return 1;
}

- (void)makeStateTransition
{
  if (![(MBStatefulEngine *)self isFinished]
    && [(MBStatefulEngine *)self shouldAdvanceState])
  {
    [(MBStatefulEngine *)self makeStateTransition];
  }
}

- (void)performRetryablePhase:(id)a3
{
  BOOL v4 = (uint64_t (**)(id, id *))a3;
  BOOL v5 = [(MBStatefulEngine *)self injectedError];

  if (v5)
  {
    [(MBStatefulEngine *)self setIsFinished:1];
    uint64_t v6 = [(MBStatefulEngine *)self injectedError];
    [(MBStatefulEngine *)self setEngineError:v6];

    objc_super v7 = [(MBStatefulEngine *)self injectedError];
    [(MBStatefulEngine *)self cleanUpAfterError:v7];
  }
  else
  {
    objc_super v8 = [(MBStatefulEngine *)self retryStrategy];
    [v8 reset];

    v9 = [(MBEngine *)self watchdog];
    [v9 resume];

    id v36 = 0;
    unsigned __int8 v11 = [(MBStatefulEngine *)self handleCancelation:&v36];
    id v12 = v36;
    if (v11)
    {
LABEL_4:
      -[MBStatefulEngine setIsFinished:](self, "setIsFinished:", 1, v30, v32);
      [(MBStatefulEngine *)self setEngineError:v12];
    }
    else
    {
      v13 = ATClientController_ptr;
      while (1)
      {
        id v35 = 0;
        unsigned __int8 v14 = -[MBStatefulEngine engineWillTransitionToNextState:](self, "engineWillTransitionToNextState:", &v35, v30, v32);
        id v15 = v35;
        v16 = v15;
        if ((v14 & 1) == 0)
        {
          [(MBStatefulEngine *)self setIsFinished:1];
          [(MBStatefulEngine *)self setEngineError:v16];
LABEL_20:
          id v27 = v12;
          goto LABEL_21;
        }

        id v34 = 0;
        char v17 = v4[2](v4, &v34);
        id v18 = v34;
        v16 = v18;
        if (v17) {
          goto LABEL_20;
        }
        if (!v18)
        {
          v19 = [v13[146] stringWithFormat:@"block returned NO without setting an out error: %@", self];
          if (MBIsInternalInstall())
          {
            v20 = v13;
            v21 = +[NSAssertionHandler currentHandler];
            v22 = [v20[146] stringWithUTF8String:"-[MBStatefulEngine performRetryablePhase:]"];
            [v21 handleFailureInFunction:v22 file:@"MBStatefulEngine.m" lineNumber:124 description:v19];
          }
          else
          {
            v21 = MBGetDefaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v19;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
              v31 = v19;
              _MBLog();
            }
          }

          v13 = ATClientController_ptr;
        }
        v23 = [(MBStatefulEngine *)self retryStrategy];
        unsigned __int8 v24 = [v23 shouldRetryAfterError:v16];

        if ((v24 & 1) == 0) {
          break;
        }
        v25 = MBGetDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v38 = self;
          __int16 v39 = 2112;
          v40 = v16;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Retrying transition for %{public}@ after error: %@", buf, 0x16u);
          v30 = self;
          v32 = v16;
          _MBLog();
        }

        id v36 = 0;
        unsigned __int8 v26 = [(MBStatefulEngine *)self handleCancelation:&v36];
        id v12 = v36;
        if (v26) {
          goto LABEL_4;
        }
      }
      id v33 = v12;
      unsigned int v28 = [(MBStatefulEngine *)self handleCancelation:&v33];
      id v27 = v33;

      if (v28)
      {
        [(MBStatefulEngine *)self setIsFinished:1];
        [(MBStatefulEngine *)self setEngineError:v27];
      }
      else
      {
        v29 = MBGetDefaultLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v38 = self;
          __int16 v39 = 2112;
          v40 = v16;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Not retrying transition for %{public}@ after error: %@", buf, 0x16u);
          _MBLog();
        }

        [(MBStatefulEngine *)self setIsFinished:1];
        [(MBStatefulEngine *)self setEngineError:v16];
        [(MBStatefulEngine *)self cleanUpAfterError:v16];
      }
LABEL_21:
    }
  }
}

- (void)replenishRetryTokens
{
  id v2 = [(MBStatefulEngine *)self retryStrategy];
  [v2 replenishRetryTokens];
}

- (MBRetryStrategy)retryStrategy
{
  id v2 = self;
  objc_sync_enter(v2);
  retryStrategy = v2->_retryStrategy;
  if (!retryStrategy)
  {
    BOOL v4 = [MBRetryStrategy alloc];
    BOOL v5 = [(MBEngine *)v2 debugContext];
    uint64_t v6 = [(MBRetryStrategy *)v4 initWithDebugContext:v5 networkAvailabilityProvider:v2 engineMode:[(MBEngine *)v2 engineMode] restoreType:[(MBEngine *)v2 restoreType]];
    objc_super v7 = v2->_retryStrategy;
    v2->_retryStrategy = v6;

    retryStrategy = v2->_retryStrategy;
  }
  objc_super v8 = retryStrategy;
  objc_sync_exit(v2);

  return v8;
}

- (BOOL)isNetworkAvailable
{
  return 0;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (NSError)engineError
{
  return self->_engineError;
}

- (void)setEngineError:(id)a3
{
}

- (NSError)injectedError
{
  return self->_injectedError;
}

- (void)setInjectedError:(id)a3
{
}

- (BOOL)shouldAdvanceState
{
  return self->_shouldAdvanceState;
}

- (void)setShouldAdvanceState:(BOOL)a3
{
  self->_shouldAdvanceState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injectedError, 0);
  objc_storeStrong((id *)&self->_engineError, 0);
  objc_storeStrong((id *)&self->_retryStrategy, 0);
}

@end
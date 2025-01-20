@interface MNNavigationState
- (BOOL)_isSelectorValidForForwarding:(SEL)a3;
- (BOOL)requiresHighMemoryThreshold;
- (BOOL)requiresLocationAccess;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldClearStoredRoutes;
- (MNLocationProviderCLParameters)clParameters;
- (MNNavigationState)init;
- (MNNavigationState)initWithStateManager:(id)a3;
- (MNNavigationStateManager)stateManager;
- (MNNavigationTraceManager)traceManager;
- (MNSimulationLocationProvider)simulationLocationProvider;
- (double)locationUpdateInterval;
- (double)suggestionUpdateFrequency;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)desiredLocationProviderType;
- (unint64_t)type;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
@end

@implementation MNNavigationState

- (unint64_t)type
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    v5 = "-[MNNavigationState type]";
    __int16 v6 = 2080;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Navigation/NavigationState/MNNavigationState.m";
    __int16 v8 = 1024;
    int v9 = 27;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v4, 0x1Cu);
  }

  return -1;
}

- (BOOL)requiresHighMemoryThreshold
{
  return 0;
}

- (BOOL)requiresLocationAccess
{
  unint64_t v3 = [(MNNavigationState *)self desiredLocationProviderType];
  if (v3 != 1) {
    LOBYTE(v3) = [(MNNavigationState *)self desiredLocationProviderType] == 2;
  }
  return v3;
}

- (unint64_t)desiredLocationProviderType
{
  return 0;
}

- (MNLocationProviderCLParameters)clParameters
{
  return 0;
}

- (BOOL)shouldClearStoredRoutes
{
  return 1;
}

- (MNNavigationTraceManager)traceManager
{
  return 0;
}

- (MNSimulationLocationProvider)simulationLocationProvider
{
  return 0;
}

- (MNNavigationState)init
{
  return [(MNNavigationState *)self initWithStateManager:0];
}

- (MNNavigationState)initWithStateManager:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationState;
  v5 = [(MNNavigationState *)&v10 init];
  __int16 v6 = (MNNavigationState *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_1B5542DA0;
    objc_storeWeak((id *)v5 + 3, v4);
    if ([(MNNavigationState *)v6 requiresHighMemoryThreshold])
    {
      v7 = +[MNXPCTransactionManager sharedInstance];
      [v7 addHighMemoryThresholdRequest:v6];
    }
    __int16 v8 = v6;
  }

  return v6;
}

- (void)dealloc
{
  if ([(MNNavigationState *)self requiresHighMemoryThreshold])
  {
    unint64_t v3 = +[MNXPCTransactionManager sharedInstance];
    [v3 removeHighMemoryThresholdRequest:self afterDelay:3.0];
  }
  v4.receiver = self;
  v4.super_class = (Class)MNNavigationState;
  [(MNNavigationState *)&v4 dealloc];
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (const char *)[a3 selector];
  if ([(MNNavigationState *)self _isSelectorValidForForwarding:v4])
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v6 = NSStringFromSelector(v4);
      int v7 = 138412546;
      __int16 v8 = v6;
      __int16 v9 = 2112;
      uint64_t v10 = objc_opt_class();
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "%@ is not supported by state %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    [(MNNavigationState *)self doesNotRecognizeSelector:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (-[MNNavigationState _isSelectorValidForForwarding:](self, "_isSelectorValidForForwarding:"))
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA38], "_navigation_methodSignatureForEmptyMethod");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MNNavigationState;
    v5 = [(MNNavigationState *)&v7 methodSignatureForSelector:a3];
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (-[MNNavigationState _isSelectorValidForForwarding:](self, "_isSelectorValidForForwarding:")) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MNNavigationState;
  return [(MNNavigationState *)&v6 respondsToSelector:a3];
}

- (BOOL)_isSelectorValidForForwarding:(SEL)a3
{
  return MNProtocolDeclaresSelector(&unk_1F0E555E0, a3);
}

- (double)locationUpdateInterval
{
  return self->_locationUpdateInterval;
}

- (double)suggestionUpdateFrequency
{
  return self->_suggestionUpdateFrequency;
}

- (MNNavigationStateManager)stateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateManager);
  return (MNNavigationStateManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
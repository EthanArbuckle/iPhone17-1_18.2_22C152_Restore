@interface MNNavigationStateNoDestination
- (unint64_t)desiredLocationProviderType;
- (unint64_t)type;
- (void)postEnterState;
- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4;
@end

@implementation MNNavigationStateNoDestination

- (unint64_t)type
{
  return 1;
}

- (unint64_t)desiredLocationProviderType
{
  v2 = [(MNNavigationState *)self traceManager];
  v3 = [v2 tracePlayer];

  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

- (void)postEnterState
{
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count] && objc_msgSend(v6, "count") > a4)
  {
    v7 = [MNNavigationStateRoutePreview alloc];
    v8 = [(MNNavigationState *)self stateManager];
    v9 = [(MNNavigationStateRoutePreview *)v7 initWithStateManager:v8 previewRoutes:v6 selectedRouteIndex:a4];

    v10 = [(MNNavigationState *)self stateManager];
    [v10 transitionToState:v9];
  }
  else
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2048;
      unint64_t v15 = a4;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "setting nil routes (%@) or selectedRouteIndex out of bound (%ld) for route previews while in state MNNavigationStateNoDestination is a no-op, returning early", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4
{
  id v5 = a3;
  id v6 = [(MNNavigationState *)self stateManager];
  id v8 = +[MNNavigationStateGuidance guidanceStateForStartDetails:v5 stateManager:v6 navigationSessionManager:0];

  if (v8)
  {
    v7 = [(MNNavigationState *)self stateManager];
    [v7 transitionToState:v8];
  }
}

@end
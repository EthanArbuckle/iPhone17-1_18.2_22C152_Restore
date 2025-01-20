@interface MNNavigationStateRoutePreview
- (BOOL)requiresHighMemoryThreshold;
- (BOOL)shouldClearStoredRoutes;
- (MNNavigationStateRoutePreview)initWithStateManager:(id)a3 previewRoutes:(id)a4 selectedRouteIndex:(unint64_t)a5;
- (id)simulationLocationProvider;
- (id)traceManager;
- (unint64_t)desiredLocationProviderType;
- (unint64_t)type;
- (void)enterState;
- (void)leaveState;
- (void)pauseRealtimeUpdatesForSubscriber:(id)a3;
- (void)resumeRealtimeUpdatesForSubscriber:(id)a3;
- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4;
- (void)stopNavigationWithReason:(unint64_t)a3;
@end

@implementation MNNavigationStateRoutePreview

- (unint64_t)type
{
  return 2;
}

- (BOOL)requiresHighMemoryThreshold
{
  return 1;
}

- (unint64_t)desiredLocationProviderType
{
  return 0;
}

- (BOOL)shouldClearStoredRoutes
{
  return 0;
}

- (id)traceManager
{
  return [(MNNavigationSessionManager *)self->_navigationSessionManager traceManager];
}

- (id)simulationLocationProvider
{
  return [(MNNavigationSessionManager *)self->_navigationSessionManager simulationLocationProvider];
}

- (MNNavigationStateRoutePreview)initWithStateManager:(id)a3 previewRoutes:(id)a4 selectedRouteIndex:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MNNavigationStateRoutePreview;
  v10 = [(MNNavigationState *)&v13 initWithStateManager:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_previewRoutes, a4);
    v11->_selectedRouteIndex = a5;
  }

  return v11;
}

- (void)enterState
{
  v11.receiver = self;
  v11.super_class = (Class)MNNavigationStateRoutePreview;
  [(MNNavigationState *)&v11 enterState];
  v3 = [MNNavigationSessionManager alloc];
  v4 = [(MNNavigationState *)self stateManager];
  v5 = [v4 auditToken];
  v6 = [(MNNavigationSessionManager *)v3 initWithAuditToken:v5];
  navigationSessionManager = self->_navigationSessionManager;
  self->_navigationSessionManager = v6;

  v8 = [(MNNavigationState *)self stateManager];
  id v9 = [v8 navigationDelegate];
  [(MNNavigationSessionManager *)self->_navigationSessionManager setDelegate:v9];

  previewRoutes = self->_previewRoutes;
  if (previewRoutes) {
    [(MNNavigationSessionManager *)self->_navigationSessionManager setRoutesForPreview:previewRoutes selectedRouteIndex:self->_selectedRouteIndex];
  }
}

- (void)leaveState
{
  v4.receiver = self;
  v4.super_class = (Class)MNNavigationStateRoutePreview;
  [(MNNavigationState *)&v4 leaveState];
  [(MNNavigationSessionManager *)self->_navigationSessionManager setDelegate:0];
  navigationSessionManager = self->_navigationSessionManager;
  self->_navigationSessionManager = 0;
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
}

- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4
{
  id v5 = a3;
  v6 = [(MNNavigationState *)self stateManager];
  id v8 = +[MNNavigationStateGuidance guidanceStateForStartDetails:v5 stateManager:v6 navigationSessionManager:self->_navigationSessionManager];

  if (v8)
  {
    v7 = [(MNNavigationState *)self stateManager];
    [v7 transitionToState:v8];
  }
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  [(MNNavigationSessionManager *)self->_navigationSessionManager stopNavigationWithReason:a3];
  objc_super v4 = [MNNavigationStateNoDestination alloc];
  id v5 = [(MNNavigationState *)self stateManager];
  v7 = [(MNNavigationState *)v4 initWithStateManager:v5];

  v6 = [(MNNavigationState *)self stateManager];
  [v6 transitionToState:v7];
}

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
{
}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSessionManager, 0);
  objc_storeStrong((id *)&self->_previewRoutes, 0);
}

@end
@interface MNNavigationStateRoutePreviewGuidance
- (MNNavigationStateRoutePreviewGuidance)initWithStateManager:(id)a3 navigationSessionManager:(id)a4 startDetails:(id)a5;
- (unint64_t)type;
- (void)enterState;
- (void)setGuidanceType:(unint64_t)a3;
- (void)stopNavigationWithReason:(unint64_t)a3;
@end

@implementation MNNavigationStateRoutePreviewGuidance

- (MNNavigationStateRoutePreviewGuidance)initWithStateManager:(id)a3 navigationSessionManager:(id)a4 startDetails:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MNNavigationStateRoutePreviewGuidance;
  return [(MNNavigationStateGuidance *)&v6 initWithStateManager:a3 navigationSessionManager:a4 startDetails:a5];
}

- (unint64_t)type
{
  return 3;
}

- (void)setGuidanceType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    v4 = MNNavigationStateLowGuidance;
  }
  else
  {
    v4 = MNNavigationStateGuidanceTurnByTurn;
  }
  id v5 = [v4 alloc];
  objc_super v6 = [(MNNavigationState *)self stateManager];
  id v8 = (id)[v5 initWithStateManager:v6 navigationSessionManager:self->super._navigationSessionManager startDetails:0];

  if (v8)
  {
    v7 = [(MNNavigationState *)self stateManager];
    [v7 transitionToState:v8];
  }
}

- (void)enterState
{
  v3.receiver = self;
  v3.super_class = (Class)MNNavigationStateRoutePreviewGuidance;
  [(MNNavigationStateGuidance *)&v3 enterState];
  [(MNNavigationSessionManager *)self->super._navigationSessionManager setIsNavigatingInLowGuidance:0];
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  id v5 = [MNNavigationStateRoutePreview alloc];
  objc_super v6 = [(MNNavigationState *)self stateManager];
  v7 = [(MNNavigationSessionManager *)self->super._navigationSessionManager routeManager];
  id v8 = [v7 previewRoutes];
  v9 = [(MNNavigationSessionManager *)self->super._navigationSessionManager routeManager];
  v11 = -[MNNavigationStateRoutePreview initWithStateManager:previewRoutes:selectedRouteIndex:](v5, "initWithStateManager:previewRoutes:selectedRouteIndex:", v6, v8, [v9 selectedRouteIndex]);

  [(MNNavigationSessionManager *)self->super._navigationSessionManager stopNavigationWithReason:a3];
  v10 = [(MNNavigationState *)self stateManager];
  [v10 transitionToState:v11];
}

@end
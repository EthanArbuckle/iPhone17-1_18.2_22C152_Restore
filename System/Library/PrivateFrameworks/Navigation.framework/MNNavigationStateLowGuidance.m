@interface MNNavigationStateLowGuidance
- (unint64_t)type;
- (void)postEnterState;
- (void)setGuidanceType:(unint64_t)a3;
@end

@implementation MNNavigationStateLowGuidance

- (unint64_t)type
{
  return 5;
}

- (void)postEnterState
{
  v3.receiver = self;
  v3.super_class = (Class)MNNavigationStateLowGuidance;
  [(MNNavigationStateGuidance *)&v3 postEnterState];
  [(MNNavigationSessionManager *)self->super._navigationSessionManager setIsNavigatingInLowGuidance:1];
}

- (void)setGuidanceType:(unint64_t)a3
{
  if (a3 == 2)
  {
    v4 = MNNavigationStateRoutePreviewGuidance;
  }
  else
  {
    if (a3) {
      return;
    }
    v4 = MNNavigationStateGuidanceTurnByTurn;
  }
  id v5 = [v4 alloc];
  v6 = [(MNNavigationState *)self stateManager];
  id v8 = (id)[v5 initWithStateManager:v6 navigationSessionManager:self->super._navigationSessionManager startDetails:0];

  if (v8)
  {
    v7 = [(MNNavigationState *)self stateManager];
    [v7 transitionToState:v8];
  }
}

@end
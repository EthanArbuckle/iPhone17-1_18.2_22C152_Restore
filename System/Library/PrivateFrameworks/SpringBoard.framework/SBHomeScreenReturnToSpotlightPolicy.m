@interface SBHomeScreenReturnToSpotlightPolicy
+ (BOOL)areSpotlightBreadcrumbsEnabled;
- (BOOL)shouldAnimateReactivation;
- (SBHomeScreenReturnToSpotlightPolicy)init;
- (double)_elapsedTime;
- (double)reactivationWindowDuration;
- (unint64_t)homeScreenZStackParticipantDidChange:(id)a3 launchingForSpotlight:(BOOL)a4;
- (void)setReactivationWindowDuration:(double)a3;
- (void)setShouldAnimateReactivation:(BOOL)a3;
- (void)willReactivateSpotlight;
@end

@implementation SBHomeScreenReturnToSpotlightPolicy

+ (BOOL)areSpotlightBreadcrumbsEnabled
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (unint64_t)homeScreenZStackParticipantDidChange:(id)a3 launchingForSpotlight:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 activationState];
  int64_t lastKnownActivationState = self->_lastKnownActivationState;
  int64_t v9 = [v6 activationState];

  self->_int64_t lastKnownActivationState = v9;
  if (v7 != lastKnownActivationState)
  {
    if (v7 == 1 && !self->_homeScreenInactiveReason)
    {
      v13 = +[SBSceneManagerCoordinator sharedInstance];
      v14 = [v13 sceneDeactivationManager];
      v15 = (UIApplicationSceneDeactivationAssertion *)[v14 newAssertionWithReason:3];
      homeScreenInactiveReason = self->_homeScreenInactiveReason;
      self->_homeScreenInactiveReason = v15;

      [(UIApplicationSceneDeactivationAssertion *)self->_homeScreenInactiveReason acquireWithPredicate:&__block_literal_global_294 transitionContext:0];
      if (lastKnownActivationState)
      {
LABEL_6:
        if (self->_shouldReactivateSpotlight)
        {
          [(SBHomeScreenReturnToSpotlightPolicy *)self _elapsedTime];
          double reactivationWindowDuration = self->_reactivationWindowDuration;
          if (v7 == 2)
          {
            BOOL shouldReactivateSpotlight = 0;
            self->_BOOL shouldReactivateSpotlight = v11 <= reactivationWindowDuration;
            goto LABEL_24;
          }
          if (!v4)
          {
            if (self->_shouldAnimateReactivation)
            {
              if (v7 == 1 || lastKnownActivationState == 2) {
                self->_BOOL shouldReactivateSpotlight = v11 <= reactivationWindowDuration;
              }
              if (!v7)
              {
                BOOL shouldReactivateSpotlight = self->_shouldReactivateSpotlight;
                goto LABEL_24;
              }
            }
            else if (lastKnownActivationState == 2)
            {
              BOOL shouldReactivateSpotlight = v11 <= reactivationWindowDuration;
              self->_BOOL shouldReactivateSpotlight = shouldReactivateSpotlight;
              goto LABEL_23;
            }
          }
        }
        BOOL shouldReactivateSpotlight = 0;
LABEL_23:
        if (v7 == 1) {
          return shouldReactivateSpotlight;
        }
LABEL_24:
        [(UIApplicationSceneDeactivationAssertion *)self->_spotlightSceneDeactivationAssertion relinquish];
        spotlightSceneDeactivationAssertion = self->_spotlightSceneDeactivationAssertion;
        self->_spotlightSceneDeactivationAssertion = 0;

        [(UIApplicationSceneDeactivationAssertion *)self->_homeScreenInactiveReason relinquish];
        v18 = self->_homeScreenInactiveReason;
        self->_homeScreenInactiveReason = 0;

        return shouldReactivateSpotlight;
      }
    }
    else if (lastKnownActivationState)
    {
      goto LABEL_6;
    }
    if (v4) {
      self->_anchorTimeForReactivationWindow = CFAbsoluteTimeGetCurrent();
    }
    BOOL shouldReactivateSpotlight = 0;
    self->_BOOL shouldReactivateSpotlight = v4;
    goto LABEL_23;
  }
  return 0;
}

- (SBHomeScreenReturnToSpotlightPolicy)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBHomeScreenReturnToSpotlightPolicy;
  v2 = [(SBHomeScreenReturnToSpotlightPolicy *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_double reactivationWindowDuration = 8.0;
    BOOL v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    v3->_shouldAnimateReactivation = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  return v3;
}

- (void)setReactivationWindowDuration:(double)a3
{
  self->_double reactivationWindowDuration = a3;
}

- (double)_elapsedTime
{
  return CFAbsoluteTimeGetCurrent() - self->_anchorTimeForReactivationWindow;
}

uint64_t __98__SBHomeScreenReturnToSpotlightPolicy_homeScreenZStackParticipantDidChange_launchingForSpotlight___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 clientHandle];
  uint64_t v3 = [v2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:@"com.apple.Spotlight"];

  return v4;
}

- (void)willReactivateSpotlight
{
  if (self->_lastKnownActivationState)
  {
    if (!self->_spotlightSceneDeactivationAssertion)
    {
      uint64_t v3 = +[SBSceneManagerCoordinator sharedInstance];
      uint64_t v4 = [v3 sceneDeactivationManager];
      uint64_t v5 = (UIApplicationSceneDeactivationAssertion *)[v4 newAssertionWithReason:5];
      spotlightSceneDeactivationAssertion = self->_spotlightSceneDeactivationAssertion;
      self->_spotlightSceneDeactivationAssertion = v5;

      objc_super v7 = self->_spotlightSceneDeactivationAssertion;
      [(UIApplicationSceneDeactivationAssertion *)v7 acquireWithPredicate:&__block_literal_global_2_1 transitionContext:0];
    }
  }
  else
  {
    self->_BOOL shouldReactivateSpotlight = 0;
  }
}

uint64_t __62__SBHomeScreenReturnToSpotlightPolicy_willReactivateSpotlight__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 clientHandle];
  uint64_t v3 = [v2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:@"com.apple.Spotlight"];

  return v4;
}

- (double)reactivationWindowDuration
{
  return self->_reactivationWindowDuration;
}

- (BOOL)shouldAnimateReactivation
{
  return self->_shouldAnimateReactivation;
}

- (void)setShouldAnimateReactivation:(BOOL)a3
{
  self->_shouldAnimateReactivation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenInactiveReason, 0);
  objc_storeStrong((id *)&self->_spotlightSceneDeactivationAssertion, 0);
}

@end
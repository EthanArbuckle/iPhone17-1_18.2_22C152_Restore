@interface SBNotificationHomeAffordanceController
+ (SBNotificationHomeAffordanceController)sharedInstance;
- (BSAnimationSettings)hideHomeAffordanceAnimationSettings;
- (BSAnimationSettings)unhideHomeAffordanceAnimationSettings;
- (SBScreenEdgePanGestureRecognizer)screenEdgePanGesture;
- (UIViewSpringAnimationBehaviorDescribing)settleHomeAffordanceAnimationBehaviorDescription;
- (void)registerClient:(id)a3 withZStackIdentifier:(int64_t)a4;
- (void)unregisterClient:(id)a3 withZStackIdentifier:(int64_t)a4;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBNotificationHomeAffordanceController

+ (SBNotificationHomeAffordanceController)sharedInstance
{
  if (sharedInstance_onceToken_56 != -1) {
    dispatch_once(&sharedInstance_onceToken_56, &__block_literal_global_400);
  }
  v2 = (void *)sharedInstance___sharedInstance_28;
  return (SBNotificationHomeAffordanceController *)v2;
}

void __56__SBNotificationHomeAffordanceController_sharedInstance__block_invoke()
{
  if (SBHomeGestureEnabled()) {
    v0 = objc_alloc_init(SBNotificationHomeAffordanceController);
  }
  else {
    v0 = 0;
  }
  v1 = (void *)sharedInstance___sharedInstance_28;
  sharedInstance___sharedInstance_28 = (uint64_t)v0;
}

- (SBScreenEdgePanGestureRecognizer)screenEdgePanGesture
{
  screenEdgePanGesture = self->_screenEdgePanGesture;
  if (!screenEdgePanGesture)
  {
    v4 = +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:0 action:0];
    v5 = self->_screenEdgePanGesture;
    self->_screenEdgePanGesture = v4;

    v6 = +[SBSystemGestureManager mainDisplayManager];
    [v6 addGestureRecognizer:self->_screenEdgePanGesture withType:5];
    [(UIScreenEdgePanGestureRecognizer *)self->_screenEdgePanGesture setEdges:4];
    [(SBHomeGesturePanGestureRecognizer *)self->_screenEdgePanGesture setEnabled:0];

    screenEdgePanGesture = self->_screenEdgePanGesture;
  }
  return (SBScreenEdgePanGestureRecognizer *)screenEdgePanGesture;
}

- (BSAnimationSettings)hideHomeAffordanceAnimationSettings
{
  v2 = [MEMORY[0x1E4FA5F28] rootSettings];
  v3 = [v2 hideForHomeGestureOwnershipAnimationSettings];
  v4 = [v3 BSAnimationSettings];

  return (BSAnimationSettings *)v4;
}

- (BSAnimationSettings)unhideHomeAffordanceAnimationSettings
{
  v2 = [MEMORY[0x1E4FA5F28] rootSettings];
  v3 = [v2 unhideForHomeGestureOwnershipAnimationSettings];
  v4 = [v3 BSAnimationSettings];

  return (BSAnimationSettings *)v4;
}

- (UIViewSpringAnimationBehaviorDescribing)settleHomeAffordanceAnimationBehaviorDescription
{
  v2 = +[SBAppSwitcherDomain rootSettings];
  v3 = [v2 animationSettings];
  v4 = [v3 alertBarSwipeDismissalSettings];

  return (UIViewSpringAnimationBehaviorDescribing *)v4;
}

- (void)registerClient:(id)a3 withZStackIdentifier:(int64_t)a4
{
  id v21 = a3;
  if (!v21)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBNotificationHomeAffordanceController.m", 65, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  if (a4 != 14)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBNotificationHomeAffordanceController.m", 66, @"identifier out of range: %lu", a4);
  }
  clientsToZStackParticipants = self->_clientsToZStackParticipants;
  if (!clientsToZStackParticipants)
  {
    v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v9 = self->_clientsToZStackParticipants;
    self->_clientsToZStackParticipants = v8;

    clientsToZStackParticipants = self->_clientsToZStackParticipants;
  }
  v10 = [(NSMapTable *)clientsToZStackParticipants keyEnumerator];
  v11 = 0;
  v12 = 0;
  while (1)
  {
    v13 = v12;
    v12 = [v10 nextObject];

    if (!v12) {
      break;
    }
    v14 = [(NSMapTable *)self->_clientsToZStackParticipants objectForKey:v12];

    v11 = v14;
    if ([v14 identifier] == a4)
    {
      [(NSMapTable *)self->_clientsToZStackParticipants setObject:v14 forKey:v21];
      if (v14) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
  }
  v14 = v11;
  if (v11) {
    goto LABEL_16;
  }
LABEL_13:
  v15 = [(id)SBApp windowSceneManager];
  v16 = [v15 embeddedDisplayWindowScene];
  v17 = [v16 zStackResolver];
  v14 = [v17 acquireParticipantWithIdentifier:a4 delegate:self];

  if (v14)
  {
    [(NSMapTable *)self->_clientsToZStackParticipants setObject:v14 forKey:v21];
    if ([v14 ownsHomeGesture]) {
      [(SBNotificationHomeAffordanceController *)self zStackParticipantDidChange:v14];
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"SBNotificationHomeAffordanceController.m" lineNumber:87 description:@"Failed to receive a participant from the resolver"];
  }
LABEL_16:
}

- (void)unregisterClient:(id)a3 withZStackIdentifier:(int64_t)a4
{
  id v7 = a3;
  id v11 = v7;
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBNotificationHomeAffordanceController.m", 98, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

    id v7 = 0;
  }
  if (a4 != 14)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBNotificationHomeAffordanceController.m", 99, @"identifier out of range: %lu", a4);

    id v7 = v11;
  }
  v8 = [(NSMapTable *)self->_clientsToZStackParticipants objectForKey:v7];
  [v8 invalidate];
  [(NSMapTable *)self->_clientsToZStackParticipants removeObjectForKey:v11];
  if (![(NSMapTable *)self->_clientsToZStackParticipants count]) {
    [(SBHomeGesturePanGestureRecognizer *)self->_screenEdgePanGesture setEnabled:0];
  }
}

- (void)zStackParticipantDidChange:(id)a3
{
  id v12 = a3;
  v4 = [(NSMapTable *)self->_clientsToZStackParticipants keyEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    v6 = (void *)v5;
    LOBYTE(v7) = 0;
    do
    {
      v8 = [(NSMapTable *)self->_clientsToZStackParticipants objectForKey:v6];
      id v9 = v8;
      if (v7) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = [v8 ownsHomeGesture];
      }
      if (v9 == v12) {
        [v6 zStackParticipantDidChange:v12];
      }

      uint64_t v10 = [v4 nextObject];

      v6 = (void *)v10;
    }
    while (v10);
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v11 = [(SBNotificationHomeAffordanceController *)self screenEdgePanGesture];
  [v11 setEnabled:v7];
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenEdgePanGesture, 0);
  objc_storeStrong((id *)&self->_clientsToZStackParticipants, 0);
}

@end
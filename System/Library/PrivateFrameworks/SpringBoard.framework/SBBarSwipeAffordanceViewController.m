@interface SBBarSwipeAffordanceViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)suppressAffordance;
- (BOOL)wantsToBeActiveAffordance;
- (SBBarSwipeAffordanceControllingDelegate)delegate;
- (SBBarSwipeAffordanceViewController)initWithZStackParticipantIdentifier:(int64_t)a3 windowScene:(id)a4;
- (SBFZStackParticipant)zStackParticipant;
- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate;
- (int64_t)activationPolicyForParticipantsBelow;
- (void)loadView;
- (void)setActivationPolicyForParticipantsBelow:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPointerClickDelegate:(id)a3;
- (void)setSuppressAffordance:(BOOL)a3;
- (void)setWantsToBeActiveAffordance:(BOOL)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBBarSwipeAffordanceViewController

- (void)setWantsToBeActiveAffordance:(BOOL)a3
{
}

- (SBBarSwipeAffordanceViewController)initWithZStackParticipantIdentifier:(int64_t)a3 windowScene:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBBarSwipeAffordanceViewController;
  v7 = [(SBBarSwipeAffordanceViewController *)&v11 initWithNibName:0 bundle:0];
  if (v7)
  {
    v8 = [[SBBarSwipeAffordanceController alloc] initWithZStackParticipantIdentifier:a3 windowScene:v6];
    barSwipeAffordanceController = v7->_barSwipeAffordanceController;
    v7->_barSwipeAffordanceController = v8;
  }
  return v7;
}

- (SBBarSwipeAffordanceControllingDelegate)delegate
{
  return [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController delegate];
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)wantsToBeActiveAffordance
{
  return [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController wantsToBeActiveAffordance];
}

- (BOOL)suppressAffordance
{
  return [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController suppressAffordance];
}

- (void)setSuppressAffordance:(BOOL)a3
{
}

- (int64_t)activationPolicyForParticipantsBelow
{
  return [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController activationPolicyForParticipantsBelow];
}

- (void)setActivationPolicyForParticipantsBelow:(int64_t)a3
{
}

- (SBFZStackParticipant)zStackParticipant
{
  return [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController zStackParticipant];
}

- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate
{
  return [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController pointerClickDelegate];
}

- (void)setPointerClickDelegate:(id)a3
{
}

- (void)loadView
{
  id v3 = [(SBBarSwipeAffordanceController *)self->_barSwipeAffordanceController barSwipeAffordanceView];
  [(SBBarSwipeAffordanceViewController *)self setView:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)zStackParticipantDidChange:(id)a3
{
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
}

- (void).cxx_destruct
{
}

@end
@interface SBDismissForEmptySwitcherSwitcherEventResponse
- (SBDismissForEmptySwitcherSwitcherEventResponse)init;
- (SBDismissForEmptySwitcherSwitcherEventResponse)initWithHIDEventSenderID:(unint64_t)a3;
- (int64_t)type;
@end

@implementation SBDismissForEmptySwitcherSwitcherEventResponse

- (SBDismissForEmptySwitcherSwitcherEventResponse)init
{
  return [(SBDismissForEmptySwitcherSwitcherEventResponse *)self initWithHIDEventSenderID:0];
}

- (SBDismissForEmptySwitcherSwitcherEventResponse)initWithHIDEventSenderID:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBDismissForEmptySwitcherSwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v12 init];
  if (v4)
  {
    v5 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:1 phase:0];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v5];

    v6 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:1 phase:1];
    [(SBHapticSwitcherEventResponse *)v6 setHidEventSenderID:a3];
    v7 = [SBPerformTransitionSwitcherEventResponse alloc];
    v8 = +[SBSwitcherTransitionRequest requestForActivatingHomeScreen];
    v9 = [(SBPerformTransitionSwitcherEventResponse *)v7 initWithTransitionRequest:v8 gestureInitiated:0];

    [(SBChainableModifierEventResponse *)v4 addChildResponse:v6];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v9];
    v10 = [[SBHapticSwitcherEventResponse alloc] initWithHapticType:1 phase:2];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v10];
  }
  return v4;
}

- (int64_t)type
{
  return 16;
}

@end
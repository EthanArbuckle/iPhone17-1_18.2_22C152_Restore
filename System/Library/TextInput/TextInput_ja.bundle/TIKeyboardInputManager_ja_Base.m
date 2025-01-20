@interface TIKeyboardInputManager_ja_Base
- (BOOL)delayedCandidateList;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)usesCandidateSelection;
- (id)keyboardBehaviors;
@end

@implementation TIKeyboardInputManager_ja_Base

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E5E0]);
  return v2;
}

@end
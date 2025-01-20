@interface TIKeyboardBehaviorState
- (BOOL)followsIncompleteRomaji;
- (BOOL)followsZhuyin;
- (BOOL)hardwareKeyboardMode;
- (BOOL)hasAutocorrection;
- (BOOL)hasCandidateSelected;
- (BOOL)hasCandidates;
- (BOOL)hasInput;
- (BOOL)hasNextPage;
- (BOOL)isContinuousPathUnderway;
- (BOOL)showsCandidatesInLayout;
- (BOOL)showsExtendedList;
- (BOOL)spaceConfirmation;
- (BOOL)userSelectedCurrentCandidate;
- (void)setContinuousPathUnderway:(BOOL)a3;
- (void)setFollowsIncompleteRomaji:(BOOL)a3;
- (void)setFollowsZhuyin:(BOOL)a3;
- (void)setHardwareKeyboardMode:(BOOL)a3;
- (void)setHasAutocorrection:(BOOL)a3;
- (void)setHasCandidateSelected:(BOOL)a3;
- (void)setHasCandidates:(BOOL)a3;
- (void)setHasInput:(BOOL)a3;
- (void)setHasNextPage:(BOOL)a3;
- (void)setShowsCandidatesInLayout:(BOOL)a3;
- (void)setShowsExtendedList:(BOOL)a3;
- (void)setSpaceConfirmation:(BOOL)a3;
- (void)setUserSelectedCurrentCandidate:(BOOL)a3;
@end

@implementation TIKeyboardBehaviorState

- (void)setContinuousPathUnderway:(BOOL)a3
{
  self->_continuousPathUnderway = a3;
}

- (BOOL)isContinuousPathUnderway
{
  return self->_continuousPathUnderway;
}

- (void)setShowsCandidatesInLayout:(BOOL)a3
{
  self->_showsCandidatesInLayout = a3;
}

- (BOOL)showsCandidatesInLayout
{
  return self->_showsCandidatesInLayout;
}

- (void)setUserSelectedCurrentCandidate:(BOOL)a3
{
  self->_userSelectedCurrentCandidate = a3;
}

- (BOOL)userSelectedCurrentCandidate
{
  return self->_userSelectedCurrentCandidate;
}

- (void)setHasAutocorrection:(BOOL)a3
{
  self->_hasAutocorrection = a3;
}

- (BOOL)hasAutocorrection
{
  return self->_hasAutocorrection;
}

- (void)setFollowsIncompleteRomaji:(BOOL)a3
{
  self->followsIncompleteRomaji = a3;
}

- (BOOL)followsIncompleteRomaji
{
  return self->followsIncompleteRomaji;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  self->hardwareKeyboardMode = a3;
}

- (BOOL)hardwareKeyboardMode
{
  return self->hardwareKeyboardMode;
}

- (void)setSpaceConfirmation:(BOOL)a3
{
  self->spaceConfirmation = a3;
}

- (BOOL)spaceConfirmation
{
  return self->spaceConfirmation;
}

- (void)setFollowsZhuyin:(BOOL)a3
{
  self->followsZhuyin = a3;
}

- (BOOL)followsZhuyin
{
  return self->followsZhuyin;
}

- (void)setShowsExtendedList:(BOOL)a3
{
  self->showsExtendedList = a3;
}

- (BOOL)showsExtendedList
{
  return self->showsExtendedList;
}

- (void)setHasNextPage:(BOOL)a3
{
  self->hasNextPage = a3;
}

- (BOOL)hasNextPage
{
  return self->hasNextPage;
}

- (void)setHasCandidateSelected:(BOOL)a3
{
  self->hasCandidateSelected = a3;
}

- (BOOL)hasCandidateSelected
{
  return self->hasCandidateSelected;
}

- (void)setHasCandidates:(BOOL)a3
{
  self->hasCandidates = a3;
}

- (BOOL)hasCandidates
{
  return self->hasCandidates;
}

- (void)setHasInput:(BOOL)a3
{
  self->hasInput = a3;
}

- (BOOL)hasInput
{
  return self->hasInput;
}

@end
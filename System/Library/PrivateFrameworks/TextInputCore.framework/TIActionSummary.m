@interface TIActionSummary
- (int)backspaceKeyTaps;
- (int)candidateSelections;
- (int)characterKeyTaps;
- (int)cursorMovements;
- (int)cuts;
- (int)emojiCandidateSelections;
- (int)emojiKeyTaps;
- (int)emojiSearchBackspaceKeyTaps;
- (int)emojiSearchCandidateSelections;
- (int)emojiSearchCharacterKeyTaps;
- (int)emojiSearchCursorMovements;
- (int)emojiSearchCuts;
- (int)emojiSearchEmojiKeyTaps;
- (int)emojiSearchFlicks;
- (int)emojiSearchGestures;
- (int)emojiSearchMoreKeyTaps;
- (int)emojiSearchPastes;
- (int)emojiSearchPaths;
- (int)emojiSearchPathsWithWeight1;
- (int)emojiSearchPathsWithWeight10;
- (int)emojiSearchPathsWithWeight2;
- (int)emojiSearchPathsWithWeight3;
- (int)emojiSearchPathsWithWeight4;
- (int)emojiSearchPathsWithWeight5;
- (int)emojiSearchPathsWithWeight6;
- (int)emojiSearchPathsWithWeight7;
- (int)emojiSearchPathsWithWeight8;
- (int)emojiSearchPathsWithWeight9;
- (int)emojiSearchPopupVariants;
- (int)emojiSearchShiftKeyTaps;
- (int)emojiSearchSpaceKeyTaps;
- (int)emojiSearchUnknownKeyTaps;
- (int)emojiSelections;
- (int)flicks;
- (int)gestures;
- (int)moreKeyTaps;
- (int)pastes;
- (int)paths;
- (int)pathsWithWeight1;
- (int)pathsWithWeight10;
- (int)pathsWithWeight2;
- (int)pathsWithWeight3;
- (int)pathsWithWeight4;
- (int)pathsWithWeight5;
- (int)pathsWithWeight6;
- (int)pathsWithWeight7;
- (int)pathsWithWeight8;
- (int)pathsWithWeight9;
- (int)popupVariants;
- (int)returnKeyTaps;
- (int)shiftKeyTaps;
- (int)spaceKeyTaps;
- (int)totalInputActions;
- (int)unknownKeyTaps;
- (void)setBackspaceKeyTaps:(int)a3;
- (void)setCandidateSelections:(int)a3;
- (void)setCharacterKeyTaps:(int)a3;
- (void)setCursorMovements:(int)a3;
- (void)setCuts:(int)a3;
- (void)setEmojiCandidateSelections:(int)a3;
- (void)setEmojiKeyTaps:(int)a3;
- (void)setEmojiSearchBackspaceKeyTaps:(int)a3;
- (void)setEmojiSearchCandidateSelections:(int)a3;
- (void)setEmojiSearchCharacterKeyTaps:(int)a3;
- (void)setEmojiSearchCursorMovements:(int)a3;
- (void)setEmojiSearchCuts:(int)a3;
- (void)setEmojiSearchEmojiKeyTaps:(int)a3;
- (void)setEmojiSearchFlicks:(int)a3;
- (void)setEmojiSearchGestures:(int)a3;
- (void)setEmojiSearchMoreKeyTaps:(int)a3;
- (void)setEmojiSearchPastes:(int)a3;
- (void)setEmojiSearchPaths:(int)a3;
- (void)setEmojiSearchPathsWithWeight10:(int)a3;
- (void)setEmojiSearchPathsWithWeight1:(int)a3;
- (void)setEmojiSearchPathsWithWeight2:(int)a3;
- (void)setEmojiSearchPathsWithWeight3:(int)a3;
- (void)setEmojiSearchPathsWithWeight4:(int)a3;
- (void)setEmojiSearchPathsWithWeight5:(int)a3;
- (void)setEmojiSearchPathsWithWeight6:(int)a3;
- (void)setEmojiSearchPathsWithWeight7:(int)a3;
- (void)setEmojiSearchPathsWithWeight8:(int)a3;
- (void)setEmojiSearchPathsWithWeight9:(int)a3;
- (void)setEmojiSearchPopupVariants:(int)a3;
- (void)setEmojiSearchShiftKeyTaps:(int)a3;
- (void)setEmojiSearchSpaceKeyTaps:(int)a3;
- (void)setEmojiSearchUnknownKeyTaps:(int)a3;
- (void)setEmojiSelections:(int)a3;
- (void)setFlicks:(int)a3;
- (void)setGestures:(int)a3;
- (void)setMoreKeyTaps:(int)a3;
- (void)setPastes:(int)a3;
- (void)setPaths:(int)a3;
- (void)setPathsWithWeight10:(int)a3;
- (void)setPathsWithWeight1:(int)a3;
- (void)setPathsWithWeight2:(int)a3;
- (void)setPathsWithWeight3:(int)a3;
- (void)setPathsWithWeight4:(int)a3;
- (void)setPathsWithWeight5:(int)a3;
- (void)setPathsWithWeight6:(int)a3;
- (void)setPathsWithWeight7:(int)a3;
- (void)setPathsWithWeight8:(int)a3;
- (void)setPathsWithWeight9:(int)a3;
- (void)setPopupVariants:(int)a3;
- (void)setReturnKeyTaps:(int)a3;
- (void)setShiftKeyTaps:(int)a3;
- (void)setSpaceKeyTaps:(int)a3;
- (void)setTotalInputActions:(int)a3;
- (void)setUnknownKeyTaps:(int)a3;
@end

@implementation TIActionSummary

- (void)setEmojiSearchPastes:(int)a3
{
  self->_emojiSearchPastes = a3;
}

- (int)emojiSearchPastes
{
  return self->_emojiSearchPastes;
}

- (void)setEmojiSearchCuts:(int)a3
{
  self->_emojiSearchCuts = a3;
}

- (int)emojiSearchCuts
{
  return self->_emojiSearchCuts;
}

- (void)setEmojiSearchCandidateSelections:(int)a3
{
  self->_emojiSearchCandidateSelections = a3;
}

- (int)emojiSearchCandidateSelections
{
  return self->_emojiSearchCandidateSelections;
}

- (void)setEmojiSearchCursorMovements:(int)a3
{
  self->_emojiSearchCursorMovements = a3;
}

- (int)emojiSearchCursorMovements
{
  return self->_emojiSearchCursorMovements;
}

- (void)setEmojiSearchPopupVariants:(int)a3
{
  self->_emojiSearchPopupVariants = a3;
}

- (int)emojiSearchPopupVariants
{
  return self->_emojiSearchPopupVariants;
}

- (void)setEmojiSearchGestures:(int)a3
{
  self->_emojiSearchGestures = a3;
}

- (int)emojiSearchGestures
{
  return self->_emojiSearchGestures;
}

- (void)setEmojiSearchFlicks:(int)a3
{
  self->_emojiSearchFlicks = a3;
}

- (int)emojiSearchFlicks
{
  return self->_emojiSearchFlicks;
}

- (void)setEmojiSearchPathsWithWeight10:(int)a3
{
  self->_emojiSearchPathsWithWeight10 = a3;
}

- (int)emojiSearchPathsWithWeight10
{
  return self->_emojiSearchPathsWithWeight10;
}

- (void)setEmojiSearchPathsWithWeight9:(int)a3
{
  self->_emojiSearchPathsWithWeight9 = a3;
}

- (int)emojiSearchPathsWithWeight9
{
  return self->_emojiSearchPathsWithWeight9;
}

- (void)setEmojiSearchPathsWithWeight8:(int)a3
{
  self->_emojiSearchPathsWithWeight8 = a3;
}

- (int)emojiSearchPathsWithWeight8
{
  return self->_emojiSearchPathsWithWeight8;
}

- (void)setEmojiSearchPathsWithWeight7:(int)a3
{
  self->_emojiSearchPathsWithWeight7 = a3;
}

- (int)emojiSearchPathsWithWeight7
{
  return self->_emojiSearchPathsWithWeight7;
}

- (void)setEmojiSearchPathsWithWeight6:(int)a3
{
  self->_emojiSearchPathsWithWeight6 = a3;
}

- (int)emojiSearchPathsWithWeight6
{
  return self->_emojiSearchPathsWithWeight6;
}

- (void)setEmojiSearchPathsWithWeight5:(int)a3
{
  self->_emojiSearchPathsWithWeight5 = a3;
}

- (int)emojiSearchPathsWithWeight5
{
  return self->_emojiSearchPathsWithWeight5;
}

- (void)setEmojiSearchPathsWithWeight4:(int)a3
{
  self->_emojiSearchPathsWithWeight4 = a3;
}

- (int)emojiSearchPathsWithWeight4
{
  return self->_emojiSearchPathsWithWeight4;
}

- (void)setEmojiSearchPathsWithWeight3:(int)a3
{
  self->_emojiSearchPathsWithWeight3 = a3;
}

- (int)emojiSearchPathsWithWeight3
{
  return self->_emojiSearchPathsWithWeight3;
}

- (void)setEmojiSearchPathsWithWeight2:(int)a3
{
  self->_emojiSearchPathsWithWeight2 = a3;
}

- (int)emojiSearchPathsWithWeight2
{
  return self->_emojiSearchPathsWithWeight2;
}

- (void)setEmojiSearchPathsWithWeight1:(int)a3
{
  self->_emojiSearchPathsWithWeight1 = a3;
}

- (int)emojiSearchPathsWithWeight1
{
  return self->_emojiSearchPathsWithWeight1;
}

- (void)setEmojiSearchPaths:(int)a3
{
  self->_emojiSearchPaths = a3;
}

- (int)emojiSearchPaths
{
  return self->_emojiSearchPaths;
}

- (void)setEmojiSearchUnknownKeyTaps:(int)a3
{
  self->_emojiSearchUnknownKeyTaps = a3;
}

- (int)emojiSearchUnknownKeyTaps
{
  return self->_emojiSearchUnknownKeyTaps;
}

- (void)setEmojiSearchEmojiKeyTaps:(int)a3
{
  self->_emojiSearchEmojiKeyTaps = a3;
}

- (int)emojiSearchEmojiKeyTaps
{
  return self->_emojiSearchEmojiKeyTaps;
}

- (void)setEmojiSearchMoreKeyTaps:(int)a3
{
  self->_emojiSearchMoreKeyTaps = a3;
}

- (int)emojiSearchMoreKeyTaps
{
  return self->_emojiSearchMoreKeyTaps;
}

- (void)setEmojiSearchShiftKeyTaps:(int)a3
{
  self->_emojiSearchShiftKeyTaps = a3;
}

- (int)emojiSearchShiftKeyTaps
{
  return self->_emojiSearchShiftKeyTaps;
}

- (void)setEmojiSearchSpaceKeyTaps:(int)a3
{
  self->_emojiSearchSpaceKeyTaps = a3;
}

- (int)emojiSearchSpaceKeyTaps
{
  return self->_emojiSearchSpaceKeyTaps;
}

- (void)setEmojiSearchBackspaceKeyTaps:(int)a3
{
  self->_emojiSearchBackspaceKeyTaps = a3;
}

- (int)emojiSearchBackspaceKeyTaps
{
  return self->_emojiSearchBackspaceKeyTaps;
}

- (void)setEmojiSearchCharacterKeyTaps:(int)a3
{
  self->_emojiSearchCharacterKeyTaps = a3;
}

- (int)emojiSearchCharacterKeyTaps
{
  return self->_emojiSearchCharacterKeyTaps;
}

- (void)setEmojiCandidateSelections:(int)a3
{
  self->_emojiCandidateSelections = a3;
}

- (int)emojiCandidateSelections
{
  return self->_emojiCandidateSelections;
}

- (void)setEmojiSelections:(int)a3
{
  self->_emojiSelections = a3;
}

- (int)emojiSelections
{
  return self->_emojiSelections;
}

- (void)setPastes:(int)a3
{
  self->_pastes = a3;
}

- (int)pastes
{
  return self->_pastes;
}

- (void)setCuts:(int)a3
{
  self->_cuts = a3;
}

- (int)cuts
{
  return self->_cuts;
}

- (void)setCandidateSelections:(int)a3
{
  self->_candidateSelections = a3;
}

- (int)candidateSelections
{
  return self->_candidateSelections;
}

- (void)setCursorMovements:(int)a3
{
  self->_cursorMovements = a3;
}

- (int)cursorMovements
{
  return self->_cursorMovements;
}

- (void)setPopupVariants:(int)a3
{
  self->_popupVariants = a3;
}

- (int)popupVariants
{
  return self->_popupVariants;
}

- (void)setGestures:(int)a3
{
  self->_gestures = a3;
}

- (int)gestures
{
  return self->_gestures;
}

- (void)setFlicks:(int)a3
{
  self->_flicks = a3;
}

- (int)flicks
{
  return self->_flicks;
}

- (void)setPathsWithWeight10:(int)a3
{
  self->_pathsWithWeight10 = a3;
}

- (int)pathsWithWeight10
{
  return self->_pathsWithWeight10;
}

- (void)setPathsWithWeight9:(int)a3
{
  self->_pathsWithWeight9 = a3;
}

- (int)pathsWithWeight9
{
  return self->_pathsWithWeight9;
}

- (void)setPathsWithWeight8:(int)a3
{
  self->_pathsWithWeight8 = a3;
}

- (int)pathsWithWeight8
{
  return self->_pathsWithWeight8;
}

- (void)setPathsWithWeight7:(int)a3
{
  self->_pathsWithWeight7 = a3;
}

- (int)pathsWithWeight7
{
  return self->_pathsWithWeight7;
}

- (void)setPathsWithWeight6:(int)a3
{
  self->_pathsWithWeight6 = a3;
}

- (int)pathsWithWeight6
{
  return self->_pathsWithWeight6;
}

- (void)setPathsWithWeight5:(int)a3
{
  self->_pathsWithWeight5 = a3;
}

- (int)pathsWithWeight5
{
  return self->_pathsWithWeight5;
}

- (void)setPathsWithWeight4:(int)a3
{
  self->_pathsWithWeight4 = a3;
}

- (int)pathsWithWeight4
{
  return self->_pathsWithWeight4;
}

- (void)setPathsWithWeight3:(int)a3
{
  self->_pathsWithWeight3 = a3;
}

- (int)pathsWithWeight3
{
  return self->_pathsWithWeight3;
}

- (void)setPathsWithWeight2:(int)a3
{
  self->_pathsWithWeight2 = a3;
}

- (int)pathsWithWeight2
{
  return self->_pathsWithWeight2;
}

- (void)setPathsWithWeight1:(int)a3
{
  self->_pathsWithWeight1 = a3;
}

- (int)pathsWithWeight1
{
  return self->_pathsWithWeight1;
}

- (void)setPaths:(int)a3
{
  self->_paths = a3;
}

- (int)paths
{
  return self->_paths;
}

- (void)setUnknownKeyTaps:(int)a3
{
  self->_unknownKeyTaps = a3;
}

- (int)unknownKeyTaps
{
  return self->_unknownKeyTaps;
}

- (void)setEmojiKeyTaps:(int)a3
{
  self->_emojiKeyTaps = a3;
}

- (int)emojiKeyTaps
{
  return self->_emojiKeyTaps;
}

- (void)setMoreKeyTaps:(int)a3
{
  self->_moreKeyTaps = a3;
}

- (int)moreKeyTaps
{
  return self->_moreKeyTaps;
}

- (void)setShiftKeyTaps:(int)a3
{
  self->_shiftKeyTaps = a3;
}

- (int)shiftKeyTaps
{
  return self->_shiftKeyTaps;
}

- (void)setReturnKeyTaps:(int)a3
{
  self->_returnKeyTaps = a3;
}

- (int)returnKeyTaps
{
  return self->_returnKeyTaps;
}

- (void)setSpaceKeyTaps:(int)a3
{
  self->_spaceKeyTaps = a3;
}

- (int)spaceKeyTaps
{
  return self->_spaceKeyTaps;
}

- (void)setBackspaceKeyTaps:(int)a3
{
  self->_backspaceKeyTaps = a3;
}

- (int)backspaceKeyTaps
{
  return self->_backspaceKeyTaps;
}

- (void)setCharacterKeyTaps:(int)a3
{
  self->_characterKeyTaps = a3;
}

- (int)characterKeyTaps
{
  return self->_characterKeyTaps;
}

- (void)setTotalInputActions:(int)a3
{
  self->_totalInputActions = a3;
}

- (int)totalInputActions
{
  return self->_totalInputActions;
}

@end
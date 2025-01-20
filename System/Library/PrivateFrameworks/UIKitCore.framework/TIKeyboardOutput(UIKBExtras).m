@interface TIKeyboardOutput(UIKBExtras)
- (BOOL)_isEmpty;
- (void)_copyTo:()UIKBExtras;
@end

@implementation TIKeyboardOutput(UIKBExtras)

- (void)_copyTo:()UIKBExtras
{
  id v11 = a3;
  v4 = [a1 acceptedCandidate];
  [v11 setAcceptedCandidate:v4];

  v5 = [a1 textToCommit];
  [v11 setTextToCommit:v5];

  objc_msgSend(v11, "setUnmarkIfNecessary:", objc_msgSend(a1, "unmarkIfNecessary"));
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
    objc_msgSend(v11, "setPositionOffset:", objc_msgSend(a1, "positionOffset"));
  }
  objc_msgSend(v11, "setDeletionCount:", objc_msgSend(a1, "deletionCount"));
  v6 = [a1 insertionText];
  [v11 setInsertionText:v6];

  objc_msgSend(v11, "setForwardDeletionCount:", objc_msgSend(a1, "forwardDeletionCount"));
  v7 = [a1 insertionTextAfterSelection];
  [v11 setInsertionTextAfterSelection:v7];

  v8 = [a1 shortcutConversion];
  [v11 setShortcutConversion:v8];

  v9 = [a1 handwritingStrokesToDelete];
  [v11 setHandwritingStrokesToDelete:v9];

  objc_msgSend(v11, "setShouldSendCurrentLocation:", objc_msgSend(a1, "shouldSendCurrentLocation"));
  v10 = [a1 customInfo];
  [v11 setCustomInfo:v10];

  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
    objc_msgSend(v11, "setProducedByDeleteInput:", objc_msgSend(a1, "producedByDeleteInput"));
  }
}

- (BOOL)_isEmpty
{
  uint64_t v2 = [a1 acceptedCandidate];

  uint64_t v3 = [a1 textToCommit];
  uint64_t v4 = v2 | v3;

  char v5 = [a1 unmarkIfNecessary];
  if (v4) {
    char v6 = 1;
  }
  else {
    char v6 = v5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [a1 positionOffset]) {
    char v6 = 1;
  }
  if ([a1 deletionCount]) {
    char v6 = 1;
  }
  v7 = [a1 insertionText];
  if (v7) {
    char v6 = 1;
  }

  if ([a1 forwardDeletionCount]) {
    char v6 = 1;
  }
  v8 = [a1 insertionTextAfterSelection];
  if (v8) {
    char v6 = 1;
  }

  v9 = [a1 shortcutConversion];
  if (v9) {
    char v6 = 1;
  }

  v10 = [a1 handwritingStrokesToDelete];
  if (v10) {
    char v11 = 1;
  }
  else {
    char v11 = v6;
  }

  char v12 = [a1 shouldSendCurrentLocation];
  v13 = [a1 customInfo];
  char v14 = v11 | v12 | (v13 != 0);

  if (objc_opt_respondsToSelector()) {
    v14 |= [a1 producedByDeleteInput];
  }
  return (v14 & 1) == 0;
}

@end
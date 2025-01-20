@interface TIKeyboardBehaviors_Pinyin
- (id)keyBehaviorsForState:(id)a3;
@end

@implementation TIKeyboardBehaviors_Pinyin

- (id)keyBehaviorsForState:(id)a3
{
  id v3 = a3;
  int v4 = [v3 hasInput];
  int v5 = [v3 hasCandidates];
  if (!v4)
  {
    if (!v5)
    {
      v19 = 0;
      goto LABEL_51;
    }
    if (![v3 hardwareKeyboardMode])
    {
      if ([v3 hasCandidateSelected])
      {
        if ([v3 showsExtendedList]
          && ![v3 hardwareKeyboardMode])
        {
          uint64_t v18 = 4;
        }
        else if ([v3 spaceConfirmation])
        {
          uint64_t v18 = 5;
        }
        else
        {
          uint64_t v18 = 4;
        }
        uint64_t v15 = 2;
      }
      else
      {
        uint64_t v18 = 7;
        uint64_t v15 = 9;
      }
      goto LABEL_50;
    }
    int v16 = [v3 spaceConfirmation];
    int v17 = [v3 hasCandidateSelected];
    if (v16)
    {
      if (v17) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 7;
      }
      int v17 = [v3 hasCandidateSelected];
    }
    else if (v17)
    {
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 7;
    }
    if (v17) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 9;
    }
    goto LABEL_49;
  }
  if (v5)
  {
    int v6 = [v3 hardwareKeyboardMode];
    int v7 = [v3 spaceConfirmation];
    int v8 = v7;
    if (v6)
    {
      int v9 = [v3 hasCandidateSelected];
      uint64_t v10 = 5;
      if (v9) {
        uint64_t v10 = 2;
      }
      uint64_t v11 = 3;
      if (v9) {
        uint64_t v11 = 4;
      }
      BOOL v12 = v8 == 0;
      if (v8) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = v11;
      }
      if (v12) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 10;
      }
      if ([v3 userSelectedCurrentCandidate]) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = v14;
      }
    }
    else if (v7 {
           && (![v3 showsExtendedList]
    }
            || ([v3 showsCandidatesInLayout] & 1) != 0))
    {
      if ([v3 hasCandidateSelected]) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 5;
      }
      uint64_t v15 = 10;
    }
    else
    {
      if ([v3 hasCandidateSelected]) {
        uint64_t v13 = 4;
      }
      else {
        uint64_t v13 = 3;
      }
      uint64_t v15 = 2;
    }
LABEL_49:
    uint64_t v18 = v13;
    goto LABEL_50;
  }
  uint64_t v18 = 8;
  uint64_t v15 = 10;
LABEL_50:
  v19 = +[TIKeyboardKeyBehaviors behaviorForSpaceKey:v18 forReturnKey:v15];
LABEL_51:

  return v19;
}

@end
@interface TIKeyboardBehaviors_Wubixing
- (id)keyBehaviorsForState:(id)a3;
@end

@implementation TIKeyboardBehaviors_Wubixing

- (id)keyBehaviorsForState:(id)a3
{
  id v3 = a3;
  int v4 = [v3 hasCandidates];
  int v5 = [v3 hasInput];
  if (v4)
  {
    if ((v5 & 1) != 0 || [v3 hasCandidateSelected])
    {
      if ([v3 spaceConfirmation])
      {
        if ([v3 hardwareKeyboardMode])
        {
          if ([v3 userSelectedCurrentCandidate]) {
            uint64_t v6 = 2;
          }
          else {
            uint64_t v6 = 10;
          }
        }
        else
        {
          uint64_t v6 = 10;
        }
        uint64_t v7 = 2;
      }
      else
      {
        uint64_t v7 = 4;
        uint64_t v6 = 2;
      }
    }
    else
    {
      uint64_t v7 = 7;
      uint64_t v6 = 9;
    }
  }
  else
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_17;
    }
    uint64_t v7 = 8;
    uint64_t v6 = 8;
  }
  v8 = +[TIKeyboardKeyBehaviors behaviorForSpaceKey:v7 forReturnKey:v6];
LABEL_17:

  return v8;
}

@end
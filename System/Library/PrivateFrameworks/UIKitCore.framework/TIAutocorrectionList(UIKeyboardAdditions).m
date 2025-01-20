@interface TIAutocorrectionList(UIKeyboardAdditions)
- (BOOL)notEmpty;
- (uint64_t)containsAutofillCandidates;
- (uint64_t)containsContinuousPathConversions;
@end

@implementation TIAutocorrectionList(UIKeyboardAdditions)

- (uint64_t)containsAutofillCandidates
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "candidates", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if ([*(id *)(*((void *)&v6 + 1) + 8 * i) isAutofillCandidate])
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)containsContinuousPathConversions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "candidates", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if ([*(id *)(*((void *)&v6 + 1) + 8 * i) isContinuousPathConversion])
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (BOOL)notEmpty
{
  uint64_t v2 = [a1 autocorrection];
  if (v2)
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = [a1 predictions];
    if ([v4 count])
    {
      BOOL v3 = 1;
    }
    else
    {
      v5 = [a1 emojiList];
      if ([v5 count])
      {
        BOOL v3 = 1;
      }
      else
      {
        long long v6 = [a1 proactiveTriggers];
        BOOL v3 = [v6 count] != 0;
      }
    }
  }
  return v3;
}

@end
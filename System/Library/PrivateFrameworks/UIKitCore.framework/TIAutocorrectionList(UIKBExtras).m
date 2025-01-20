@interface TIAutocorrectionList(UIKBExtras)
- (uint64_t)isShowingSuggestionForKeyboardCamera;
- (uint64_t)isShowingSuggestionForWritingTools;
- (uint64_t)sourceForAutocorrection;
- (void)updateLabelsWithSmartPunctuation:()UIKBExtras;
@end

@implementation TIAutocorrectionList(UIKBExtras)

- (void)updateLabelsWithSmartPunctuation:()UIKBExtras
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5 = [a1 autocorrection];

    if (v5)
    {
      v6 = [a1 autocorrection];
      v7 = [v6 label];
      v8 = [v4 smartPunctuationedStringForString:v7];

      v9 = [a1 autocorrection];
      [v9 setLabel:v8];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v10 = objc_msgSend(a1, "predictions", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v16 = [v15 label];
          v17 = [v4 smartPunctuationedStringForString:v16];

          [v15 setLabel:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
}

- (uint64_t)sourceForAutocorrection
{
  v1 = [a1 autocorrection];
  int v2 = [v1 isContinuousPathConversion];

  if (v2) {
    return 6;
  }
  else {
    return 0;
  }
}

- (uint64_t)isShowingSuggestionForKeyboardCamera
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(a1, "predictions", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = [*(id *)(*((void *)&v7 + 1) + 8 * i) textSuggestion];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (char *)[v5 action] == sel_captureTextFromCamera_)
        {

          uint64_t v2 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v2;
}

- (uint64_t)isShowingSuggestionForWritingTools
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(a1, "predictions", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = [*(id *)(*((void *)&v7 + 1) + 8 * i) textSuggestion];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (char *)[v5 action] == sel_showWritingTools_)
        {

          uint64_t v2 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v2;
}

@end
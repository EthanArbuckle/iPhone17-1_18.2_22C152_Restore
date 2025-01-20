@interface TPSKeyboardUtilities
+ (BOOL)hasCustomizedKeyboard;
+ (BOOL)isAutoCorrectionEnabled;
+ (BOOL)isDictationEnabled;
+ (BOOL)isDictationSelectedForLanguage:(id)a3;
+ (BOOL)isExtendedSuggestionSupportedForInputMode:(id)a3;
+ (BOOL)isHandwritingEnabledForInputMode:(id)a3;
+ (BOOL)isInputModeInstalledForLanguage:(id)a3;
+ (id)_variantForInputMode:(id)a3;
+ (id)enabledDictationLanguages;
+ (id)installedInputModes;
@end

@implementation TPSKeyboardUtilities

+ (id)enabledDictationLanguages
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard.preferences"];
  v3 = [v2 objectForKey:@"DictationLanguagesEnabled"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (BOOL)isDictationEnabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.assistant.support"];
  v3 = [v2 objectForKey:@"Dictation Enabled"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)isDictationSelectedForLanguage:(id)a3
{
  id v3 = a3;
  char v4 = [(id)objc_opt_class() enabledDictationLanguages];
  char v5 = [v4 TPSSafeBoolForKey:v3];

  return v5;
}

+ (id)installedInputModes
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"AppleKeyboards"];

  return v3;
}

+ (BOOL)isHandwritingEnabledForInputMode:(id)a3
{
  id v3 = [a1 _variantForInputMode:a3];
  char v4 = [v3 isEqualToString:@"HWR"];

  return v4;
}

+ (BOOL)isInputModeInstalledForLanguage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = +[TPSKeyboardUtilities installedInputModes];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "hasPrefix:", v3, (void)v10))
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isExtendedSuggestionSupportedForInputMode:(id)a3
{
  id v3 = a3;
  if (isExtendedSuggestionSupportedForInputMode__onceToken != -1) {
    dispatch_once(&isExtendedSuggestionSupportedForInputMode__onceToken, &__block_literal_global_5);
  }
  id v18 = 0;
  char v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"([a-zA-Z0-9]+)(_\\w+)?(-\\w+)?(@.*)?" options:1 error:&v18];
  id v5 = v18;
  uint64_t v6 = objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  uint64_t v7 = v6;
  if (v6 && [v6 numberOfRanges] == 5)
  {
    uint64_t v8 = [v7 rangeAtIndex:1];
    uint64_t v10 = v9;
    uint64_t v11 = [v7 rangeAtIndex:3];
    unint64_t v13 = v12;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
    }
    else
    {
      v14 = objc_msgSend(v3, "substringWithRange:", v8, v10);
    }
    uint64_t v15 = 0;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL && v13 >= 2)
    {
      uint64_t v15 = objc_msgSend(v3, "substringWithRange:", v11 + 1, v13 - 1);
    }
    if (v14
      && [(id)isExtendedSuggestionSupportedForInputMode__supportedLanguages containsObject:v14]&& !objc_msgSend(v15, "isEqualToString:", @"HWR")|| objc_msgSend(v14, "isEqualToString:", @"hi")&& !objc_msgSend(v15, "caseInsensitiveCompare:", @"translit"))
    {
      BOOL v16 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v15 = 0;
    v14 = 0;
  }
  BOOL v16 = 0;
LABEL_9:

  return v16;
}

void __66__TPSKeyboardUtilities_isExtendedSuggestionSupportedForInputMode___block_invoke()
{
  v0 = (void *)isExtendedSuggestionSupportedForInputMode__supportedLanguages;
  isExtendedSuggestionSupportedForInputMode__supportedLanguages = (uint64_t)&unk_1F4022320;
}

+ (id)_variantForInputMode:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 rangeOfString:@"-" options:2];
  unint64_t v5 = [v3 rangeOfString:@"@" options:2];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v5 = [v3 length];
  }
  uint64_t v6 = 0;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && v4 < v5)
  {
    uint64_t v6 = objc_msgSend(v3, "substringWithRange:", v4 + 1, v5 - (v4 + 1));
  }

  return v6;
}

+ (BOOL)isAutoCorrectionEnabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard.preferences"];
  id v3 = [v2 objectForKey:@"KeyboardAutocorrection"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v4 = [v3 BOOLValue];
    }
    else {
      char v4 = 0;
    }
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

+ (BOOL)hasCustomizedKeyboard
{
  v2 = [a1 installedInputModes];
  BOOL v3 = v2 != 0;

  return v3;
}

@end
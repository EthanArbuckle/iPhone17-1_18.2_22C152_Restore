@interface TITextInputTraits(UIKBExtras)
+ (BOOL)translateToTextInputSmartDashesEnabled:()UIKBExtras;
+ (BOOL)translateToTextInputSmartInsertDeleteEnabled:()UIKBExtras;
+ (BOOL)translateToTextInputSmartQuotesEnabled:()UIKBExtras;
+ (id)traitsForUITextInputTraits:()UIKBExtras;
+ (id)translateToTextInputRecentInputIdentifier:()UIKBExtras;
+ (uint64_t)translateToAllowsTextAnimationsType:()UIKBExtras;
+ (uint64_t)translateToPublicKeyboardType:()UIKBExtras;
+ (uint64_t)translateToTextInputAutocapitalizationType:()UIKBExtras;
+ (uint64_t)translateToTextInputAutocorrectionType:()UIKBExtras;
+ (uint64_t)translateToTextInputInlineCompletionType:()UIKBExtras;
+ (uint64_t)translateToTextInputKeyboardAppearance:()UIKBExtras;
+ (uint64_t)translateToTextInputKeyboardType:()UIKBExtras;
+ (uint64_t)translateToTextInputReturnKeyType:()UIKBExtras;
+ (uint64_t)translateToTextInputSpellCheckingType:()UIKBExtras;
+ (uint64_t)translateToTextMathExpressionCompletionType:()UIKBExtras;
+ (uint64_t)translateToTextScriptType:()UIKBExtras;
@end

@implementation TITextInputTraits(UIKBExtras)

+ (id)traitsForUITextInputTraits:()UIKBExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FAE450]);
  objc_msgSend(v5, "setAutocapitalizationType:", objc_msgSend(a1, "translateToTextInputAutocapitalizationType:", objc_msgSend(v4, "autocapitalizationType")));
  objc_msgSend(v5, "setAutocorrectionType:", objc_msgSend(a1, "translateToTextInputAutocorrectionType:", objc_msgSend(v4, "autocorrectionType")));
  objc_msgSend(v5, "setSpellCheckingType:", objc_msgSend(a1, "translateToTextInputSpellCheckingType:", objc_msgSend(v4, "spellCheckingType")));
  objc_msgSend(v5, "setKeyboardType:", objc_msgSend(a1, "translateToTextInputKeyboardType:", objc_msgSend(v4, "keyboardType")));
  objc_msgSend(v5, "setKeyboardAppearance:", objc_msgSend(a1, "translateToTextInputKeyboardAppearance:", objc_msgSend(v4, "keyboardAppearance")));
  objc_msgSend(v5, "setReturnKeyType:", objc_msgSend(a1, "translateToTextInputReturnKeyType:", objc_msgSend(v4, "returnKeyType")));
  objc_msgSend(v5, "setEnablesReturnKeyAutomatically:", objc_msgSend(v4, "enablesReturnKeyAutomatically"));
  objc_msgSend(v5, "setSecureTextEntry:", objc_msgSend(v4, "isSecureTextEntry"));
  objc_msgSend(v5, "setSmartInsertDeleteEnabled:", objc_msgSend(a1, "translateToTextInputSmartInsertDeleteEnabled:", objc_msgSend(v4, "smartInsertDeleteType")));
  objc_msgSend(v5, "setSmartQuotesEnabled:", objc_msgSend(a1, "translateToTextInputSmartQuotesEnabled:", objc_msgSend(v4, "smartQuotesType")));
  objc_msgSend(v5, "setSmartDashesEnabled:", objc_msgSend(a1, "translateToTextInputSmartDashesEnabled:", objc_msgSend(v4, "smartDashesType")));
  if (objc_opt_respondsToSelector())
  {
    v6 = [v4 textContentType];
    [v5 setTextContentType:v6];
  }
  objc_msgSend(v5, "setTextScriptType:", objc_msgSend(a1, "translateToTextScriptType:", objc_msgSend(v4, "textScriptType")));
  v7 = [v4 recentInputIdentifier];
  v8 = [a1 translateToTextInputRecentInputIdentifier:v7];
  [v5 setRecentInputIdentifier:v8];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setDisablePrediction:", objc_msgSend(v4, "disablePrediction"));
  }
  objc_msgSend(v5, "setInlineCompletionType:", objc_msgSend(a1, "translateToTextInputInlineCompletionType:", objc_msgSend(v4, "inlinePredictionType")));
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setMathExpressionCompletionType:", objc_msgSend(a1, "translateToTextMathExpressionCompletionType:", objc_msgSend(v4, "mathExpressionCompletionType")));
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setAllowsTextAnimationsType:", objc_msgSend(a1, "translateToAllowsTextAnimationsType:", objc_msgSend(v4, "allowsTextAnimationsType")));
  }

  return v5;
}

+ (uint64_t)translateToTextInputKeyboardType:()UIKBExtras
{
  switch(a3)
  {
    case 1:
LABEL_5:
      uint64_t result = 1;
      break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      uint64_t result = a3;
      break;
    case 12:
      uint64_t result = 14;
      break;
    case 13:
      uint64_t result = 12;
      break;
    default:
      uint64_t result = 0;
      switch(a3)
      {
        case 'x':
          uint64_t result = 18;
          break;
        case '{':
          goto LABEL_5;
        case '|':
          uint64_t result = 16;
          break;
        case '~':
          uint64_t result = 17;
          break;
        case '\x7F':
          uint64_t result = 13;
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

+ (uint64_t)translateToTextScriptType:()UIKBExtras
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (uint64_t)translateToTextMathExpressionCompletionType:()UIKBExtras
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (uint64_t)translateToTextInputSpellCheckingType:()UIKBExtras
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (BOOL)translateToTextInputSmartQuotesEnabled:()UIKBExtras
{
  return a3 != 1;
}

+ (BOOL)translateToTextInputSmartInsertDeleteEnabled:()UIKBExtras
{
  return a3 != 1;
}

+ (BOOL)translateToTextInputSmartDashesEnabled:()UIKBExtras
{
  return a3 != 1;
}

+ (uint64_t)translateToTextInputReturnKeyType:()UIKBExtras
{
  uint64_t result = a3;
  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      return result;
    default:
      if (a3 == 124) {
        uint64_t result = 13;
      }
      else {
        uint64_t result = 0;
      }
      break;
  }
  return result;
}

+ (id)translateToTextInputRecentInputIdentifier:()UIKBExtras
{
  id v3 = a3;
  return v3;
}

+ (uint64_t)translateToTextInputKeyboardAppearance:()UIKBExtras
{
  if (a3 <= 8)
  {
    if (a3 != 1)
    {
      if (a3 == 2) {
        return 2;
      }
      else {
        return 0;
      }
    }
    return 1;
  }
  if (a3 == 9) {
    return 1;
  }
  uint64_t v3 = 6;
  if (a3 != 11) {
    uint64_t v3 = 0;
  }
  if (a3 == 127) {
    return 5;
  }
  else {
    return v3;
  }
}

+ (uint64_t)translateToTextInputInlineCompletionType:()UIKBExtras
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (uint64_t)translateToTextInputAutocorrectionType:()UIKBExtras
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (uint64_t)translateToTextInputAutocapitalizationType:()UIKBExtras
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (uint64_t)translateToAllowsTextAnimationsType:()UIKBExtras
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (uint64_t)translateToPublicKeyboardType:()UIKBExtras
{
  if ((unint64_t)(a3 - 1) > 0x11) {
    return 0;
  }
  else {
    return qword_186B99040[a3 - 1];
  }
}

@end
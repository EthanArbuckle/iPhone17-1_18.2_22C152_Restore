@interface NSObject(UIAccessibilityTextAttributeRotor)
- (id)_accessibilityAttributeMatcher:()UIAccessibilityTextAttributeRotor;
- (id)_accessibilityCommonStylingRotors;
- (id)_accessibilityNextTextRangeUsingTextStyling:()UIAccessibilityTextAttributeRotor attributeMatch:;
- (id)_accessibilityTextStylingCustomRotor:()UIAccessibilityTextAttributeRotor;
- (uint64_t)_accessibilityAttributedTextRetrieval;
- (uint64_t)_accessibilityMisspelledRotor;
- (uint64_t)_accessibilityMisspelledWordIn:()UIAccessibilityTextAttributeRotor searchRange:next:;
- (void)_accessibilityBoldTextMatch;
- (void)_accessibilityColorChangeMatch;
- (void)_accessibilityFontChangeMatch;
- (void)_accessibilityItalicTextMatch;
- (void)_accessibilityPlainTextMatch;
- (void)_accessibilityStyleChangeMatch;
- (void)_accessibilityUnderlineTextMatch;
@end

@implementation NSObject(UIAccessibilityTextAttributeRotor)

- (uint64_t)_accessibilityMisspelledRotor
{
  return [a1 _accessibilityTextStylingCustomRotor:13];
}

- (id)_accessibilityCommonStylingRotors
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = [a1 _accessibilityTextStylingCustomRotor:10];
  v3 = [a1 _accessibilityTextStylingCustomRotor:11];
  v4 = [a1 _accessibilityTextStylingCustomRotor:12];
  v5 = [a1 _accessibilityMisspelledRotor];
  v6 = [a1 _accessibilityTextStylingCustomRotor:UIAccessibilityCustomSystemRotorTypePlainText];
  v7 = [a1 _accessibilityTextStylingCustomRotor:UIAccessibilityCustomSystemRotorTypeColorChange];
  v8 = [a1 _accessibilityTextStylingCustomRotor:UIAccessibilityCustomSystemRotorTypeFontChange];
  v9 = [a1 _accessibilityTextStylingCustomRotor:UIAccessibilityCustomSystemRotorTypeStyleChange];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

- (id)_accessibilityNextTextRangeUsingTextStyling:()UIAccessibilityTextAttributeRotor attributeMatch:
{
  id v5 = a3;
  v6 = a4;
  v7 = __UIAccessibilityCastAsProtocol();
  v29 = [v5 currentItem];
  v8 = [v29 targetRange];
  v30 = v5;
  uint64_t v9 = [v5 searchDirection];
  v10 = [v8 start];
  BOOL v32 = v9 != 1;
  v33 = [v7 textStylingAtPosition:v10 inDirection:v32];

  v11 = 0;
  v12 = 0;
  v13 = 0;
  for (i = v6; ; v6 = i)
  {
    if (v9 == 1) {
      [v8 end];
    }
    else {
    v14 = [v8 start];
    }
    v15 = [v7 textStylingAtPosition:v14 inDirection:v32];

    if (!v6[2](v6, v15, v33)) {
      break;
    }
    if (v9 == 1 && !v12)
    {
      v12 = [v8 start];
      goto LABEL_13;
    }
    if (v9 != 1 && !v13)
    {
      v13 = [v8 end];
LABEL_17:
      v16 = [v8 start];
      v17 = v7;
      v18 = v16;
      uint64_t v19 = -1;
      goto LABEL_18;
    }
LABEL_12:
    if (v9 != 1) {
      goto LABEL_17;
    }
LABEL_13:
    v16 = [v8 end];
    v17 = v7;
    v18 = v16;
    uint64_t v19 = 1;
LABEL_18:
    v20 = [v17 positionFromPosition:v18 offset:v19];

    id v21 = v8;
    v8 = [v7 textRangeFromPosition:v20 toPosition:v20];

    uint64_t v22 = [v8 start];
    if (!v22
      || (v23 = (void *)v22,
          [v8 end],
          v24 = objc_claimAutoreleasedReturnValue(),
          v24,
          v23,
          !v24))
    {

      v6 = i;
      goto LABEL_25;
    }

    v11 = v21;
  }
  if (v12)
  {
    uint64_t v25 = [v11 end];

    v13 = (void *)v25;
    goto LABEL_24;
  }
  if (!v13)
  {
    v12 = 0;
    goto LABEL_12;
  }
  v12 = [v11 start];
LABEL_24:
  id v21 = v11;
LABEL_25:

  if (v13 || !v12)
  {
    if (v13 && !v12)
    {
      v12 = [v7 beginningOfDocument];
    }
  }
  else
  {
    v13 = [v7 endOfDocument];
  }
  v26 = 0;
  if (v12 && v13)
  {
    v26 = [v7 textRangeFromPosition:v12 toPosition:v13];
  }
  id v27 = v26;

  return v27;
}

- (void)_accessibilityUnderlineTextMatch
{
  return &__block_literal_global_16;
}

- (void)_accessibilityItalicTextMatch
{
  return &__block_literal_global_523;
}

- (void)_accessibilityBoldTextMatch
{
  return &__block_literal_global_526;
}

- (void)_accessibilityPlainTextMatch
{
  return &__block_literal_global_528;
}

- (void)_accessibilityStyleChangeMatch
{
  return &__block_literal_global_530;
}

- (void)_accessibilityFontChangeMatch
{
  return &__block_literal_global_532;
}

- (void)_accessibilityColorChangeMatch
{
  return &__block_literal_global_534;
}

- (id)_accessibilityAttributeMatcher:()UIAccessibilityTextAttributeRotor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__NSObject_UIAccessibilityTextAttributeRotor___accessibilityAttributeMatcher___block_invoke;
  block[3] = &unk_1E59B9300;
  block[4] = a1;
  if (_accessibilityAttributeMatcher__onceToken != -1) {
    dispatch_once(&_accessibilityAttributeMatcher__onceToken, block);
  }
  v4 = (void *)_accessibilityAttributeMatcher__Matchers;
  id v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (uint64_t)_accessibilityAttributedTextRetrieval
{
  return 0;
}

- (uint64_t)_accessibilityMisspelledWordIn:()UIAccessibilityTextAttributeRotor searchRange:next:
{
  id v10 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || [a1 spellCheckingType] != 1)
  {
    v11 = [a1 _accessibilityTextChecker];
    if (v11) {
      goto LABEL_8;
    }
    CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F1D418];
    double v13 = 0.0;
    do
    {
      CFRunLoopRunInMode(v12, 0.2, 0);
      uint64_t v14 = [a1 _accessibilityTextChecker];
      v11 = (void *)v14;
      if (v14) {
        break;
      }
      double v13 = v13 + 0.2;
    }
    while (v13 < 1.5);
    if (v14)
    {
LABEL_8:
      v15 = [v10 string];
      v16 = [MEMORY[0x1E4F42B30] sharedInputModeController];
      v17 = [v16 currentInputMode];
      if (v17)
      {
        if (a6)
        {
LABEL_10:
          v18 = [v17 primaryLanguage];
          uint64_t v19 = objc_msgSend(v11, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v15, a4, a5, a4, 0, v18);

LABEL_23:
          goto LABEL_24;
        }
      }
      else
      {
        v17 = [v16 currentSystemInputMode];
        if (a6) {
          goto LABEL_10;
        }
      }
      v28 = v16;
      id v29 = v10;
      unint64_t v20 = a4 + a5;
      if (a4 >= a4 + a5)
      {
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          uint64_t v22 = objc_msgSend(v17, "primaryLanguage", v28, v29);
          uint64_t v23 = objc_msgSend(v11, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v15, a4, a5, a4, 0, v22);
          uint64_t v25 = v24;

          if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          a4 = v23 + v25;
          uint64_t v21 = v23;
          BOOL v26 = v20 >= v23 + v25;
          a5 = v20 - (v23 + v25);
        }
        while (a5 != 0 && v26);
      }
      if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v19 = 0x7FFFFFFFLL;
      }
      else {
        uint64_t v19 = v21;
      }
      v16 = v28;
      id v10 = v29;
      goto LABEL_23;
    }
  }
  uint64_t v19 = 0x7FFFFFFFLL;
LABEL_24:

  return v19;
}

- (id)_accessibilityTextStylingCustomRotor:()UIAccessibilityTextAttributeRotor
{
  if ([a1 conformsToProtocol:&unk_1EF1BE0D8])
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"UIAccessibilityCustomSystemRotorType-%d", a3);
    v6 = [a1 _accessibilityValueForKey:v5];
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x1E4F426C8]);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __84__NSObject_UIAccessibilityTextAttributeRotor___accessibilityTextStylingCustomRotor___block_invoke;
      v12[3] = &unk_1E59B9CF8;
      v12[4] = a1;
      v12[5] = a3;
      id v10 = (void *)[v9 initWithSystemType:a3 itemSearchBlock:v12];
      [v10 setVisibleInTouchRotor:a3 == 13];
      [a1 _accessibilitySetRetainedValue:v10 forKey:v5];
      id v7 = v10;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
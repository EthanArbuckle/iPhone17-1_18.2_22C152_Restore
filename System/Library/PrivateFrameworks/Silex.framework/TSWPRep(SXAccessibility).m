@interface TSWPRep(SXAccessibility)
- (double)_accessibilityFrameForRange:()SXAccessibility;
- (double)accessibilityFrameForLineNumber:()SXAccessibility;
- (id)_STAXColumnForLineIndex:()SXAccessibility;
- (id)_STAXColumnForStorageRelativeCharIndex:()SXAccessibility;
- (id)_accessibilityNextElementsForSpeakThis;
- (id)_accessibilityRawRangeForUITextRange:()SXAccessibility;
- (id)_accessibilityTextOperations;
- (id)_accessibilityTextRectsForSpeakThisStringRange:()SXAccessibility;
- (id)_sxaxTextInputEditor;
- (id)accessibilityAttributedValue;
- (id)accessibilityContentForLineNumber:()SXAccessibility;
- (id)accessibilityLanguage;
- (id)sxaxNameForEditRotorAction:()SXAccessibility;
- (uint64_t)_accessibilityHasTextOperations;
- (uint64_t)_accessibilityIsSpeakThisElement;
- (uint64_t)_accessibilityLineEndPosition;
- (uint64_t)_accessibilityLineRangeForPosition:()SXAccessibility;
- (uint64_t)_accessibilityLineStartPosition;
- (uint64_t)_accessibilityRangeForLineNumber:()SXAccessibility;
- (uint64_t)_accessibilitySelectedTextRange;
- (uint64_t)_accessibilitySpeakThisShouldScrollTextRects;
- (uint64_t)_accessibilityTextRangeFromNSRange:()SXAccessibility;
- (uint64_t)accessibilityEditOperationAction:()SXAccessibility;
- (uint64_t)accessibilityLineNumberForPoint:()SXAccessibility;
- (uint64_t)isAccessibilityElement;
- (uint64_t)sxaxRepRelativeRangeFromStorageRelativeRange:()SXAccessibility;
- (uint64_t)sxaxStorageRelativeRangeFromRepRelativeRange:()SXAccessibility;
- (unint64_t)_sxaxStorageRelativeRangeOfLineFragmentAtStorageRelativeCharIndex:()SXAccessibility;
- (void)_accessibilitySetSelectedTextRange:()SXAccessibility;
- (void)sxaxSupportedEditRotorActions;
@end

@implementation TSWPRep(SXAccessibility)

- (uint64_t)isAccessibilityElement
{
  return objc_msgSend(a1, "sxax_shouldBeOccluded") ^ 1;
}

- (id)accessibilityAttributedValue
{
  v2 = [a1 storage];
  uint64_t v3 = [a1 range];
  v5 = objc_msgSend(v2, "substringWithRange:", v3, v4);

  v6 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v5];
  v7 = [a1 storage];
  uint64_t v8 = [a1 range];
  uint64_t v10 = v9;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __56__TSWPRep_SXAccessibility__accessibilityAttributedValue__block_invoke;
  v27[3] = &unk_264651D40;
  v27[4] = a1;
  id v11 = v6;
  id v28 = v11;
  objc_msgSend(v7, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v8, v10, v27);

  uint64_t v12 = [v5 length];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v13 = [a1 storage];
  uint64_t v14 = [a1 range];
  uint64_t v16 = v15;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__TSWPRep_SXAccessibility__accessibilityAttributedValue__block_invoke_2;
  v21[3] = &unk_264651D68;
  id v17 = v11;
  uint64_t v24 = 0;
  uint64_t v25 = v12;
  id v22 = v17;
  v23 = v26;
  objc_msgSend(v13, "enumerateWithAttributeKind:inRange:usingBlock:", 2, v14, v16, v21);

  v18 = v22;
  id v19 = v17;

  _Block_object_dispose(v26, 8);
  return v19;
}

- (id)accessibilityLanguage
{
  v2 = [a1 storage];
  uint64_t v3 = [a1 range];
  v5 = objc_msgSend(v2, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v3, v4, 0, 0);

  v6 = MEMORY[0x223CA4B10](v5);

  return v6;
}

- (id)_accessibilityNextElementsForSpeakThis
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = [a1 interactiveCanvasController];
  [v2 layoutIfNeeded];

  uint64_t v3 = [a1 interactiveCanvasController];
  uint64_t v4 = [v3 canvasView];

  uint64_t v5 = [v4 sxaxNextSpeakThisElementFromElement:a1];
  v6 = (void *)v5;
  if (v5)
  {
    v11[0] = v5;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)TSWPRep_0;
    uint64_t v7 = objc_msgSendSuper2(&v10, sel__accessibilityNextElementsForSpeakThis);
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (uint64_t)accessibilityLineNumberForPoint:()SXAccessibility
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [a1 columns];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = [v11 countLines];
        if (v12 >= 1)
        {
          uint64_t v13 = v12;
          uint64_t v14 = 0;
          uint64_t v15 = v12 + v8;
          while (1)
          {
            [v11 boundsOfLineFragmentAtIndex:v14];
            v28.x = a2;
            v28.y = a3;
            if (CGRectContainsPoint(v29, v28)) {
              break;
            }
            if (v13 == ++v14)
            {
              uint64_t v8 = v15;
              goto LABEL_11;
            }
          }
          uint64_t v19 = v8 + v14;
          goto LABEL_15;
        }
LABEL_11:
        ;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v5 = [MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPRep(SXAccessibility) accessibilityLineNumberForPoint:]"];
  id v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/TSWPRep+SXAccessibility.m"];
  v27.x = a2;
  v27.y = a3;
  v18 = NSStringFromCGPoint(v27);
  [v5 handleFailureInFunction:v16, v17, 92, @"Line not found for natural point: %@", v18 file lineNumber description];

  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  return v19;
}

- (id)accessibilityContentForLineNumber:()SXAccessibility
{
  uint64_t v5 = objc_msgSend(a1, "_STAXColumnForLineIndex:");
  uint64_t v6 = [v5 rangeOfLineFragmentAtIndex:a3];
  uint64_t v8 = v7;
  uint64_t v9 = [a1 storage];
  objc_super v10 = objc_msgSend(v9, "substringWithRange:", v6, v8);

  return v10;
}

- (double)accessibilityFrameForLineNumber:()SXAccessibility
{
  uint64_t v5 = objc_msgSend(a1, "_STAXColumnForLineIndex:");
  [v5 boundsOfLineFragmentAtIndex:a3];
  objc_msgSend(a1, "SXAXConvertNaturalRectToScreenSpace:");
  double v7 = v6;

  return v7;
}

- (id)_STAXColumnForLineIndex:()SXAccessibility
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [MEMORY[0x263F7C7F0] currentHandler];
    double v6 = [NSString stringWithUTF8String:"-[TSWPRep(SXAccessibility) _STAXColumnForLineIndex:]"];
    double v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/TSWPRep+SXAccessibility.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:116 description:@"Invalid line index"];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = objc_msgSend(a1, "columns", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 += [v14 countLines];
        if (v11 > (uint64_t)a3)
        {
          id v15 = v14;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_13:

  return v15;
}

- (double)_accessibilityFrameForRange:()SXAccessibility
{
  uint64_t v2 = objc_msgSend(a1, "sxaxStorageRelativeRangeFromRepRelativeRange:");
  uint64_t v4 = v3;
  uint64_t v5 = [a1 _STAXColumnForStorageRelativeCharIndex:v2];
  if (v5)
  {
    double v6 = objc_msgSend(MEMORY[0x263F7C790], "selectionWithRange:", v2, v4);
    double v7 = [v5 rectsForSelection:v6];
    uint64_t v8 = [v7 firstObject];
    [v8 CGRectValue];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    objc_msgSend(a1, "SXAXConvertNaturalRectToScreenSpace:", v10, v12, v14, v16);
    double v18 = v17;
  }
  else
  {
    double v18 = *MEMORY[0x263F001A8];
  }

  return v18;
}

- (uint64_t)sxaxStorageRelativeRangeFromRepRelativeRange:()SXAccessibility
{
  return [a1 range] + a3;
}

- (uint64_t)sxaxRepRelativeRangeFromStorageRelativeRange:()SXAccessibility
{
  return a3 - [a1 range];
}

- (uint64_t)_accessibilitySelectedTextRange
{
  uint64_t v2 = [a1 selection];
  uint64_t v3 = [v2 range];
  uint64_t v5 = objc_msgSend(a1, "sxaxRepRelativeRangeFromStorageRelativeRange:", v3, v4);

  return v5;
}

- (void)_accessibilitySetSelectedTextRange:()SXAccessibility
{
  uint64_t v2 = objc_msgSend(a1, "sxaxStorageRelativeRangeFromRepRelativeRange:");
  objc_msgSend(MEMORY[0x263F7C790], "selectionWithRange:", v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  uint64_t v4 = [a1 interactiveCanvasController];
  uint64_t v5 = [v4 beginEditingRep:a1];
  double v6 = TSUDynamicCast();

  [v6 setSelection:v7];
  UIAccessibilityPostNotification(*MEMORY[0x263F81340], 0);
}

- (uint64_t)_accessibilityLineStartPosition
{
  uint64_t v2 = [a1 selection];
  uint64_t v3 = [v2 range];
  uint64_t v5 = v4;
  uint64_t v6 = *MEMORY[0x263F7C7C8];
  uint64_t v7 = *(void *)(MEMORY[0x263F7C7C8] + 8);

  if (v6 == v3 && v7 == v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  double v9 = [a1 selection];
  uint64_t v10 = [v9 range];
  uint64_t v12 = v11 + v10 - 1;

  uint64_t v13 = [a1 _sxaxStorageRelativeRangeOfLineFragmentAtStorageRelativeCharIndex:v12];
  return objc_msgSend(a1, "sxaxRepRelativeRangeFromStorageRelativeRange:", v13, v14);
}

- (uint64_t)_accessibilityLineRangeForPosition:()SXAccessibility
{
  [a1 range];
  if (v5 < a3) {
    return *MEMORY[0x263F7C7C8];
  }
  if (a3)
  {
    [a1 range];
    uint64_t v8 = a3 - (v7 == a3);
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = objc_msgSend(a1, "_sxaxStorageRelativeRangeOfLineFragmentAtStorageRelativeCharIndex:", objc_msgSend(a1, "sxaxStorageRelativeRangeFromRepRelativeRange:", v8, 0));
  return objc_msgSend(a1, "sxaxRepRelativeRangeFromStorageRelativeRange:", v9, v10);
}

- (uint64_t)_accessibilityLineEndPosition
{
  uint64_t v2 = [a1 selection];
  uint64_t v3 = [v2 range];
  uint64_t v5 = v3 + v4;

  uint64_t v6 = [a1 _sxaxStorageRelativeRangeOfLineFragmentAtStorageRelativeCharIndex:v5];
  uint64_t v8 = objc_msgSend(a1, "sxaxRepRelativeRangeFromStorageRelativeRange:", v6, v7);
  return v8 + v9;
}

- (unint64_t)_sxaxStorageRelativeRangeOfLineFragmentAtStorageRelativeCharIndex:()SXAccessibility
{
  unint64_t v4 = *MEMORY[0x263F7C7C8];
  uint64_t v5 = objc_msgSend(a1, "_STAXColumnForStorageRelativeCharIndex:");
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 countLines];
    if (v7 >= 1)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      while (1)
      {
        unint64_t v10 = [v6 rangeOfLineFragmentAtIndex:v9];
        if (v10 <= a3 && v10 + v11 > a3) {
          break;
        }
        if (v8 == ++v9) {
          goto LABEL_9;
        }
      }
      unint64_t v4 = v10;
    }
  }
LABEL_9:

  return v4;
}

- (id)_STAXColumnForStorageRelativeCharIndex:()SXAccessibility
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v4 = objc_msgSend(a1, "columns", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 range] <= a3)
        {
          uint64_t v10 = [v9 range];
          if (v10 + v11 > a3)
          {
            id v12 = v9;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (uint64_t)_accessibilityRangeForLineNumber:()SXAccessibility
{
  uint64_t v4 = a3 & ~(a3 >> 63);
  uint64_t v5 = [a1 _STAXColumnForLineIndex:v4];
  uint64_t v6 = [v5 rangeOfLineFragmentAtIndex:v4];
  uint64_t v8 = objc_msgSend(a1, "sxaxRepRelativeRangeFromStorageRelativeRange:", v6, v7);

  return v8;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:()SXAccessibility
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a4 && ([a1 hasBeenRemoved] & 1) == 0)
  {
    v33 = objc_opt_new();
    [a1 range];
    if (a3 <= v8)
    {
      uint64_t v15 = objc_msgSend(a1, "sxaxStorageRelativeRangeFromRepRelativeRange:", a3, a4);
      NSUInteger v30 = v16;
      NSUInteger v31 = v15;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id obj = [a1 columns];
      uint64_t v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v32)
      {
        uint64_t v29 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v35 != v29) {
              objc_enumerationMutation(obj);
            }
            double v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            v41.location = [v18 range];
            v43.length = v30;
            v43.location = v31;
            NSRange v19 = NSIntersectionRange(v41, v43);
            if (v19.length)
            {
              unint64_t v20 = [v18 lineIndexForCharIndex:v19.location eol:0];
              unint64_t v21 = [v18 lineIndexForCharIndex:v19.length + v19.location - 1 eol:0];
              if (v20 <= v21)
              {
                unint64_t v22 = v21;
                do
                {
                  v42.location = [v18 rangeOfLineFragmentAtIndex:v20];
                  NSRange v44 = v19;
                  long long v23 = objc_msgSend(objc_alloc(MEMORY[0x263F7C790]), "initWithRange:", NSIntersectionRange(v42, v44).location, v42.length);
                  [a1 rectForSelection:v23];
                  if (v24 * v25 > 0.0)
                  {
                    objc_msgSend(a1, "SXAXConvertNaturalRectToScreenSpace:");
                    uint64_t v26 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:");
                    [v33 addObject:v26];
                  }
                  ++v20;
                }
                while (v20 <= v22);
              }
            }
          }
          uint64_t v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v32);
      }
    }
    else
    {
      uint64_t v9 = [a1 _accessibilityNextElementsForSpeakThis];
      uint64_t v10 = [v9 firstObject];

      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [a1 range];
          id v12 = objc_msgSend(v10, "_accessibilityTextRectsForSpeakThisStringRange:", a3 - v11, a4);
          [v33 addObjectsFromArray:v12];
        }
        if (![v33 count])
        {
          uint64_t v13 = (void *)MEMORY[0x263F08D40];
          [v10 accessibilityFrame];
          long long v14 = objc_msgSend(v13, "valueWithCGRect:");
          [v33 addObject:v14];
        }
      }
    }
    uint64_t v7 = (void *)[v33 copy];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }
  return v7;
}

- (uint64_t)_accessibilitySpeakThisShouldScrollTextRects
{
  return 1;
}

- (id)_accessibilityRawRangeForUITextRange:()SXAccessibility
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (id)[v5 range];
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)TSWPRep_0;
    id v7 = objc_msgSendSuper2(&v10, sel__accessibilityRawRangeForUITextRange_, v4);
  }
  id v8 = v7;

  return v8;
}

- (uint64_t)_accessibilityTextRangeFromNSRange:()SXAccessibility
{
  return objc_msgSend(MEMORY[0x263F7C6E8], "textRangeWithRange:");
}

- (uint64_t)_accessibilityHasTextOperations
{
  return 1;
}

- (id)_accessibilityTextOperations
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [a1 _sxaxTextInputEditor];
  id v4 = [a1 sxaxSupportedEditRotorActions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(NSString **)(*((void *)&v13 + 1) + 8 * i);
        if ([v3 canPerformEditorAction:NSSelectorFromString(v9) withSender:0])
        {
          objc_super v10 = [a1 sxaxNameForEditRotorAction:v9];
          [v2 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  uint64_t v11 = (void *)[v2 copy];

  return v11;
}

- (uint64_t)accessibilityEditOperationAction:()SXAccessibility
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 sxaxSupportedEditRotorActions];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      objc_super v10 = *(NSString **)(*((void *)&v17 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend(a1, "sxaxNameForEditRotorAction:", v10, (void)v17);
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    SEL v15 = NSSelectorFromString(v10);

    if (v15)
    {
      long long v14 = [a1 interactiveCanvasController];
      [v14 makeEditorPerformAction:v15 withSender:0];
      uint64_t v13 = 1;
      goto LABEL_12;
    }
    uint64_t v13 = 0;
  }
  else
  {
LABEL_9:
    uint64_t v13 = 0;
    long long v14 = v5;
LABEL_12:
  }
  return v13;
}

- (id)_sxaxTextInputEditor
{
  objc_opt_class();
  uint64_t v2 = [a1 interactiveCanvasController];
  uint64_t v3 = [v2 editorController];
  id v4 = [v3 textInputEditor];
  id v5 = TSUDynamicCast();

  return v5;
}

- (void)sxaxSupportedEditRotorActions
{
  return &unk_26D593F20;
}

- (id)sxaxNameForEditRotorAction:()SXAccessibility
{
  id v3 = a3;
  if ([v3 isEqualToString:@"copy:"])
  {
    id v4 = [MEMORY[0x263F086E0] mainBundle];
    id v5 = v4;
    uint64_t v6 = @"Copy";
LABEL_5:
    uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26D5311C0 table:0];

    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"selectAll:"])
  {
    id v4 = [MEMORY[0x263F086E0] mainBundle];
    id v5 = v4;
    uint64_t v6 = @"Select all";
    goto LABEL_5;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (uint64_t)_accessibilityIsSpeakThisElement
{
  return 1;
}

@end
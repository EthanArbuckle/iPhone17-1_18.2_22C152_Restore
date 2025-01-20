@interface SXTextTangierFlowRep
- (BOOL)accessibilitySupportsTextSelection;
- (BOOL)forceTiling;
- (BOOL)isAccessibilityElement;
- (BOOL)p_doesRep:(id)a3 containCharIndex:(unint64_t)a4 isStart:(BOOL)a5;
- (BOOL)preventClipToColumn;
- (BOOL)updateFromVisualPosition;
- (CGRect)accessibilityFrameForScrolling;
- (CGRect)frameInCanvas;
- (Class)wpEditorClass;
- (SXAXCustomRotor)headingsRotor;
- (SXAXCustomRotor)linkRotor;
- (SXTextTangierInteractiveCanvasController)icc;
- (SXTextTangierRepAccessibilityDataSource)accessibilityDataSource;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)accessibilityHitTest:(CGPoint)a3;
- (id)accessibilityNextTextNavigationElement;
- (id)accessibilityPreviousTextNavigationElement;
- (id)automationElements;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)itemsForCustomRotor:(id)a3;
- (id)orderedSiblings;
- (id)repForCharIndex:(unint64_t)a3 isStart:(BOOL)a4;
- (id)siblings;
- (id)storage;
- (id)supportedCustomRotors;
- (id)sxaxLinkElements;
- (id)sxaxNameForEditRotorAction:(id)a3;
- (id)sxaxSupportedEditRotorActions;
- (unint64_t)accessibilityTraits;
- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 isTail:(BOOL)a4 selectionType:(int)a5;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)dealloc;
- (void)setAccessibilityDataSource:(id)a3;
- (void)setFrameInCanvas:(CGRect)a3;
- (void)setHeadingsRotor:(id)a3;
- (void)setIcc:(id)a3;
- (void)setLinkRotor:(id)a3;
@end

@implementation SXTextTangierFlowRep

- (id)storage
{
  v2 = [(SXTextTangierFlowRep *)self info];
  v3 = [v2 storage];

  return v3;
}

- (Class)wpEditorClass
{
  return (Class)objc_opt_class();
}

- (BOOL)forceTiling
{
  return 1;
}

- (BOOL)preventClipToColumn
{
  return 1;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v22 = a4;
  id v9 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v10 = [(SXTextTangierFlowRep *)self childReps];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = [v15 layout];
          v17 = [v16 geometry];
          [v17 frame];
          v31.double x = x;
          v31.double y = y;
          BOOL v18 = CGRectContainsPoint(v32, v31);

          if (v18)
          {

            v20 = 0;
            v19 = v22;
            goto LABEL_12;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v23.receiver = self;
  v23.super_class = (Class)SXTextTangierFlowRep;
  v19 = v22;
  v20 = -[SXTextTangierFlowRep hitRep:withGesture:passingTest:](&v23, sel_hitRep_withGesture_passingTest_, v22, v9, x, y);
LABEL_12:

  return v20;
}

- (BOOL)p_doesRep:(id)a3 containCharIndex:(unint64_t)a4 isStart:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v7 = [a3 range];
  if (v5 && v7 <= a4) {
    return v7 + v8 > a4;
  }
  BOOL v10 = v7 + v8 >= a4;
  if (v7 >= a4) {
    BOOL v10 = 0;
  }
  return !v5 && v10;
}

- (id)repForCharIndex:(unint64_t)a3 isStart:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(SXTextTangierFlowRep *)self p_doesRep:self containCharIndex:a3 isStart:a4])
  {
    unint64_t v7 = self;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [(SXTextTangierFlowRep *)self siblings];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([(SXTextTangierFlowRep *)self p_doesRep:v13 containCharIndex:a3 isStart:v4])
          {
            unint64_t v7 = v13;

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    unint64_t v7 = 0;
  }
LABEL_13:
  return v7;
}

- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 isTail:(BOOL)a4 selectionType:(int)a5
{
  BOOL v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SXTextTangierFlowRep;
  id v8 = -[SXTextTangierFlowRep charIndexForPointWithPinning:isTail:selectionType:](&v15, sel_charIndexForPointWithPinning_isTail_selectionType_, a3.x, a3.y);
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [(SXTextTangierFlowRep *)self storage];
    unint64_t v11 = [v10 length];
    if (a5 == 7 && (unint64_t)v8 < v11 && v6)
    {
      uint64_t v13 = [(SXTextTangierFlowRep *)self storage];
      int v14 = [v13 characterAtIndex:v8];

      if (v14 != 10) {
        return (unint64_t)v8;
      }
      uint64_t v10 = [(SXTextTangierFlowRep *)self storage];
      id v8 = (id)[v10 previousCharacterIndex:v8];
    }

    return (unint64_t)v8;
  }
  return result;
}

- (id)siblings
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(SXTextTangierFlowRep *)self orderedSiblings];
  BOOL v4 = [v3 array];
  BOOL v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)orderedSiblings
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v4 = [(SXTextTangierFlowRep *)self canvas];
  BOOL v5 = [v4 topLevelReps];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        uint64_t v10 = TSUDynamicCast();
        unint64_t v11 = [v10 storage];
        uint64_t v12 = [(SXTextTangierFlowRep *)self storage];

        if (v11 == v12) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = (void *)[v3 copy];
  return v13;
}

- (BOOL)updateFromVisualPosition
{
  id v3 = [(SXTextTangierFlowRep *)self layout];
  BOOL v4 = [v3 geometry];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(SXTextTangierFlowRep *)self frameInCanvas];
  v23.origin.double x = v13;
  v23.origin.double y = v14;
  v23.size.width = v15;
  v23.size.height = v16;
  v22.origin.double x = v6;
  v22.origin.double y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  BOOL v17 = CGRectEqualToRect(v22, v23);

  if (!v17)
  {
    id v18 = objc_alloc(MEMORY[0x263F7C6D0]);
    [(SXTextTangierFlowRep *)self frameInCanvas];
    v19 = objc_msgSend(v18, "initWithFrame:");
    uint64_t v20 = [(SXTextTangierFlowRep *)self layout];
    [v20 setGeometry:v19];
  }
  return !v17;
}

- (void)dealloc
{
  [(SXTextTangierFlowRep *)self _accessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierFlowRep;
  [(SXTextTangierFlowRep *)&v3 dealloc];
}

- (id)supportedCustomRotors
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000;
  CGFloat v13 = __Block_byref_object_copy__3;
  CGFloat v14 = __Block_byref_object_dispose__3;
  objc_super v3 = [(SXTextTangierFlowRep *)self accessibilityDataSource];
  id v15 = [v3 accessibilityCustomRotorMembershipForRep:self];

  BOOL v4 = [(SXTextTangierFlowRep *)self storage];
  uint64_t v5 = [(SXTextTangierFlowRep *)self range];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__SXTextTangierFlowRep_supportedCustomRotors__block_invoke;
  v9[3] = &unk_264654410;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v4, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v5, v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __45__SXTextTangierFlowRep_supportedCustomRotors__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v12 = (id)[objc_alloc(MEMORY[0x263EFF9B0]) initWithSet:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  id v7 = [*(id *)(a1 + 32) linkRotor];

  if (v7)
  {
    CGFloat v8 = [*(id *)(a1 + 32) linkRotor];
    [v12 addObject:v8];
  }
  uint64_t v9 = [v12 copy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  double v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  *a5 = 1;
}

- (id)itemsForCustomRotor:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SXTextTangierFlowRep *)self headingsRotor];
  if (v5 == v4)
  {
    CGFloat v8 = [(SXTextTangierFlowRep *)self headingsRotor];

    if (v8)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F1C3A0]) initWithTargetElement:self targetRange:0];
      id v7 = (void *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithObject:v9];

      goto LABEL_17;
    }
  }
  else
  {
  }
  id v6 = [(SXTextTangierFlowRep *)self linkRotor];
  if (v6 != v4)
  {

LABEL_5:
    id v7 = 0;
    goto LABEL_17;
  }
  uint64_t v10 = [(SXTextTangierFlowRep *)self linkRotor];

  if (!v10) {
    goto LABEL_5;
  }
  double v11 = [(SXTextTangierFlowRep *)self sxaxLinkElements];
  id v12 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v19 = objc_alloc(MEMORY[0x263F1C3A0]);
        uint64_t v20 = objc_msgSend(v19, "initWithTargetElement:targetRange:", v18, 0, (void)v22);
        [v12 addObject:v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  id v7 = (void *)[v12 copy];
LABEL_17:

  return v7;
}

- (id)sxaxLinkElements
{
  objc_super v3 = [(SXTextTangierFlowRep *)self _accessibilityValueForKey:@"SXAXLinkElementsKey"];
  if (![v3 count])
  {
    id v4 = objc_opt_new();
    id v5 = [(SXTextTangierFlowRep *)self storage];
    uint64_t v6 = [(SXTextTangierFlowRep *)self range];
    uint64_t v8 = v7;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __40__SXTextTangierFlowRep_sxaxLinkElements__block_invoke;
    uint64_t v15 = &unk_264651D40;
    uint64_t v16 = self;
    id v17 = v4;
    id v9 = v4;
    objc_msgSend(v5, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v6, v8, &v12);

    uint64_t v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15, v16);
    [(SXTextTangierFlowRep *)self _accessibilitySetRetainedValue:v10 forKey:@"SXAXLinkElementsKey"];

    objc_super v3 = (void *)v10;
  }
  return v3;
}

void __40__SXTextTangierFlowRep_sxaxLinkElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  TSUDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v4 = [[SXTextLinkAccessibilityElement alloc] initWithHyperlinkField:v5 parentRep:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (id)automationElements
{
  id v3 = [(SXTextTangierFlowRep *)self sxaxLinkElements];
  if ([v3 count])
  {
    id v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SXTextTangierFlowRep;
    id v4 = [(SXTextTangierFlowRep *)&v7 automationElements];
  }
  id v5 = v4;

  return v5;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(SXTextTangierFlowRep *)self info];
  int v4 = [v3 hasSpeakableContent];

  if (!v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SXTextTangierFlowRep;
  return [(TSWPRep *)&v6 isAccessibilityElement];
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(SXTextTangierFlowRep *)self accessibilityElements];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      double v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "accessibilityHitTest:", x, y);

      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v14.receiver = self;
  v14.super_class = (Class)SXTextTangierFlowRep;
  uint64_t v12 = -[SXTextTangierFlowRep accessibilityHitTest:](&v14, sel_accessibilityHitTest_, x, y);

  return v12;
}

- (CGRect)accessibilityFrameForScrolling
{
  v37.receiver = self;
  v37.super_class = (Class)SXTextTangierFlowRep;
  [(SXTextTangierFlowRep *)&v37 accessibilityFrameForScrolling];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(SXTextTangierFlowRep *)self _accessibilityScrollParent];
  [v11 contentInset];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [v11 adjustedContentInset];
  if (v15 == v23 && v13 == v20 && v19 == v22 && v17 == v21)
  {
    [v11 safeAreaInsets];
    double v28 = fmin(-v27, 0.0);
    double v30 = fmin(-v29, 0.0);
    double v4 = v4 + v30;
    double v6 = v6 + v28;
    double v8 = v8 - (v30 + fmin(-v32, 0.0));
    double v10 = v10 - (v28 + fmin(-v31, 0.0));
  }

  double v33 = v4;
  double v34 = v6;
  double v35 = v8;
  double v36 = v10;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v10.receiver = self;
  v10.super_class = (Class)SXTextTangierFlowRep;
  unint64_t v3 = [(SXTextTangierFlowRep *)&v10 accessibilityTraits];
  double v4 = [(SXTextTangierFlowRep *)self accessibilityDataSource];
  double v5 = [v4 accessibilityCustomRotorMembershipForRep:self];
  double v6 = [(SXTextTangierFlowRep *)self headingsRotor];
  int v7 = [v5 containsObject:v6];

  uint64_t v8 = *MEMORY[0x263F1CEF8];
  if (!v7) {
    uint64_t v8 = 0;
  }
  return v8 | v3;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  unint64_t v3 = [(SXTextTangierFlowRep *)self accessibilityDataSource];
  int v4 = [v3 accessibilityRepIsSelectable:self];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SXTextTangierFlowRep;
    id v5 = [(TSWPRep *)&v7 _accessibilitySelectedTextRange];
  }
  else
  {
    id v5 = 0;
    NSUInteger v6 = 0;
  }
  result.length = v6;
  result.location = (NSUInteger)v5;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = [(SXTextTangierFlowRep *)self accessibilityDataSource];
  int v7 = [v6 accessibilityRepIsSelectable:self];

  if (v7)
  {
    v8.receiver = self;
    v8.super_class = (Class)SXTextTangierFlowRep;
    -[TSWPRep _accessibilitySetSelectedTextRange:](&v8, sel__accessibilitySetSelectedTextRange_, location, length);
  }
}

- (id)accessibilityNextTextNavigationElement
{
  unint64_t v3 = [(SXTextTangierFlowRep *)self orderedSiblings];
  unint64_t v4 = [v3 indexOfObject:self];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v5 = v4, v4 >= [v3 count] - 1))
  {
    NSUInteger v6 = 0;
  }
  else
  {
    NSUInteger v6 = [v3 objectAtIndexedSubscript:v5 + 1];
  }

  return v6;
}

- (id)accessibilityPreviousTextNavigationElement
{
  unint64_t v3 = [(SXTextTangierFlowRep *)self orderedSiblings];
  uint64_t v4 = [v3 indexOfObject:self];
  unint64_t v5 = 0;
  if (v4 && v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = [v3 objectAtIndexedSubscript:v4 - 1];
  }

  return v5;
}

- (BOOL)accessibilitySupportsTextSelection
{
  v2 = self;
  unint64_t v3 = [(SXTextTangierFlowRep *)self accessibilityDataSource];
  LOBYTE(v2) = [v3 accessibilityRepIsSelectable:v2];

  return (char)v2;
}

- (id)sxaxSupportedEditRotorActions
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  v7.receiver = self;
  v7.super_class = (Class)SXTextTangierFlowRep;
  uint64_t v4 = [(TSWPRep *)&v7 sxaxSupportedEditRotorActions];
  if (v4) {
    [v3 addObjectsFromArray:v4];
  }
  if (([v3 containsObject:@"lookup:"] & 1) == 0) {
    [v3 addObject:@"lookup:"];
  }
  unint64_t v5 = (void *)[v3 copy];

  return v5;
}

- (id)sxaxNameForEditRotorAction:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"lookup:"])
  {
    unint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
    NSUInteger v6 = [v5 localizedStringForKey:@"Lookup" value:&stru_26D5311C0 table:0];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SXTextTangierFlowRep;
    NSUInteger v6 = [(TSWPRep *)&v8 sxaxNameForEditRotorAction:v4];
  }

  return v6;
}

- (SXTextTangierRepAccessibilityDataSource)accessibilityDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->accessibilityDataSource);
  return (SXTextTangierRepAccessibilityDataSource *)WeakRetained;
}

- (void)setAccessibilityDataSource:(id)a3
{
}

- (SXAXCustomRotor)linkRotor
{
  return self->_linkRotor;
}

- (void)setLinkRotor:(id)a3
{
}

- (SXAXCustomRotor)headingsRotor
{
  return self->_headingsRotor;
}

- (void)setHeadingsRotor:(id)a3
{
}

- (SXTextTangierInteractiveCanvasController)icc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  return (SXTextTangierInteractiveCanvasController *)WeakRetained;
}

- (void)setIcc:(id)a3
{
}

- (CGRect)frameInCanvas
{
  double x = self->_frameInCanvas.origin.x;
  double y = self->_frameInCanvas.origin.y;
  double width = self->_frameInCanvas.size.width;
  double height = self->_frameInCanvas.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameInCanvas:(CGRect)a3
{
  self->_frameInCanvas = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
  objc_storeStrong((id *)&self->_headingsRotor, 0);
  objc_storeStrong((id *)&self->_linkRotor, 0);
  objc_destroyWeak((id *)&self->accessibilityDataSource);
}

@end
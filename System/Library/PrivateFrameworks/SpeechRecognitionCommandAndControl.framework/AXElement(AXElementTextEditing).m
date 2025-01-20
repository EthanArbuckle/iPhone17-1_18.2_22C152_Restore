@interface AXElement(AXElementTextEditing)
- (BOOL)isVisibleTextRect:()AXElementTextEditing;
- (CACTextMarker)cacFirstPosition;
- (CACTextMarker)cacLastPosition;
- (CACTextMarkerRange)cacTextSelectionCACTextMarkerRange;
- (double)textMarkerFrame:()AXElementTextEditing;
- (id)cacString;
- (id)cacStringForRange:()AXElementTextEditing;
- (id)elementForTextMarker:()AXElementTextEditing;
- (id)objectForRange:()AXElementTextEditing withParameterizedAttribute:;
- (id)textLineEndMarker:()AXElementTextEditing;
- (id)textLineStartMarker:()AXElementTextEditing;
- (id)textMarkerRangeForSelection;
- (id)textMarkersForRange:()AXElementTextEditing;
- (uint64_t)_numberOfCharacters;
- (uint64_t)cacApplyFormatBold;
- (uint64_t)cacApplyFormatItalics;
- (uint64_t)cacApplyFormatUnderline;
- (uint64_t)cacPerformTextCopy;
- (uint64_t)cacPerformTextCut;
- (uint64_t)cacPerformTextOperation:()AXElementTextEditing;
- (uint64_t)cacPerformTextRedo;
- (uint64_t)cacSetTextSelectionToCACTextMarkerRange:()AXElementTextEditing;
- (uint64_t)cacSetTextSelectionToRange:()AXElementTextEditing;
- (uint64_t)cacStringForCACTextMarkerRange:()AXElementTextEditing;
- (uint64_t)cacSupportsTextOperation:()AXElementTextEditing;
- (uint64_t)deleteTextAtRange:()AXElementTextEditing;
- (uint64_t)deleteTextAtTextMarkerRange:()AXElementTextEditing;
- (uint64_t)isVisibleTextRange:()AXElementTextEditing;
- (uint64_t)lineRangeForPosition:()AXElementTextEditing;
- (uint64_t)rangeForTextMarker:()AXElementTextEditing;
- (uint64_t)rangeForTextMarkers:()AXElementTextEditing;
- (uint64_t)visibleTextRange;
- (void)_scrollToVisibleForRange:()AXElementTextEditing;
- (void)cacPerformTextPaste;
- (void)cacPerformTextSelectAll;
- (void)cacPerformTextUndo;
- (void)rectForRange:()AXElementTextEditing;
@end

@implementation AXElement(AXElementTextEditing)

- (uint64_t)cacApplyFormatBold
{
  return [a1 cacPerformTextOperation:*MEMORY[0x263F21B70]];
}

- (uint64_t)cacApplyFormatItalics
{
  return [a1 cacPerformTextOperation:*MEMORY[0x263F21BA8]];
}

- (uint64_t)cacApplyFormatUnderline
{
  return [a1 cacPerformTextOperation:*MEMORY[0x263F21C10]];
}

- (uint64_t)cacPerformTextCopy
{
  return [a1 cacPerformTextOperation:*MEMORY[0x263F21B78]];
}

- (uint64_t)cacPerformTextCut
{
  return [a1 cacPerformTextOperation:*MEMORY[0x263F21B80]];
}

- (void)cacPerformTextPaste
{
  id v1 = a1;
  if ([v1 hasAnyTraits:*MEMORY[0x263F21C90]])
  {
    v2 = [v1 elementForAttribute:2011];
    v3 = v2;
    if (v2)
    {
      id v4 = v2;

      id v1 = v4;
    }
  }
  v5 = [MEMORY[0x263F82A18] generalPasteboard];
  v6 = [v1 uiElement];
  v7 = [v6 numberWithAXAttribute:3065];
  uint64_t v8 = [v7 longLongValue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__AXElement_AXElementTextEditing__cacPerformTextPaste__block_invoke;
  v10[3] = &unk_264D11FD0;
  id v11 = v1;
  id v9 = v1;
  [v5 _requestSecurePasteAuthenticationMessageWithContext:0x6B3CE0810AAF53ALL forClientVersionedPID:v8 completionBlock:v10];
}

- (void)cacPerformTextUndo
{
  v2 = (uint64_t *)MEMORY[0x263F21C18];
  if ([a1 cacSupportsTextOperation:*MEMORY[0x263F21C18]])
  {
    uint64_t v3 = *v2;
    [a1 cacPerformTextOperation:v3];
  }
  else
  {
    id v4 = [MEMORY[0x263F21F20] sharedInstance];
    [v4 shake];
  }
}

- (uint64_t)cacPerformTextRedo
{
  return [a1 cacPerformTextOperation:*MEMORY[0x263F21BC8]];
}

- (void)cacPerformTextSelectAll
{
  v2 = (uint64_t *)MEMORY[0x263F21BE8];
  if ([a1 cacSupportsTextOperation:*MEMORY[0x263F21BE8]])
  {
    uint64_t v3 = *v2;
    [a1 cacPerformTextOperation:v3];
  }
  else
  {
    id v6 = [a1 cacFirstPosition];
    id v4 = [a1 cacLastPosition];
    v5 = +[CACTextMarkerRange markerRangeWithStartMarker:v6 endMarker:v4];
    [a1 cacSetTextSelectionToCACTextMarkerRange:v5];
  }
}

- (uint64_t)cacSupportsTextOperation:()AXElementTextEditing
{
  id v4 = a3;
  v5 = [a1 cacTextOperations];
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)cacPerformTextOperation:()AXElementTextEditing
{
  return [a1 performAction:2012 withValue:a3];
}

- (void)rectForRange:()AXElementTextEditing
{
  if (a3 != 0x7FFFFFFF) {
    return objc_msgSend(result, "boundsForTextRange:");
  }
  return result;
}

- (void)_scrollToVisibleForRange:()AXElementTextEditing
{
  if (a3 != 0x7FFFFFFF)
  {
    objc_msgSend(a1, "boundsForTextRange:");
    double x = v11.origin.x;
    double y = v11.origin.y;
    double width = v11.size.width;
    double height = v11.size.height;
    if (!CGRectEqualToRect(v11, *MEMORY[0x263F001A8]))
    {
      id v9 = [a1 uiElement];
      uint64_t v8 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", x, y, width, height);
      [v9 performAXAction:2039 withValue:v8];
    }
  }
}

- (uint64_t)visibleTextRange
{
  v2 = [a1 uiElement];
  [v2 updateCache:2216];

  uint64_t v3 = [a1 uiElement];
  uint64_t v4 = [v3 rangeWithAXAttribute:2216];

  return v4;
}

- (uint64_t)isVisibleTextRange:()AXElementTextEditing
{
  objc_msgSend(a1, "rectForRange:");
  return objc_msgSend(a1, "isVisibleTextRect:");
}

- (BOOL)isVisibleTextRect:()AXElementTextEditing
{
  if (CGRectEqualToRect(*(CGRect *)&a2, *MEMORY[0x263F001A8])) {
    return 0;
  }
  [a1 visibleFrame];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  double v19 = a2;
  double v20 = a3;
  double v21 = a4;
  double v22 = a5;
  return CGRectIntersectsRect(*(CGRect *)&v19, *(CGRect *)&v12);
}

- (CACTextMarkerRange)cacTextSelectionCACTextMarkerRange
{
  uint64_t v2 = [a1 selectedTextRange];
  return +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", v2, v1);
}

- (uint64_t)cacSetTextSelectionToRange:()AXElementTextEditing
{
  v7 = +[CACDisplayManager sharedManager];
  objc_msgSend(v7, "willProgrammaticallySelectRange:forElement:", a3, a4, a1);

  uint64_t result = objc_msgSend(a1, "setSelectedTextRange:", a3, a4);
  if (a4)
  {
    return objc_msgSend(a1, "_scrollToVisibleForRange:", a3, a4);
  }
  return result;
}

- (uint64_t)cacSetTextSelectionToCACTextMarkerRange:()AXElementTextEditing
{
  uint64_t v5 = [a3 nsRange];
  return objc_msgSend(a1, "cacSetTextSelectionToRange:", v5, v4);
}

- (id)cacStringForRange:()AXElementTextEditing
{
  unint64_t v7 = [a1 _numberOfCharacters];
  if (a3 <= v7)
  {
    uint64_t v8 = 0;
    if (a4 && a3 + a4 <= v7)
    {
      id v9 = [a1 uiElement];
      [v9 updateCache:2006];

      v10 = [a1 value];
      uint64_t v8 = objc_msgSend(v10, "substringWithRange:", a3, a4);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)cacString
{
  uint64_t v2 = [a1 uiElement];
  [v2 updateCache:2006];

  uint64_t v3 = [a1 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = (void *)[v3 copy];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)cacStringForCACTextMarkerRange:()AXElementTextEditing
{
  uint64_t v5 = [a3 nsRange];
  return objc_msgSend(a1, "cacStringForRange:", v5, v4);
}

- (uint64_t)deleteTextAtRange:()AXElementTextEditing
{
  objc_msgSend(a1, "setSelectedTextRange:");
  if (a4) {
    objc_msgSend(a1, "_scrollToVisibleForRange:", a3, a4);
  }
  return [a1 deleteText];
}

- (uint64_t)deleteTextAtTextMarkerRange:()AXElementTextEditing
{
  uint64_t v5 = [a3 nsRange];
  return objc_msgSend(a1, "deleteTextAtRange:", v5, v4);
}

- (CACTextMarker)cacFirstPosition
{
  return +[CACTextMarker markerWithIndex:0];
}

- (CACTextMarker)cacLastPosition
{
  uint64_t v1 = [a1 _numberOfCharacters];
  return +[CACTextMarker markerWithIndex:v1];
}

- (uint64_t)_numberOfCharacters
{
  uint64_t v2 = [a1 uiElement];
  [v2 updateCache:2006];

  uint64_t v3 = [a1 value];
  uint64_t v4 = [v3 length];

  return v4;
}

- (uint64_t)lineRangeForPosition:()AXElementTextEditing
{
  long long v8 = xmmword_238415C70;
  uint64_t v4 = [a1 uiElement];
  uint64_t v5 = (const void *)objc_msgSend(v4, "objectWithAXAttribute:parameter:", 94009, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3));

  if (!v5) {
    return 0x7FFFFFFFLL;
  }
  CFTypeID v6 = CFGetTypeID(v5);
  if (v6 != AXValueGetTypeID() || AXValueGetType((AXValueRef)v5) != kAXValueTypeCFRange) {
    return 0x7FFFFFFFLL;
  }
  AXValueGetValue((AXValueRef)v5, kAXValueTypeCFRange, &v8);
  return v8;
}

- (id)textMarkerRangeForSelection
{
  uint64_t v2 = [a1 uiElement];
  [v2 updateCache:4004];

  uint64_t v3 = [a1 uiElement];
  uint64_t v4 = [v3 arrayWithAXAttribute:4004];

  return v4;
}

- (id)textLineEndMarker:()AXElementTextEditing
{
  id v4 = a3;
  uint64_t v5 = [a1 uiElement];
  [v5 updateCache:94003];

  CFTypeID v6 = [a1 uiElement];
  unint64_t v7 = [v6 objectWithAXAttribute:94003 parameter:v4];

  return v7;
}

- (id)textLineStartMarker:()AXElementTextEditing
{
  id v4 = a3;
  uint64_t v5 = [a1 uiElement];
  [v5 updateCache:94002];

  CFTypeID v6 = [a1 uiElement];
  unint64_t v7 = [v6 objectWithAXAttribute:94002 parameter:v4];

  return v7;
}

- (id)elementForTextMarker:()AXElementTextEditing
{
  id v4 = a3;
  uint64_t v5 = [a1 uiElement];
  [v5 updateCache:94006];

  CFTypeID v6 = [a1 elementForAttribute:94006 parameter:v4];

  return v6;
}

- (double)textMarkerFrame:()AXElementTextEditing
{
  id v4 = a3;
  uint64_t v5 = [a1 uiElement];
  CFTypeID v6 = (const __AXValue *)[v5 objectWithAXAttribute:94000 parameter:v4];

  if (v6 && (CFTypeID v7 = CFGetTypeID(v6), v7 == AXValueGetTypeID()))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    AXValueGetValue(v6, kAXValueTypeCGRect, &v10);
  }
  else
  {
    long long v8 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v10 = *MEMORY[0x263F001A8];
    long long v11 = v8;
  }
  return *(double *)&v10;
}

- (uint64_t)rangeForTextMarker:()AXElementTextEditing
{
  long long v9 = xmmword_238415C70;
  id v4 = a3;
  uint64_t v5 = [a1 uiElement];
  CFTypeID v6 = (const void *)[v5 objectWithAXAttribute:94012 parameter:v4];

  if (v6)
  {
    CFTypeID v7 = CFGetTypeID(v6);
    if (v7 == AXValueGetTypeID() && AXValueGetType((AXValueRef)v6) == kAXValueTypeCFRange) {
      AXValueGetValue((AXValueRef)v6, kAXValueTypeCFRange, &v9);
    }
  }
  return v9;
}

- (uint64_t)rangeForTextMarkers:()AXElementTextEditing
{
  long long v9 = xmmword_238415C70;
  id v4 = a3;
  uint64_t v5 = [a1 uiElement];
  CFTypeID v6 = (const void *)[v5 objectWithAXAttribute:94017 parameter:v4];

  if (v6)
  {
    CFTypeID v7 = CFGetTypeID(v6);
    if (v7 == AXValueGetTypeID() && AXValueGetType((AXValueRef)v6) == kAXValueTypeCFRange) {
      AXValueGetValue((AXValueRef)v6, kAXValueTypeCFRange, &v9);
    }
  }
  return v9;
}

- (id)objectForRange:()AXElementTextEditing withParameterizedAttribute:
{
  v12[0] = a3;
  v12[1] = a4;
  AXValueRef v7 = AXValueCreate(kAXValueTypeCFRange, v12);
  if (v7)
  {
    AXValueRef v8 = v7;
    long long v9 = [a1 uiElement];
    long long v10 = [v9 objectWithAXAttribute:a5 parameter:v8];

    CFRelease(v8);
  }
  else
  {
    long long v10 = 0;
  }
  return v10;
}

- (id)textMarkersForRange:()AXElementTextEditing
{
  id v4 = objc_msgSend(a1, "objectForRange:withParameterizedAttribute:", a3, a4, 94014);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

@end
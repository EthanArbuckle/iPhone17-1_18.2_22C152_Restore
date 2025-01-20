@interface THTSWPRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilityIncludeDuringContentReading;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxIsLastTextRepOnCurrentPage;
- (CGRect)_accessibilityFrameForRange:(_NSRange)a3;
- (CGRect)accessibilityFrameForLineNumber:(int64_t)a3;
- (CGRect)thaxFrameForLineIndex:(unint64_t)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)_thaxSelectedRepRange;
- (id)_thaxColumnForLineIndex:(unint64_t)a3;
- (id)accessibilityContentForLineNumber:(int64_t)a3;
- (id)accessibilityLabel;
- (id)accessibilityNextTextNavigationElement;
- (id)accessibilityPreviousTextNavigationElement;
- (id)accessibilityTextualContext;
- (id)thaxContentForLineIndex:(unint64_t)a3;
- (id)thaxParentPageRep;
- (int64_t)accessibilityLineNumberForPoint:(CGPoint)a3;
- (int64_t)thaxLineIndexAtPoint:(CGPoint)a3;
- (unint64_t)_thaxLineIndexInColumn:(id)a3 forLineIndex:(unint64_t)a4;
- (unint64_t)_tsaxLinePosition:(BOOL)a3;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_thaxSetSelectedRepRange:(_NSRange)a3;
@end

@implementation THTSWPRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (int64_t)thaxLineIndexAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v5 = [(TSWPRepAccessibility *)self tsaxColumns];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v7 = v6;
  int64_t v8 = 0;
  uint64_t v9 = *(void *)v19;
  int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      v13 = (char *)[v12 tsaxCountLines];
      if (v13)
      {
        v14 = v13;
        uint64_t v15 = 0;
        v16 = &v13[v8];
        while (1)
        {
          [v12 tsaxBoundsOfLineFragmentAtIndex:v15];
          v23.CGFloat x = x;
          v23.CGFloat y = y;
          if (CGRectContainsPoint(v24, v23)) {
            break;
          }
          if (v14 == (char *)++v15)
          {
            int64_t v8 = (int64_t)v16;
            goto LABEL_12;
          }
        }
        v8 += v15;
        int64_t v10 = v8;
      }
LABEL_12:
      ;
    }
    id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v7);
  return v10;
}

- (id)thaxContentForLineIndex:(unint64_t)a3
{
  id v5 = -[THTSWPRepAccessibility _thaxColumnForLineIndex:](self, "_thaxColumnForLineIndex:");
  if (!v5)
  {
    if (!TSAccessibilityShouldPerformValidationChecks()) {
      return 0;
    }
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    int v18 = __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Line fragment not found for index: %lu", v13, v14, v15, v16, v17, a3);
LABEL_14:
    if (v18) {
      goto LABEL_21;
    }
    return 0;
  }
  id v6 = [v5 tsaxRangeOfLineFragmentAtIndex:[self _thaxLineIndexInColumn:forLineIndex:v5, a3]];
  if (v6 == NSInvalidRange[0] && v7 == NSInvalidRange[1])
  {
    if (!TSAccessibilityShouldPerformValidationChecks()) {
      return 0;
    }
    int v19 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    int v18 = __TSAccessibilityHandleValidationErrorWithDescription(v19, 0, @"Line fragment range not found for index: %lu, in column: %@", v20, v21, v22, v23, v24, a3);
    goto LABEL_14;
  }
  id v9 = v6;
  id v10 = v7;
  if ([(THTSWPRepAccessibility *)self tsaxRespondsToSelector:"tsaxSubstringInStorageWithRange:" fromExtrasProtocol:&OBJC_PROTOCOL___TSWPRepAccessibilityExtras])
  {
    return -[TSWPRepAccessibility tsaxSubstringInStorageWithRange:](self, "tsaxSubstringInStorageWithRange:", v9, v10);
  }
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int v25 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(v25, 0, @"THTSWPRepAccessibility should have implemented tsaxSubstringInStorageWithRange from TSWPRepAccessibilityExtras protocol", v26, v27, v28, v29, v30, v32))LABEL_21:abort(); {
  }
    }
  v31 = [(TSWPRepAccessibility *)self tsaxStorage];

  return -[TSWPStorageAccessibility tsaxSubstringWithRange:](v31, "tsaxSubstringWithRange:", v9, v10);
}

- (CGRect)thaxFrameForLineIndex:(unint64_t)a3
{
  id v5 = -[THTSWPRepAccessibility _thaxColumnForLineIndex:](self, "_thaxColumnForLineIndex:");
  unint64_t v6 = [(THTSWPRepAccessibility *)self _thaxLineIndexInColumn:v5 forLineIndex:a3];
  if (v5)
  {
    [v5 tsaxBoundsOfLineFragmentAtIndex:v6];
    -[TSDRepAccessibility tsaxConvertNaturalRectToScreenSpace:](self, "tsaxConvertNaturalRectToScreenSpace:");
    CGFloat x = v7;
    CGFloat y = v9;
    CGFloat width = v11;
    CGFloat height = v13;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Line fragment not found for index: %lu", v16, v17, v18, v19, v20, a3))abort(); {
    }
      }
  }
  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (id)_thaxColumnForLineIndex:(unint64_t)a3
{
  v4 = [(TSWPRepAccessibility *)self tsaxColumns];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      v7 += (unint64_t)[v10 tsaxCountLines];
      if (v7 > a3) {
        break;
      }
      if (v6 == (id)++v9)
      {
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v10 = 0;
  }
  int ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
  if (!v10)
  {
    if (ShouldPerformValidationChecks)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"No line fragment found at index: %lu", v13, v14, v15, v16, v17, a3))abort(); {
    }
      }
  }
  return v10;
}

- (unint64_t)_thaxLineIndexInColumn:(id)a3 forLineIndex:(unint64_t)a4
{
  id v6 = [(TSWPRepAccessibility *)self tsaxColumns];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v22;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(id *)(*((void *)&v21 + 1) + 8 * v11);
      if (v12 == a3) {
        break;
      }
      v9 += (uint64_t)[v12 tsaxCountLines];
      if (v8 == (id)++v11)
      {
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  unint64_t v13 = a4 - v9;
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (v13 >= (unint64_t)[a3 tsaxCountLines] + v9)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Line index is out of bounds for specified column", v15, v16, v17, v18, v19, v21))abort(); {
    }
      }
  }
  return v13;
}

- (_NSRange)_thaxSelectedRepRange
{
  id AssociatedRange = __TSAccessibilityGetAssociatedRange(self, &unk_573A8B);
  result.length = v3;
  result.location = (NSUInteger)AssociatedRange;
  return result;
}

- (void)_thaxSetSelectedRepRange:(_NSRange)a3
{
}

- (id)thaxParentPageRep
{
  for (i = [(TSDRepAccessibility *)self tsaxParentRep];
        i;
        i = [(TSDRepAccessibility *)i tsaxParentRep])
  {
    +[TSAccessibilitySafeCategory tsaxTargetClass];
    if (objc_opt_isKindOfClass()) {
      break;
    }
  }
  return i;
}

- (BOOL)thaxIsLastTextRepOnCurrentPage
{
  id v3 = [(THTSWPRepAccessibility *)self thaxParentPageRep];

  return [v3 thaxRepIsLastTextElementOnPage:self];
}

- (BOOL)isAccessibilityElement
{
  v5.receiver = self;
  v5.super_class = (Class)THTSWPRepAccessibility;
  BOOL v3 = [(TSWPRepAccessibility *)&v5 isAccessibilityElement];
  if (v3) {
    LOBYTE(v3) = [[self accessibilityValue] length] != 0;
  }
  return v3;
}

- (id)accessibilityLabel
{
  return 0;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 0;
}

- (BOOL)accessibilityActivate
{
  return 0;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  id v2 = [(THTSWPRepAccessibility *)self _thaxSelectedRepRange];
  if (v2 == NSInvalidRange[0] && v3 == NSInvalidRange[1])
  {
    id v2 = 0;
    id v3 = 0;
  }
  result.length = (NSUInteger)v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.length || ([(THTSWPRepAccessibility *)self _thaxSelectedRepRange], v6))
  {
    v7.receiver = self;
    v7.super_class = (Class)THTSWPRepAccessibility;
    -[TSWPRepAccessibility _accessibilitySetSelectedTextRange:](&v7, "_accessibilitySetSelectedTextRange:", location, length);
  }
  -[THTSWPRepAccessibility _thaxSetSelectedRepRange:](self, "_thaxSetSelectedRepRange:", location, length);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)THTSWPRepAccessibility;
  unint64_t v3 = [(TSWPRepAccessibility *)&v7 accessibilityTraits] & ~(TSAccessibilityTraitTextEntry | TSAccessibilityTraitTextArea) | UIAccessibilityTraitCausesPageTurn | TSAccessibilityTraitIsEditing | TSAccessibilityTraitStaticText;
  [(THTSWPRepAccessibility *)self _accessibilitySelectedTextRange];
  uint64_t v4 = TSAccessibilityTraitTextOperationsAvailable;
  if (!v5) {
    uint64_t v4 = 0;
  }
  return v3 | v4;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (int64_t)accessibilityLineNumberForPoint:(CGPoint)a3
{
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:]([(TSWPRepAccessibility *)self tsaxInteractiveCanvasController], "tsaxConvertBoundsToUnscaledPoint:", a3.x, a3.y);
  -[TSDRepAccessibility tsaxConvertNaturalPointFromUnscaledCanvas:](self, "tsaxConvertNaturalPointFromUnscaledCanvas:");

  return -[THTSWPRepAccessibility thaxLineIndexAtPoint:](self, "thaxLineIndexAtPoint:");
}

- (id)accessibilityContentForLineNumber:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  else {
    return -[THTSWPRepAccessibility thaxContentForLineIndex:](self, "thaxContentForLineIndex:");
  }
}

- (CGRect)accessibilityFrameForLineNumber:(int64_t)a3
{
  if (a3 < 0)
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  else
  {
    -[THTSWPRepAccessibility thaxFrameForLineIndex:](self, "thaxFrameForLineIndex:");
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)accessibilityTextualContext
{
  return UIAccessibilityTextualContextNarrative;
}

- (CGRect)_accessibilityFrameForRange:(_NSRange)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x4010000000;
  uint64_t v17 = &unk_41622E;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v19 = size;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2A0554;
  v12[3] = &unk_46B940;
  v12[4] = self;
  v12[5] = &v14;
  _NSRange v13 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v12)) {
    abort();
  }
  double v4 = v15[4];
  double v5 = v15[5];
  double v6 = v15[6];
  double v7 = v15[7];
  _Block_object_dispose(&v14, 8);
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (BOOL)_accessibilityIncludeDuringContentReading
{
  return 1;
}

- (id)accessibilityPreviousTextNavigationElement
{
  id v3 = [self thaxParentPageRep].thaxPageContentReps;
  double v4 = (char *)[v3 indexOfObject:self];
  if (!v4 || v4 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [v3 objectAtIndexedSubscript:v4 - 1];
}

- (id)accessibilityNextTextNavigationElement
{
  id v3 = [self thaxParentPageRep].thaxPageContentReps;
  double v4 = (char *)[v3 indexOfObject:self];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  double v5 = v4;
  if (v4 >= (char *)[v3 count] - 1) {
    return 0;
  }

  return [v3 objectAtIndexedSubscript:v5 + 1];
}

- (unint64_t)_tsaxLinePosition:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (char *)[(TSWPEditingControllerAccessibility *)[(TSWPRepAccessibility *)self tsaxEditingController] tsaxSelectedTextRange];
  uint64_t v7 = (uint64_t)&v5[v6];
  double v8 = (char *)[(TSWPEditingControllerAccessibility *)[(TSWPRepAccessibility *)self tsaxEditingController] tsaxStorageRangeOfLineFragmentAtCharIndex:&v5[v6]];
  if (v8 == NSInvalidRange[0] && v9 == NSInvalidRange[1])
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Line fragment range not found for positionInStorage: %lu", v19, v20, v21, v22, v23, v7))abort(); {
    }
      }
    return -1;
  }
  else
  {
    double v11 = v8;
    id v12 = v9;
    id v13 = -[TSWPStorageAccessibility tsaxSubstringWithRange:]([(TSWPRepAccessibility *)self tsaxStorage], "tsaxSubstringWithRange:", v8, v9);
    unsigned int v14 = [v13 hasPrefix:@"\n"];
    uint64_t v15 = &v11[v14];
    uint64_t v16 = &v12[-v14 - [v13 hasSuffix:@"\n"]];
    if (v3)
    {
      return (unint64_t)-[TSWPRepAccessibility tsaxRepRangeWithStorageRange:](self, "tsaxRepRangeWithStorageRange:", v15, v16);
    }
    else
    {
      return [(TSWPRepAccessibility *)self tsaxRepPositionWithStoragePosition:&v15[(void)v16]];
    }
  }
}

@end
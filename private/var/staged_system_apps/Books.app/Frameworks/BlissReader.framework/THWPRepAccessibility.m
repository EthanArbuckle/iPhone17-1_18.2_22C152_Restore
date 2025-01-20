@interface THWPRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilityIncludeDuringContentReading;
- (BOOL)_thaxShouldOverrideValue;
- (BOOL)thaxIsPageNumberTextRep;
- (NSString)thaxFormattedPageNumberString;
- (NSString)thaxOverrideValue;
- (THWPHighlightControllerAccessibility)thaxHighlightController;
- (_NSRange)_accessibilityRawRangeForUITextRange:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityTextRangeFromNSRange:(_NSRange)a3;
- (id)_thaxCachedGlossaryTermsRotorItems;
- (id)_thaxCachedHighlightsRotorItems;
- (id)_thaxCachedLinksRotorItems;
- (id)_thaxGlossaryTermsRotor;
- (id)_thaxGlossaryTermsRotorItems;
- (id)_thaxHighlightController;
- (id)_thaxHighlightsRotor;
- (id)_thaxHighlightsRotorItems;
- (id)_thaxLinksRotor;
- (id)_thaxLinksRotorItems;
- (id)_thaxOverrideValue;
- (id)_thaxRotorItemForPredicate:(id)a3 fromItems:(id)a4;
- (id)_thaxStoredGlossaryTermsRotor;
- (id)_thaxStoredHighlightsRotor;
- (id)_thaxStoredLinksRotor;
- (id)accessibilityCustomRotors;
- (id)accessibilityLabel;
- (void)_thaxSetCachedGlossaryTermsRotorItems:(id)a3;
- (void)_thaxSetCachedHighlightsRotorItems:(id)a3;
- (void)_thaxSetCachedLinksRotorItems:(id)a3;
- (void)_thaxSetStoredGlossaryTermsRotor:(id)a3;
- (void)_thaxSetStoredHighlightsRotor:(id)a3;
- (void)_thaxSetStoredLinksRotor:(id)a3;
- (void)thaxEnumerateGlossaryTermsInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)thaxEnumerateHighlightsInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)thaxEnumerateLinksInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)thaxHighlightsDidChange;
- (void)thaxSetOverrideValue:(id)a3;
- (void)tsaxChildWillBeRemoved:(id)a3;
- (void)tsaxEnumerateSpecialTextTokensInRange:(_NSRange)a3 usingBlock:(id)a4;
@end

@implementation THWPRepAccessibility

- (id)_thaxCachedHighlightsRotorItems
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A64);
}

- (void)_thaxSetCachedHighlightsRotorItems:(id)a3
{
}

- (id)_thaxCachedGlossaryTermsRotorItems
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A65);
}

- (void)_thaxSetCachedGlossaryTermsRotorItems:(id)a3
{
}

- (id)_thaxCachedLinksRotorItems
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A66);
}

- (void)_thaxSetCachedLinksRotorItems:(id)a3
{
}

- (id)_thaxStoredHighlightsRotor
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A67);
}

- (void)_thaxSetStoredHighlightsRotor:(id)a3
{
}

- (id)_thaxStoredGlossaryTermsRotor
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A68);
}

- (void)_thaxSetStoredGlossaryTermsRotor:(id)a3
{
}

- (id)_thaxStoredLinksRotor
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A69);
}

- (void)_thaxSetStoredLinksRotor:(id)a3
{
}

- (BOOL)thaxIsPageNumberTextRep
{
  id v3 = [self thaxPageController].thaxCurrentAbsolutePageIndex;
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v4 = v3;
  v5 = [(TSWPRepAccessibility *)self tsaxStorage];
  if ([(TSWPStorageAccessibility *)v5 tsaxRange]) {
    return 0;
  }
  unint64_t v7 = (unint64_t)v4 + 1;
  if (v6 != (unint64_t)(floor(log10((double)v7)) + 1.0)) {
    return 0;
  }
  v8 = [(TSWPStorageAccessibility *)v5 tsaxString];
  v9 = +[NSString stringWithFormat:@"%lu", v7];

  return [(NSString *)v8 isEqualToString:v9];
}

- (NSString)thaxFormattedPageNumberString
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  v8 = sub_28DD4C;
  v9 = sub_28DD5C;
  uint64_t v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_28DD68;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  v2 = (NSString *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)thaxHighlightsDidChange
{
}

- (void)thaxEnumerateHighlightsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = [[self _thaxHighlightController] thaxAnnotationCache];
  if (v7)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_28DE80;
    v8[3] = &unk_46C538;
    v8[6] = location;
    v8[7] = length;
    v8[4] = a4;
    v8[5] = v9;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
    _Block_object_dispose(v9, 8);
  }
}

- (void)thaxEnumerateGlossaryTermsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v8 = [(TSWPRepAccessibility *)self tsaxStorage];
  v9 = objc_opt_class();
  Class v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)[(TSWPRepAccessibility *)self tsaxInteractiveCanvasController], 0, 0);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_28E060;
    v11[3] = &unk_46C560;
    v11[4] = v10;
    v11[5] = self;
    v11[6] = a4;
    v11[7] = v12;
    -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](v8, "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, location, length, v11);
  }
  _Block_object_dispose(v12, 8);
}

- (void)thaxEnumerateLinksInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v8 = [(TSWPRepAccessibility *)self tsaxStorage];
  v9 = objc_opt_class();
  Class v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)[(TSWPRepAccessibility *)self tsaxInteractiveCanvasController], 0, 0);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_28E23C;
    v11[3] = &unk_46C560;
    v11[4] = v10;
    v11[5] = self;
    v11[6] = a4;
    v11[7] = v12;
    -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](v8, "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, location, length, v11);
  }
  _Block_object_dispose(v12, 8);
}

- (void)tsaxEnumerateSpecialTextTokensInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_28E52C;
  v12[3] = &unk_46C588;
  void v12[4] = a4;
  v12[5] = &v13;
  v11.receiver = self;
  v11.super_class = (Class)THWPRepAccessibility;
  -[TSWPRepAccessibility tsaxEnumerateSpecialTextTokensInRange:usingBlock:](&v11, "tsaxEnumerateSpecialTextTokensInRange:usingBlock:", a3.location, a3.length, v12);
  if (!*((unsigned char *)v14 + 24))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_28E584;
    v10[3] = &unk_46C5B0;
    v10[4] = a4;
    v10[5] = &v13;
    -[THWPRepAccessibility thaxEnumerateHighlightsInRange:usingBlock:](self, "thaxEnumerateHighlightsInRange:usingBlock:", location, length, v10);
    if (!*((unsigned char *)v14 + 24))
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_28E61C;
      v9[3] = &unk_46C5D8;
      void v9[4] = THAccessibilityLocalizedString(@"glossary.term");
      v9[5] = a4;
      v9[6] = &v13;
      -[THWPRepAccessibility thaxEnumerateGlossaryTermsInRange:usingBlock:](self, "thaxEnumerateGlossaryTermsInRange:usingBlock:", location, length, v9);
      if (!*((unsigned char *)v14 + 24))
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_28E68C;
        v8[3] = &unk_46C600;
        v8[4] = a4;
        v8[5] = &v13;
        -[THWPRepAccessibility thaxEnumerateLinksInRange:usingBlock:](self, "thaxEnumerateLinksInRange:usingBlock:", location, length, v8);
      }
    }
  }
  _Block_object_dispose(&v13, 8);
}

- (id)accessibilityLabel
{
  if (![(THWPRepAccessibility *)self thaxIsPageNumberTextRep]) {
    return 0;
  }

  return THAccessibilityLocalizedString(@"page.number.no.format");
}

- (BOOL)_accessibilityIncludeDuringContentReading
{
  v5.receiver = self;
  v5.super_class = (Class)THWPRepAccessibility;
  BOOL v3 = [(THTSWPRepAccessibility *)&v5 _accessibilityIncludeDuringContentReading];
  if (v3) {
    LOBYTE(v3) = ![(THWPRepAccessibility *)self thaxIsPageNumberTextRep];
  }
  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (![(THTSWPRepAccessibility *)self isAccessibilityElement]
    || (-[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:](-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxConvertBoundsToUnscaledPoint:", x, y), -[TSDRepAccessibility tsaxConvertNaturalPointFromUnscaledCanvas:](self, "tsaxConvertNaturalPointFromUnscaledCanvas:"), v8 = -[THWPRepAccessibility charIndexForPointWithPinning:](self, "charIndexForPointWithPinning:"), v9 = -[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), id v10 = -[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep"), (result = -[TSWPStorageAccessibility tsaxSmartFieldNearestToCharIndex:inStorageRange:](v9, "tsaxSmartFieldNearestToCharIndex:inStorageRange:", v8, v10, v11)) == 0))
  {
    v13.receiver = self;
    v13.super_class = (Class)THWPRepAccessibility;
    return -[THWPRepAccessibility _accessibilityHitTest:withEvent:](&v13, "_accessibilityHitTest:withEvent:", a4, x, y);
  }
  return result;
}

- (id)accessibilityCustomRotors
{
  id v3 = +[NSMutableArray array];
  id v4 = [(THWPRepAccessibility *)self _thaxHighlightsRotor];
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = [(THWPRepAccessibility *)self _thaxLinksRotor];
  if (v5) {
    [v3 addObject:v5];
  }
  id v6 = [(THWPRepAccessibility *)self _thaxGlossaryTermsRotor];
  if (v6) {
    [v3 addObject:v6];
  }
  id v7 = [v3 copy];

  return v7;
}

- (id)_thaxHighlightsRotor
{
  if (!objc_msgSend(-[THWPRepAccessibility _thaxHighlightsRotorItems](self, "_thaxHighlightsRotorItems"), "count")) {
    return 0;
  }
  id v3 = [(THWPRepAccessibility *)self _thaxStoredHighlightsRotor];
  if (!v3)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3052000000;
    v6[3] = sub_28DD4C;
    v6[4] = sub_28DD5C;
    v6[5] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_28EA84;
    v5[3] = &unk_46C628;
    v5[4] = v6;
    id v3 = [objc_alloc((Class)UIAccessibilityCustomRotor) initWithName:THAccessibilityLocalizedString(@"highlights.menu.title") itemSearchBlock:v5];
    [(THWPRepAccessibility *)self _thaxSetStoredHighlightsRotor:v3];
    _Block_object_dispose(v6, 8);
  }
  return v3;
}

- (id)_thaxLinksRotor
{
  if (!objc_msgSend(-[THWPRepAccessibility _thaxLinksRotorItems](self, "_thaxLinksRotorItems"), "count")) {
    return 0;
  }
  id v3 = [(THWPRepAccessibility *)self _thaxStoredLinksRotor];
  if (!v3)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3052000000;
    v6[3] = sub_28DD4C;
    v6[4] = sub_28DD5C;
    v6[5] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_28EC0C;
    v5[3] = &unk_46C628;
    v5[4] = v6;
    id v3 = [objc_alloc((Class)UIAccessibilityCustomRotor) initWithName:THAccessibilityLocalizedString(@"links.menu.title") itemSearchBlock:v5];
    [(THWPRepAccessibility *)self _thaxSetStoredLinksRotor:v3];
    _Block_object_dispose(v6, 8);
  }
  return v3;
}

- (id)_thaxGlossaryTermsRotor
{
  if (![[self _thaxGlossaryTermsRotorItems] count])return 0; {
  id v3 = [(THWPRepAccessibility *)self _thaxStoredGlossaryTermsRotor];
  }
  if (!v3)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3052000000;
    v6[3] = sub_28DD4C;
    v6[4] = sub_28DD5C;
    v6[5] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_28ED94;
    v5[3] = &unk_46C628;
    v5[4] = v6;
    id v3 = [objc_alloc((Class)UIAccessibilityCustomRotor) initWithName:THAccessibilityLocalizedString(@"glossary.terms.menu.title") itemSearchBlock:v5];
    [(THWPRepAccessibility *)self _thaxSetStoredGlossaryTermsRotor:v3];
    _Block_object_dispose(v6, 8);
  }
  return v3;
}

- (id)_accessibilityTextRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  char v7 = 0;
  id v5 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v5, (uint64_t)+[TSDTextRangeAccessibility tsaxNewTextRangeWithRange:](TSDTextRangeAccessibility, "tsaxNewTextRangeWithRange:", location, length), 1, &v7);
  if (v7) {
    abort();
  }
  return result;
}

- (_NSRange)_accessibilityRawRangeForUITextRange:(id)a3
{
  id v5 = objc_opt_class();
  Class v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)a3, 0, 0);
  if (v6)
  {
    id v7 = [(objc_class *)v6 tsaxRange];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWPRepAccessibility;
    id v7 = [(THWPRepAccessibility *)&v9 _accessibilityRawRangeForUITextRange:a3];
  }
  result.NSUInteger length = v8;
  result.NSUInteger location = (NSUInteger)v7;
  return result;
}

- (id)_thaxRotorItemForPredicate:(id)a3 fromItems:(id)a4
{
  id v7 = (char *)[a3 searchDirection];
  char v18 = 0;
  NSUInteger v8 = objc_opt_class();
  Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)objc_msgSend(objc_msgSend(a3, "currentItem"), "targetRange"), 1, &v18);
  if (v18) {
    abort();
  }
  Class v10 = v9;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_28F074;
  v17[3] = &unk_46C650;
  v17[4] = v9;
  uint64_t v11 = [a4 indexOfObjectPassingTest:v17];
  if (v10) {
    BOOL v12 = v11 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    unint64_t v13 = 0;
  }
  else
  {
    uint64_t v15 = v11;
    if (v7 != (unsigned char *)&dword_0 + 1 && !v11) {
      return 0;
    }
    if (v7 == (unsigned char *)&dword_0 + 1)
    {
      if (v11 == (char *)[a4 count] - 1) {
        return 0;
      }
      uint64_t v16 = 1;
    }
    else
    {
      uint64_t v16 = -1;
    }
    unint64_t v13 = (unint64_t)&v15[v16];
    if (&v15[v16] == (unsigned char *)0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
  }
  if (v13 < (unint64_t)[a4 count]) {
    return [objc_alloc((Class)UIAccessibilityCustomRotorItemResult) initWithTargetElement:self targetRange:[a4 objectAtIndexedSubscript:v13]];
  }
  return 0;
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
  [self _thaxCachedHighlightsRotorItems].enumerateObjectsUsingBlock:&stru_46C690;
  [self->_thaxCachedGlossaryTermsRotorItems enumerateObjectsUsingBlock:&stru_46C6B0];
  [self->_thaxCachedLinksRotorItems enumerateObjectsUsingBlock:&stru_46C6D0];
  [(THWPRepAccessibility *)self _thaxSetCachedGlossaryTermsRotorItems:0];
  [(THWPRepAccessibility *)self _thaxSetCachedHighlightsRotorItems:0];
  [(THWPRepAccessibility *)self _thaxSetCachedLinksRotorItems:0];
  v5.receiver = self;
  v5.super_class = (Class)THWPRepAccessibility;
  [(TSDRepAccessibility *)&v5 tsaxChildWillBeRemoved:a3];
}

- (id)_thaxHighlightController
{
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"highlightController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_thaxGlossaryTermsRotorItems
{
  if (![(THWPRepAccessibility *)self _thaxCachedGlossaryTermsRotorItems])
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    id v4 = [(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_28F2C4;
    v7[3] = &unk_46C6F8;
    v7[4] = self;
    v7[5] = v3;
    -[THWPRepAccessibility thaxEnumerateGlossaryTermsInRange:usingBlock:](self, "thaxEnumerateGlossaryTermsInRange:usingBlock:", v4, v5, v7);
    [v3 sortUsingSelector:"tsaxCompareTextRangeByLocation:"];
    [(THWPRepAccessibility *)self _thaxSetCachedGlossaryTermsRotorItems:v3];
  }
  return [(THWPRepAccessibility *)self _thaxCachedGlossaryTermsRotorItems];
}

- (id)_thaxHighlightsRotorItems
{
  if (![(THWPRepAccessibility *)self _thaxCachedHighlightsRotorItems])
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    id v4 = [(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_28F400;
    v7[3] = &unk_46C720;
    v7[4] = self;
    v7[5] = v3;
    -[THWPRepAccessibility thaxEnumerateHighlightsInRange:usingBlock:](self, "thaxEnumerateHighlightsInRange:usingBlock:", v4, v5, v7);
    [v3 sortUsingSelector:"tsaxCompareTextRangeByLocation:"];
    [(THWPRepAccessibility *)self _thaxSetCachedHighlightsRotorItems:v3];
  }
  return [(THWPRepAccessibility *)self _thaxCachedHighlightsRotorItems];
}

- (id)_thaxLinksRotorItems
{
  if (![(THWPRepAccessibility *)self _thaxCachedLinksRotorItems])
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    id v4 = [(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_28F544;
    v7[3] = &unk_46C6F8;
    v7[4] = self;
    v7[5] = v3;
    -[THWPRepAccessibility thaxEnumerateLinksInRange:usingBlock:](self, "thaxEnumerateLinksInRange:usingBlock:", v4, v5, v7);
    [v3 sortUsingSelector:"tsaxCompareTextRangeByLocation:"];
    [(THWPRepAccessibility *)self _thaxSetCachedLinksRotorItems:v3];
  }
  return [(THWPRepAccessibility *)self _thaxCachedLinksRotorItems];
}

+ (id)tsaxTargetClassName
{
  return @"THWPRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxOverrideValue
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_573A6D);
}

- (void)thaxSetOverrideValue:(id)a3
{
}

- (THWPHighlightControllerAccessibility)thaxHighlightController
{
  char v5 = 0;
  id v3 = objc_opt_class();
  id result = (THWPHighlightControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"highlightController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)_thaxShouldOverrideValue
{
  return [(THWPRepAccessibility *)self thaxIsPageNumberTextRep]
      || [(NSString *)[(THWPRepAccessibility *)self thaxOverrideValue] length] != 0;
}

- (id)_thaxOverrideValue
{
  if ([(THWPRepAccessibility *)self thaxIsPageNumberTextRep])
  {
    return [(THWPRepAccessibility *)self thaxFormattedPageNumberString];
  }
  else
  {
    return [(THWPRepAccessibility *)self thaxOverrideValue];
  }
}

@end
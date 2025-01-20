@interface THWPRepCustomRotorItemAccessibilityElement
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (NSString)roleDescription;
- (THWPRepAccessibility)parentRep;
- (THWPRepCustomRotorItemAccessibilityElement)initWithParentRep:(id)a3 rangeInRep:(_NSRange)a4 label:(id)a5 hint:(id)a6;
- (TSWPHyperlinkFieldAccessibility)linkField;
- (_NSRange)rangeInRep;
- (id)_accessibilityRoleDescription;
- (void)dealloc;
- (void)setRangeInRep:(_NSRange)a3;
- (void)setRoleDescription:(id)a3;
@end

@implementation THWPRepCustomRotorItemAccessibilityElement

- (THWPRepCustomRotorItemAccessibilityElement)initWithParentRep:(id)a3 rangeInRep:(_NSRange)a4 label:(id)a5 hint:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12.receiver = self;
  v12.super_class = (Class)THWPRepCustomRotorItemAccessibilityElement;
  v10 = [(THWPRepCustomRotorItemAccessibilityElement *)&v12 initWithAccessibilityContainer:a3];
  v10->_rangeInRep.NSUInteger location = location;
  v10->_rangeInRep.NSUInteger length = length;
  [(THWPRepCustomRotorItemAccessibilityElement *)v10 setAccessibilityLabel:a5];
  [(THWPRepCustomRotorItemAccessibilityElement *)v10 setAccessibilityHint:a6];
  return v10;
}

- (THWPRepAccessibility)parentRep
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWPRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWPRepCustomRotorItemAccessibilityElement *)self accessibilityContainer], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSWPHyperlinkFieldAccessibility)linkField
{
  v3 = [(THWPRepCustomRotorItemAccessibilityElement *)self parentRep];
  id v4 = [(THWPRepCustomRotorItemAccessibilityElement *)self rangeInRep];
  id v6 = -[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](v3, "tsaxStorageRangeWithRepRange:", v4, v5);
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = sub_29B86C;
  v15 = sub_29B87C;
  uint64_t v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_29B888;
  v10[3] = &unk_46C8D8;
  v10[4] = &v11;
  -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:]([(TSWPRepAccessibility *)[(THWPRepCustomRotorItemAccessibilityElement *)self parentRep] tsaxStorage], "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v6, v7, v10);
  v8 = (TSWPHyperlinkFieldAccessibility *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  char v15 = 0;
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPRepAccessibility *)[(THWPRepCustomRotorItemAccessibilityElement *)self parentRep] tsaxInteractiveCanvasController], 1, &v15);
  if (v15) {
    goto LABEL_7;
  }
  Class v5 = v4;
  id v6 = [(THWPRepCustomRotorItemAccessibilityElement *)self linkField];
  if (v6)
  {
    [(objc_class *)v5 thaxHandleHyperlink:[(THWPRepCustomRotorItemAccessibilityElement *)self linkField] hitRep:[(THWPRepCustomRotorItemAccessibilityElement *)self parentRep]];
    return v6 != 0;
  }
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Could not perform AX activate on link item, falling back to tap", v8, v9, v10, v11, v12, v14))LABEL_7:abort(); {
  }
    }
  return v6 != 0;
}

- (CGRect)accessibilityFrame
{
  v3 = [(THWPRepCustomRotorItemAccessibilityElement *)self parentRep];
  NSUInteger location = self->_rangeInRep.location;
  NSUInteger length = self->_rangeInRep.length;

  -[TSWPRepAccessibility _accessibilityBoundsForRange:](v3, "_accessibilityBoundsForRange:", location, length);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)_accessibilityRoleDescription
{
  v3 = [(THWPRepCustomRotorItemAccessibilityElement *)self roleDescription];
  if (![(NSString *)v3 length])
  {
    v5.receiver = self;
    v5.super_class = (Class)THWPRepCustomRotorItemAccessibilityElement;
    return [(THWPRepCustomRotorItemAccessibilityElement *)&v5 _accessibilityRoleDescription];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWPRepCustomRotorItemAccessibilityElement;
  [(THWPRepCustomRotorItemAccessibilityElement *)&v3 dealloc];
}

- (NSString)roleDescription
{
  return self->_roleDescription;
}

- (void)setRoleDescription:(id)a3
{
}

- (_NSRange)rangeInRep
{
  p_rangeInRep = &self->_rangeInRep;
  NSUInteger location = self->_rangeInRep.location;
  NSUInteger length = p_rangeInRep->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeInRep:(_NSRange)a3
{
  self->_rangeInRep = a3;
}

@end
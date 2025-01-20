@interface NSObject
- (BOOL)_tsaxIsBuildingChildrenCache;
- (BOOL)_tsaxIsInvalidatingChildrenCache;
- (BOOL)_tsaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4 skipAssertions:(BOOL)a5;
- (BOOL)thaxUsesChildrenFramesForSorting;
- (BOOL)tsaxBoolValueForKey:(id)a3;
- (BOOL)tsaxIsDescendantOfElement:(id)a3;
- (BOOL)tsaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4;
- (BOOL)tsaxRespondsToSelector:(SEL)a3 fromOptionalExtrasProtocol:(id)a4;
- (CGAffineTransform)tsaxCGAffineTransformValueForKey:(SEL)a3;
- (CGPoint)tsaxCGPointValueForKey:(id)a3;
- (CGRect)boundsOfLineFragmentAtIndex:(unint64_t)a3;
- (CGRect)tsaxCGRectValueForKey:(id)a3;
- (CGSize)tsaxCGSizeValueForKey:(id)a3;
- (NSMutableArray)_tsaxChildInvalidationCompletionBlocks;
- (NSMutableArray)_tsaxChildrenCache;
- (TSAccessibilityTimer)_tsaxChildInvalidationTimer;
- (UIView)tsaxAncestorView;
- (_NSRange)paragraphIndexRangeForCharRange:(_NSRange)a3;
- (_NSRange)rangeOfLineFragmentAtIndex:(unint64_t)a3;
- (_NSRange)tsaxRangeValueForKey:(id)a3;
- (__CTFont)createFontAtCharIndex:(unint64_t)a3 scaleTextPercent:(unint64_t)a4 effectiveRange:(_NSRange *)a5 styleProvider:(id)a6;
- (double)tsaxDoubleValueForKey:(id)a3;
- (double)tsaxScreenScale;
- (float)tsaxFloatValueForKey:(id)a3;
- (id)_tsaxElementAccessibilityChildren:(id)a3;
- (id)_tsaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5;
- (id)_tsaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5;
- (id)columnForCharIndex:(unint64_t)a3;
- (id)rectsForSelection:(id)a3;
- (id)stringEquivalentFromRange:(_NSRange)a3;
- (id)substringWithRange:(_NSRange)a3;
- (id)thaxDocumentViewController;
- (id)thaxPageController;
- (id)tsaxAncestorOfType:(Class)a3;
- (id)tsaxChildren;
- (id)tsaxFindDescendantPassingTest:(id)a3;
- (id)tsaxValueForKey:(id)a3;
- (id)tsaxViewAncestorOfType:(Class)a3;
- (id)valueForProperty:(int)a3 atCharIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (int)tsaxIntValueForKey:(id)a3;
- (int64_t)tsaxIntegerValueForKey:(id)a3;
- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3;
- (unint64_t)lineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4;
- (unint64_t)tsaxUnsignedIntegerValueForKey:(id)a3;
- (unsigned)tsaxUnsignedIntValueForKey:(id)a3;
- (void)_tsaxSetBuildingChildrenCache:(BOOL)a3;
- (void)_tsaxSetChildInvalidationCompletionBlocks:(id)a3;
- (void)_tsaxSetChildInvalidationTimer:(id)a3;
- (void)_tsaxSetChildrenCache:(id)a3;
- (void)_tsaxSetInvalidatingChildrenCache:(BOOL)a3;
- (void)performSelector:(SEL)a3 withIndexesFromSet:(id)a4;
- (void)thaxSetUsesChildrenFramesForSorting:(BOOL)a3;
- (void)tsaxAccessibilityUnregister;
- (void)tsaxHandleTextOperationAction:(id)a3 usingBlock:(id)a4;
- (void)tsaxInvalidateChildrenEventually;
- (void)tsaxInvalidateChildrenEventuallyWithCompletion:(id)a3;
- (void)tsaxInvalidateChildrenImmediately;
- (void)tsaxStructValue:(void *)a3 forKey:(id)a4 ofExpectedType:(const char *)a5 fallbackValue:(const void *)a6;
@end

@implementation NSObject

- (void)performSelector:(SEL)a3 withIndexesFromSet:(id)a4
{
  for (id i = [a4 firstIndex]; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a4 indexGreaterThanIndex:i])
  {
    v7 = +[NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:a3]];
    [(NSInvocation *)v7 setSelector:a3];
    [(NSInvocation *)v7 setArgument:&i atIndex:2];
    [(NSInvocation *)v7 invokeWithTarget:self];
  }
}

- (id)_tsaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5
{
  return -[NSObject _tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, a4, a5, 0);
}

- (id)_tsaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5
{
  id v8 = -[NSObject tsaxValueForKey:](self, "tsaxValueForKey:");
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (qword_573840 != -1) {
        dispatch_once(&qword_573840, &stru_46B7C0);
      }
      if (!byte_573838) {
        return 0;
      }
      if (qword_573860 != -1) {
        dispatch_once(&qword_573860, &stru_46B800);
      }
      int v12 = byte_573858;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      NSStringFromClass(a4);
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      if (!__TSAccessibilityHandleValidationErrorWithDescription(v12, 0, @"Value for key %@ on object <%@: %p> is not an %@; class: %@; value: %@",
                            v15,
                            v16,
                            v17,
                            v18,
                            v19,
                            (uint64_t)a3))
        return 0;
      goto LABEL_33;
    }
    if (a5)
    {
      v9 = (const char *)[v8 objCType];
      if (strcmp(v9, a5))
      {
        char v10 = 0;
        v31 = (const char **)&v33;
        while (1)
        {
          v11 = v31++;
          if (!*v11) {
            break;
          }
          if ((v10 & 1) == 0) {
            char v10 = 1;
          }
          if (!strcmp(v9, *v11)) {
            return v8;
          }
        }
        if (qword_573840 != -1) {
          dispatch_once(&qword_573840, &stru_46B7C0);
        }
        if (!byte_573838) {
          return 0;
        }
        if (v10)
        {
          id v21 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%s" a5];
          v32 = &v34;
          for (uint64_t i = v33; i; uint64_t i = *v23)
          {
            [v21 appendFormat:@"\", \"%s", i];
            v23 = v32++;
          }
          [v21 UTF8String];
          if (qword_573840 != -1) {
            dispatch_once(&qword_573840, &stru_46B7C0);
          }
        }
        else
        {
          id v21 = 0;
        }
        if (!byte_573838) {
          goto LABEL_32;
        }
        if (qword_573860 != -1) {
          dispatch_once(&qword_573860, &stru_46B800);
        }
        int v24 = byte_573858;
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        if (!__TSAccessibilityHandleValidationErrorWithDescription(v24, 0, @"Value for key %@ on object <%@: %p> doesn't encapsulate the right type; value: %@; actual type encoding: \"%s\"; %s: \"%s\".",
                              v26,
                              v27,
                              v28,
                              v29,
                              v30,
                              (uint64_t)a3))
        {
LABEL_32:

          return 0;
        }
LABEL_33:
        abort();
      }
    }
  }
  return v8;
}

- (id)tsaxValueForKey:(id)a3
{
  return -[NSObject valueForKey:](self, "valueForKey:");
}

- (BOOL)tsaxBoolValueForKey:(id)a3
{
  id v3 = -[NSObject _tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(), "i", "c", "B", 0);

  return [v3 BOOLValue];
}

- (int)tsaxIntValueForKey:(id)a3
{
  id v3 = [self _tsaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"i"];

  return [v3 intValue];
}

- (unsigned)tsaxUnsignedIntValueForKey:(id)a3
{
  id v3 = -[NSObject _tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(), "i", "I", 0);

  return [v3 unsignedIntValue];
}

- (int64_t)tsaxIntegerValueForKey:(id)a3
{
  id v3 = -[NSObject _tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(), "q", 0);

  return (int64_t)[v3 integerValue];
}

- (unint64_t)tsaxUnsignedIntegerValueForKey:(id)a3
{
  id v3 = -[NSObject _tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_tsaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(), "Q", "q", "Q", 0);

  return (unint64_t)[v3 unsignedIntegerValue];
}

- (float)tsaxFloatValueForKey:(id)a3
{
  id v3 = [self _tsaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"f"];

  [v3 floatValue];
  return result;
}

- (double)tsaxDoubleValueForKey:(id)a3
{
  id v3 = [self _tsaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"d"];

  [v3 doubleValue];
  return result;
}

- (_NSRange)tsaxRangeValueForKey:(id)a3
{
  id v3 = [self _tsaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"{_NSRange=QQ}"];

  id v4 = [v3 rangeValue];
  result.length = v5;
  result.location = (NSUInteger)v4;
  return result;
}

- (CGPoint)tsaxCGPointValueForKey:(id)a3
{
  id v3 = [self _tsaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGPoint=dd}"];

  [v3 CGPointValue];
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGSize)tsaxCGSizeValueForKey:(id)a3
{
  id v3 = [self _tsaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGSize=dd}"];

  [v3 CGSizeValue];
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)tsaxCGRectValueForKey:(id)a3
{
  id v3 = [self _tsaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  [v3 CGRectValue];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGAffineTransform)tsaxCGAffineTransformValueForKey:(SEL)a3
{
  CGRect result = [self _tsaxValidatedValueForKey:a4 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGAffineTransform=dddddd}"];
  if (result)
  {
    return (CGAffineTransform *)[(CGAffineTransform *)result CGAffineTransformValue];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (void)tsaxStructValue:(void *)a3 forKey:(id)a4 ofExpectedType:(const char *)a5 fallbackValue:(const void *)a6
{
  id v9 = [self _tsaxValidatedValueForKey:a4 expectedClass:objc_opt_class() expectedTypeEncoding:a5];
  if (v9)
  {
    [v9 getValue:a3];
  }
  else
  {
    NSUInteger sizep = 0;
    NSGetSizeAndAlignment(a5, &sizep, 0);
    memmove(a3, a6, sizep);
  }
}

- (BOOL)tsaxRespondsToSelector:(SEL)a3 fromOptionalExtrasProtocol:(id)a4
{
  return [self _tsaxRespondsToSelector:a3 fromExtrasProtocol:a4 skipAssertions:1];
}

- (BOOL)tsaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4
{
  return [self _tsaxRespondsToSelector:a3 fromExtrasProtocol:a4 skipAssertions:0];
}

- (double)tsaxScreenScale
{
  return 1.0;
}

- (BOOL)_tsaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4 skipAssertions:(BOOL)a5
{
  if (!a5)
  {
    int ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
    if (!a3)
    {
      if (ShouldPerformValidationChecks)
      {
        int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Selector can't be null.", v14, v15, v16, v17, v18, v45))goto LABEL_26; {
      }
        }
    }
    int v19 = TSAccessibilityShouldPerformValidationChecks();
    if (!a4)
    {
      if (v19)
      {
        int v20 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        int v26 = __TSAccessibilityHandleValidationErrorWithDescription(v20, 0, @"Protocol can't be null.", v21, v22, v23, v24, v25, v45);
        goto LABEL_13;
      }
    }
  }
  LOBYTE(v9) = 0;
  if (!a3 || !a4) {
    return v9 & 1;
  }
  SEL name = protocol_getMethodDescription((Protocol *)a4, a3, 1, 1).name;
  unsigned int v11 = [self conformsToProtocol:a4];
  unsigned int v9 = v11;
  if (a5)
  {
    if (v11) {
      LOBYTE(v9) = objc_opt_respondsToSelector();
    }
    return v9 & 1;
  }
  int v27 = TSAccessibilityShouldPerformValidationChecks() ^ 1;
  if (!name) {
    int v27 = 1;
  }
  if (((v27 | v9) & 1) == 0)
  {
    int v28 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    uint64_t v29 = (objc_class *)objc_opt_class();
    uint64_t v30 = NSStringFromClass(v29);
    NSStringFromProtocol((Protocol *)a4);
    if (__TSAccessibilityHandleValidationErrorWithDescription(v28, 0, @"<%@: %p> doesn't conform to the protocol: %@", v31, v32, v33, v34, v35, (uint64_t)v30))LABEL_26:abort(); {
  }
    }
  if ((v9 & 1) == 0)
  {
    LOBYTE(v9) = 0;
    return v9 & 1;
  }
  LOBYTE(v9) = objc_opt_respondsToSelector();
  if (TSAccessibilityShouldPerformValidationChecks() && name && (v9 & 1) == 0)
  {
    int v36 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    NSStringFromSelector(a3);
    int v26 = __TSAccessibilityHandleValidationErrorWithDescription(v36, 0, @"<%@: %p> doesn't respond to the following abstract method: %@", v39, v40, v41, v42, v43, (uint64_t)v38);
LABEL_13:
    LOBYTE(v9) = 0;
    if (!v26) {
      return v9 & 1;
    }
    goto LABEL_26;
  }
  return v9 & 1;
}

- (NSMutableArray)_tsaxChildrenCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_573A20);
}

- (void)_tsaxSetChildrenCache:(id)a3
{
}

- (BOOL)_tsaxIsBuildingChildrenCache
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A21);
}

- (void)_tsaxSetBuildingChildrenCache:(BOOL)a3
{
}

- (BOOL)_tsaxIsInvalidatingChildrenCache
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A22);
}

- (void)_tsaxSetInvalidatingChildrenCache:(BOOL)a3
{
}

- (TSAccessibilityTimer)_tsaxChildInvalidationTimer
{
  return (TSAccessibilityTimer *)__TSAccessibilityGetAssociatedObject(self, &unk_573A23);
}

- (void)_tsaxSetChildInvalidationTimer:(id)a3
{
}

- (NSMutableArray)_tsaxChildInvalidationCompletionBlocks
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_573A24);
}

- (void)_tsaxSetChildInvalidationCompletionBlocks:(id)a3
{
}

- (void)tsaxAccessibilityUnregister
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_275BFC;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (UIView)tsaxAncestorView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return (UIView *)self;
  }
  uint64_t v4 = objc_opt_class();

  return (UIView *)[self tsaxAncestorOfType:v4];
}

- (id)tsaxAncestorOfType:(Class)a3
{
  for (id i = [self tsaxValueForKey:@"accessibilityContainer"];
        i;
        id i = [i tsaxValueForKey:@"accessibilityContainer"])
  {
    if (objc_opt_isKindOfClass()) {
      break;
    }
  }
  return i;
}

- (id)tsaxViewAncestorOfType:(Class)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  do
    self = [self superview];
  while (self && (objc_opt_isKindOfClass() & 1) == 0);
  return self;
}

- (BOOL)tsaxIsDescendantOfElement:(id)a3
{
  BOOL v7 = self != 0;
  if (self != a3 && self)
  {
    uint64_t v11 = v4;
    uint64_t v12 = v3;
    uint64_t v13 = v5;
    uint64_t v14 = v6;
    do
    {
      self = [self tsaxValueForKey:@"accessibilityContainer", v11, v12, v13, v14];
      BOOL v7 = self != 0;
    }
    while (self != a3 && self != 0);
  }
  return v7;
}

- (id)tsaxFindDescendantPassingTest:(id)a3
{
  uint64_t v5 = objc_opt_new();
  [v5 addObject:self];
  while ([v5 count])
  {
    id v6 = [v5 lastObject];
    [v5 removeLastObject];
    BOOL v7 = v6;
    if (((*((uint64_t (**)(id, id))a3 + 2))(a3, v6) & 1) == 0)
    {
      id v8 = (char *)[v6 accessibilityElementCount];
      if ((unint64_t)(v8 - 1) > 0x7FFFFFFFFFFFFFFDLL)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v6 subviews];
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_275F34;
          v13[3] = &unk_457910;
          v13[4] = v5;
          [v11 enumerateObjectsWithOptions:2 usingBlock:v13];
        }
      }
      else
      {
        unint64_t v9 = (unint64_t)(v8 + 1);
        do
        {
          id v10 = [v6 accessibilityElementAtIndex:v9 - 2];
          if (v10) {
            [v5 addObject:v10];
          }
          --v9;
        }
        while (v9 > 1);
      }
      BOOL v7 = 0;
    }

    if (v7) {
      goto LABEL_16;
    }
  }
  BOOL v7 = 0;
LABEL_16:

  return v7;
}

- (id)tsaxChildren
{
  if (![self conformsToProtocol:&OBJC_PROTOCOL___TSAccessibilityContainer])return 0; {
  uint64_t v3 = [self _tsaxChildrenCache];
  }
  if (v3) {
    return v3;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![self tsaxIsReadyToLoadChildren])
  {
    return 0;
  }
  BOOL v4 = [self _tsaxIsBuildingChildrenCache];
  [self _tsaxSetBuildingChildrenCache:1];
  uint64_t v3 = (NSMutableArray *)objc_opt_new();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![self tsaxShouldCacheChildren])
  {
    int v5 = 0;
  }
  else
  {
    [self _tsaxSetChildrenCache:v3];
    int v5 = 1;
  }
  [self tsaxLoadChildrenIntoCollection:v3];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [self tsaxShouldSortChildrenUsingStandardAlgorithm])
  {
    [(NSMutableArray *)v3 sortUsingSelector:NSSelectorFromString(@"accessibilityCompareGeometry:")];
  }
  if (v5) {

  }
  else {
    BOOL v7 = v3;
  }
  [self _tsaxSetBuildingChildrenCache:v4];
  return v3;
}

- (void)tsaxInvalidateChildrenEventuallyWithCompletion:(id)a3
{
  if (![self _tsaxChildInvalidationTimer])
  {
    int v5 = [[TSAccessibilityTimer alloc] initWithTargetSerialQueue:&_dispatch_main_q];
    [(TSAccessibilityTimer *)v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [self _tsaxSetChildInvalidationTimer:v5];
  }
  if (![self _tsaxChildInvalidationCompletionBlocks])
  {
    BOOL v7 = objc_opt_new();
    [self _tsaxSetChildInvalidationCompletionBlocks:v7];

    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (a3)
  {
LABEL_5:
    id v6 = [a3 copy];
    [(NSMutableArray *)[self _tsaxChildInvalidationCompletionBlocks] addObject:v6];
  }
LABEL_6:
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2761C0;
  v8[3] = &unk_456DE0;
  v8[4] = self;
  [(TSAccessibilityTimer *)[self _tsaxChildInvalidationTimer] afterDelay:v8 processBlock:0.25];
}

- (void)tsaxInvalidateChildrenEventually
{
}

- (void)tsaxInvalidateChildrenImmediately
{
  if (![self _tsaxIsInvalidatingChildrenCache])
  {
    [self _tsaxSetInvalidatingChildrenCache:1];
    unsigned int v3 = [self conformsToProtocol:&OBJC_PROTOCOL___TSAccessibilityContainer];
    if (v3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ![self tsaxShouldCacheChildren])
      {
        BOOL v4 = [self tsaxChildren];
      }
      else
      {
        BOOL v4 = [self _tsaxChildrenCache];
      }
    }
    else
    {
      BOOL v4 = [self _tsaxElementAccessibilityChildren:self];
    }
    int v5 = v4;
    if (v4)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          for (id i = 0; i != v7; id i = (char *)i + 1)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
            if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
              [self tsaxChildWillBeRemoved:v10];
            }
            [v10 tsaxInvalidateChildrenImmediately];
          }
          id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
      if (v3)
      {
        [self _tsaxSetChildrenCache:0];
        if (objc_opt_respondsToSelector()) {
          [self tsaxDidInvalidateChildren];
        }
      }
    }
    [self _tsaxSetInvalidatingChildrenCache:0];
  }
}

- (id)_tsaxElementAccessibilityChildren:(id)a3
{
  if ([a3 isAccessibilityElement]) {
    return 0;
  }
  if ([a3 tsaxBoolValueForKey:@"_accessibilityHasOrderedChildren"])
  {
    char v8 = 0;
    int v5 = (objc_class *)objc_opt_class();
    id result = (id)__TSAccessibilityCastAsClass(v5, (uint64_t)[a3 tsaxValueForKey:@"accessibilityElements"], 1, &v8);
    if (!v8) {
      return result;
    }
LABEL_8:
    abort();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  char v7 = 0;
  id v6 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v6, (uint64_t)[a3 tsaxValueForKey:@"_accessibilitySubviews"], 1, &v7);
  if (v7) {
    goto LABEL_8;
  }
  return result;
}

- (void)tsaxHandleTextOperationAction:(id)a3 usingBlock:(id)a4
{
  if (a4)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    if (v7 <= *(double *)&qword_573A28 + 0.2)
    {
      uint64_t v16 = (void (*)(id))*((void *)a4 + 2);
      v16(a4);
    }
    else
    {
      qword_573A28 = *(void *)&v7;
      (*((void (**)(id))a4 + 2))(a4);
      char v8 = [+[UIPasteboard generalPasteboard] string];
      if ([(NSMutableString *)v8 length])
      {
        if ([a3 length])
        {
          UIKitLocalizedString = TSAccessibilityGetUIKitLocalizedString((uint64_t)a3);
          char v8 = __TSAccessibilityStringForVariables(1, v8, v10, v11, v12, v13, v14, v15, (uint64_t)UIKitLocalizedString);
        }
        TSAccessibilityPostHighPriorityAnnouncementNotification((uint64_t)self, (uint64_t)v8);
      }
    }
  }
}

- (CGRect)boundsOfLineFragmentAtIndex:(unint64_t)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (_NSRange)rangeOfLineFragmentAtIndex:(unint64_t)a3
{
  NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v4 = 0x7FFFFFFFFFFFFFFFLL;
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)rectsForSelection:(id)a3
{
  return 0;
}

- (id)substringWithRange:(_NSRange)a3
{
  return 0;
}

- (id)valueForProperty:(int)a3 atCharIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  return 0;
}

- (__CTFont)createFontAtCharIndex:(unint64_t)a3 scaleTextPercent:(unint64_t)a4 effectiveRange:(_NSRange *)a5 styleProvider:(id)a6
{
  return 0;
}

- (id)columnForCharIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3
{
  return 0;
}

- (unint64_t)lineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4
{
  return 0;
}

- (id)stringEquivalentFromRange:(_NSRange)a3
{
  return 0;
}

- (_NSRange)paragraphIndexRangeForCharRange:(_NSRange)a3
{
  NSUInteger v3 = NSInvalidRange[0];
  NSUInteger v4 = NSInvalidRange[1];
  result.length = v4;
  result.location = v3;
  return result;
}

- (BOOL)thaxUsesChildrenFramesForSorting
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A6A);
}

- (void)thaxSetUsesChildrenFramesForSorting:(BOOL)a3
{
}

- (id)thaxDocumentViewController
{
  return 0;
}

- (id)thaxPageController
{
  return 0;
}

@end
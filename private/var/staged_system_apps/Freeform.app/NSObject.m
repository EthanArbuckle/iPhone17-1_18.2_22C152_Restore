@interface NSObject
+ (BOOL)crl_object:(id)a3 isEqualToObject:(id)a4;
+ (BOOL)crl_overridesClassSelector:(SEL)a3 ofBaseClass:(Class)a4;
+ (BOOL)crl_overridesSelector:(SEL)a3 ofBaseClass:(Class)a4;
- (BOOL)_crlaxIsBuildingChildrenCache;
- (BOOL)_crlaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4 skipAssertions:(BOOL)a5;
- (BOOL)crlaxBoolValueForKey:(id)a3;
- (BOOL)crlaxIsDescendantOfElement:(id)a3;
- (BOOL)crlaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4;
- (BOOL)crlaxRespondsToSelector:(SEL)a3 fromOptionalExtrasProtocol:(id)a4;
- (CGAffineTransform)crlaxCGAffineTransformValueForKey:(SEL)a3;
- (CGPoint)crlaxCGPointValueForKey:(id)a3;
- (CGRect)crlaxCGRectValueForKey:(id)a3;
- (CGSize)crlaxCGSizeValueForKey:(id)a3;
- (NSMutableArray)_crlaxChildrenCache;
- (UIView)crlaxAncestorView;
- (_NSRange)crlaxRangeValueForKey:(id)a3;
- (double)crlaxCGFloatValueForKey:(id)a3;
- (double)crlaxDoubleValueForKey:(id)a3;
- (double)crlaxScreenScale;
- (double)crlaxTimeIntervalValueForKey:(id)a3;
- (float)crlaxFloatValueForKey:(id)a3;
- (id)_crlaxElementAccessibilityChildren;
- (id)_crlaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5;
- (id)_crlaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5;
- (id)crl_addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (id)crlaxAncestorOfType:(Class)a3;
- (id)crlaxChildren;
- (id)crlaxFindDescendantPassingTest:(id)a3;
- (id)crlaxValueForKey:(id)a3;
- (id)crlaxViewAncestorOfType:(Class)a3;
- (int)crlaxIntValueForKey:(id)a3;
- (int64_t)crlaxIntegerValueForKey:(id)a3;
- (unint64_t)crlaxUnsignedIntegerValueForKey:(id)a3;
- (unsigned)crlaxUnsignedIntValueForKey:(id)a3;
- (void)_crlaxSetBuildingChildrenCache:(BOOL)a3;
- (void)_crlaxSetChildrenCache:(id)a3;
- (void)crl_performSelector:(SEL)a3 withValue:(id)a4;
- (void)crl_removeObserverForToken:(id)a3;
- (void)crl_runBlock;
- (void)crlaxAccessibilityUnregister;
- (void)crlaxEnsureChildrenAreLoaded;
- (void)crlaxHandleTextOperationAction:(id)a3 usingBlock:(id)a4;
- (void)crlaxInvalidateChildren;
- (void)crlaxIvarForKey:(id)a3;
- (void)crlaxSetIsSpeakThisElement:(BOOL)a3;
- (void)crlaxStructValue:(void *)a3 forKey:(id)a4 ofExpectedType:(const char *)a5 fallbackValue:(const void *)a6;
@end

@implementation NSObject

- (void)crl_runBlock
{
  v2 = objc_retainBlock(self);
  ((void (*)(void))v2[2].isa)();
}

- (id)_crlaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5
{
  return -[NSObject _crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, a4, a5, 0);
}

- (id)_crlaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5
{
  id v8 = -[NSObject crlaxValueForKey:](self, "crlaxValueForKey:");
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (qword_1016A90D8 != -1) {
        dispatch_once(&qword_1016A90D8, &stru_1014D7238);
      }
      if (!byte_1016A90D0) {
        return 0;
      }
      if (qword_1016A90F8 != -1) {
        dispatch_once(&qword_1016A90F8, &stru_1014D7278);
      }
      int v12 = byte_1016A90F0;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      NSStringFromClass(a4);
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      if (!__CRLAccessibilityHandleValidationErrorWithDescription(v12, 0, @"Value for key %@ on object <%@: %p> is not an %@; class: %@; value: %@",
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
        if (qword_1016A90D8 != -1) {
          dispatch_once(&qword_1016A90D8, &stru_1014D7238);
        }
        if (!byte_1016A90D0) {
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
          if (qword_1016A90D8 != -1) {
            dispatch_once(&qword_1016A90D8, &stru_1014D7238);
          }
        }
        else
        {
          id v21 = 0;
        }
        if (!byte_1016A90D0) {
          goto LABEL_32;
        }
        if (qword_1016A90F8 != -1) {
          dispatch_once(&qword_1016A90F8, &stru_1014D7278);
        }
        int v24 = byte_1016A90F0;
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        if (!__CRLAccessibilityHandleValidationErrorWithDescription(v24, 0, @"Value for key %@ on object <%@: %p> doesn't encapsulate the right type; value: %@; actual type encoding: \"%s\"; %s: \"%s\".",
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

- (id)crlaxValueForKey:(id)a3
{
  return -[NSObject valueForKey:](self, "valueForKey:");
}

- (BOOL)crlaxBoolValueForKey:(id)a3
{
  id v3 = -[NSObject _crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(), "i", "c", "B", 0);

  return [v3 BOOLValue];
}

- (int)crlaxIntValueForKey:(id)a3
{
  id v3 = [self _crlaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"i"];

  return [v3 intValue];
}

- (unsigned)crlaxUnsignedIntValueForKey:(id)a3
{
  id v3 = -[NSObject _crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(), "i", "I", 0);

  return [v3 unsignedIntValue];
}

- (int64_t)crlaxIntegerValueForKey:(id)a3
{
  id v3 = -[NSObject _crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(), "q", 0);

  return (int64_t)[v3 integerValue];
}

- (unint64_t)crlaxUnsignedIntegerValueForKey:(id)a3
{
  id v3 = -[NSObject _crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_crlaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, objc_opt_class(), "Q", "q", "Q", 0);

  return (unint64_t)[v3 unsignedIntegerValue];
}

- (float)crlaxFloatValueForKey:(id)a3
{
  id v3 = [self _crlaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"f"];

  [v3 floatValue];
  return result;
}

- (double)crlaxDoubleValueForKey:(id)a3
{
  id v3 = [self _crlaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"d"];

  [v3 doubleValue];
  return result;
}

- (double)crlaxTimeIntervalValueForKey:(id)a3
{
  [self crlaxDoubleValueForKey:a3];
  return result;
}

- (_NSRange)crlaxRangeValueForKey:(id)a3
{
  id v3 = [self _crlaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"{_NSRange=QQ}"];

  id v4 = [v3 rangeValue];
  result.length = v5;
  result.location = (NSUInteger)v4;
  return result;
}

- (double)crlaxCGFloatValueForKey:(id)a3
{
  [self crlaxDoubleValueForKey:a3];
  return result;
}

- (CGPoint)crlaxCGPointValueForKey:(id)a3
{
  id v3 = [self _crlaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGPoint=dd}"];

  [v3 CGPointValue];
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGSize)crlaxCGSizeValueForKey:(id)a3
{
  id v3 = [self _crlaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGSize=dd}"];

  _[v3 CGSizeValue];
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)crlaxCGRectValueForKey:(id)a3
{
  id v3 = [self _crlaxValidatedValueForKey:a3 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  [v3 CGRectValue];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGAffineTransform)crlaxCGAffineTransformValueForKey:(SEL)a3
{
  CGRect result = [self _crlaxValidatedValueForKey:a4 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGAffineTransform=dddddd}"];
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

- (void)crlaxStructValue:(void *)a3 forKey:(id)a4 ofExpectedType:(const char *)a5 fallbackValue:(const void *)a6
{
  id v9 = [self _crlaxValidatedValueForKey:a4 expectedClass:objc_opt_class() expectedTypeEncoding:a5];
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

- (void)crlaxIvarForKey:(id)a3
{
  return (void *)__CRLAccessibilitySafeIvarForKey(self, a3, 0);
}

- (NSMutableArray)_crlaxChildrenCache
{
  return (NSMutableArray *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A9318);
}

- (void)_crlaxSetChildrenCache:(id)a3
{
}

- (BOOL)_crlaxIsBuildingChildrenCache
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9319);
}

- (void)_crlaxSetBuildingChildrenCache:(BOOL)a3
{
}

- (void)crlaxAccessibilityUnregister
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100200E58;
  v2[3] = &unk_1014CBBB0;
  v2[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (UIView)crlaxAncestorView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = self;
  }
  else
  {
    id v3 = [self crlaxAncestorOfType:objc_opt_class()];
  }

  return (UIView *)v3;
}

- (id)crlaxAncestorOfType:(Class)a3
{
  uint64_t v3 = [self crlaxValueForKey:@"accessibilityContainer"];
  if (v3)
  {
    double v4 = (void *)v3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [v4 crlaxValueForKey:@"accessibilityContainer"];

      double v4 = (void *)v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
    id v6 = v4;
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }

  return v6;
}

- (id)crlaxViewAncestorOfType:(Class)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [self superview];
    if (v4)
    {
      do
      {
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v5 = [v4 superview];

        double v4 = (void *)v5;
      }
      while (v5);
    }
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (BOOL)crlaxIsDescendantOfElement:(id)a3
{
  double v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    id v6 = v5;
    BOOL v7 = v5 != 0;
    if (v5 != v4 && v5)
    {
      do
      {
        id v8 = v6;
        id v6 = [v6 crlaxValueForKey:@"accessibilityContainer"];

        BOOL v7 = v6 != 0;
      }
      while (v6 != v4 && v6 != 0);
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)crlaxFindDescendantPassingTest:(id)a3
{
  double v4 = (unsigned int (**)(id, void *))a3;
  uint64_t v5 = objc_opt_new();
  [v5 addObject:self];
  while ([v5 count])
  {
    id v6 = [v5 lastObject];
    [v5 removeLastObject];
    if (v4[2](v4, v6))
    {
      id v7 = v6;
    }
    else
    {
      id v8 = (char *)[v6 accessibilityElementCount];
      if ((unint64_t)(v8 - 1) > 0x7FFFFFFFFFFFFFFDLL)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [v6 subviews];
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_100201280;
          v13[3] = &unk_1014E1FB0;
          id v14 = v5;
          [v11 enumerateObjectsWithOptions:2 usingBlock:v13];
        }
      }
      else
      {
        unint64_t v9 = (unint64_t)(v8 + 1);
        do
        {
          char v10 = [v6 accessibilityElementAtIndex:v9 - 2];
          if (v10) {
            [v5 addObject:v10];
          }

          --v9;
        }
        while (v9 > 1);
      }
      id v7 = 0;
    }

    if (v7) {
      goto LABEL_17;
    }
  }
  id v7 = 0;
LABEL_17:

  return v7;
}

- (id)crlaxChildren
{
  if ([self _crlaxIsBuildingChildrenCache])
  {
    id v3 = 0;
  }
  else
  {
    [self _crlaxSetBuildingChildrenCache:1];
    if ([self conformsToProtocol:&OBJC_PROTOCOL___CRLAccessibilityContainer])
    {
      double v4 = [self _crlaxChildrenCache];
      id v5 = [v4 copy];

      if (!v5)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ![self crlaxIsReadyToLoadChildren])
        {
          id v5 = 0;
        }
        else
        {
          id v5 = (id)objc_opt_new();
          if (objc_opt_respondsToSelector()) {
            unsigned int v11 = [self crlaxShouldCacheChildren];
          }
          else {
            unsigned int v11 = 1;
          }
          [self crlaxLoadChildrenIntoCollection:v5];
          if ((objc_opt_respondsToSelector() & 1) != 0
            && [self crlaxShouldSortChildrenUsingStandardAlgorithm])
          {
            [v5 sortUsingSelector:NSSelectorFromString(@"accessibilityCompareGeometry:")];
          }
          if (v11) {
            [self _crlaxSetChildrenCache:v5];
          }
        }
      }
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v3 = v5;
      id v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v3);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) setAccessibilityContainer:self v13];
          }
          id v7 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
    else
    {
      id v3 = 0;
    }
    -[NSObject _crlaxSetBuildingChildrenCache:](self, "_crlaxSetBuildingChildrenCache:", 0, (void)v13);
  }

  return v3;
}

- (void)crlaxEnsureChildrenAreLoaded
{
  id v2 = [self crlaxChildren];
}

- (void)crlaxInvalidateChildren
{
  unsigned int v3 = [self conformsToProtocol:&OBJC_PROTOCOL___CRLAccessibilityContainer];
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([self crlaxShouldCacheChildren] & 1) == 0)
    {
      double v4 = [self crlaxChildren];
    }
    else
    {
      double v4 = [self _crlaxChildrenCache];
    }
  }
  else
  {
    double v4 = [self _crlaxElementAccessibilityChildren];
  }
  id v5 = v4;
  id v6 = [v4 copy];

  if (v6)
  {
    int v7 = objc_opt_respondsToSelector();
    char v22 = 0;
    uint64_t v8 = self;
    uint64_t v9 = __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___CRLAccessibilityContainer, v8, 1, &v22);
    if (v22) {
      abort();
    }
    char v10 = (void *)v9;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      int v15 = v3 & v7;
      do
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (v15) {
            [v10 crlaxChildWillBeRemoved:*(void *)(*((void *)&v18 + 1) + 8 * i) v18];
          }
          [v17 crlaxInvalidateChildren:v18];
        }
        id v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v13);
    }

    if (v3)
    {
      [v8 _crlaxSetChildrenCache:0];
      if (objc_opt_respondsToSelector()) {
        [v10 crlaxDidInvalidateChildren];
      }
    }
  }
}

- (id)_crlaxElementAccessibilityChildren
{
  if ([self isAccessibilityElement]) {
    goto LABEL_2;
  }
  if ([self crlaxBoolValueForKey:@"_accessibilityHasOrderedChildren"])
  {
    char v10 = 0;
    double v4 = [self crlaxValueForKey:@"accessibilityElements"];
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v10);
    if (!v10) {
      goto LABEL_5;
    }
LABEL_11:
    abort();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_2:
    unsigned int v3 = 0;
    goto LABEL_6;
  }
  char v9 = 0;
  double v4 = [self crlaxValueForKey:@"_accessibilitySubviews"];
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v4, 1, &v9);
  if (v9) {
    goto LABEL_11;
  }
LABEL_5:
  unsigned int v3 = (void *)v6;

LABEL_6:

  return v3;
}

- (void)crlaxHandleTextOperationAction:(id)a3 usingBlock:(id)a4
{
  id v19 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if (v6)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    if (v7 <= *(double *)&qword_1016A9320 + 0.2)
    {
      v6[2](v6);
    }
    else
    {
      qword_1016A9320 = *(void *)&v7;
      v6[2](v6);
      uint64_t v8 = +[UIPasteboard generalPasteboard];
      char v9 = [v8 string];

      if ([v9 length])
      {
        id v10 = v9;
        if ([v19 length])
        {
          id v11 = CRLAccessibilityGetUIKitLocalizedString((uint64_t)v19);
          uint64_t v18 = __CRLAccessibilityStringForVariables(1, v10, v12, v13, v14, v15, v16, v17, (uint64_t)v11);

          id v10 = (id)v18;
        }
        CRLAccessibilityPostHighPriorityAnnouncementNotification(self, v10);
      }
    }
  }
}

- (void)crlaxSetIsSpeakThisElement:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002019BC;
  v3[3] = &unk_1014CD3B8;
  v3[4] = self;
  BOOL v4 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

+ (BOOL)crl_overridesSelector:(SEL)a3 ofBaseClass:(Class)a4
{
  Method InstanceMethod = class_getInstanceMethod((Class)a1, a3);
  return InstanceMethod != class_getInstanceMethod(a4, a3);
}

+ (BOOL)crl_overridesClassSelector:(SEL)a3 ofBaseClass:(Class)a4
{
  Method ClassMethod = class_getClassMethod((Class)a1, a3);
  return ClassMethod != class_getClassMethod(a4, a3);
}

- (void)crl_performSelector:(SEL)a3 withValue:(id)a4
{
  id v6 = a4;
  double v7 = [self methodSignatureForSelector:a3];
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 numberOfArguments] == (id)3)
    {
      id v9 = v8;
      id v10 = (const char *)[v9 getArgumentTypeAtIndex:2];
      while (2)
      {
        switch(*v10)
        {
          case '@':
            goto LABEL_8;
          case 'A':
          case 'D':
          case 'E':
          case 'F':
          case 'G':
          case 'H':
          case 'J':
          case 'K':
          case 'M':
          case 'P':
          case 'T':
          case 'U':
          case 'W':
          case 'X':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
          case ']':
          case '_':
          case 'a':
          case 'b':
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'p':
            goto LABEL_9;
          case 'B':
            id v16 = [v6 BOOLValue];
            goto LABEL_27;
          case 'C':
            id v16 = [v6 unsignedCharValue];
            goto LABEL_27;
          case 'I':
            id v16 = [v6 unsignedIntValue];
            goto LABEL_27;
          case 'L':
            id v16 = [v6 unsignedLongValue];
            goto LABEL_27;
          case 'N':
          case 'O':
          case 'R':
          case 'V':
          case 'n':
          case 'o':
          case 'r':
            ++v10;
            continue;
          case 'Q':
            id v16 = [v6 unsignedLongLongValue];
            goto LABEL_27;
          case 'S':
            id v16 = [v6 unsignedShortValue];
            goto LABEL_27;
          case '^':
            id v16 = [v6 pointerValue];
            goto LABEL_27;
          case 'c':
            id v16 = [v6 charValue];
            goto LABEL_27;
          case 'd':
            [v6 doubleValue];
            [self a3];
            goto LABEL_28;
          case 'f':
            [v6 floatValue];
            [self a3];
            goto LABEL_28;
          case 'i':
            id v16 = [v6 intValue];
            goto LABEL_27;
          case 'l':
            id v16 = [v6 longValue];
            goto LABEL_27;
          case 'q':
            id v16 = [v6 longLongValue];
            goto LABEL_27;
          case 's':
            id v16 = [v6 shortValue];
LABEL_27:
            [self a3:v16];
            goto LABEL_28;
          default:
            if (*v10 == 35)
            {
LABEL_8:
              [self a3:v6];
              goto LABEL_28;
            }
LABEL_9:
            id v11 = v6;
            uint64_t v12 = (const char *)[v11 objCType];
            if (v12)
            {
              uint64_t v13 = v12;
              if (!strcmp(v10, v12))
              {
                uint64_t v14 = +[NSInvocation invocationWithMethodSignature:v9];
                [v14 setTarget:self];
                [v14 setSelector:a3];
                NSUInteger sizep = 0;
                NSGetSizeAndAlignment(v13, &sizep, 0);
                uint64_t v15 = malloc_type_malloc(sizep, 0xE0D26B8FuLL);
                [v11 getValue:v15];
                [v14 setArgument:v15 atIndex:2];
                [v14 invoke];
                free(v15);

                goto LABEL_28;
              }
            }
            NSExceptionName v17 = NSInvalidArgumentException;
            uint64_t v22 = objc_opt_class();
            id v19 = NSStringFromSelector(a3);
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[%@ %@] first argument type does not match type of %@.", v22, v19, v11);
            break;
        }
        break;
      }
    }
    else
    {
      NSExceptionName v17 = NSInvalidArgumentException;
      uint64_t v18 = objc_opt_class();
      id v19 = NSStringFromSelector(a3);
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[%@ %@] does not take one argument.", v18, v19, v23);
    long long v20 = };
    id v21 = +[NSException exceptionWithName:v17 reason:v20 userInfo:0];

    objc_exception_throw(v21);
  }
  [self doesNotRecognizeSelector:a3];
LABEL_28:
}

+ (BOOL)crl_object:(id)a3 isEqualToObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = v6;
  if (v5 == v6)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    if (v5)
    {
      id v6 = v5;
      uint64_t v8 = v7;
    }
    else
    {
      if (!v6)
      {
        unsigned __int8 v9 = 0;
        goto LABEL_8;
      }
      uint64_t v8 = 0;
    }
    unsigned __int8 v9 = [v6 isEqual:v8];
  }
LABEL_8:

  return v9;
}

- (id)crl_addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [[CRLKVOToken alloc] initWithObserver:v10 target:self keyPath:v11 context:a6];
  uint64_t v13 = objc_getAssociatedObject(self, off_10166CD90);
  if (!v13)
  {
    uint64_t v14 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v12, 0);
    objc_setAssociatedObject(self, off_10166CD90, v14, (void *)1);
LABEL_9:
    [self addObserver:v10 forKeyPath:v11 options:a5 context:a6];
    goto LABEL_10;
  }
  uint64_t v14 = v13;
  if (([v13 containsObject:v12] & 1) == 0)
  {
    [v14 addObject:v12];
    goto LABEL_9;
  }
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014E31B8);
  }
  uint64_t v15 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    id v18 = v10;
    __int16 v19 = 2112;
    long long v20 = self;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2048;
    int v24 = a6;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ is already observing %@ for key path %@ using context %p", buf, 0x2Au);
  }
LABEL_10:

  return v12;
}

- (void)crl_removeObserverForToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = sub_1002469D0(v5, v4);

  if (v6)
  {
    double v7 = [v6 target];

    if (v7 != self)
    {
      int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E31D8);
      }
      unsigned __int8 v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108D074((uint64_t)self, v8, v9);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E31F8);
      }
      id v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v10, v8);
      }
      id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSObject(CRLAdditions) crl_removeObserverForToken:]");
      uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSObject_CRLAdditions.m"];
      +[CRLAssertionHandler handleFailureInFunction:v11, v12, 203, 0, "Attempted to stop key-value observing on %@ using a token that it was not associated with", self file lineNumber isFatal description];
    }
    uint64_t v13 = objc_getAssociatedObject(self, off_10166CD90);
    if ([v13 containsObject:v6])
    {
      uint64_t v14 = [v6 target];
      uint64_t v15 = [v6 observer];
      id v16 = [v6 keyPath];
      [v14 removeObserver:v15 forKeyPath:v16 context:[v6 context]];

      [v13 removeObject:v6];
    }
  }
}

- (BOOL)crlaxRespondsToSelector:(SEL)a3 fromOptionalExtrasProtocol:(id)a4
{
  return [self _crlaxRespondsToSelector:a3 fromExtrasProtocol:a4 skipAssertions:1];
}

- (BOOL)crlaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4
{
  return [self _crlaxRespondsToSelector:a3 fromExtrasProtocol:a4 skipAssertions:0];
}

- (double)crlaxScreenScale
{
  return 1.0;
}

- (BOOL)_crlaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4 skipAssertions:(BOOL)a5
{
  int v8 = (Protocol *)a4;
  if (!a5)
  {
    int ShouldPerformValidationChecks = CRLAccessibilityShouldPerformValidationChecks();
    if (!a3)
    {
      if (ShouldPerformValidationChecks)
      {
        int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Selector can't be null.", v14, v15, v16, v17, v18, v46))goto LABEL_23; {
      }
        }
    }
    int v19 = CRLAccessibilityShouldPerformValidationChecks();
    if (!v8)
    {
      if (v19)
      {
        int v20 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        LOBYTE(v9) = 0;
        if (!__CRLAccessibilityHandleValidationErrorWithDescription(v20, 0, @"Protocol can't be null.", v21, v22, v23, v24, v25, v46))goto LABEL_25; {
        goto LABEL_23;
        }
      }
    }
  }
  LOBYTE(v9) = 0;
  if (!a3 || !v8) {
    goto LABEL_25;
  }
  SEL name = protocol_getMethodDescription(v8, a3, 1, 1).name;
  unsigned int v11 = [self conformsToProtocol:v8];
  unsigned int v9 = v11;
  if (a5)
  {
    if (v11) {
      LOBYTE(v9) = objc_opt_respondsToSelector();
    }
    goto LABEL_25;
  }
  int v26 = CRLAccessibilityShouldPerformValidationChecks() ^ 1;
  if (!name) {
    int v26 = 1;
  }
  if (((v26 | v9) & 1) == 0)
  {
    int v27 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    uint64_t v28 = (objc_class *)objc_opt_class();
    uint64_t v29 = NSStringFromClass(v28);
    v47 = NSStringFromProtocol(v8);
    int v35 = __CRLAccessibilityHandleValidationErrorWithDescription(v27, 0, @"<%@: %p> doesn't conform to the protocol: %@", v30, v31, v32, v33, v34, (uint64_t)v29);

    if (v35) {
      goto LABEL_23;
    }
  }
  if ((v9 & 1) == 0)
  {
    LOBYTE(v9) = 0;
    goto LABEL_25;
  }
  LOBYTE(v9) = objc_opt_respondsToSelector();
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (name)
    {
      if ((v9 & 1) == 0)
      {
        int v36 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        v48 = NSStringFromSelector(a3);
        int v44 = __CRLAccessibilityHandleValidationErrorWithDescription(v36, 0, @"<%@: %p> doesn't respond to the following abstract method: %@", v39, v40, v41, v42, v43, (uint64_t)v38);

        LOBYTE(v9) = 0;
        if (v44) {
LABEL_23:
        }
          abort();
      }
    }
  }
LABEL_25:

  return v9 & 1;
}

@end
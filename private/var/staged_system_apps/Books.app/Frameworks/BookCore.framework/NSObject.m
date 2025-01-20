@interface NSObject
- (BOOL)_imaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4 skipAssertions:(BOOL)a5;
- (BOOL)imaxBoolValueForKey:(id)a3;
- (BOOL)imaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4;
- (CGPoint)imaxCGPointValueForKey:(id)a3;
- (CGRect)imaxCGRectValueForKey:(id)a3;
- (CGSize)imaxCGSizeValueForKey:(id)a3;
- (NSString)imaxIdentification;
- (_NSRange)imaxRangeValueForKey:(id)a3;
- (double)imaxCGFloatValueForKey:(id)a3;
- (double)imaxDoubleValueForKey:(id)a3;
- (double)imaxScreenScale;
- (double)imaxTimeIntervalValueForKey:(id)a3;
- (float)imaxFloatValueForKey:(id)a3;
- (id)_accessibilityFindDescendant:(id)a3;
- (id)_imaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5;
- (id)_imaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5;
- (id)im_completeDescription;
- (id)im_propertiesDescription;
- (id)im_recursiveDescriptionChildrenBlock:(id)a3;
- (id)imaxAncestorIsKindOf:(Class)a3;
- (id)imaxDescendentOfType:(Class)a3;
- (id)imaxElementIsAncestor:(id)a3;
- (id)imaxFindAncestor:(id)a3;
- (id)imaxUnignoredDescendant;
- (id)imaxValueForKey:(id)a3;
- (int)imaxIntValueForKey:(id)a3;
- (int64_t)imaxIntegerValueForKey:(id)a3;
- (unint64_t)imaxUnsignedIntegerValueForKey:(id)a3;
- (unsigned)imaxUnsignedIntValueForKey:(id)a3;
- (void)imaxSetIdentification:(id)a3;
@end

@implementation NSObject

- (NSString)imaxIdentification
{
  return (NSString *)__IMAccessibilityGetAssociatedObject(self, &unk_345620);
}

- (void)imaxSetIdentification:(id)a3
{
}

- (id)imaxFindAncestor:(id)a3
{
  v4 = (uint64_t (**)(id, void *))a3;
  v5 = [self imaxValueForKey:@"accessibilityContainer"];
  if (v5)
  {
    do
    {
      if (v4[2](v4, v5)) {
        break;
      }
      uint64_t v6 = [v5 imaxValueForKey:@"accessibilityContainer"];

      v5 = (void *)v6;
    }
    while (v6);
  }

  return v5;
}

- (id)imaxElementIsAncestor:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_47DE4;
  v7[3] = &unk_2C55D0;
  id v8 = a3;
  id v4 = v8;
  v5 = [self imaxFindAncestor:v7];

  return v5;
}

- (id)imaxAncestorIsKindOf:(Class)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_47E74;
  v5[3] = &unk_2C55F0;
  v5[4] = a3;
  v3 = [self imaxFindAncestor:v5];

  return v3;
}

- (id)_accessibilityFindDescendant:(id)a3
{
  id v4 = (uint64_t (**)(id, void *))a3;
  id v5 = [objc_allocWithZone((Class)NSMutableArray) init];
  [v5 addObject:self];
  if ([v5 count])
  {
    while (1)
    {
      uint64_t v6 = [v5 lastObject];
      [v5 removeLastObject];
      if (v4[2](v4, v6)) {
        break;
      }
      v7 = (char *)[v6 accessibilityElementCount];
      if ((unint64_t)(v7 - 1) > 0x7FFFFFFFFFFFFFFDLL)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          v10 = [v6 subviews];
          v11 = [v10 reverseObjectEnumerator];
          v12 = [v11 allObjects];

          id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v19;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v19 != v15) {
                  objc_enumerationMutation(v12);
                }
                [v5 addObject:*(void *)(*((void *)&v18 + 1) + 8 * i)];
              }
              id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
            }
            while (v14);
          }
        }
      }
      else
      {
        unint64_t v8 = (unint64_t)(v7 + 1);
        do
        {
          v9 = [v6 accessibilityElementAtIndex:v8 - 2];
          if (v9) {
            [v5 addObject:v9];
          }

          --v8;
        }
        while (v8 > 1);
      }

      if (![v5 count]) {
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)imaxDescendentOfType:(Class)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4814C;
  v5[3] = &unk_2C55F0;
  v5[4] = a3;
  v3 = [self _accessibilityFindDescendant:v5];

  return v3;
}

- (id)imaxUnignoredDescendant
{
  return [self _accessibilityFindDescendant:&stru_2C5630];
}

- (id)im_propertiesDescription
{
  unsigned int outCount = 0;
  v2 = (objc_class *)objc_opt_class();
  long long v18 = class_copyPropertyList(v2, &outCount);
  if (v18)
  {
    if (outCount)
    {
      unint64_t v3 = 0;
      id v4 = &stru_2CE418;
      while (1)
      {
        id v5 = +[NSString stringWithCString:property_getName(v18[v3]) encoding:1];
        uint64_t v6 = &stru_2CE418;
        if (![(NSString *)v5 isEqualToString:@"description"]
          && ![(NSString *)v5 isEqualToString:@"debugDescription"])
        {
          NSSelectorFromString(v5);
          uint64_t v6 = @"<not implemented>";
          if (objc_opt_respondsToSelector())
          {
            uint64_t v6 = [self valueForKey:v5];
          }
        }
        uint64_t v7 = objc_opt_class();
        v28[0] = objc_opt_class();
        v28[1] = objc_opt_class();
        v28[2] = objc_opt_class();
        unint64_t v8 = +[NSArray arrayWithObjects:v28 count:3];
        v27[0] = objc_opt_class();
        v27[1] = objc_opt_class();
        v27[2] = objc_opt_class();
        v27[3] = objc_opt_class();
        v9 = +[NSArray arrayWithObjects:v27 count:4];
        uint64_t v22 = 0;
        v23 = &v22;
        uint64_t v24 = 0x2020000000;
        int v25 = 0;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_79D88;
        v19[3] = &unk_2C67C8;
        long long v21 = &v22;
        v10 = v6;
        long long v20 = v10;
        v11 = objc_retainBlock(v19);
        v12 = (unsigned int (**)(void, void))v11;
        if (!v10) {
          *((_DWORD *)v23 + 6) = 1;
        }
        if (((unsigned int (*)(void *, void *))v11[2])(v11, v8))
        {
          *((_DWORD *)v23 + 6) = 1;
        }
        else
        {
          if (((unsigned int (**)(void, void *))v12)[2](v12, v9))
          {
            *((_DWORD *)v23 + 6) = 2;
LABEL_18:
            uint64_t v13 = [(__CFString *)v4 stringByAppendingFormat:@"\t%@ = <%@: %p> {%ld objects}", v5, v7, v10, [(__CFString *)v10 count]];
            goto LABEL_19;
          }
          int v14 = *((_DWORD *)v23 + 6);
          if (v14 == 2) {
            goto LABEL_18;
          }
          if (v14 != 1)
          {
            uint64_t v13 = [(__CFString *)v4 stringByAppendingFormat:@"\t%@ = <%@: %p>", v5, v7, v10];
            goto LABEL_19;
          }
        }
        uint64_t v13 = [(__CFString *)v4 stringByAppendingFormat:@"\t%@ = %@", v5, v10];
LABEL_19:
        uint64_t v15 = (__CFString *)v13;

        if (v3 >= outCount - 1)
        {
          id v4 = v15;
        }
        else
        {
          id v4 = [(__CFString *)v15 stringByAppendingString:@",\n"];
        }
        _Block_object_dispose(&v22, 8);

        if (++v3 >= outCount) {
          goto LABEL_26;
        }
      }
    }
    id v4 = &stru_2CE418;
LABEL_26:
    free(v18);
  }
  else
  {
    id v4 = &stru_2CE418;
  }

  return v4;
}

- (id)im_completeDescription
{
  unint64_t v3 = (objc_class *)[(id)objc_opt_class() superclass];
  InstanceMethod = class_getInstanceMethod(v3, "description");
  IMP Implementation = method_getImplementation(InstanceMethod);
  uint64_t v6 = ((void (*)(NSObject *, const char *))Implementation)(self, "description");
  uint64_t v7 = [self im_propertiesDescription];
  if ([v7 length])
  {
    uint64_t v8 = [v6 stringByAppendingFormat:@"{\n%@\n}", v7];

    uint64_t v6 = (void *)v8;
  }

  return v6;
}

- (id)im_recursiveDescriptionChildrenBlock:(id)a3
{
  id v4 = (void (**)(id, NSObject *))a3;
  id v5 = [self description];
  v33 = +[NSMutableString stringWithString:v5];

  uint64_t v6 = +[NSMutableString string];
  uint64_t v7 = v4[2](v4, self);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v13 = [v12 im_recursiveDescriptionChildrenBlock:v4];
        [v6 appendString:v13];

        int v14 = [v7 lastObject];

        if (v12 != v14) {
          [v6 appendString:@"\n"];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v9);
  }
  v32 = v7;
  v34 = v4;
  uint64_t v15 = +[NSCharacterSet newlineCharacterSet];
  v16 = [v6 componentsSeparatedByCharactersInSet:v15];

  v17 = +[NSMutableString string];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
        uint64_t v24 = +[NSCharacterSet whitespaceCharacterSet];
        int v25 = [v23 stringByTrimmingCharactersInSet:v24];
        id v26 = [v25 length];

        if (v26)
        {
          [v17 appendFormat:@"\t%@", v23];
          v27 = [v18 lastObject];

          if (v23 != v27) {
            [v17 appendString:@"\n"];
          }
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v20);
  }

  v28 = +[NSCharacterSet whitespaceCharacterSet];
  v29 = [v17 stringByTrimmingCharactersInSet:v28];
  id v30 = [v29 length];

  if (v30) {
    [v33 appendFormat:@"\n%@", v17];
  }

  return v33;
}

- (id)_imaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 expectedTypeEncoding:(const char *)a5
{
  return -[NSObject _imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", a3, a4, a5, 0);
}

- (id)_imaxValidatedValueForKey:(id)a3 expectedClass:(Class)a4 possibleExpectedTypeEncodings:(const char *)a5
{
  id v8 = a3;
  id v9 = [self imaxValueForKey:v8];
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (qword_349368 != -1) {
        dispatch_once(&qword_349368, &stru_2C9D48);
      }
      if (!byte_349360) {
        goto LABEL_17;
      }
      if (qword_349388 != -1) {
        dispatch_once(&qword_349388, &stru_2C9D88);
      }
      int v13 = byte_349380;
      int v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      v16 = NSStringFromClass(a4);
      v17 = (objc_class *)objc_opt_class();
      long long v38 = NSStringFromClass(v17);
      int v23 = __IMAccessibilityHandleValidationErrorWithDescription(v13, 0, @"Value for key %@ on object <%@: %p> is not an %@; class: %@; value: %@",
              v18,
              v19,
              v20,
              v21,
              v22,
              (uint64_t)v8);

      if (!v23) {
        goto LABEL_17;
      }
      goto LABEL_35;
    }
    if (a5)
    {
      id v9 = v9;
      uint64_t v10 = (const char *)[v9 objCType];
      if (strcmp(v10, a5))
      {
        char v11 = 0;
        long long v39 = (const char **)&v42;
        while (1)
        {
          v12 = v39++;
          if (!*v12) {
            break;
          }
          if ((v11 & 1) == 0) {
            char v11 = 1;
          }
          if (!strcmp(v10, *v12)) {
            goto LABEL_18;
          }
        }
        if (qword_349368 != -1) {
          dispatch_once(&qword_349368, &stru_2C9D48);
        }
        if (!byte_349360) {
          goto LABEL_17;
        }
        if (v11)
        {
          id v26 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%s" a5];
          long long v40 = &v43;
          for (uint64_t i = v42; i; uint64_t i = *v28)
          {
            [v26 appendFormat:@"\", \"%s", i];
            v28 = v40++;
          }
          id v25 = v26;
          [v25 UTF8String];
          if (qword_349368 != -1) {
            dispatch_once(&qword_349368, &stru_2C9D48);
          }
        }
        else
        {
          id v25 = 0;
        }
        if (!byte_349360) {
          goto LABEL_34;
        }
        if (qword_349388 != -1) {
          dispatch_once(&qword_349388, &stru_2C9D88);
        }
        int v29 = byte_349380;
        id v30 = (objc_class *)objc_opt_class();
        long long v37 = NSStringFromClass(v30);
        int v36 = __IMAccessibilityHandleValidationErrorWithDescription(v29, 0, @"Value for key %@ on object <%@: %p> doesn't encapsulate the right type; value: %@; actual type encoding: \"%s\"; %s: \"%s\".",
                v31,
                v32,
                v33,
                v34,
                v35,
                (uint64_t)v8);

        if (!v36)
        {
LABEL_34:

LABEL_17:
          id v9 = 0;
          goto LABEL_18;
        }
LABEL_35:
        abort();
      }
    }
  }
LABEL_18:

  return v9;
}

- (id)imaxValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [self valueForKey:v4];

  return v5;
}

- (BOOL)imaxBoolValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "i", "c", "B", 0);

  unsigned __int8 v6 = [v5 BOOLValue];
  return v6;
}

- (int)imaxIntValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [self _imaxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"i"];

  int v6 = [v5 intValue];
  return v6;
}

- (unsigned)imaxUnsignedIntValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "i", "I", 0);

  unsigned int v6 = [v5 unsignedIntValue];
  return v6;
}

- (int64_t)imaxIntegerValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "q", 0);

  id v6 = [v5 integerValue];
  return (int64_t)v6;
}

- (unint64_t)imaxUnsignedIntegerValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = -[NSObject _imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:](self, "_imaxValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", v4, objc_opt_class(), "Q", "q", "Q", 0);

  id v6 = [v5 unsignedIntegerValue];
  return (unint64_t)v6;
}

- (float)imaxFloatValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [self _imaxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"f"];

  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (double)imaxDoubleValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [self _imaxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"d"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (double)imaxTimeIntervalValueForKey:(id)a3
{
  [self imaxDoubleValueForKey:a3];
  return result;
}

- (_NSRange)imaxRangeValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [self _imaxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{_NSRange=QQ}"];

  id v6 = [v5 rangeValue];
  NSUInteger v8 = v7;

  NSUInteger v9 = (NSUInteger)v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (double)imaxCGFloatValueForKey:(id)a3
{
  [self imaxDoubleValueForKey:a3];
  return result;
}

- (CGPoint)imaxCGPointValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [self _imaxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGPoint=dd}"];

  [v5 CGPointValue];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGSize)imaxCGSizeValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [self _imaxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGSize=dd}"];

  [v5 CGSizeValue];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGRect)imaxCGRectValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [self _imaxValidatedValueForKey:v4 expectedClass:objc_opt_class() expectedTypeEncoding:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)imaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4
{
  return [self _imaxRespondsToSelector:a3 fromExtrasProtocol:a4 skipAssertions:0];
}

- (double)imaxScreenScale
{
  return 1.0;
}

- (BOOL)_imaxRespondsToSelector:(SEL)a3 fromExtrasProtocol:(id)a4 skipAssertions:(BOOL)a5
{
  double v8 = (Protocol *)a4;
  if (!a5)
  {
    int ShouldPerformValidationChecks = IMAccessibilityShouldPerformValidationChecks();
    if (!a3)
    {
      if (ShouldPerformValidationChecks)
      {
        int ShouldCrashOnValidationErrorAfterLaunch = IMAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__IMAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Selector can't be null.", v14, v15, v16, v17, v18, v46))goto LABEL_23; {
      }
        }
    }
    int v19 = IMAccessibilityShouldPerformValidationChecks();
    if (!v8)
    {
      if (v19)
      {
        int v20 = IMAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        LOBYTE(v9) = 0;
        if (!__IMAccessibilityHandleValidationErrorWithDescription(v20, 0, @"Protocol can't be null.", v21, v22, v23, v24, v25, v46))goto LABEL_25; {
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
  int v26 = IMAccessibilityShouldPerformValidationChecks() ^ 1;
  if (!name) {
    int v26 = 1;
  }
  if (((v26 | v9) & 1) == 0)
  {
    int v27 = IMAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v28 = (objc_class *)objc_opt_class();
    int v29 = NSStringFromClass(v28);
    v47 = NSStringFromProtocol(v8);
    int v35 = __IMAccessibilityHandleValidationErrorWithDescription(v27, 0, @"<%@: %p> doesn't conform to the protocol: %@", v30, v31, v32, v33, v34, (uint64_t)v29);

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
  if (IMAccessibilityShouldPerformValidationChecks())
  {
    if (name)
    {
      if ((v9 & 1) == 0)
      {
        int v36 = IMAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        long long v37 = (objc_class *)objc_opt_class();
        long long v38 = NSStringFromClass(v37);
        v48 = NSStringFromSelector(a3);
        int v44 = __IMAccessibilityHandleValidationErrorWithDescription(v36, 0, @"<%@: %p> doesn't respond to the following abstract method: %@", v39, v40, v41, v42, v43, (uint64_t)v38);

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
@interface UISegmentedControl
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (BOOL)__dbg_hasValidSelectedSegmentIndex;
- (BOOL)__dbg_isEnabledForSelectedSegment;
- (CGSize)__dbg_contentOffsetForSelectedSegment;
- (double)__dbg_widthForSelectedSegment;
- (id)__dbg_titleForSelectedSegment;
@end

@implementation UISegmentedControl

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"apportionsSegmentWidthsByContent");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v15[0] = Mutable;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"momentary");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v12, @"propertyFormat", @"b");
  v15[1] = v12;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"numberOfSegments");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"NSUInteger");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v11, @"propertyFormat", @"uinteger");
  v15[2] = v11;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"selectedSegmentIndex");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v2, @"propertyFormat", @"integer");
  v15[3] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"contentOffsetForInspectedSegment");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v3, @"propertyFormat", @"CGf, CGf");
  v15[4] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"imageForInspectedSegment");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v4, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v4, @"propertyOptions", v5);
  CFRelease(v5);
  v15[5] = v4;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"isEnabledForInspectedSegment");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v6, @"propertyFormat", @"b");
  v15[6] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"titleForInspectedSegment");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v7, @"propertyFormat", @"public.plain-text");
  v15[7] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"widthForInspectedSegment");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v8, @"propertyFormat", @"CGf");
  v15[8] = v8;
  v9 = +[NSArray arrayWithObjects:v15 count:9];

  return v9;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"contentOffsetForInspectedSegment"])
  {
    [v9 __dbg_contentOffsetForSelectedSegment];
    uint64_t valuePtr = v10;
    v32[0] = v11;
    v12 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
    __CFDictionary *v12 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
    v12[1] = CFNumberCreate(0, kCFNumberCGFloatType, v32);
    a6 = (id *)CFArrayCreate(0, v12, 2, &kCFTypeArrayCallBacks);
    CFRelease(*v12);
    CFRelease(v12[1]);
    free(v12);
    goto LABEL_14;
  }
  if ([v8 isEqualToString:@"imageForInspectedSegment"])
  {
    if ([v9 selectedSegmentIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      a6 = 0;
      goto LABEL_14;
    }
    [v9 imageForSegmentAtIndex:[v9 selectedSegmentIndex]];
    v13 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if ([v8 isEqualToString:@"isEnabledForInspectedSegment"])
  {
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 __dbg_isEnabledForSelectedSegment]);
    v13 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    a6 = v13;
    goto LABEL_14;
  }
  if ([v8 isEqualToString:@"titleForInspectedSegment"])
  {
    [v9 __dbg_titleForSelectedSegment];
    v13 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if ([v8 isEqualToString:@"widthForInspectedSegment"])
  {
    [v9 __dbg_widthForSelectedSegment];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v13 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  id v15 = v9;
  id v16 = v8;
  if (![v16 length]) {
    goto LABEL_29;
  }
  NSSelectorFromString((NSString *)v16);
  if (objc_opt_respondsToSelector())
  {
    v17 = (NSString *)v16;
  }
  else
  {
    if ((unint64_t)[v16 length] < 2)
    {
      v21 = [v16 uppercaseString];
    }
    else
    {
      v18 = [v16 substringToIndex:1];
      v19 = [v18 uppercaseString];
      v20 = [v16 substringFromIndex:1];
      v21 = [v19 stringByAppendingString:v20];
    }
    v22 = [@"is" stringByAppendingString:v21];
    NSSelectorFromString(v22);
    v17 = (objc_opt_respondsToSelector() & 1) != 0 ? v22 : 0;
  }
  if (v17)
  {
    a6 = [v15 valueForKey:v17];
  }
  else
  {
LABEL_29:
    if (a6)
    {
      v23 = (__CFString *)v16;
      if (v15)
      {
        v24 = +[NSString stringWithFormat:@"%@", v15];
      }
      else
      {
        v24 = &stru_3C770;
      }
      if (v23) {
        v25 = v23;
      }
      else {
        v25 = &stru_3C770;
      }
      v30[0] = @"propertyName";
      v30[1] = @"objectDescription";
      uint64_t valuePtr = v25;
      v32[0] = v24;
      v30[2] = @"errorDescription";
      v32[1] = &stru_3C770;
      v26 = v25;
      v27 = +[NSDictionary dictionaryWithObjects:&valuePtr forKeys:v30 count:3];
      v28 = +[NSError errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v27];

      id v29 = v28;
      *a6 = v29;

      v17 = 0;
      a6 = 0;
    }
    else
    {
      v17 = 0;
    }
  }

LABEL_14:

  return a6;
}

- (BOOL)__dbg_hasValidSelectedSegmentIndex
{
  if ([(UISegmentedControl *)self selectedSegmentIndex] < 0) {
    return 0;
  }
  unint64_t v3 = [(UISegmentedControl *)self selectedSegmentIndex];
  return v3 < [(UISegmentedControl *)self numberOfSegments];
}

- (CGSize)__dbg_contentOffsetForSelectedSegment
{
  if ([(UISegmentedControl *)self __dbg_hasValidSelectedSegmentIndex])
  {
    [(UISegmentedControl *)self contentOffsetForSegmentAtIndex:[(UISegmentedControl *)self selectedSegmentIndex]];
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)__dbg_isEnabledForSelectedSegment
{
  BOOL v3 = [(UISegmentedControl *)self __dbg_hasValidSelectedSegmentIndex];
  if (v3)
  {
    NSInteger v4 = [(UISegmentedControl *)self selectedSegmentIndex];
    LOBYTE(v3) = [(UISegmentedControl *)self isEnabledForSegmentAtIndex:v4];
  }
  return v3;
}

- (id)__dbg_titleForSelectedSegment
{
  if ([(UISegmentedControl *)self __dbg_hasValidSelectedSegmentIndex]) {
    id v3 = [(UISegmentedControl *)self titleForSegmentAtIndex:[(UISegmentedControl *)self selectedSegmentIndex]];
  }
  return 0;
}

- (double)__dbg_widthForSelectedSegment
{
  if (![(UISegmentedControl *)self __dbg_hasValidSelectedSegmentIndex]) {
    return 0.0;
  }
  NSInteger v3 = [(UISegmentedControl *)self selectedSegmentIndex];

  [(UISegmentedControl *)self widthForSegmentAtIndex:v3];
  return result;
}

@end
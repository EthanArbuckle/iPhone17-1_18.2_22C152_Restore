@interface UITabBar
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UITabBar

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"backgroundImage");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"propertyOptions", v3);
  CFRelease(v3);
  v18[0] = Mutable;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"barTintColor");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v18[1] = v16;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"delegate");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v15, @"propertyFormat", @"objectInfo");
  v18[2] = v15;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"itemSpacing");
  CFDictionaryAddValue(v14, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v14, @"propertyFormat", @"CGf");
  v18[3] = v14;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"itemWidth");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v4, @"propertyFormat", @"CGf");
  v18[4] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"selectionIndicatorImage");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v5, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v5, @"propertyOptions", v6);
  CFRelease(v6);
  v18[5] = v5;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"shadowImage");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v7, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1;
  CFNumberRef v8 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v7, @"propertyOptions", v8);
  CFRelease(v8);
  v18[6] = v7;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"translucent");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v9, @"propertyFormat", @"b");
  v18[7] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"barStyle");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"UIBarStyle");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v10, @"propertyFormat", @"integer");
  v18[8] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"itemPositioning");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"UITabBarItemPositioning");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v11, @"propertyFormat", @"integer");
  v18[9] = v11;
  v12 = +[NSArray arrayWithObjects:v18 count:10];

  return v12;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  if (![v10 length]) {
    goto LABEL_12;
  }
  NSSelectorFromString((NSString *)v10);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((unint64_t)[v10 length] < 2)
    {
      v15 = [v10 uppercaseString];
    }
    else
    {
      v12 = [v10 substringToIndex:1];
      v13 = [v12 uppercaseString];
      v14 = [v10 substringFromIndex:1];
      v15 = [v13 stringByAppendingString:v14];
    }
    v16 = [@"is" stringByAppendingString:v15];
    NSSelectorFromString(v16);
    if (objc_opt_respondsToSelector()) {
      v11 = v16;
    }
    else {
      v11 = 0;
    }

    if (v11) {
      goto LABEL_4;
    }
LABEL_12:
    if (a6)
    {
      v17 = (__CFString *)v10;
      if (v9)
      {
        v18 = +[NSString stringWithFormat:@"%@", v9];
      }
      else
      {
        v18 = &stru_3C770;
      }
      if (v17) {
        v19 = v17;
      }
      else {
        v19 = &stru_3C770;
      }
      v25[0] = @"propertyName";
      v25[1] = @"objectDescription";
      v26[0] = v19;
      v26[1] = v18;
      v25[2] = @"errorDescription";
      v26[2] = &stru_3C770;
      v20 = v19;
      v21 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
      v22 = +[NSError errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v21];

      id v23 = v22;
      *a6 = v23;

      v11 = 0;
      a6 = 0;
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_21;
  }
  v11 = (NSString *)v10;
  if (!v11) {
    goto LABEL_12;
  }
LABEL_4:
  a6 = [v9 valueForKey:v11];
LABEL_21:

  return a6;
}

@end
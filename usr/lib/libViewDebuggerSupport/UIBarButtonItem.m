@interface UIBarButtonItem
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UIBarButtonItem

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"style");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"integer");
  v11[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"tintColor");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"UIColor");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  v11[1] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"width");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v4, @"propertyFormat", @"CGf");
  v11[2] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"image");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v5, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v5, @"propertyOptions", v6);
  CFRelease(v6);
  v11[3] = v5;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"style");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"UIBarButtonItemStyle");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v7, @"propertyFormat", @"integer");
  v11[4] = v7;
  v8 = +[NSArray arrayWithObjects:v11 count:5];

  return v8;
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
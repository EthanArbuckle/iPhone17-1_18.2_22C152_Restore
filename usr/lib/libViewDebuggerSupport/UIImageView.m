@interface UIImageView
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UIImageView

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"highlighted");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v16[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"highlightedImage");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v3, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v3, @"propertyOptions", v4);
  CFRelease(v4);
  v16[1] = v3;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"image");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"UIImage");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeImage");
  CFDictionaryAddValue(v5, @"propertyFormat", @"public.png");
  uint64_t valuePtr = 1;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v5, @"propertyOptions", v6);
  CFRelease(v6);
  v16[2] = v5;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"dbg_holdsSymbolImage");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v7, @"propertyFormat", @"b");
  v16[3] = v7;
  v13 = +[NSArray arrayWithObjects:v16 count:4];

  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"preferredSymbolConfigurationSummary");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v8, @"propertyFormat", @"public.plain-text");
  v15[0] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"displaySymbolConfigurationSummary");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v9, @"propertyFormat", @"public.plain-text");
  v15[1] = v9;
  v10 = +[NSArray arrayWithObjects:v15 count:2];

  v11 = [v13 arrayByAddingObjectsFromArray:v10];

  return v11;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"preferredSymbolConfigurationSummary"])
  {
    a6 = [v9 preferredSymbolConfiguration];

    if (!a6) {
      goto LABEL_13;
    }
    id v10 = [v9 preferredSymbolConfiguration];
    _UIImageSymbolConfigurationTextualSummary();
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if ([v8 isEqualToString:@"displaySymbolConfigurationSummary"])
  {
    _UIImageViewGetCurrentImage();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    a6 = [v10 symbolConfiguration];

    if (!a6) {
      goto LABEL_12;
    }
    id v12 = [v10 symbolConfiguration];
    _UIImageSymbolConfigurationTextualSummary();
    v13 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if ([v8 isEqualToString:@"dbg_holdsSymbolImage"])
  {
    _UIImageViewGetCurrentImage();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [v10 symbolConfiguration];
    +[NSNumber numberWithInt:v12 != 0];
    v13 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    a6 = v13;
LABEL_11:

    goto LABEL_12;
  }
  if (![v8 isEqualToString:@"image"])
  {
    id v10 = v9;
    id v12 = v8;
    if (![v12 length]) {
      goto LABEL_32;
    }
    NSSelectorFromString((NSString *)v12);
    if (objc_opt_respondsToSelector())
    {
      v16 = (NSString *)v12;
    }
    else
    {
      if ((unint64_t)[v12 length] < 2)
      {
        v20 = [v12 uppercaseString];
      }
      else
      {
        v17 = [v12 substringToIndex:1];
        v18 = [v17 uppercaseString];
        v19 = [v12 substringFromIndex:1];
        v20 = [v18 stringByAppendingString:v19];
      }
      v21 = [@"is" stringByAppendingString:v20];
      NSSelectorFromString(v21);
      v16 = (objc_opt_respondsToSelector() & 1) != 0 ? v21 : 0;
    }
    if (v16)
    {
      a6 = [v10 valueForKey:v16];
    }
    else
    {
LABEL_32:
      if (a6)
      {
        v22 = (__CFString *)v12;
        if (v10)
        {
          v23 = +[NSString stringWithFormat:@"%@", v10];
        }
        else
        {
          v23 = &stru_3C770;
        }
        if (v22) {
          v24 = v22;
        }
        else {
          v24 = &stru_3C770;
        }
        v29[0] = @"propertyName";
        v29[1] = @"objectDescription";
        v30[0] = v24;
        v30[1] = v23;
        v29[2] = @"errorDescription";
        v30[2] = &stru_3C770;
        v25 = v24;
        v26 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
        v27 = +[NSError errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v26];

        id v28 = v27;
        *a6 = v28;

        v16 = 0;
        a6 = 0;
      }
      else
      {
        v16 = 0;
      }
    }

    goto LABEL_11;
  }
  v15 = _UIImageViewGetCurrentImage();
  id v10 = v15;
  if (v15)
  {
    v11 = v15;
  }
  else
  {
    v11 = [v9 image];
  }
LABEL_4:
  a6 = v11;
LABEL_12:

LABEL_13:

  return a6;
}

@end
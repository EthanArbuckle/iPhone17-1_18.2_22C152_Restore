@interface UIDatePicker
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UIDatePicker

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"countDownDuration");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"CGf");
  v11[0] = Mutable;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"minuteInterval");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"NSInteger");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v2, @"propertyFormat", @"integer");
  v11[1] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"date");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v3, @"propertyFormat", @"public.plain-text");
  v11[2] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"datePickerMode");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"UIDatePickerMode");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v4, @"propertyFormat", @"integer");
  v11[3] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"localeIdentifier");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v5, @"propertyFormat", @"public.plain-text");
  v11[4] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"maximumDate");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v6, @"propertyFormat", @"public.plain-text");
  v11[5] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"minimumDate");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v7, @"propertyFormat", @"public.plain-text");
  v11[6] = v7;
  v8 = +[NSArray arrayWithObjects:v11 count:7];

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"date"])
  {
    v10 = [v9 date];
LABEL_9:
    id v11 = v10;
    v12 = [v10 description];
    goto LABEL_10;
  }
  if ([v8 isEqualToString:@"localeIdentifier"])
  {
    id v11 = [v9 locale];
    v12 = [v11 localeIdentifier];
LABEL_10:
    a6 = v12;
    goto LABEL_11;
  }
  if ([v8 isEqualToString:@"maximumDate"])
  {
    v10 = [v9 maximumDate];
    goto LABEL_9;
  }
  if ([v8 isEqualToString:@"minimumDate"])
  {
    v10 = [v9 minimumDate];
    goto LABEL_9;
  }
  id v11 = v9;
  id v14 = v8;
  if (![v14 length]) {
    goto LABEL_26;
  }
  NSSelectorFromString((NSString *)v14);
  if (objc_opt_respondsToSelector())
  {
    v15 = (NSString *)v14;
  }
  else
  {
    if ((unint64_t)[v14 length] < 2)
    {
      v19 = [v14 uppercaseString];
    }
    else
    {
      v16 = [v14 substringToIndex:1];
      v17 = [v16 uppercaseString];
      v18 = [v14 substringFromIndex:1];
      v19 = [v17 stringByAppendingString:v18];
    }
    v20 = [@"is" stringByAppendingString:v19];
    NSSelectorFromString(v20);
    v15 = (objc_opt_respondsToSelector() & 1) != 0 ? v20 : 0;
  }
  if (v15)
  {
    a6 = [v11 valueForKey:v15];
  }
  else
  {
LABEL_26:
    if (a6)
    {
      v21 = (__CFString *)v14;
      if (v11)
      {
        v22 = +[NSString stringWithFormat:@"%@", v11];
      }
      else
      {
        v22 = &stru_3C770;
      }
      if (v21) {
        v23 = v21;
      }
      else {
        v23 = &stru_3C770;
      }
      v28[0] = @"propertyName";
      v28[1] = @"objectDescription";
      v29[0] = v23;
      v29[1] = v22;
      v28[2] = @"errorDescription";
      v29[2] = &stru_3C770;
      v24 = v23;
      v25 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
      v26 = +[NSError errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v25];

      id v27 = v26;
      *a6 = v27;

      v15 = 0;
      a6 = 0;
    }
    else
    {
      v15 = 0;
    }
  }

LABEL_11:

  return a6;
}

@end
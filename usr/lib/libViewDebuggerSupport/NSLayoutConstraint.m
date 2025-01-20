@interface NSLayoutConstraint
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation NSLayoutConstraint

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"active");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v18[0] = Mutable;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, @"propertyName", @"constant");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v16, @"propertyFormat", @"CGf");
  v18[1] = v16;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, @"propertyName", @"firstAnchor");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v15, @"propertyFormat", @"objectInfo");
  v18[2] = v15;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, @"propertyName", @"firstItem");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v14, @"propertyFormat", @"objectInfo");
  v18[3] = v14;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"identifier");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(v13, @"propertyFormat", @"public.plain-text");
  v18[4] = v13;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"multiplier");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v12, @"propertyFormat", @"f");
  v18[5] = v12;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"priority");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"float");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v10, @"propertyFormat", @"f");
  v18[6] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"secondAnchor");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v11, @"propertyFormat", @"objectInfo");
  v18[7] = v11;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, @"propertyName", @"secondItem");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v9, @"propertyFormat", @"objectInfo");
  v18[8] = v9;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"dbgInspectedHasIdentifier");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v2, @"propertyFormat", @"b");
  v18[9] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"dbgInspectedHasSecondItem");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v3, @"propertyFormat", @"b");
  v18[10] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"firstAttribute");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"NSLayoutAttribute");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v4, @"propertyFormat", @"integer");
  v18[11] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"relation");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"NSLayoutRelation");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v5, @"propertyFormat", @"integer");
  v18[12] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"secondAttribute");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"NSLayoutAttribute");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v6, @"propertyFormat", @"integer");
  v18[13] = v6;
  v7 = +[NSArray arrayWithObjects:v18 count:14];

  return v7;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"dbgInspectedHasIdentifier"])
  {
    v10 = [v9 identifier];
    BOOL v11 = [v10 length] != 0;

    BOOL v12 = v11;
LABEL_5:
    a6 = +[NSNumber numberWithBool:v12];
    goto LABEL_27;
  }
  if ([v8 isEqualToString:@"dbgInspectedHasSecondItem"])
  {
    v13 = [v9 secondItem];
    BOOL v14 = v13 != 0;

    BOOL v12 = v14;
    goto LABEL_5;
  }
  id v15 = v9;
  id v16 = v8;
  if (![v16 length]) {
    goto LABEL_17;
  }
  NSSelectorFromString((NSString *)v16);
  if ((objc_opt_respondsToSelector() & 1) == 0)
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
    if (objc_opt_respondsToSelector()) {
      v17 = v22;
    }
    else {
      v17 = 0;
    }

    if (v17) {
      goto LABEL_9;
    }
LABEL_17:
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
      v31[0] = @"propertyName";
      v31[1] = @"objectDescription";
      v32[0] = v25;
      v32[1] = v24;
      v31[2] = @"errorDescription";
      v32[2] = &stru_3C770;
      v26 = v25;
      v27 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
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
    goto LABEL_26;
  }
  v17 = (NSString *)v16;
  if (!v17) {
    goto LABEL_17;
  }
LABEL_9:
  a6 = [v15 valueForKey:v17];
LABEL_26:

LABEL_27:

  return a6;
}

@end
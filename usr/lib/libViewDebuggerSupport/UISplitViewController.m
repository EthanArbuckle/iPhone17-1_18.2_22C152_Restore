@interface UISplitViewController
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UISplitViewController

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"collapsed");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v15[0] = Mutable;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, @"propertyName", @"delegate");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v13, @"propertyFormat", @"objectInfo");
  v15[1] = v13;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, @"propertyName", @"displayModeButtonItem");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v12, @"propertyFormat", @"objectInfo");
  v15[2] = v12;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, @"propertyName", @"maximumPrimaryColumnWidth");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v11, @"propertyFormat", @"CGf");
  v15[3] = v11;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, @"propertyName", @"minimumPrimaryColumnWidth");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v10, @"propertyFormat", @"CGf");
  v15[4] = v10;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, @"propertyName", @"preferredPrimaryColumnWidthFraction");
  CFDictionaryAddValue(v2, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v2, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v2, @"propertyFormat", @"CGf");
  v15[5] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"presentsWithGesture");
  CFDictionaryAddValue(v3, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v3, @"propertyFormat", @"b");
  v15[6] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"primaryColumnWidth");
  CFDictionaryAddValue(v4, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v4, @"propertyFormat", @"CGf");
  v15[7] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"displayMode");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"UISplitViewControllerDisplayMode");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v5, @"propertyFormat", @"uinteger");
  v15[8] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"preferredDisplayMode");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"UISplitViewControllerDisplayMode");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v6, @"propertyFormat", @"uinteger");
  v15[9] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, @"propertyName", @"primaryEdge");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"UISplitViewControllerPrimaryEdge");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v7, @"propertyFormat", @"uinteger");
  v15[10] = v7;
  v8 = +[NSArray arrayWithObjects:v15 count:11];

  return v8;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"displayModeButtonItem"] && objc_msgSend(v9, "style"))
  {
    a6 = 0;
    goto LABEL_25;
  }
  id v10 = v9;
  id v11 = v8;
  if (![v11 length]) {
    goto LABEL_15;
  }
  NSSelectorFromString((NSString *)v11);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((unint64_t)[v11 length] < 2)
    {
      v16 = [v11 uppercaseString];
    }
    else
    {
      v13 = [v11 substringToIndex:1];
      v14 = [v13 uppercaseString];
      v15 = [v11 substringFromIndex:1];
      v16 = [v14 stringByAppendingString:v15];
    }
    v17 = [@"is" stringByAppendingString:v16];
    NSSelectorFromString(v17);
    if (objc_opt_respondsToSelector()) {
      v12 = v17;
    }
    else {
      v12 = 0;
    }

    if (v12) {
      goto LABEL_7;
    }
LABEL_15:
    if (a6)
    {
      v18 = (__CFString *)v11;
      if (v10)
      {
        v19 = +[NSString stringWithFormat:@"%@", v10];
      }
      else
      {
        v19 = &stru_3C770;
      }
      if (v18) {
        v20 = v18;
      }
      else {
        v20 = &stru_3C770;
      }
      v26[0] = @"propertyName";
      v26[1] = @"objectDescription";
      v27[0] = v20;
      v27[1] = v19;
      v26[2] = @"errorDescription";
      v27[2] = &stru_3C770;
      v21 = v20;
      v22 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
      v23 = +[NSError errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v22];

      id v24 = v23;
      *a6 = v24;

      v12 = 0;
      a6 = 0;
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_24;
  }
  v12 = (NSString *)v11;
  if (!v12) {
    goto LABEL_15;
  }
LABEL_7:
  a6 = [v10 valueForKey:v12];
LABEL_24:

LABEL_25:

  return a6;
}

@end
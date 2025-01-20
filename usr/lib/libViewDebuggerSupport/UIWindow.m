@interface UIWindow
+ (id)fallback_debugHierarchyAdditionalGroupingIDs;
+ (id)fallback_debugHierarchyGroupingIDs;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4;
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UIWindow

+ (id)fallback_debugHierarchyGroupingIDs
{
  v4 = @"com.apple.UIKit.UIWindow";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4
{
  if (objc_msgSend(a3, "isEqualToString:", @"com.apple.UIKit.UIWindow", a4))
  {
    v4 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)fallback_debugHierarchyAdditionalGroupingIDs
{
  v4[0] = @"com.apple.UIKit.UIViewController";
  v4[1] = @"com.apple.UIKit.UIScreen";
  v4[2] = @"com.apple.UIKit.UIScene";
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.UIKit.UIViewController"])
  {
    v8 = [v7 rootViewController];

    if (v8)
    {
      v9 = [v7 rootViewController];
      v16 = v9;
      v10 = &v16;
LABEL_9:
      v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 1, v14, v15, v16);

      goto LABEL_11;
    }
  }
  else if ([v6 isEqualToString:@"com.apple.UIKit.UIScreen"])
  {
    v11 = [v7 screen];

    if (v11)
    {
      v9 = [v7 screen];
      v15 = v9;
      v10 = &v15;
      goto LABEL_9;
    }
  }
  else if ([v6 isEqualToString:@"com.apple.UIKit.UIScene"])
  {
    v9 = [v7 windowScene];
    v14 = v9;
    v10 = &v14;
    goto LABEL_9;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"keyWindow");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v12[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, @"propertyName", @"rootViewController");
  CFDictionaryAddValue(v3, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v3, @"propertyFormat", @"objectInfo");
  v12[1] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, @"propertyName", @"screen");
  CFDictionaryAddValue(v4, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v4, @"propertyFormat", @"objectInfo");
  v12[2] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, @"propertyName", @"windowLevel");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v5, @"propertyFormat", @"CGf");
  v12[3] = v5;
  id v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, @"propertyName", @"internal");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v6, @"propertyFormat", @"b");
  uint64_t v11 = 4;
  CFNumberRef v7 = CFNumberCreate(0, kCFNumberCFIndexType, &v11);
  CFDictionaryAddValue(v6, @"visibility", v7);
  CFRelease(v7);
  v12[4] = v6;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, @"propertyName", @"visible");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v8, @"propertyFormat", @"b");
  v12[5] = v8;
  v9 = +[NSArray arrayWithObjects:v12 count:6];

  return v9;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"internal"])
  {
    v10 = +[UIWindow allWindowsIncludingInternalWindows:0 onlyVisibleWindows:0];
    id v11 = (id)([v10 containsObject:v9] ^ 1);
LABEL_5:

    a6 = +[NSNumber numberWithBool:v11];
    goto LABEL_30;
  }
  if ([v8 isEqualToString:@"visible"])
  {
    v10 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
    id v11 = [v10 containsObject:v9];
    goto LABEL_5;
  }
  if (![v8 isEqualToString:@"screenScale"])
  {
    id v12 = v9;
    v13 = (NSString *)v8;
    if ([(NSString *)v13 length])
    {
      NSSelectorFromString(v13);
      if (objc_opt_respondsToSelector())
      {
        v14 = v13;
        if (v14)
        {
LABEL_11:
          a6 = [v12 valueForKey:v14];
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        if ([(NSString *)v13 length] < 2)
        {
          v18 = [(NSString *)v13 uppercaseString];
        }
        else
        {
          v15 = [(NSString *)v13 substringToIndex:1];
          v16 = [v15 uppercaseString];
          v17 = [(NSString *)v13 substringFromIndex:1];
          v18 = [v16 stringByAppendingString:v17];
        }
        v19 = [@"is" stringByAppendingString:v18];
        NSSelectorFromString(v19);
        if (objc_opt_respondsToSelector()) {
          v14 = v19;
        }
        else {
          v14 = 0;
        }

        if (v14) {
          goto LABEL_11;
        }
      }
    }
    if (a6)
    {
      v20 = v13;
      if (v12)
      {
        v21 = +[NSString stringWithFormat:@"%@", v12];
      }
      else
      {
        v21 = &stru_3C770;
      }
      if (v20) {
        v22 = v20;
      }
      else {
        v22 = &stru_3C770;
      }
      v28[0] = @"propertyName";
      v28[1] = @"objectDescription";
      v29[0] = v22;
      v29[1] = v21;
      v28[2] = @"errorDescription";
      v29[2] = &stru_3C770;
      v23 = v22;
      v24 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
      v25 = +[NSError errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v24];

      id v26 = v25;
      *a6 = v26;

      v14 = 0;
      a6 = 0;
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_28;
  }
  id v12 = [v9 screen];
  [v12 scale];
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  a6 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_29:

LABEL_30:

  return a6;
}

@end
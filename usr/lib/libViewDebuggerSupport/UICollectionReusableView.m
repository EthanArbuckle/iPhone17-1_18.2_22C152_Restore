@interface UICollectionReusableView
+ (id)fallback_debugHierarchyPropertyDescriptions;
+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
@end

@implementation UICollectionReusableView

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"propertyName", @"reuseIdentifier");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"public.plain-text");
  v5 = Mutable;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
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
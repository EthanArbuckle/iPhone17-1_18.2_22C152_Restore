@interface TSDColorFillAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxColorFillName;
- (id)_tsaxColor;
- (id)accessibilityLabel;
@end

@implementation TSDColorFillAccessibility

- (id)accessibilityLabel
{
  if (!qword_573880)
  {
    qword_573880 = objc_opt_new();
    Class v3 = NSClassFromString(@"TSDColorFill");
    if (v3)
    {
      Class v4 = v3;
      for (uint64_t i = 0; i != 22; i += 2)
      {
        id v6 = [(objc_class *)v4 tsaxValueForKey:off_46B860[i]];
        if (v6) {
          [(id)qword_573880 setObject:v6 forKey:TSAccessibilityLocalizedString((uint64_t)off_46B860[i + 1])];
        }
      }
    }
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = sub_2525E4;
  v14 = sub_2525F4;
  uint64_t v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_252600;
  v9[3] = &unk_46B918;
  v9[4] = self;
  v9[5] = &v10;
  [(id)qword_573880 enumerateKeysAndObjectsUsingBlock:v9];
  v7 = (NSString *)v11[5];
  if (!v7)
  {
    v7 = TSAccessibilityLocalizedString(@"unlabeled.color");
    v11[5] = (uint64_t)v7;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

+ (id)tsaxTargetClassName
{
  return @"TSDColorFill";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxColorFillName
{
  id v2 = [(TSDColorFillAccessibility *)self _tsaxColor];

  return (NSString *)[v2 tsaxStyleInfoDescription];
}

- (id)_tsaxColor
{
  char v5 = 0;
  Class v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDColorFillAccessibility *)self tsaxValueForKey:@"color"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end
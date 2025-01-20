@interface THTSDDrawableInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxUserProvidedDescription;
@end

@implementation THTSDDrawableInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDDrawableInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxUserProvidedDescription
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = sub_287F4C;
  v14 = sub_287F5C;
  v15 = 0;
  v9.receiver = self;
  v9.super_class = (Class)THTSDDrawableInfoAccessibility;
  v15 = [(TSDDrawableInfoAccessibility *)&v9 tsaxUserProvidedDescription];
  if (![(id)v11[5] length])
  {
    char v8 = 0;
    v3 = (objc_class *)objc_opt_class();
    v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THTSDDrawableInfoAccessibility *)self tsaxValueForKey:@"accessibilityDescriptions"], 1, &v8);
    if (v8) {
      abort();
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_287F68;
    v7[3] = &unk_46C428;
    v7[4] = &v10;
    [v4 enumerateKeysAndObjectsUsingBlock:v7];
  }
  v5 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v5;
}

@end
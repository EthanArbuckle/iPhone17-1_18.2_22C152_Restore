@interface THModelLinkAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)thaxModelLinkForHyperlinkField:(id)a3;
+ (id)tsaxTargetClassName;
@end

@implementation THModelLinkAccessibility

+ (id)tsaxTargetClassName
{
  return @"THModelLink";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)thaxModelLinkForHyperlinkField:(id)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_27F854;
  v12 = sub_27F864;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_27F870;
  v7[3] = &unk_457DA0;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = a1;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  uint64_t v3 = v9[5];
  _Block_object_dispose(&v8, 8);
  LOBYTE(v8) = 0;
  v4 = objc_opt_class();
  Class v5 = __TSAccessibilityCastAsSafeCategory(v4, v3, 1, &v8);
  if ((_BYTE)v8) {
    abort();
  }
  return v5;
}

@end
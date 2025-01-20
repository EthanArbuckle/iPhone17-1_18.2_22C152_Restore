@interface THModelNodeAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (THModelContainerNodeAccessibility)thaxParent;
- (_NSRange)thaxAbsolutePageRangeForPresentationType:(id)a3;
- (id)thaxContentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
@end

@implementation THModelNodeAccessibility

+ (id)tsaxTargetClassName
{
  return @"THModelNode";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THModelContainerNodeAccessibility)thaxParent
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THModelContainerNodeAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THModelNodeAccessibility *)self tsaxValueForKey:@"parent"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)thaxContentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_285910;
  v12 = sub_285920;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_28592C;
  v7[3] = &unk_46BE20;
  v7[6] = &v8;
  v7[7] = a3;
  v7[4] = self;
  v7[5] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  uint64_t v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  LOBYTE(v8) = 0;
  char v5 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v5, v4, 1, &v8);
  if ((_BYTE)v8) {
    abort();
  }
  return result;
}

- (_NSRange)thaxAbsolutePageRangeForPresentationType:(id)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3010000000;
  v11 = &unk_41622E;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_285A44;
  v7[3] = &unk_457DA0;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  NSUInteger v3 = v9[4];
  NSUInteger v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  NSUInteger v5 = v3;
  NSUInteger v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

@end
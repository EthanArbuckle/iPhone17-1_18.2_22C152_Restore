@interface TSTTableCellTextEditingRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxNeedsTextEntryTrait;
- (TSTTableCellAccessibilityElement)tsaxParentTableCellElement;
- (id)accessibilityContainer;
@end

@implementation TSTTableCellTextEditingRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTTableCellTextEditingRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSTTableCellAccessibilityElement)tsaxParentTableCellElement
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2810000000;
  v11 = &unk_41622E;
  int v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_26C714;
  v7[3] = &unk_4573D8;
  v7[4] = self;
  v7[5] = &v8;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  uint64_t v3 = *((unsigned int *)v9 + 8);
  _Block_object_dispose(&v8, 8);
  result = 0;
  if ((_WORD)v3 != 0xFFFF && (v3 & 0xFF0000) != 0xFF0000)
  {
    LOBYTE(v8) = 0;
    v5 = objc_opt_class();
    Class v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)[(TSDRepAccessibility *)self tsaxParentRep], 1, &v8);
    if ((_BYTE)v8) {
      abort();
    }
    return (TSTTableCellAccessibilityElement *)[(objc_class *)v6 tsaxChildCellForCellID:v3];
  }
  return result;
}

- (id)accessibilityContainer
{
  return [(TSTTableCellTextEditingRepAccessibility *)self tsaxParentTableCellElement];
}

- (BOOL)tsaxNeedsTextEntryTrait
{
  return 1;
}

@end
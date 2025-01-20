@interface CRLWPShapeItemAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxDisplaysInstructionalText;
- (BOOL)crlaxIsTextBox;
- (CRLWPStorageAccessibility)crlaxContainedStorage;
- (NSString)crlaxShapeString;
- (id)crlaxTarget;
@end

@implementation CRLWPShapeItemAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLWPShapeItem";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)crlaxShapeString
{
  v2 = [(CRLWPShapeItemAccessibility *)self crlaxContainedStorage];
  v3 = [v2 crlaxString];

  return (NSString *)v3;
}

- (BOOL)crlaxDisplaysInstructionalText
{
  return 0;
}

- (CRLWPStorageAccessibility)crlaxContainedStorage
{
  char v8 = 0;
  v2 = [(CRLWPShapeItemAccessibility *)self crlaxTarget];
  v3 = [v2 textStorage];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLWPStorageAccessibility *)v6;
}

- (id)crlaxTarget
{
  char v7 = 0;
  v2 = self;
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v7);
  if (v7) {
    abort();
  }
  uint64_t v5 = (void *)v4;

  return v5;
}

- (BOOL)crlaxIsTextBox
{
  return self->_crlaxIsTextBox;
}

@end
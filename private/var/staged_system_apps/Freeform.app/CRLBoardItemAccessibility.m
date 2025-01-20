@interface CRLBoardItemAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (CRLItemGeometryAccessibility)crlaxGeometry;
- (NSString)crlaxTypeDescription;
- (NSString)crlaxUserProvidedCaption;
- (NSString)crlaxUserProvidedCaptionLabel;
- (NSString)crlaxUserProvidedDescription;
- (NSString)crlaxUserProvidedTitle;
- (NSString)crlaxUserProvidedTitleLabel;
@end

@implementation CRLBoardItemAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLBoardItem";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)crlaxUserProvidedDescription
{
  char v7 = 0;
  v2 = [(CRLBoardItemAccessibility *)self crlaxValueForKey:@"accessibilityDescription"];
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v7);
  if (v7) {
    abort();
  }
  v5 = (void *)v4;

  return (NSString *)v5;
}

- (NSString)crlaxTypeDescription
{
  return (NSString *)[(CRLBoardItemAccessibility *)self crlaxValueForKey:@"localizedName"];
}

- (CRLItemGeometryAccessibility)crlaxGeometry
{
  char v7 = 0;
  v2 = [(CRLBoardItemAccessibility *)self crlaxValueForKey:@"geometry"];
  v3 = objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v7);
  if (v7) {
    abort();
  }
  v5 = (void *)v4;

  return (CRLItemGeometryAccessibility *)v5;
}

- (NSString)crlaxUserProvidedTitle
{
  return self->_crlaxUserProvidedTitle;
}

- (NSString)crlaxUserProvidedCaption
{
  return self->_crlaxUserProvidedCaption;
}

- (NSString)crlaxUserProvidedTitleLabel
{
  return self->_crlaxUserProvidedTitleLabel;
}

- (NSString)crlaxUserProvidedCaptionLabel
{
  return self->_crlaxUserProvidedCaptionLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crlaxUserProvidedCaptionLabel, 0);
  objc_storeStrong((id *)&self->_crlaxUserProvidedTitleLabel, 0);
  objc_storeStrong((id *)&self->_crlaxUserProvidedCaption, 0);

  objc_storeStrong((id *)&self->_crlaxUserProvidedTitle, 0);
}

@end
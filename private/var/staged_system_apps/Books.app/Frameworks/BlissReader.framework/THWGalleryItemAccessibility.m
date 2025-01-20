@interface THWGalleryItemAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)_thaxAuthorProvidedAccessibilityDescription;
- (NSString)thaxDescription;
- (TSWPStorageAccessibility)_thaxCaptionStorage;
@end

@implementation THWGalleryItemAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWGalleryItem";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxDescription
{
  v3 = [(THWGalleryItemAccessibility *)self _thaxAuthorProvidedAccessibilityDescription];
  v4 = [(TSWPStorageAccessibility *)[(THWGalleryItemAccessibility *)self _thaxCaptionStorage] tsaxString];
  if ([(NSString *)v3 isEqualToString:v4]) {
    return v3;
  }
  else {
    return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  }
}

- (NSString)_thaxAuthorProvidedAccessibilityDescription
{
  char v6 = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THWGalleryItemAccessibility *)self tsaxValueForKey:@"accessibilityDescriptions"], 1, &v6);
  if (v6) {
    abort();
  }
  return (NSString *)[v4 objectForKey:@"alternateText"];
}

- (TSWPStorageAccessibility)_thaxCaptionStorage
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSWPStorageAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWGalleryItemAccessibility *)self tsaxValueForKey:@"captionStorage"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end
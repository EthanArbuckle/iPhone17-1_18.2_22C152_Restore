@interface THNoteCardContentLayerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)thaxCardNumberString;
- (THMultiLineLabelAccessibility)_thaxCardNumberLabel;
@end

@implementation THNoteCardContentLayerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THNoteCardContentLayer";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxCardNumberString
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THMultiLineLabelAccessibility *)[(THNoteCardContentLayerAccessibility *)self _thaxCardNumberLabel] thaxText], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THMultiLineLabelAccessibility)_thaxCardNumberLabel
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THMultiLineLabelAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THNoteCardContentLayerAccessibility *)self tsaxValueForKey:@"_cardNumberLabel"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end
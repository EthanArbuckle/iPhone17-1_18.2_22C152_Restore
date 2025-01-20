@interface THNotesDetailTableViewCellControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)thaxDateString;
- (NSString)thaxPageNumberString;
- (THCachedAnnotationAccessibility)thaxAnnotation;
- (UIButton)thaxReturnToBook;
- (UILabel)_thaxDateLabel;
- (void)populateWithAnnotation:(id)a3 cellWidth:(double)a4 highlightLayer:(id)a5 highlightTextFrame:(CGRect)a6 editingHighlightLayer:(id)a7 pageNumberString:(id)a8 topAdjustment:(double)a9 showDivider:(BOOL)a10;
@end

@implementation THNotesDetailTableViewCellControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THNotesDetailTableViewCellController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxDateString
{
  v2 = [(THNotesDetailTableViewCellControllerAccessibility *)self _thaxDateLabel];

  return [(UILabel *)v2 text];
}

- (NSString)thaxPageNumberString
{
  v2 = [(UIButton *)[(THNotesDetailTableViewCellControllerAccessibility *)self thaxReturnToBook] titleForState:0];
  if ([(NSString *)v2 length]) {
    return v2;
  }
  else {
    return 0;
  }
}

- (THCachedAnnotationAccessibility)thaxAnnotation
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THCachedAnnotationAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THNotesDetailTableViewCellControllerAccessibility *)self tsaxValueForKey:@"annotation"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)thaxReturnToBook
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THNotesDetailTableViewCellControllerAccessibility *)self tsaxValueForKey:@"returnToBook"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)populateWithAnnotation:(id)a3 cellWidth:(double)a4 highlightLayer:(id)a5 highlightTextFrame:(CGRect)a6 editingHighlightLayer:(id)a7 pageNumberString:(id)a8 topAdjustment:(double)a9 showDivider:(BOOL)a10
{
  v11.receiver = self;
  v11.super_class = (Class)THNotesDetailTableViewCellControllerAccessibility;
  -[THNotesDetailTableViewCellControllerAccessibility populateWithAnnotation:cellWidth:highlightLayer:highlightTextFrame:editingHighlightLayer:pageNumberString:topAdjustment:showDivider:](&v11, "populateWithAnnotation:cellWidth:highlightLayer:highlightTextFrame:editingHighlightLayer:pageNumberString:topAdjustment:showDivider:", a3, a5, a7, a8, a10, a4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a9);
  [(UIButton *)[(THNotesDetailTableViewCellControllerAccessibility *)self thaxReturnToBook] setIsAccessibilityElement:0];
}

- (UILabel)_thaxDateLabel
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (UILabel *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THNotesDetailTableViewCellControllerAccessibility *)self tsaxValueForKey:@"dateLabel"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end
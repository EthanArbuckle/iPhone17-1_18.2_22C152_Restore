@interface THNotesDetailTableViewCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxIsEditing;
- (BOOL)_thaxIsSelected;
- (CGPoint)accessibilityActivationPoint;
- (THCachedAnnotationAccessibility)_thaxAnnotation;
- (THNotesDetailTableViewCellControllerAccessibility)_thaxTableViewCellController;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation THNotesDetailTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"THNotesDetailTableViewCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = [(THNotesDetailTableViewCellAccessibility *)self _thaxTableViewCellController];
  v3 = [(THNotesDetailTableViewCellControllerAccessibility *)v2 thaxAnnotation];
  v4 = [(THCachedAnnotationAccessibility *)v3 thaxNoteText];
  if ([(NSString *)v4 length]) {
    v5 = +[NSString stringWithFormat:THAccessibilityLocalizedString(@"note.format %@"), v4];
  }
  else {
    v5 = 0;
  }
  v6 = [(THNotesDetailTableViewCellControllerAccessibility *)v2 thaxPageNumberString];
  if ([(NSString *)v6 length]) {
    +[NSString stringWithFormat:THAccessibilityLocalizedString(@"note.page.format %@"), v6];
  }
  v7 = [(THNotesDetailTableViewCellControllerAccessibility *)v2 thaxDateString];
  if ([(NSString *)v7 length]) {
    +[NSString stringWithFormat:THAccessibilityLocalizedString(@"note.created.format %@"), v7];
  }
  v8 = [(THCachedAnnotationAccessibility *)v3 thaxHighlightedTextDescription];
  return __TSAccessibilityStringForVariables(1, v8, v9, v10, v11, v12, v13, v14, (uint64_t)v5);
}

- (id)accessibilityHint
{
  if ([(THNotesDetailTableViewCellAccessibility *)self _thaxIsEditing])
  {
    if ([(THNotesDetailTableViewCellAccessibility *)self _thaxIsSelected]) {
      CFStringRef v3 = @"notes.editing.selected.hint.ios";
    }
    else {
      CFStringRef v3 = @"notes.editing.hint.ios";
    }
    return THAccessibilityLocalizedString((uint64_t)v3);
  }
  else
  {
    v4 = [(THNotesDetailTableViewCellControllerAccessibility *)[(THNotesDetailTableViewCellAccessibility *)self _thaxTableViewCellController] thaxPageNumberString];
    if ([(NSString *)v4 length])
    {
      return +[NSString stringWithFormat:THAccessibilityLocalizedString(@"note.jump.hint.format.iOS %@"), v4];
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)THNotesDetailTableViewCellAccessibility;
      return [(THNotesDetailTableViewCellAccessibility *)&v6 accessibilityHint];
    }
  }
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(THNotesDetailTableViewCellAccessibility *)self _thaxIsEditing])
  {
    v6.receiver = self;
    v6.super_class = (Class)THNotesDetailTableViewCellAccessibility;
    [(THNotesDetailTableViewCellAccessibility *)&v6 accessibilityActivationPoint];
  }
  else
  {
    v5 = [(THNotesDetailTableViewCellControllerAccessibility *)[(THNotesDetailTableViewCellAccessibility *)self _thaxTableViewCellController] thaxReturnToBook];
    [(UIButton *)v5 accessibilityActivationPoint];
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)THNotesDetailTableViewCellAccessibility;
  unint64_t v3 = [(THNotesDetailTableViewCellAccessibility *)&v7 accessibilityTraits];
  unsigned int v4 = [(THNotesDetailTableViewCellAccessibility *)self _thaxIsEditing];
  UIAccessibilityTraits v5 = UIAccessibilityTraitButton;
  if (v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

- (id)accessibilityUserInputLabels
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = [(THNotesDetailTableViewCellControllerAccessibility *)[(THNotesDetailTableViewCellAccessibility *)self _thaxTableViewCellController] thaxAnnotation];
  [v3 tsu_addNonNilObject:[v4 thaxHighlightedText]];
  [v3 tsu_addNonNilObject:[self thaxNoteText]];
  [v3 tsu_addNonNilObject:[self thaxHighlightedTextDescription]];
  [v3 tsu_addNonNilObject:[self accessibilityLabel]];
  return v3;
}

- (BOOL)_thaxIsEditing
{
  return [(THNotesDetailTableViewCellAccessibility *)self tsaxBoolValueForKey:@"isEditing"];
}

- (BOOL)_thaxIsSelected
{
  return [(THNotesDetailTableViewCellAccessibility *)self tsaxBoolValueForKey:@"isSelected"];
}

- (THNotesDetailTableViewCellControllerAccessibility)_thaxTableViewCellController
{
  char v5 = 0;
  id v3 = objc_opt_class();
  CGPoint result = (THNotesDetailTableViewCellControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THNotesDetailTableViewCellAccessibility *)self tsaxValueForKey:@"tableViewCellController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THCachedAnnotationAccessibility)_thaxAnnotation
{
  return self->__thaxAnnotation;
}

@end
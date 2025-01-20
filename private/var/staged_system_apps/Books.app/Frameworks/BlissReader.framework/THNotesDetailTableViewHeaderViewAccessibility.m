@interface THNotesDetailTableViewHeaderViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxEditing;
- (BOOL)_thaxSelected;
- (UIView)_thaxCellContentView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation THNotesDetailTableViewHeaderViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"THNotesDetailTableViewHeaderView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v2 = [(UIView *)[(THNotesDetailTableViewHeaderViewAccessibility *)self _thaxCellContentView] subviews];
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v3)
  {
    id v4 = v3;
    v5 = 0;
    v6 = 0;
    uint64_t v7 = *(void *)v33;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v2);
        }
        v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v9 tag] == (char *)&dword_C + 2)
        {
          char v31 = 0;
          v10 = (objc_class *)objc_opt_class();
          uint64_t v11 = __TSAccessibilityCastAsClass(v10, (uint64_t)v9, 1, &v31);
          if (v31) {
            goto LABEL_20;
          }
          v6 = (void *)v11;
        }
        else if ([v9 tag] == &dword_8)
        {
          char v31 = 0;
          v12 = (objc_class *)objc_opt_class();
          uint64_t v13 = __TSAccessibilityCastAsClass(v12, (uint64_t)v9, 1, &v31);
          if (v31) {
            goto LABEL_20;
          }
          v5 = (void *)v13;
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  id v14 = [v6 text];
  id v15 = [v5 text];
  v22 = __TSAccessibilityStringForVariables(1, v14, v16, v17, v18, v19, v20, v21, (uint64_t)v15);
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (![(NSMutableString *)v22 length])
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Label for note header cell is not valid.", v24, v25, v26, v27, v28, v30))LABEL_20:abort(); {
    }
      }
  }
  return v22;
}

- (id)accessibilityHint
{
  if ([(THNotesDetailTableViewHeaderViewAccessibility *)self _thaxEditing])
  {
    if ([(THNotesDetailTableViewHeaderViewAccessibility *)self _thaxSelected]) {
      CFStringRef v3 = @"notes.heading.editing.selected.hint.ios";
    }
    else {
      CFStringRef v3 = @"notes.heading.editing.hint.ios";
    }
    return THAccessibilityLocalizedString((uint64_t)v3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)THNotesDetailTableViewHeaderViewAccessibility;
    return [(THNotesDetailTableViewHeaderViewAccessibility *)&v5 accessibilityHint];
  }
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewHeaderViewAccessibility;
  unint64_t v3 = [(THNotesDetailTableViewHeaderViewAccessibility *)&v5 accessibilityTraits];
  if ([(THNotesDetailTableViewHeaderViewAccessibility *)self _thaxSelected]) {
    return UIAccessibilityTraitSelected | v3;
  }
  else {
    return v3 & ~UIAccessibilityTraitSelected;
  }
}

- (BOOL)_thaxSelected
{
  return [(THNotesDetailTableViewHeaderViewAccessibility *)self tsaxBoolValueForKey:@"selected"];
}

- (BOOL)_thaxEditing
{
  return [(THNotesDetailTableViewHeaderViewAccessibility *)self tsaxBoolValueForKey:@"editing"];
}

- (UIView)_thaxCellContentView
{
  char v5 = 0;
  unint64_t v3 = (objc_class *)objc_opt_class();
  result = (UIView *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THNotesDetailTableViewHeaderViewAccessibility *)self tsaxValueForKey:@"cellContentView"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end
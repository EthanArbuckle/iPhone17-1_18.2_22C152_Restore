@interface THNotesSidebarTableCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (UILabel)_thaxChapterLabel;
- (UILabel)_thaxChapterName;
- (UILabel)_thaxCountLabel;
- (id)_thaxNoResultsLabel;
- (id)_thaxNoteCountLabel;
- (id)accessibilityLabel;
@end

@implementation THNotesSidebarTableCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"THNotesSidebarTableCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  if ([(THNotesSidebarTableCellAccessibility *)self _thaxNoResultsLabel])
  {
    id v3 = [(THNotesSidebarTableCellAccessibility *)self _thaxNoResultsLabel];
    return [v3 text];
  }
  else
  {
    v5 = [(UILabel *)[(THNotesSidebarTableCellAccessibility *)self _thaxChapterLabel] text];
    v6 = [(UILabel *)[(THNotesSidebarTableCellAccessibility *)self _thaxChapterName] text];
    v7 = [(char *)[THNotesSidebarTableCellAccessibility _thaxNoteCountLabel](self, "_thaxNoteCountLabel") text] integerValue];
    id v8 = TSAccessibilityLocalizedNumber((uint64_t)+[NSNumber numberWithInteger:v7]);
    if (v7 == (unsigned char *)&dword_0 + 1) {
      CFStringRef v9 = @"notes.count.singular.format %@";
    }
    else {
      CFStringRef v9 = @"notes.count.plural.format %@";
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)v9), v8);
    return __TSAccessibilityStringForVariables(1, v5, v10, v11, v12, v13, v14, v15, (uint64_t)v6);
  }
}

- (id)_thaxNoteCountLabel
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THNotesSidebarTableCellAccessibility *)self tsaxValueForKey:@"countLabel"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UILabel)_thaxChapterLabel
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UILabel *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THNotesSidebarTableCellAccessibility *)self tsaxValueForKey:@"chapterLabel"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_thaxNoResultsLabel
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THNotesSidebarTableCellAccessibility *)self tsaxValueForKey:@"noResultsLabel"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UILabel)_thaxChapterName
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UILabel *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THNotesSidebarTableCellAccessibility *)self tsaxValueForKey:@"chapterName"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UILabel)_thaxCountLabel
{
  return self->__thaxCountLabel;
}

@end
@interface THNotesDetailTableViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxIsEditing;
- (BOOL)selectAllNotes;
- (NSDictionary)_thaxSelectedNotes;
- (UITableView)_thaxTableView;
- (unint64_t)_thaxNumberOfSelectedNotes;
- (void)_thaxAnnounceNumberOfSelectedNotes;
- (void)deleteSelectedNotes;
- (void)deselectAllNotes;
- (void)notesDetailTableViewHeaderView:(id)a3 selected:(BOOL)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation THNotesDetailTableViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THNotesDetailTableViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  [(THNotesDetailTableViewControllerAccessibility *)&v5 tableView:a3 didSelectRowAtIndexPath:a4];
  if ([(THNotesDetailTableViewControllerAccessibility *)self _thaxIsEditing]) {
    [(THNotesDetailTableViewControllerAccessibility *)self _thaxAnnounceNumberOfSelectedNotes];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  [(THNotesDetailTableViewControllerAccessibility *)&v5 tableView:a3 didDeselectRowAtIndexPath:a4];
  if ([(THNotesDetailTableViewControllerAccessibility *)self _thaxIsEditing]) {
    [(THNotesDetailTableViewControllerAccessibility *)self _thaxAnnounceNumberOfSelectedNotes];
  }
}

- (void)notesDetailTableViewHeaderView:(id)a3 selected:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  [(THNotesDetailTableViewControllerAccessibility *)&v5 notesDetailTableViewHeaderView:a3 selected:a4];
  if ([(THNotesDetailTableViewControllerAccessibility *)self _thaxIsEditing]) {
    [(THNotesDetailTableViewControllerAccessibility *)self _thaxAnnounceNumberOfSelectedNotes];
  }
}

- (BOOL)selectAllNotes
{
  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  BOOL v3 = [(THNotesDetailTableViewControllerAccessibility *)&v5 selectAllNotes];
  [(THNotesDetailTableViewControllerAccessibility *)self _thaxAnnounceNumberOfSelectedNotes];
  return v3;
}

- (void)deselectAllNotes
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  [(THNotesDetailTableViewControllerAccessibility *)&v3 deselectAllNotes];
  [(THNotesDetailTableViewControllerAccessibility *)self _thaxAnnounceNumberOfSelectedNotes];
}

- (void)deleteSelectedNotes
{
  uint64_t v3 = [(THNotesDetailTableViewControllerAccessibility *)self _thaxNumberOfSelectedNotes];
  id v4 = TSAccessibilityLocalizedUnsignedInteger(v3);
  v6.receiver = self;
  v6.super_class = (Class)THNotesDetailTableViewControllerAccessibility;
  [(THNotesDetailTableViewControllerAccessibility *)&v6 deleteSelectedNotes];
  if (v3 == 1) {
    CFStringRef v5 = @"%@ note deleted";
  }
  else {
    CFStringRef v5 = @"%@ notes deleted";
  }
  TSAccessibilityPostHighPriorityAnnouncementNotification((uint64_t)self, (uint64_t)+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v4));
}

- (void)_thaxAnnounceNumberOfSelectedNotes
{
  uint64_t v3 = [(THNotesDetailTableViewControllerAccessibility *)self _thaxNumberOfSelectedNotes];
  id v4 = TSAccessibilityLocalizedUnsignedInteger(v3);
  if (v3 == 1) {
    CFStringRef v5 = @"%@ note selected";
  }
  else {
    CFStringRef v5 = @"%@ notes selected";
  }
  objc_super v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v4);

  TSAccessibilityPostHighPriorityAnnouncementNotification((uint64_t)self, (uint64_t)v6);
}

- (BOOL)_thaxIsEditing
{
  v2 = [(THNotesDetailTableViewControllerAccessibility *)self _thaxTableView];

  return [(UITableView *)v2 isEditing];
}

- (UITableView)_thaxTableView
{
  char v5 = 0;
  uint64_t v3 = (objc_class *)objc_opt_class();
  result = (UITableView *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THNotesDetailTableViewControllerAccessibility *)self tsaxValueForKey:@"tableView"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (unint64_t)_thaxNumberOfSelectedNotes
{
  v2 = [(THNotesDetailTableViewControllerAccessibility *)self _thaxSelectedNotes];

  return [(NSDictionary *)v2 count];
}

- (NSDictionary)_thaxSelectedNotes
{
  char v5 = 0;
  uint64_t v3 = (objc_class *)objc_opt_class();
  result = (NSDictionary *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THNotesDetailTableViewControllerAccessibility *)self tsaxValueForKey:@"mSelectedNotes"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end
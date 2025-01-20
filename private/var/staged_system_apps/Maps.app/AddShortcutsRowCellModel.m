@interface AddShortcutsRowCellModel
- (BOOL)isEqual:(id)a3;
- (BOOL)vibrantBackground;
- (id)_maps_diffableDataSourceIdentifier;
- (id)image;
- (id)title;
- (int64_t)contentMode;
- (unint64_t)hash;
@end

@implementation AddShortcutsRowCellModel

- (id)title
{
  unsigned int v2 = +[LibraryUIUtilities isMyPlacesEnabled];
  v3 = +[NSBundle mainBundle];
  v4 = v3;
  if (v2) {
    CFStringRef v5 = @"[Proactive Tray] Add Pin";
  }
  else {
    CFStringRef v5 = @"[Proactive Tray] Add Shortcut";
  }
  v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)_maps_diffableDataSourceIdentifier
{
  return @"AddShortcut";
}

- (BOOL)vibrantBackground
{
  return 1;
}

- (id)image
{
  return +[UIImage systemImageNamed:@"plus"];
}

- (int64_t)contentMode
{
  return 4;
}

- (unint64_t)hash
{
  unsigned int v2 = [(AddShortcutsRowCellModel *)self title];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

@end
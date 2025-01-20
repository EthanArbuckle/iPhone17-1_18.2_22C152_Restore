@interface HomeSection
- (BOOL)hasOrthogonalLayout;
- (BOOL)showsSectionButton;
- (HomeSection)initWithType:(int64_t)a3 contents:(id)a4 showsSectionButton:(BOOL)a5 customLocalizedName:(id)a6;
- (NSArray)contents;
- (NSString)_maps_diffableDataSourceIdentifier;
- (NSString)localizedButtonName;
- (NSString)localizedName;
- (UIKeyCommand)keyCommand;
- (int64_t)type;
@end

@implementation HomeSection

- (HomeSection)initWithType:(int64_t)a3 contents:(id)a4 showsSectionButton:(BOOL)a5 customLocalizedName:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HomeSection;
  v12 = [(HomeSection *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    v14 = (NSArray *)[v10 copy];
    contents = v13->_contents;
    v13->_contents = v14;

    v13->_showsSectionButton = a5;
    v16 = (NSString *)[v11 copy];
    customLocalizedName = v13->_customLocalizedName;
    v13->_customLocalizedName = v16;
  }
  return v13;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 5) {
    return 0;
  }
  else {
    return &off_1012E7260[v2]->isa;
  }
}

- (NSString)localizedButtonName
{
  unint64_t type = self->_type;
  BOOL v3 = type > 5;
  uint64_t v4 = (1 << type) & 0x2C;
  if (v3 || v4 == 0)
  {
    v7 = 0;
  }
  else
  {
    v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"[Proactive Tray] More Button" value:@"localized string not found" table:0];
  }

  return (NSString *)v7;
}

- (NSString)localizedName
{
  customLocalizedName = self->_customLocalizedName;
  if (customLocalizedName)
  {
    BOOL v3 = customLocalizedName;
  }
  else
  {
    BOOL v3 = &stru_101324E70;
    switch(self->_type)
    {
      case 1:
        unsigned int v4 = +[MapsSuggestionsSiri isEnabled];
        v5 = +[NSBundle mainBundle];
        v6 = v5;
        if (v4) {
          CFStringRef v7 = @"[Proactive Tray] Suggestion Section";
        }
        else {
          CFStringRef v7 = @"[Proactive Tray] Shared Trip Section";
        }
        goto LABEL_11;
      case 2:
        v5 = +[NSBundle mainBundle];
        v6 = v5;
        CFStringRef v7 = @"[Proactive Tray] Favorites Section";
        goto LABEL_11;
      case 3:
        v5 = +[NSBundle mainBundle];
        v6 = v5;
        CFStringRef v7 = @"[Proactive Tray] Guides Section";
        goto LABEL_11;
      case 5:
        v5 = +[NSBundle mainBundle];
        v6 = v5;
        CFStringRef v7 = @"[Proactive Tray] Recents Section";
LABEL_11:
        BOOL v3 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

        break;
      default:
        break;
    }
  }

  return (NSString *)v3;
}

- (BOOL)hasOrthogonalLayout
{
  return ((self->_type - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (UIKeyCommand)keyCommand
{
  unint64_t v2 = 0;
  int64_t type = self->_type;
  switch(type)
  {
    case 0:
    case 1:
    case 4:
    case 6:
      goto LABEL_7;
    case 2:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"[Proactive Tray] See All Favorites Command";
      goto LABEL_5;
    case 3:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"[Proactive Tray] See All My Guides Command";
      goto LABEL_5;
    case 5:
      v5 = +[NSBundle mainBundle];
      v6 = v5;
      CFStringRef v7 = @"[Proactive Tray] See All Recents Command";
LABEL_5:
      unint64_t v2 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

      int64_t type = self->_type;
      break;
    default:
      break;
  }
  v8 = +[NSNumber numberWithInteger:type];
  v9 = [v8 stringValue];
  uint64_t v10 = +[UIKeyCommand commandWithTitle:v2 image:0 action:"handleHomeSectionKeyCommand:" input:v9 modifierFlags:1572864 propertyList:0];

  unint64_t v2 = (void *)v10;
LABEL_7:

  return (UIKeyCommand *)v2;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)contents
{
  return self->_contents;
}

- (BOOL)showsSectionButton
{
  return self->_showsSectionButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);

  objc_storeStrong((id *)&self->_customLocalizedName, 0);
}

@end
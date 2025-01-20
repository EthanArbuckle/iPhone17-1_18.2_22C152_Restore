@interface UserProfileLinkPreferencesProvider
+ (id)sharedInstance;
- (GEOObserverHashTable)observers;
- (UserProfileLinkPreferencesProvider)init;
- (id)createUserProfileLink;
- (id)retrieveTravelPreference;
- (int64_t)userProfileLinkType;
- (void)_updateLinkAndNotifyObservers:(BOOL)a3;
- (void)dealloc;
@end

@implementation UserProfileLinkPreferencesProvider

+ (id)sharedInstance
{
  if (qword_101610E78 != -1) {
    dispatch_once(&qword_101610E78, &stru_101320B48);
  }
  v2 = (void *)qword_101610E70;

  return v2;
}

- (UserProfileLinkPreferencesProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)UserProfileLinkPreferencesProvider;
  v2 = [(UserProfileLinkPreferencesProvider *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v7 = v2;
    uint64_t v4 = _GEOConfigAddBlockListenerForKey();
    id transportTypeChangedListener = v7->_transportTypeChangedListener;
    v7->_id transportTypeChangedListener = (id)v4;
  }
  return v3;
}

- (void)dealloc
{
  GEOConfigRemoveBlockListener();
  v3.receiver = self;
  v3.super_class = (Class)UserProfileLinkPreferencesProvider;
  [(UserProfileLinkPreferencesProvider *)&v3 dealloc];
}

- (id)createUserProfileLink
{
  objc_super v3 = +[UIScreen mainScreen];
  uint64_t v4 = sub_1000BBB44(v3);
  v5 = +[NSBundle mainBundle];
  v6 = v5;
  if (v4 == 5) {
    CFStringRef v7 = @"[User Profile Preferences] Preferences (macOS)";
  }
  else {
    CFStringRef v7 = @"[User Profile Preferences] Preferences (iOS)";
  }
  objc_super v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

  v9 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  v10 = [v9 fontDescriptorWithSymbolicTraits:2];
  v11 = +[UIFont fontWithDescriptor:v10 size:15.0];

  v12 = +[UIImage systemImageNamed:@"switch.2"];
  v13 = +[UIImageSymbolConfiguration configurationWithFont:v11];
  v14 = [v12 imageWithConfiguration:v13];

  v15 = [[UserProfileLink alloc] initWithTitle:v8 icon:v14];
  newLink = self->_newLink;
  self->_newLink = v15;

  [(UserProfileLink *)self->_newLink setUserProfileLinkType:[(UserProfileLinkPreferencesProvider *)self userProfileLinkType]];
  v17 = +[UIDevice currentDevice];
  id v18 = [v17 userInterfaceIdiom];

  if (v18 != (id)5)
  {
    v19 = [(UserProfileLinkPreferencesProvider *)self retrieveTravelPreference];
    [(UserProfileLink *)self->_newLink setSubtitle:v19];
  }
  v20 = self->_newLink;

  return v20;
}

- (int64_t)userProfileLinkType
{
  return 6;
}

- (id)retrieveTravelPreference
{
  switch(GEOGetUserTransportTypePreference())
  {
    case 1:
      v2 = +[NSBundle mainBundle];
      objc_super v3 = v2;
      CFStringRef v4 = @"[User Profile Preferences] Preferred Transport Type - Walking";
      break;
    case 2:
      v2 = +[NSBundle mainBundle];
      objc_super v3 = v2;
      CFStringRef v4 = @"[User Profile Preferences] Preferred Transport Type - Transit";
      break;
    case 3:
      v2 = +[NSBundle mainBundle];
      objc_super v3 = v2;
      CFStringRef v4 = @"[User Profile Preferences] Preferred Transport Type - Ridesharing";
      break;
    case 4:
      v2 = +[NSBundle mainBundle];
      objc_super v3 = v2;
      CFStringRef v4 = @"[User Profile Preferences] Preferred Transport Type - Cycling";
      break;
    default:
      v2 = +[NSBundle mainBundle];
      objc_super v3 = v2;
      CFStringRef v4 = @"[User Profile Preferences] Preferred Transport Type - Driving";
      break;
  }
  v5 = [v2 localizedStringForKey:v4 value:@"localized string not found" table:0];

  return v5;
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    CFStringRef v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___UserProfileLinkDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)_updateLinkAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(UserProfileLinkPreferencesProvider *)self retrieveTravelPreference];
  v5 = [(UserProfileLink *)self->_newLink subtitle];
  unsigned __int8 v6 = [v5 isEqualToString:v7];

  if ((v6 & 1) == 0)
  {
    [(UserProfileLink *)self->_newLink setSubtitle:v7];
    if (v3) {
      [(GEOObserverHashTable *)self->_observers dataDidUpdateForUserProfileLinkType:[(UserProfileLinkPreferencesProvider *)self userProfileLinkType]];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_transportTypeChangedListener, 0);

  objc_storeStrong((id *)&self->_newLink, 0);
}

@end
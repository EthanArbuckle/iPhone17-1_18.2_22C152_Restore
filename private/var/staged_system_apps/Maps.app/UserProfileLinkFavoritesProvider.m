@interface UserProfileLinkFavoritesProvider
+ (id)sharedInstance;
- (GEOObserverHashTable)observers;
- (UserProfileLinkFavoritesProvider)init;
- (id)createUserProfileLink;
- (id)retrieveSubtitleText;
- (int64_t)userProfileLinkType;
- (void)_updateLinkAndNotifyObservers:(BOOL)a3;
- (void)shortcutManagerMeCardDidChange:(id)a3;
@end

@implementation UserProfileLinkFavoritesProvider

+ (id)sharedInstance
{
  if (qword_101610248 != -1) {
    dispatch_once(&qword_101610248, &stru_101312790);
  }
  v2 = (void *)qword_101610240;

  return v2;
}

- (UserProfileLinkFavoritesProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)UserProfileLinkFavoritesProvider;
  v2 = [(UserProfileLinkFavoritesProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ShortcutManager sharedManager];
    shortcutManager = v2->_shortcutManager;
    v2->_shortcutManager = (ShortcutManager *)v3;

    [(ShortcutManager *)v2->_shortcutManager addObserver:v2];
  }
  return v2;
}

- (id)createUserProfileLink
{
  uint64_t v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[User Profile Favorites] Favorites" value:@"localized string not found" table:0];

  v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  objc_super v6 = [v5 fontDescriptorWithSymbolicTraits:2];
  v7 = +[UIFont fontWithDescriptor:v6 size:15.0];

  v8 = +[UIImage systemImageNamed:@"star.fill"];
  v9 = +[UIImageSymbolConfiguration configurationWithFont:v7];
  v10 = [v8 imageWithConfiguration:v9];

  v11 = [[UserProfileLink alloc] initWithTitle:v4 icon:v10];
  newLink = self->_newLink;
  self->_newLink = v11;

  [(UserProfileLink *)self->_newLink setUserProfileLinkType:[(UserProfileLinkFavoritesProvider *)self userProfileLinkType]];
  v13 = +[UserInformationManager sharedInstance];
  self->_loggedIn = [v13 loggedIn];

  v14 = [(UserProfileLinkFavoritesProvider *)self retrieveSubtitleText];
  [(UserProfileLink *)self->_newLink setSubtitle:v14];

  v15 = self->_newLink;
  return v15;
}

- (int64_t)userProfileLinkType
{
  return 1;
}

- (id)retrieveSubtitleText
{
  v2 = [(ShortcutManager *)self->_shortcutManager meCard];
  uint64_t v3 = [v2 mapItemsForAll];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = +[NSString localizedStringWithFormat:@"%ld", v4];
  }
  else
  {
    objc_super v6 = +[NSBundle mainBundle];
    v5 = [v6 localizedStringForKey:@"[User Profile Favorites] Add" value:@"localized string not found" table:0];
  }

  return v5;
}

- (void)_updateLinkAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(UserProfileLinkFavoritesProvider *)self retrieveSubtitleText];
  v5 = [(UserProfileLink *)self->_newLink subtitle];
  unsigned __int8 v6 = [v5 isEqualToString:v7];

  if ((v6 & 1) == 0)
  {
    [(UserProfileLink *)self->_newLink setSubtitle:v7];
    if (v3) {
      [(GEOObserverHashTable *)self->_observers dataDidUpdateForUserProfileLinkType:[(UserProfileLinkFavoritesProvider *)self userProfileLinkType]];
    }
  }
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    id v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___UserProfileLinkDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)shortcutManagerMeCardDidChange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_shortcutManager, 0);

  objc_storeStrong((id *)&self->_newLink, 0);
}

@end
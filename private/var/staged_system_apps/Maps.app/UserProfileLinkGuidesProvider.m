@interface UserProfileLinkGuidesProvider
+ (id)sharedInstance;
- (GEOObserverHashTable)observers;
- (UserProfileLinkGuidesProvider)init;
- (id)createUserProfileLink;
- (id)retrieveSubtitleText;
- (int64_t)userProfileLinkType;
- (void)_updateLinkAndNotifyObservers:(BOOL)a3;
- (void)collectionManager:(id)a3 contentDidChange:(id)a4;
@end

@implementation UserProfileLinkGuidesProvider

+ (id)sharedInstance
{
  if (qword_101611050 != -1) {
    dispatch_once(&qword_101611050, &stru_101322920);
  }
  v2 = (void *)qword_101611048;

  return v2;
}

- (UserProfileLinkGuidesProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)UserProfileLinkGuidesProvider;
  v2 = [(UserProfileLinkGuidesProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[CollectionManager sharedManager];
    collectionManager = v2->_collectionManager;
    v2->_collectionManager = (CollectionManager *)v3;

    [(CollectionManager *)v2->_collectionManager addObserver:v2];
  }
  return v2;
}

- (id)createUserProfileLink
{
  uint64_t v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[User Profile Guides] Guides" value:@"localized string not found" table:0];

  v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  objc_super v6 = [v5 fontDescriptorWithSymbolicTraits:2];
  v7 = +[UIFont fontWithDescriptor:v6 size:15.0];

  v8 = +[UIImage _systemImageNamed:@"pin.point.of.interest.2.fill"];
  v9 = +[UIImageSymbolConfiguration configurationWithFont:v7];
  v10 = [v8 imageWithConfiguration:v9];

  v11 = [[UserProfileLink alloc] initWithTitle:v4 icon:v10];
  newLink = self->_newLink;
  self->_newLink = v11;

  [(UserProfileLink *)self->_newLink setUserProfileLinkType:[(UserProfileLinkGuidesProvider *)self userProfileLinkType]];
  v13 = +[UserInformationManager sharedInstance];
  self->_loggedIn = [v13 loggedIn];

  v14 = [(UserProfileLinkGuidesProvider *)self retrieveSubtitleText];
  [(UserProfileLink *)self->_newLink setSubtitle:v14];

  v15 = self->_newLink;
  return v15;
}

- (int64_t)userProfileLinkType
{
  return 2;
}

- (id)retrieveSubtitleText
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  v4 = +[CollectionManager sharedManager];
  v5 = v4;
  if (v3 == (id)5) {
    [v4 currentCollectionsForMacHome];
  }
  else {
  objc_super v6 = [v4 currentCollectionsForiOSHome];
  }
  id v7 = [v6 count];

  if (v7)
  {
    v8 = +[NSString localizedStringWithFormat:@"%ld", v7];
  }
  else
  {
    v9 = +[NSBundle mainBundle];
    v8 = [v9 localizedStringForKey:@"[User Profile Guides] Add" value:@"localized string not found" table:0];
  }

  return v8;
}

- (void)_updateLinkAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(UserProfileLinkGuidesProvider *)self retrieveSubtitleText];
  v5 = [(UserProfileLink *)self->_newLink subtitle];
  unsigned __int8 v6 = [v5 isEqualToString:v7];

  if ((v6 & 1) == 0)
  {
    [(UserProfileLink *)self->_newLink setSubtitle:v7];
    if (v3) {
      [(GEOObserverHashTable *)self->_observers dataDidUpdateForUserProfileLinkType:[(UserProfileLinkGuidesProvider *)self userProfileLinkType]];
    }
  }
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___UserProfileLinkDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_collectionManager, 0);

  objc_storeStrong((id *)&self->_newLink, 0);
}

@end
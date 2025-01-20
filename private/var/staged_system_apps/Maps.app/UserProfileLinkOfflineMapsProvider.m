@interface UserProfileLinkOfflineMapsProvider
+ (id)sharedInstance;
- (GEOObserverHashTable)observers;
- (UserProfileLinkOfflineMapsProvider)init;
- (id)createUserProfileLink;
- (id)retrieveSubtitleText;
- (int64_t)userProfileLinkType;
- (void)_updateLinkAndNotifyObservers;
@end

@implementation UserProfileLinkOfflineMapsProvider

+ (id)sharedInstance
{
  if (qword_10160F518 != -1) {
    dispatch_once(&qword_10160F518, &stru_1012F40D0);
  }
  v2 = (void *)qword_10160F510;

  return v2;
}

- (UserProfileLinkOfflineMapsProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)UserProfileLinkOfflineMapsProvider;
  v2 = [(UserProfileLinkOfflineMapsProvider *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_updateLinkAndNotifyObservers" name:@"OfflineMapsSubscriptionsDidChangeNotification" object:0];
  }
  return v2;
}

- (id)createUserProfileLink
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[User Profile] Offline Maps" value:@"localized string not found" table:@"Offline"];

  objc_super v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  v6 = [v5 fontDescriptorWithSymbolicTraits:2];
  v7 = +[UIFont fontWithDescriptor:v6 size:15.0];

  v8 = +[UIImage systemImageNamed:@"icloud.slash.fill"];
  v9 = +[UIImageSymbolConfiguration configurationWithFont:v7];
  v10 = [v8 imageWithConfiguration:v9];

  v11 = [[UserProfileLink alloc] initWithTitle:v4 icon:v10];
  newLink = self->_newLink;
  self->_newLink = v11;

  [(UserProfileLink *)self->_newLink setUserProfileLinkType:[(UserProfileLinkOfflineMapsProvider *)self userProfileLinkType]];
  v13 = [(UserProfileLinkOfflineMapsProvider *)self retrieveSubtitleText];
  [(UserProfileLink *)self->_newLink setSubtitle:v13];

  v14 = self->_newLink;
  return v14;
}

- (int64_t)userProfileLinkType
{
  return 7;
}

- (id)retrieveSubtitleText
{
  if (GEOSupportsOfflineMaps())
  {
    v2 = +[MapsOfflineUIHelper sharedHelper];
    v3 = [v2 subscriptions];
    id v4 = [v3 count];

    if (v4)
    {
      objc_super v5 = +[NSString localizedStringWithFormat:@"%ld", v4];
      goto LABEL_7;
    }
    v6 = +[NSBundle mainBundle];
    v7 = v6;
    CFStringRef v8 = @"[User Profile] Download";
  }
  else
  {
    v6 = +[NSBundle mainBundle];
    v7 = v6;
    CFStringRef v8 = @"[User Profile] Not available";
  }
  objc_super v5 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:@"Offline"];

LABEL_7:

  return v5;
}

- (void)_updateLinkAndNotifyObservers
{
  id v5 = [(UserProfileLinkOfflineMapsProvider *)self retrieveSubtitleText];
  v3 = [(UserProfileLink *)self->_newLink subtitle];
  unsigned __int8 v4 = [v3 isEqualToString:v5];

  if ((v4 & 1) == 0)
  {
    [(UserProfileLink *)self->_newLink setSubtitle:v5];
    [(GEOObserverHashTable *)self->_observers dataDidUpdateForUserProfileLinkType:[(UserProfileLinkOfflineMapsProvider *)self userProfileLinkType]];
  }
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    unsigned __int8 v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___UserProfileLinkDataProvidingObserver queue:0];
    id v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_newLink, 0);
}

@end
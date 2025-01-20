@interface UserProfileLinkReportsProvider
+ (id)sharedInstance;
- (GEOObserverHashTable)observers;
- (UserProfileLinkReportsProvider)init;
- (id)createUserProfileLink;
- (id)retrieveSubtitleText;
- (int64_t)userProfileLinkType;
- (void)_updateLinkAndNotifyObservers:(BOOL)a3;
- (void)reportHistoryManagerDidUpdate:(id)a3;
- (void)userDataDidUpdate;
@end

@implementation UserProfileLinkReportsProvider

+ (id)sharedInstance
{
  if (qword_10160EF40 != -1) {
    dispatch_once(&qword_10160EF40, &stru_1012ED4F8);
  }
  v2 = (void *)qword_10160EF38;

  return v2;
}

- (UserProfileLinkReportsProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)UserProfileLinkReportsProvider;
  v2 = [(UserProfileLinkReportsProvider *)&v8 init];
  if (v2)
  {
    v3 = +[UserProfileReportHistoryManager sharedInstance];
    v4 = [v3 observers];
    [v4 registerObserver:v2];

    v5 = +[UserInformationManager sharedInstance];
    v6 = [v5 observers];
    [v6 registerObserver:v2];
  }
  return v2;
}

- (id)createUserProfileLink
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[User Profile Reports] Reports" value:@"localized string not found" table:0];

  v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  v6 = [v5 fontDescriptorWithSymbolicTraits:2];
  v7 = +[UIFont fontWithDescriptor:v6 size:15.0];

  objc_super v8 = +[UIImage _systemImageNamed:@"exclamationmark.bubble.fill"];
  v9 = +[UIImageSymbolConfiguration configurationWithFont:v7];
  v10 = [v8 imageWithConfiguration:v9];

  v11 = [[UserProfileLink alloc] initWithTitle:v4 icon:v10];
  newLink = self->_newLink;
  self->_newLink = v11;

  [(UserProfileLink *)self->_newLink setUserProfileLinkType:[(UserProfileLinkReportsProvider *)self userProfileLinkType]];
  v13 = [(UserProfileLinkReportsProvider *)self retrieveSubtitleText];
  [(UserProfileLink *)self->_newLink setSubtitle:v13];

  v14 = self->_newLink;
  return v14;
}

- (int64_t)userProfileLinkType
{
  return 3;
}

- (id)retrieveSubtitleText
{
  v2 = +[UserInformationManager sharedInstance];
  unsigned int v3 = [v2 loggedIn];

  if (v3
    && (+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"), v4 = objc_claimAutoreleasedReturnValue(), [v4 rapHistory], v5 = objc_claimAutoreleasedReturnValue(), id v6 = objc_msgSend(v5, "count"), v5, v4, v6))
  {
    v7 = +[NSString localizedStringWithFormat:@"%ld", v6];
  }
  else
  {
    v7 = &stru_101324E70;
  }

  return v7;
}

- (void)_updateLinkAndNotifyObservers:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(UserProfileLinkReportsProvider *)self retrieveSubtitleText];
  v5 = [(UserProfileLink *)self->_newLink subtitle];
  unsigned __int8 v6 = [v5 isEqualToString:v7];

  if ((v6 & 1) == 0)
  {
    [(UserProfileLink *)self->_newLink setSubtitle:v7];
    if (v3) {
      [(GEOObserverHashTable *)self->_observers dataDidUpdateForUserProfileLinkType:[(UserProfileLinkReportsProvider *)self userProfileLinkType]];
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

- (void)reportHistoryManagerDidUpdate:(id)a3
{
}

- (void)userDataDidUpdate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_newLink, 0);
}

@end
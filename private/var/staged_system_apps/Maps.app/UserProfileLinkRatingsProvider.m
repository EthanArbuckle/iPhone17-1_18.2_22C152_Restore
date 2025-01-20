@interface UserProfileLinkRatingsProvider
+ (id)sharedInstance;
- (BOOL)hasRatings;
- (GEOObserverHashTable)observers;
- (UserProfileLinkRatingsProvider)init;
- (id)createUserProfileLink;
- (id)retrieveSubtitleText;
- (int64_t)userProfileLinkType;
- (void)_fetchCount;
- (void)_updateLinkWithCount:(int64_t)a3 notifyObservers:(BOOL)a4;
@end

@implementation UserProfileLinkRatingsProvider

+ (id)sharedInstance
{
  if (qword_1016102F0 != -1) {
    dispatch_once(&qword_1016102F0, &stru_101313178);
  }
  v2 = (void *)qword_1016102E8;

  return v2;
}

- (UserProfileLinkRatingsProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)UserProfileLinkRatingsProvider;
  v2 = [(UserProfileLinkRatingsProvider *)&v5 init];
  if (v2)
  {
    v3 = +[UGCReviewedPlaceMapsSync sharedInstance];
    [v3 registerObserver:v2];

    [(UserProfileLinkRatingsProvider *)v2 _fetchCount];
  }
  return v2;
}

- (id)createUserProfileLink
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[User Profile Ratings & Photos] Ratings & Photos" value:@"localized string not found" table:0];

  objc_super v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  v6 = [v5 fontDescriptorWithSymbolicTraits:2];
  v7 = +[UIFont fontWithDescriptor:v6 size:15.0];

  v8 = +[UIImage systemImageNamed:@"hand.thumbsup.fill"];
  v9 = +[UIImageSymbolConfiguration configurationWithFont:v7];
  v10 = [v8 imageWithConfiguration:v9];

  v11 = [[UserProfileLink alloc] initWithTitle:v4 icon:v10];
  newLink = self->_newLink;
  self->_newLink = v11;

  [(UserProfileLink *)self->_newLink setUserProfileLinkType:[(UserProfileLinkRatingsProvider *)self userProfileLinkType]];
  v13 = [(UserProfileLinkRatingsProvider *)self retrieveSubtitleText];
  [(UserProfileLink *)self->_newLink setSubtitle:v13];

  v14 = self->_newLink;
  return v14;
}

- (int64_t)userProfileLinkType
{
  return 4;
}

- (id)retrieveSubtitleText
{
  int64_t count = self->_count;
  if (count)
  {
    v3 = +[NSString localizedStringWithFormat:@"%ld", count];
  }
  else
  {
    v4 = +[NSBundle mainBundle];
    v3 = [v4 localizedStringForKey:@"[User Profile Ratings] Add" value:@"localized string not found" table:0];
  }

  return v3;
}

- (BOOL)hasRatings
{
  return self->_count > 0;
}

- (void)_fetchCount
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1009BBD64;
  v2[3] = &unk_1012E9BD0;
  objc_copyWeak(&v3, &location);
  +[UGCReviewedPlaceManager fetchAllHistoryObjectsFromStorageWithCompletion:v2];
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_updateLinkWithCount:(int64_t)a3 notifyObservers:(BOOL)a4
{
  BOOL v4 = a4;
  v8 = sub_100011FD4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    int v14 = 138412802;
    v15 = v10;
    __int16 v16 = 2112;
    v17 = v11;
    __int16 v18 = 1024;
    int v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@, int64_t count = %d", (uint8_t *)&v14, 0x1Cu);
  }
  if (self->_count != a3)
  {
    self->_int64_t count = a3;
    v12 = [(UserProfileLinkRatingsProvider *)self retrieveSubtitleText];
    [(UserProfileLink *)self->_newLink setSubtitle:v12];

    if (v4)
    {
      v13 = [(UserProfileLinkRatingsProvider *)self observers];
      [v13 dataDidUpdateForUserProfileLinkType:[self userProfileLinkType]];
    }
  }
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    BOOL v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___UserProfileLinkDataProvidingObserver queue:0];
    objc_super v5 = self->_observers;
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
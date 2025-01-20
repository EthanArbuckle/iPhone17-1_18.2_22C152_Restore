@interface UserInformationManager
+ (id)sharedInstance;
- (AAUIProfilePictureStore)profilePictureStore;
- (ACAccount)account;
- (BOOL)loggedIn;
- (GEOObserverHashTable)observers;
- (NSPersonNameComponentsFormatter)nameFormatter;
- (NSString)userEmail;
- (NSString)userGivenName;
- (NSString)userName;
- (UIImage)loggedOutIcon;
- (UIImage)userIcon;
- (UserInformationManager)init;
- (void)_handleProfilePictureStoreDidChangeNotification:(id)a3;
- (void)_retrieveUserProfilePicture;
- (void)_retrieveUserProfilePictureWithImageCreationCompletion:(id)a3;
- (void)_throttledProfilePictureTimerUpdate:(id)a3;
- (void)_updateAndNotifyObservers:(BOOL)a3;
- (void)dealloc;
- (void)retrieveAddressForLocationWithCompletion:(id)a3;
@end

@implementation UserInformationManager

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___UserDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (BOOL)loggedIn
{
  v2 = [(UserInformationManager *)self account];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_retrieveUserProfilePicture
{
  objc_initWeak(&location, self);
  profilePictureQueue = self->_profilePictureQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001ACC8;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(profilePictureQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_retrieveUserProfilePictureWithImageCreationCompletion:(id)a3
{
  id v4 = a3;
  if ([(UserInformationManager *)self loggedIn])
  {
    id v5 = [(UserInformationManager *)self profilePictureStore];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1008B6B34;
    v11[3] = &unk_1012F9198;
    v6 = &v12;
    id v12 = v4;
    id v7 = v4;
    [v5 fetchProfilePictureForAccountOwner:v11];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002D330;
    block[3] = &unk_1012E5F78;
    v6 = &v10;
    block[4] = self;
    id v10 = v4;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (UserInformationManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)UserInformationManager;
  v2 = [(UserInformationManager *)&v9 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, -1);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.Maps.UserProfile.ProfilePicture", v4);
    profilePictureQueue = v2->_profilePictureQueue;
    v2->_profilePictureQueue = (OS_dispatch_queue *)v5;

    [(UserInformationManager *)v2 _retrieveUserProfilePicture];
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_handleProfilePictureStoreDidChangeNotification:" name:AAUIProfilePictureStoreDidChangeNotification object:0];
  }
  return v2;
}

- (UIImage)loggedOutIcon
{
  loggedOutIcon = self->_loggedOutIcon;
  if (!loggedOutIcon)
  {
    id v4 = +[UIImage systemImageNamed:@"person.crop.circle"];
    dispatch_queue_t v5 = +[UIImageSymbolConfiguration configurationWithPointSize:(uint64_t)UIFontWeightRegular weight:36.0];
    v6 = [v4 imageWithConfiguration:v5];

    id v7 = +[UIColor systemGrayColor];
    id v8 = [v6 imageWithTintColor:v7];
    objc_super v9 = self->_loggedOutIcon;
    self->_loggedOutIcon = v8;

    loggedOutIcon = self->_loggedOutIcon;
  }

  return loggedOutIcon;
}

- (UIImage)userIcon
{
  userIcon = self->_userIcon;
  if (userIcon)
  {
    BOOL v3 = userIcon;
  }
  else
  {
    BOOL v3 = [(UserInformationManager *)self loggedOutIcon];
  }

  return v3;
}

+ (id)sharedInstance
{
  if (qword_10160FE10 != -1) {
    dispatch_once(&qword_10160FE10, &stru_1012FF490);
  }
  v2 = (void *)qword_10160FE08;

  return v2;
}

- (ACAccount)account
{
  return (ACAccount *)+[GEOUserAccountInfo primaryICloudAccount];
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  if (a3) {
    [(GEOObserverHashTable *)self->_observers userDataDidUpdate];
  }
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AAUIProfilePictureStoreDidChangeNotification object:0];

  [(NSTimer *)self->_profilePictureReloadThrottleTimer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)UserInformationManager;
  [(UserInformationManager *)&v4 dealloc];
}

- (AAUIProfilePictureStore)profilePictureStore
{
  BOOL v3 = [(UserInformationManager *)self account];
  profilePictureStore = self->_profilePictureStore;
  if (profilePictureStore) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v6 = objc_alloc_init((Class)ACAccountStore);
    id v7 = (AAUIProfilePictureStore *)[objc_alloc((Class)AAUIProfilePictureStore) initWithAppleAccount:v3 store:v6];
    id v8 = self->_profilePictureStore;
    self->_profilePictureStore = v7;

    profilePictureStore = self->_profilePictureStore;
  }
  objc_super v9 = profilePictureStore;

  return v9;
}

- (NSPersonNameComponentsFormatter)nameFormatter
{
  nameFormatter = self->_nameFormatter;
  if (!nameFormatter)
  {
    objc_super v4 = (NSPersonNameComponentsFormatter *)objc_alloc_init((Class)NSPersonNameComponentsFormatter);
    BOOL v5 = self->_nameFormatter;
    self->_nameFormatter = v4;

    [(NSPersonNameComponentsFormatter *)self->_nameFormatter setStyle:2];
    nameFormatter = self->_nameFormatter;
  }

  return nameFormatter;
}

- (NSString)userName
{
  BOOL v3 = [(UserInformationManager *)self account];
  userName = self->_userName;
  if (userName) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v6 = objc_alloc_init((Class)NSPersonNameComponents);
    id v7 = [v3 aa_firstName];
    [v6 setGivenName:v7];

    id v8 = [v3 aa_middleName];
    [v6 setMiddleName:v8];

    objc_super v9 = [v3 aa_lastName];
    [v6 setFamilyName:v9];

    id v10 = [(UserInformationManager *)self nameFormatter];
    v11 = [v10 stringFromPersonNameComponents:v6];
    id v12 = self->_userName;
    self->_userName = v11;

    userName = self->_userName;
  }
  v13 = userName;

  return v13;
}

- (NSString)userGivenName
{
  BOOL v3 = [(UserInformationManager *)self account];
  userGivenName = self->_userGivenName;
  if (userGivenName) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v6 = objc_alloc_init((Class)NSPersonNameComponents);
    id v7 = [v3 aa_firstName];
    [v6 setGivenName:v7];

    id v8 = [v3 aa_middleName];
    [v6 setMiddleName:v8];

    objc_super v9 = [v3 aa_lastName];
    [v6 setFamilyName:v9];

    id v10 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v6 style:1 options:0];
    v11 = self->_userGivenName;
    self->_userGivenName = v10;

    userGivenName = self->_userGivenName;
  }
  id v12 = userGivenName;

  return v12;
}

- (NSString)userEmail
{
  BOOL v3 = [(UserInformationManager *)self account];
  userEmail = self->_userEmail;
  if (userEmail) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    id v6 = [v3 aa_primaryEmail];
    if ([v6 length])
    {
      unsigned int v7 = [v3 aa_isPrimaryEmailVerified];

      if (!v7)
      {
        id v8 = 0;
        goto LABEL_11;
      }
      id v6 = [v3 aa_primaryEmail];
      id v8 = (NSString *)[v6 copy];
    }
    else
    {
      id v8 = 0;
    }

LABEL_11:
    objc_super v9 = self->_userEmail;
    self->_userEmail = v8;

    userEmail = self->_userEmail;
  }
  id v10 = userEmail;

  return v10;
}

- (void)retrieveAddressForLocationWithCompletion:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[MKLocationManager sharedLocationManager];
  BOOL v5 = [v4 lastLocation];

  if (v5)
  {
    id v6 = +[MKMapService sharedService];
    unsigned int v7 = [v6 ticketForReverseGeocodeLocation:v5];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1008B6E14;
    v8[3] = &unk_1012E7710;
    id v9 = v3;
    [v7 submitWithHandler:v8 networkActivity:0];
  }
}

- (void)_handleProfilePictureStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100011FD4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received notification that profile picture has changed", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v6 = +[MapsSyncService shared];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008B6FF4;
  v7[3] = &unk_1012F02B0;
  objc_copyWeak(&v8, buf);
  v7[4] = self;
  [v6 cloudKitSyncAllowedWithCompletionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)_throttledProfilePictureTimerUpdate:(id)a3
{
  self->_hasCalledReloadProfilePictureInLast10Seconds = 0;
  id v3 = sub_100011FD4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Reset the flag _hasCalledReloadProfilePicture to NO", v4, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_loggedOutIcon, 0);
  objc_storeStrong((id *)&self->_nameFormatter, 0);
  objc_storeStrong((id *)&self->_userIcon, 0);
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userGivenName, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_profilePictureQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_profilePictureReloadThrottleTimer, 0);
}

@end
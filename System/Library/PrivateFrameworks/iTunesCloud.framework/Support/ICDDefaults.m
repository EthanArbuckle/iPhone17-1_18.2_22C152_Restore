@interface ICDDefaults
+ (ICDDefaults)daemonDefaults;
- (BOOL)lastKnownExplicitContentAllowed;
- (BOOL)lastKnownMusicVideosAllowed;
- (NSArray)knownAccountDSIDs;
- (NSData)pendingBackgroundTasksData;
- (NSString)knownActiveAccountDSID;
- (NSUserDefaults)internalDefaults;
- (NSUserDefaults)userDefaults;
- (id)_init;
- (int64_t)lastKnownMusicSubscriptionType;
- (void)_setOrRemoveObject:(id)a3 forKey:(id)a4;
- (void)setInternalDefaults:(id)a3;
- (void)setKnownAccountDSIDs:(id)a3;
- (void)setKnownActiveAccountDSID:(id)a3;
- (void)setLastKnownExplicitContentAllowed:(BOOL)a3;
- (void)setLastKnownMusicSubscriptionType:(int64_t)a3;
- (void)setLastKnownMusicVideosAllowed:(BOOL)a3;
- (void)setPendingBackgroundTasksData:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation ICDDefaults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDefaults, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)setInternalDefaults:(id)a3
{
}

- (NSUserDefaults)internalDefaults
{
  return self->_internalDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)_setOrRemoveObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(ICDDefaults *)self userDefaults];
  v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)ICDDefaults;
  v2 = [(ICDDefaults *)&v10 init];
  if (v2)
  {
    v3 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.itunescloud.daemon"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v3;

    v5 = +[ICDeviceInfo currentDeviceInfo];
    unsigned int v6 = [v5 isInternalBuild];

    if (v6)
    {
      v7 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.itunescloud.daemon.internal"];
      internalDefaults = v2->_internalDefaults;
      v2->_internalDefaults = v7;
    }
  }
  return v2;
}

- (void)setLastKnownMusicSubscriptionType:(int64_t)a3
{
  id v4 = [(ICDDefaults *)self userDefaults];
  [v4 setInteger:a3 forKey:@"ICDDefaultsKeyLastKnownMusicSubscriptionType"];
}

- (int64_t)lastKnownMusicSubscriptionType
{
  v2 = [(ICDDefaults *)self userDefaults];
  id v3 = [v2 integerForKey:@"ICDDefaultsKeyLastKnownMusicSubscriptionType"];

  return (int64_t)v3;
}

- (void)setLastKnownMusicVideosAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICDDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"ICDDefaultsKeyLastKnownMusicVideosAllowed"];
}

- (BOOL)lastKnownMusicVideosAllowed
{
  v2 = [(ICDDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ICDDefaultsKeyLastKnownMusicVideosAllowed"];

  return v3;
}

- (void)setLastKnownExplicitContentAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICDDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"ICDDefaultsKeyLastKnownExplicitContentAllowed"];
}

- (BOOL)lastKnownExplicitContentAllowed
{
  v2 = [(ICDDefaults *)self userDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ICDDefaultsKeyLastKnownExplicitContentAllowed"];

  return v3;
}

- (void)setPendingBackgroundTasksData:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ICDDefaults %p - setPendingBackgroundTasksData: %@", (uint8_t *)&v6, 0x16u);
  }

  [(ICDDefaults *)self _setOrRemoveObject:v4 forKey:@"ICDDefaultsKeyPendingBackgroundTasksData"];
}

- (NSData)pendingBackgroundTasksData
{
  unsigned __int8 v3 = [(ICDDefaults *)self userDefaults];
  id v4 = [v3 dataForKey:@"ICDDefaultsKeyPendingBackgroundTasksData"];

  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if ([v4 isNSData]) {
      int v6 = v4;
    }
    else {
      int v6 = 0;
    }
    int v10 = 134218242;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ICDDefaults %p - pendingBackgroundTasksData: %@", (uint8_t *)&v10, 0x16u);
  }

  if ([v4 isNSData]) {
    v7 = v4;
  }
  else {
    v7 = 0;
  }
  __int16 v8 = v7;

  return v8;
}

- (void)setKnownActiveAccountDSID:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ICDDefaults %p - setKnownActiveAccountDSID: %@", (uint8_t *)&v6, 0x16u);
  }

  [(ICDDefaults *)self _setOrRemoveObject:v4 forKey:@"ICDDefaultsKeyKnownActiveAccountDSID"];
}

- (NSString)knownActiveAccountDSID
{
  unsigned __int8 v3 = [(ICDDefaults *)self userDefaults];
  id v4 = [v3 stringForKey:@"ICDDefaultsKeyKnownActiveAccountDSID"];

  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if ([v4 isNSString]) {
      int v6 = v4;
    }
    else {
      int v6 = 0;
    }
    int v10 = 134218242;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ICDDefaults %p - knownActiveAccountDSID: %@", (uint8_t *)&v10, 0x16u);
  }

  if ([v4 isNSString]) {
    v7 = v4;
  }
  else {
    v7 = 0;
  }
  __int16 v8 = v7;

  return v8;
}

- (void)setKnownAccountDSIDs:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ICDDefaults %p - setKnownAccountDSIDs: %@", (uint8_t *)&v6, 0x16u);
  }

  [(ICDDefaults *)self _setOrRemoveObject:v4 forKey:@"ICDDefaultsKeyKnowAccountDSIDs"];
}

- (NSArray)knownAccountDSIDs
{
  unsigned __int8 v3 = [(ICDDefaults *)self userDefaults];
  id v4 = [v3 objectForKey:@"ICDDefaultsKeyKnowAccountDSIDs"];

  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if ([v4 isNSArray]) {
      int v6 = v4;
    }
    else {
      int v6 = &__NSArray0__struct;
    }
    int v10 = 134218242;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ICDDefaults %p - knownActiveAccountDSID: %@", (uint8_t *)&v10, 0x16u);
  }

  if ([v4 isNSArray]) {
    v7 = v4;
  }
  else {
    v7 = &__NSArray0__struct;
  }
  __int16 v8 = v7;

  return v8;
}

+ (ICDDefaults)daemonDefaults
{
  if (qword_1001F3780 != -1) {
    dispatch_once(&qword_1001F3780, &stru_1001BA1F8);
  }
  v2 = (void *)qword_1001F3778;

  return (ICDDefaults *)v2;
}

@end
@interface FMFAddressBook
+ (id)sharedAddressBook;
- (BOOL)abPrefersNickname;
- (id)prettyGivenNameForHandle:(id)a3;
- (id)prettyNameForHandle:(id)a3;
- (void)addressBookDidChange:(id)a3;
- (void)addressBookPreferencesDidChange:(id)a3;
- (void)contactStoreDidChange;
- (void)resetABCachesInSession;
- (void)resetABPreferencesCachesInSession;
- (void)setAbPrefersNickname:(BOOL)a3;
@end

@implementation FMFAddressBook

+ (id)sharedAddressBook
{
  if (qword_1000BB718 != -1) {
    dispatch_once(&qword_1000BB718, &stru_1000A1E28);
  }
  v2 = (void *)qword_1000BB710;

  return v2;
}

- (BOOL)abPrefersNickname
{
  v2 = +[CNContactsUserDefaults sharedDefaults];
  unsigned __int8 v3 = [v2 shortNameFormatPrefersNicknames];

  return v3;
}

- (void)contactStoreDidChange
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"ContactStoreDidChange" object:0];
}

- (void)addressBookPreferencesDidChange:(id)a3
{
  v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "addressBookPreferencesDidChange!", v5, 2u);
  }

  [(FMFAddressBook *)self resetABPreferencesCachesInSession];
}

- (void)resetABPreferencesCachesInSession
{
  unsigned __int8 v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting cached abPreferences in session", buf, 2u);
  }

  v4 = +[FMFXPCSessionManager sharedInstance];
  v5 = [v4 clientSessions];
  id v6 = [v5 copy];

  v7 = self;
  objc_sync_enter(v7);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) clientProxy:(void)v13];
        [v12 abPreferencesDidChange];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)resetABCachesInSession
{
  unsigned __int8 v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting cached address book in session", buf, 2u);
  }

  v4 = +[FMFXPCSessionManager sharedInstance];
  v5 = [v4 clientSessions];
  id v6 = [v5 copy];

  v7 = self;
  objc_sync_enter(v7);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) clientProxy:v13];
        [v12 abDidChange];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)addressBookDidChange:(id)a3
{
  v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "addressBookDidChange!", v5, 2u);
  }

  [(FMFAddressBook *)self resetABCachesInSession];
}

- (id)prettyGivenNameForHandle:(id)a3
{
  id v3 = a3;
  v4 = +[FMFContactUtility sharedInstance];
  v5 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v11 = v5;
  id v6 = +[NSArray arrayWithObjects:&v11 count:1];
  v7 = [v4 getContactForHandle:v3 keysToFetch:v6];

  id v8 = +[FMFContactUtility sharedInstance];
  id v9 = [v8 shortDisplayNameForContact:v7 andHandle:v3];

  return v9;
}

- (id)prettyNameForHandle:(id)a3
{
  id v3 = a3;
  v4 = +[FMFContactUtility sharedInstance];
  v5 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v11 = v5;
  id v6 = +[NSArray arrayWithObjects:&v11 count:1];
  v7 = [v4 getContactForHandle:v3 keysToFetch:v6];

  id v8 = +[FMFContactUtility sharedInstance];
  id v9 = [v8 displayNameForContact:v7 andHandle:v3];

  return v9;
}

- (void)setAbPrefersNickname:(BOOL)a3
{
  self->_abPrefersNickname = a3;
}

@end
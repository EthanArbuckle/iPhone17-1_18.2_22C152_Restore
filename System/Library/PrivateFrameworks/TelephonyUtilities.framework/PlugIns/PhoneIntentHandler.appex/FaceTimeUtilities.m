@interface FaceTimeUtilities
+ (FaceTimeUtilities)sharedInstance;
- (BOOL)isFaceTimeEnabledInSettings;
- (BOOL)isFaceTimeable:(id)a3;
- (FaceTimeUtilities)init;
- (IDSSignInController)signInController;
- (id)canonicalAddressesForAddresses:(id)a3;
- (id)fetchFaceTimeAccountAliases;
- (id)generateFaceTimeLink:(id)a3;
- (void)runIDSQueryForStartCallIntent:(id)a3;
@end

@implementation FaceTimeUtilities

+ (FaceTimeUtilities)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025164;
  block[3] = &unk_10004CC38;
  block[4] = a1;
  if (qword_100058960 != -1) {
    dispatch_once(&qword_100058960, block);
  }
  v2 = (void *)qword_100058958;

  return (FaceTimeUtilities *)v2;
}

- (FaceTimeUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)FaceTimeUtilities;
  v2 = [(FaceTimeUtilities *)&v6 init];
  if (v2)
  {
    v3 = (IDSSignInController *)[objc_alloc((Class)IDSSignInController) initWithQueue:&_dispatch_main_q];
    signInController = v2->_signInController;
    v2->_signInController = v3;
  }
  return v2;
}

- (void)runIDSQueryForStartCallIntent:(id)a3
{
  v3 = [(FaceTimeUtilities *)self canonicalAddressesForAddresses:a3];
  v4 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "starting dispatch semaphore for TUIDSLookupManagerStatusChangedNotification", buf, 2u);
  }

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  objc_super v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = TUIDSLookupManagerStatusChangedNotification;
  v8 = +[NSOperationQueue mainQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000253FC;
  v15[3] = &unk_10004D190;
  v9 = v5;
  v16 = v9;
  v10 = [v6 addObserverForName:v7 object:0 queue:v8 usingBlock:v15];

  v11 = +[TUIDSLookupManager sharedManager];
  [v11 beginQueryWithDestinations:v3];

  dispatch_time_t v12 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v9, v12);
  v13 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ending dispatch semaphore for TUIDSLookupManagerStatusChangedNotification", buf, 2u);
  }

  v14 = +[NSNotificationCenter defaultCenter];
  [v14 removeObserver:v10];
}

- (id)canonicalAddressesForAddresses:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  objc_super v6 = (char *)[v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = TUCopyIDSCanonicalAddressForDestinationID();
        [v4 addObject:v10];

        v11 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          dispatch_time_t v12 = TUCopyIDSCanonicalAddressForDestinationID();
          *(_DWORD *)buf = 138412290;
          v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "canonical address: %@", buf, 0xCu);
        }
      }
      uint64_t v7 = (char *)[v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];

  return v13;
}

- (BOOL)isFaceTimeable:(id)a3
{
  id v3 = [(FaceTimeUtilities *)self canonicalAddressesForAddresses:a3];
  id v4 = [v3 allObjects];
  id v5 = +[TUIDSLookupManager sharedManager];
  if ([v5 isFaceTimeAudioAvailableForAnyDestinationInDestinations:v4])
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    uint64_t v7 = +[TUIDSLookupManager sharedManager];
    if ([v7 isFaceTimeVideoAvailableForAnyDestinationInDestinations:v4])
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      uint64_t v8 = +[TUIDSLookupManager sharedManager];
      unsigned __int8 v6 = [v8 isFaceTimeMultiwayAvailableForAnyDestinationInDestinations:v4];
    }
  }

  return v6;
}

- (id)generateFaceTimeLink:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10002581C;
  v21 = sub_10002582C;
  id v22 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = +[TUCallCenter sharedInstance];
  unsigned __int8 v6 = [v5 conversationManager];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100025834;
  v14 = &unk_10004D1B8;
  long long v16 = &v17;
  uint64_t v7 = v4;
  long long v15 = v7;
  [v6 generateLinkWithInvitedMemberHandles:v3 completionHandler:&v11];

  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v7, v8);
  id v9 = objc_msgSend((id)v18[5], "copy", v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);

  return v9;
}

- (BOOL)isFaceTimeEnabledInSettings
{
  return [(IDSSignInController *)self->_signInController isFaceTimeEnabled];
}

- (id)fetchFaceTimeAccountAliases
{
  id v2 = objc_alloc((Class)IDSService);
  id v3 = [v2 initWithService:IDSServiceNameFaceTime];
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v3, "accounts", 0);
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) vettedAliases];
        [v4 addObjectsFromArray:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100032220((uint64_t)v4, v11);
  }

  return v4;
}

- (IDSSignInController)signInController
{
  return self->_signInController;
}

- (void).cxx_destruct
{
}

@end
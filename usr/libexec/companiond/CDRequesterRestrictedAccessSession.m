@interface CDRequesterRestrictedAccessSession
- (BOOL)_requireOwnerDevice;
- (id)_idsMessageRecipientUsernames;
- (void)_configureRapportClient:(id)a3;
- (void)_invalidated;
- (void)_notifyDeviceAcceptedNotification:(id)a3;
- (void)_notifyDeviceStartedAuthentication:(id)a3;
@end

@implementation CDRequesterRestrictedAccessSession

- (void)_configureRapportClient:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000037C0;
  v6[3] = &unk_1000347B0;
  v6[4] = self;
  [v4 cad_registerRequestID:@"com.apple.CompanionAuthentication.GetAuthInfo" options:0 requireOwnerDevice:[CDRequesterRestrictedAccessSession _requireOwnerDevice](self, "_requireOwnerDevice") handler:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003AC8;
  v5[3] = &unk_1000347B0;
  v5[4] = self;
  [v4 cad_registerRequestID:@"com.apple.CompanionAuthentication.DidFinishAuth" options:0 requireOwnerDevice:[self _requireOwnerDevice] handler:v5];
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CDRequesterRestrictedAccessSession;
  [(CDRequesterSession *)&v3 _notifyDeviceAcceptedNotification:a3];
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CDRequesterRestrictedAccessSession;
  [(CDRequesterSession *)&v3 _notifyDeviceStartedAuthentication:a3];
}

- (void)_invalidated
{
  v2.receiver = self;
  v2.super_class = (Class)CDRequesterRestrictedAccessSession;
  [(CDRequesterSession *)&v2 _invalidated];
}

- (BOOL)_requireOwnerDevice
{
  objc_super v2 = [(CDRequesterSession *)self request];
  objc_super v3 = [v2 approversAppleAccountAltDSIDs];
  BOOL v4 = v3 == 0;

  return v4;
}

- (id)_idsMessageRecipientUsernames
{
  objc_super v3 = [(CDRequesterSession *)self request];
  BOOL v4 = [v3 approversAppleAccountAltDSIDs];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v6 = [(CDRequesterSession *)self request];
    v7 = [v6 approversAppleAccountAltDSIDs];

    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(*((void *)&v17 + 1) + 8 * i);
          v13 = +[ACAccountStore defaultStore];
          v14 = [v13 aa_appleAccountWithAltDSID:v12];

          v15 = [v14 username];

          if (v15) {
            [v5 addObject:v15];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end
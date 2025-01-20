@interface CDRequesterSystemAuthenticationSession
- (BOOL)_requireOwnerDevice;
- (id)_idsMessageRecipientUsernames;
- (unint64_t)_authFlags;
- (void)_configureRapportClient:(id)a3;
- (void)_invalidated;
- (void)_notifyDeviceAcceptedNotification:(id)a3;
- (void)_notifyDeviceStartedAuthentication:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
@end

@implementation CDRequesterSystemAuthenticationSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
}

- (void)_configureRapportClient:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014184;
  v6[3] = &unk_1000347B0;
  v6[4] = self;
  [v4 cad_registerRequestID:@"com.apple.CompanionAuthentication.GetAuthInfo" options:0 requireOwnerDevice:[CDRequesterSystemAuthenticationSession _requireOwnerDevice](self, "_requireOwnerDevice") handler:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014460;
  v5[3] = &unk_1000347B0;
  v5[4] = self;
  [v4 cad_registerRequestID:@"com.apple.CompanionAuthentication.DidFinishAuth" options:0 requireOwnerDevice:-[CDRequesterSystemAuthenticationSession _requireOwnerDevice](self, "_requireOwnerDevice") handler:v5];
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CDRequesterSystemAuthenticationSession;
  [(CDRequesterSession *)&v3 _notifyDeviceAcceptedNotification:a3];
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CDRequesterSystemAuthenticationSession;
  [(CDRequesterSession *)&v3 _notifyDeviceStartedAuthentication:a3];
}

- (void)_invalidated
{
  v2.receiver = self;
  v2.super_class = (Class)CDRequesterSystemAuthenticationSession;
  [(CDRequesterSession *)&v2 _invalidated];
}

- (BOOL)_requireOwnerDevice
{
  objc_super v2 = [(CDRequesterSession *)self request];
  objc_super v3 = [v2 appleAccountAltDSID];
  BOOL v4 = v3 == 0;

  return v4;
}

- (id)_idsMessageRecipientUsernames
{
  objc_super v2 = [(CDRequesterSession *)self request];
  objc_super v3 = [v2 appleAccountAltDSID];

  if (v3)
  {
    id v4 = v3;
    v5 = +[ACAccountStore defaultStore];
    v6 = [v5 aa_appleAccountWithAltDSID:v4];

    v7 = [v6 username];
    v10 = v7;
    v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)_authFlags
{
  objc_super v2 = [(CDRequesterSession *)self request];
  id v3 = [v2 options];

  return (unint64_t)v3;
}

@end
@interface CDRequesterLearnMoreSession
- (BOOL)_requireOwnerDevice;
- (id)_idsMessageRecipientUsernames;
- (void)_configureRapportClient:(id)a3;
- (void)_invalidated;
- (void)_notifyDeviceAcceptedNotification:(id)a3;
- (void)_notifyDeviceStartedAuthentication:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
@end

@implementation CDRequesterLearnMoreSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  v7 = (void (**)(id, void))a3;
  v4 = [(CDRequesterSession *)self request];
  v5 = [v4 URL];

  if (v5)
  {
    v7[2](v7, 0);
  }
  else
  {
    v6 = CPSErrorMake();
    ((void (**)(id, void *))v7)[2](v7, v6);
  }
}

- (void)_configureRapportClient:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000031A0;
  v6[3] = &unk_1000347B0;
  v6[4] = self;
  id v4 = a3;
  [v4 registerRequestID:@"com.apple.CompanionAuthentication.GetAuthInfo" options:0 handler:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000033D4;
  v5[3] = &unk_1000347B0;
  v5[4] = self;
  [v4 cad_registerRequestID:@"com.apple.CompanionAuthentication.DidFinishAuth" options:0 requireOwnerDevice:[CDRequesterLearnMoreSession _requireOwnerDevice](self, "_requireOwnerDevice") handler:v5];
}

- (BOOL)_requireOwnerDevice
{
  return 0;
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CDRequesterLearnMoreSession;
  [(CDRequesterSession *)&v3 _notifyDeviceAcceptedNotification:a3];
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CDRequesterLearnMoreSession;
  [(CDRequesterSession *)&v3 _notifyDeviceStartedAuthentication:a3];
}

- (void)_invalidated
{
  v2.receiver = self;
  v2.super_class = (Class)CDRequesterLearnMoreSession;
  [(CDRequesterSession *)&v2 _invalidated];
}

- (id)_idsMessageRecipientUsernames
{
  return 0;
}

@end
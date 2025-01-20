@interface CRReconnectionEnableWiFiAlert
- (BOOL)presentAlertWithCompletion:(id)a3;
- (CRReconnectionEnableWiFiAlert)initWithVehicle:(id)a3;
- (CRVehicle)vehicle;
- (id)alertAcceptButtonTitle;
- (id)alertDeclineButtonTitle;
- (id)alertMessage;
- (id)alertTitle;
- (id)lockscreenMessage;
- (void)setVehicle:(id)a3;
@end

@implementation CRReconnectionEnableWiFiAlert

- (CRReconnectionEnableWiFiAlert)initWithVehicle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRReconnectionEnableWiFiAlert;
  v5 = [(CRReconnectionEnableWiFiAlert *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CRReconnectionEnableWiFiAlert *)v5 setVehicle:v4];
  }

  return v6;
}

- (id)lockscreenMessage
{
  v2 = CRLocalizedWiFiVariantKeyForKey();
  v3 = CRLocalizedStringForKey();

  return v3;
}

- (id)alertTitle
{
  v2 = CRLocalizedWiFiVariantKeyForKey();
  v3 = CRLocalizedStringForKey();

  return v3;
}

- (id)alertMessage
{
  return 0;
}

- (id)alertAcceptButtonTitle
{
  v2 = CRLocalizedWiFiVariantKeyForKey();
  v3 = CRLocalizedStringForKey();

  return v3;
}

- (id)alertDeclineButtonTitle
{
  return (id)CRLocalizedStringForKey();
}

- (BOOL)presentAlertWithCompletion:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003875C;
  v7[3] = &unk_1000BE3D8;
  id v8 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CRReconnectionEnableWiFiAlert;
  id v4 = v8;
  LOBYTE(self) = [(CRAlert *)&v6 presentAlertWithCompletion:v7];

  return (char)self;
}

- (CRVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setVehicle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface CRMessagingVehicleAlert
- (BOOL)presentAlertWithCompletion:(id)a3;
- (CRMessagingServiceVehicleRepresenting)messagingVehicle;
- (CRMessagingVehicleAlert)initWithMessagingVehicle:(id)a3;
- (id)lockscreenMessage;
@end

@implementation CRMessagingVehicleAlert

- (CRMessagingVehicleAlert)initWithMessagingVehicle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRMessagingVehicleAlert;
  v6 = [(CRMessagingVehicleAlert *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_messagingVehicle, a3);
  }

  return v7;
}

- (id)lockscreenMessage
{
  return (id)CRLocalizedStringForKey();
}

- (BOOL)presentAlertWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRMessagingVehicleAlert *)self messagingVehicle];

  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)CRMessagingVehicleAlert;
    BOOL v6 = [(CRAlert *)&v8 presentAlertWithCompletion:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (CRMessagingServiceVehicleRepresenting)messagingVehicle
{
  return self->_messagingVehicle;
}

- (void).cxx_destruct
{
}

@end
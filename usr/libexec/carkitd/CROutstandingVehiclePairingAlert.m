@interface CROutstandingVehiclePairingAlert
- (BOOL)shouldEnableBluetooth;
- (id)alertAcceptButtonTitle;
- (id)alertDeclineButtonTitle;
- (id)alertMessage;
- (id)alertTitle;
- (unint64_t)declineType;
- (void)setDeclineType:(unint64_t)a3;
- (void)setShouldEnableBluetooth:(BOOL)a3;
@end

@implementation CROutstandingVehiclePairingAlert

- (id)alertTitle
{
  v2 = [(CRMessagingVehicleAlert *)self messagingVehicle];
  v3 = [v2 vehicleName];

  CRLocalizedStringForKey();
  if (v3) {
    v4 = {;
  }
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v3);
  }
  else {
    v5 = {;
  }
  }

  return v5;
}

- (id)alertMessage
{
  [(CROutstandingVehiclePairingAlert *)self shouldEnableBluetooth];

  return (id)CRLocalizedStringForKey();
}

- (id)alertAcceptButtonTitle
{
  return (id)CRLocalizedStringForKey();
}

- (id)alertDeclineButtonTitle
{
  if ([(CROutstandingVehiclePairingAlert *)self declineType] > 2)
  {
    v2 = 0;
  }
  else
  {
    v2 = CRLocalizedStringForKey();
  }

  return v2;
}

- (BOOL)shouldEnableBluetooth
{
  return self->_shouldEnableBluetooth;
}

- (void)setShouldEnableBluetooth:(BOOL)a3
{
  self->_shouldEnableBluetooth = a3;
}

- (unint64_t)declineType
{
  return self->_declineType;
}

- (void)setDeclineType:(unint64_t)a3
{
  self->_declineType = a3;
}

@end
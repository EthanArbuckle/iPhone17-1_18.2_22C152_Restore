@interface CROutstandingWiredVehicleApprovalAlert
- (id)alertAcceptButtonTitle;
- (id)alertDeclineButtonTitle;
- (id)alertMessage;
- (id)alertTitle;
@end

@implementation CROutstandingWiredVehicleApprovalAlert

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
  return (id)CRLocalizedStringForKey();
}

- (id)alertAcceptButtonTitle
{
  return (id)CRLocalizedStringForKey();
}

- (id)alertDeclineButtonTitle
{
  return (id)CRLocalizedStringForKey();
}

@end
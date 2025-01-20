@interface CRVehicleEnhancedIntegrationAlert
- (id)alertAcceptButtonTitle;
- (id)alertDeclineButtonTitle;
- (id)alertMessage;
- (id)alertTitle;
- (id)lockscreenMessage;
@end

@implementation CRVehicleEnhancedIntegrationAlert

- (id)lockscreenMessage
{
  v3 = CRLocalizedStringForKey();
  v4 = [(CRMessagingVehicleAlert *)self messagingVehicle];
  v5 = [v4 vehicleName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);

  return v6;
}

- (id)alertTitle
{
  v3 = CRLocalizedStringForKey();
  v4 = [(CRMessagingVehicleAlert *)self messagingVehicle];
  v5 = [v4 vehicleName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);

  return v6;
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
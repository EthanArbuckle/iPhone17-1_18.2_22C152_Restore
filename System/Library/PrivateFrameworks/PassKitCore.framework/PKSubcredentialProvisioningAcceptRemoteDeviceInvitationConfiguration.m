@interface PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration
- (BOOL)canRequestInvitation;
- (BOOL)declineRelatedInvitations;
- (PKAppletSubcredentialSharingInvitation)invitation;
- (PKPaymentWebService)localDeviceWebService;
- (PKPaymentWebService)remoteDeviceWebService;
- (PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration)initWithInvitation:(id)a3 canRequestInvitation:(BOOL)a4 declineRelatedInvitations:(BOOL)a5 localDeviceWebService:(id)a6 remoteDeviceWebService:(id)a7;
- (PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration)initWithInvitation:(id)a3 canRequestInvitation:(BOOL)a4 declineRelatedInvitations:(BOOL)a5 localDeviceWebService:(id)a6 remoteDeviceWebService:(id)a7 configurationType:(int64_t)a8;
- (id)description;
- (id)transitionTable;
- (int64_t)startingState;
@end

@implementation PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration

- (PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration)initWithInvitation:(id)a3 canRequestInvitation:(BOOL)a4 declineRelatedInvitations:(BOOL)a5 localDeviceWebService:(id)a6 remoteDeviceWebService:(id)a7
{
  return [(PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration *)self initWithInvitation:a3 canRequestInvitation:a4 declineRelatedInvitations:a5 localDeviceWebService:a6 remoteDeviceWebService:a7 configurationType:3];
}

- (PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration)initWithInvitation:(id)a3 canRequestInvitation:(BOOL)a4 declineRelatedInvitations:(BOOL)a5 localDeviceWebService:(id)a6 remoteDeviceWebService:(id)a7 configurationType:(int64_t)a8
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  v18 = [(PKSubcredentialProvisioningConfiguration *)self initWithConfigurationType:a8];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_invitation, a3);
    v19->_canRequestInvitation = a4;
    v19->_declineRelatedInvitations = a5;
    objc_storeStrong((id *)&v19->_remoteDeviceWebService, a7);
    objc_storeStrong((id *)&v19->_localDeviceWebService, a6);
  }

  return v19;
}

- (id)transitionTable
{
  v2 = objc_alloc_init(PKSubcredentialProvisioningRemoteDeviceProvisioningTransitionTable);
  return v2;
}

- (int64_t)startingState
{
  if (self->_canRequestInvitation) {
    return 14;
  }
  else {
    return 15;
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_canRequestInvitation) {
    v5 = "yes";
  }
  else {
    v5 = "no";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; invitation: %@; is requesting: %s >",
               v4,
               self,
               self->_invitation,
               v5);
}

- (PKAppletSubcredentialSharingInvitation)invitation
{
  return self->_invitation;
}

- (BOOL)canRequestInvitation
{
  return self->_canRequestInvitation;
}

- (BOOL)declineRelatedInvitations
{
  return self->_declineRelatedInvitations;
}

- (PKPaymentWebService)remoteDeviceWebService
{
  return self->_remoteDeviceWebService;
}

- (PKPaymentWebService)localDeviceWebService
{
  return self->_localDeviceWebService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceWebService, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end
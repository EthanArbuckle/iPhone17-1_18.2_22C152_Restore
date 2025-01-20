@interface PKSubcredentialProvisioningRemoteDeviceSharingConfiguration
- (PKAppletSubcredentialSharingRequest)sharingRequest;
- (PKAppletSubcredentialSharingSession)sharingSession;
- (PKSubcredentialProvisioningRemoteDeviceSharingConfiguration)initWithSharingRequest:(id)a3 sharingSession:(id)a4 localDeviceWebService:(id)a5 remoteDeviceWebService:(id)a6 userAuthDelegate:(id)a7;
- (PKSubcredentialProvisioningUserAuthDelegate)userAuthDelegate;
- (id)description;
- (id)transitionTable;
- (int64_t)startingState;
@end

@implementation PKSubcredentialProvisioningRemoteDeviceSharingConfiguration

- (PKSubcredentialProvisioningRemoteDeviceSharingConfiguration)initWithSharingRequest:(id)a3 sharingSession:(id)a4 localDeviceWebService:(id)a5 remoteDeviceWebService:(id)a6 userAuthDelegate:(id)a7
{
  id v13 = a3;
  id v21 = a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  v17 = [v13 invitations];
  v18 = [v17 firstObject];
  v19 = [(PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration *)self initWithInvitation:v18 canRequestInvitation:0 declineRelatedInvitations:0 localDeviceWebService:v16 remoteDeviceWebService:v15 configurationType:2];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_sharingRequest, a3);
    objc_storeStrong((id *)&v19->_sharingSession, a4);
    objc_storeWeak((id *)&v19->_userAuthDelegate, v14);
  }

  return v19;
}

- (id)transitionTable
{
  v2 = objc_alloc_init(PKSubcredentialProvisioningRemoteDeviceSharingTransitionTable);
  return v2;
}

- (int64_t)startingState
{
  return 13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PKSubcredentialProvisioningAcceptRemoteDeviceInvitationConfiguration *)self invitation];
  v6 = [(PKAppletSubcredentialSharingRequest *)self->_sharingRequest credential];
  v7 = [v3 stringWithFormat:@"<%@: %p; invitation: %@; credential: %@ >", v4, self, v5, v6];

  return v7;
}

- (PKAppletSubcredentialSharingRequest)sharingRequest
{
  return self->_sharingRequest;
}

- (PKAppletSubcredentialSharingSession)sharingSession
{
  return self->_sharingSession;
}

- (PKSubcredentialProvisioningUserAuthDelegate)userAuthDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userAuthDelegate);
  return (PKSubcredentialProvisioningUserAuthDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userAuthDelegate);
  objc_storeStrong((id *)&self->_sharingSession, 0);
  objc_storeStrong((id *)&self->_sharingRequest, 0);
}

@end
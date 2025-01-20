@interface PKSubcredentialProvisioningAcceptInvitationConfiguration
- (BOOL)declineRelatedInvitations;
- (PKAppletSubcredentialSharingInvitation)invitation;
- (PKAppletSubcredentialSharingInvitationMetadata)metadata;
- (PKAppletSubcredentialSharingSession)session;
- (PKPaymentWebService)remoteDeviceWebService;
- (PKSubcredentialProvisioningAcceptInvitationConfiguration)initWithSession:(id)a3 invitation:(id)a4 metadata:(id)a5 declineRelatedInvitations:(BOOL)a6 localDeviceWebService:(id)a7 remoteDeviceWebService:(id)a8;
- (PKSubcredentialProvisioningAcceptInvitationConfiguration)initWithSession:(id)a3 invitation:(id)a4 metadata:(id)a5 webService:(id)a6;
- (id)description;
- (id)transitionTable;
- (int64_t)startingState;
@end

@implementation PKSubcredentialProvisioningAcceptInvitationConfiguration

- (PKSubcredentialProvisioningAcceptInvitationConfiguration)initWithSession:(id)a3 invitation:(id)a4 metadata:(id)a5 webService:(id)a6
{
  return [(PKSubcredentialProvisioningAcceptInvitationConfiguration *)self initWithSession:a3 invitation:a4 metadata:a5 declineRelatedInvitations:0 localDeviceWebService:a6 remoteDeviceWebService:0];
}

- (PKSubcredentialProvisioningAcceptInvitationConfiguration)initWithSession:(id)a3 invitation:(id)a4 metadata:(id)a5 declineRelatedInvitations:(BOOL)a6 localDeviceWebService:(id)a7 remoteDeviceWebService:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v25 = a5;
  id obj = a8;
  id v24 = a8;
  id v15 = a7;
  v16 = [PKCarKeyCredentialRegistrationMetadata alloc];
  v17 = [v14 issuer];
  v18 = [v14 deviceModel];
  v19 = [(PKCarKeyCredentialRegistrationMetadata *)v16 initWithMake:v17 model:v18 keyType:1];

  v20 = [(PKSubcredentialProvisioningLocalDeviceConfiguration *)self initWithWebService:v15 registrationMetadata:v19 configurationType:1];
  if (v20)
  {
    objc_storeWeak((id *)&v20->_session, v13);
    objc_storeStrong((id *)&v20->_metadata, a5);
    objc_storeStrong((id *)&v20->_invitation, a4);
    v20->_declineRelatedInvitations = a6;
    objc_storeStrong((id *)&v20->_remoteDeviceWebService, obj);
  }

  return v20;
}

- (id)transitionTable
{
  v2 = objc_alloc_init(PKSubcredentialProvisioningFriendPairingTransitionTable);
  return v2;
}

- (int64_t)startingState
{
  return 2;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; invitation: %@ >",
               objc_opt_class(),
               self,
               self->_invitation);
}

- (PKAppletSubcredentialSharingSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (PKAppletSubcredentialSharingSession *)WeakRetained;
}

- (PKAppletSubcredentialSharingInvitation)invitation
{
  return self->_invitation;
}

- (PKAppletSubcredentialSharingInvitationMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)declineRelatedInvitations
{
  return self->_declineRelatedInvitations;
}

- (PKPaymentWebService)remoteDeviceWebService
{
  return self->_remoteDeviceWebService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->_session);
}

@end
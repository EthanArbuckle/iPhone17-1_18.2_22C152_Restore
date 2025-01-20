@interface PKSubcredentialInvitationFlowControllerContext
- (BOOL)acceptLocalDeviceInvitation;
- (BOOL)acceptRemoteDeviceInvitation;
- (BOOL)isShareActivation;
- (NSError)acceptLocalDeviceInvitationDisplayableError;
- (NSError)acceptRemoteDeviceInvitationDisplayableError;
- (PKAppletSubcredentialSharingInvitation)localDeviceInvitation;
- (PKAppletSubcredentialSharingInvitation)remoteDeviceInvitation;
- (PKSubcredentialInvitationFlowControllerContext)initWithInvitation:(id)a3 localDeviceWebService:(id)a4 remoteDeviceWebService:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAcceptLocalDeviceInvitation:(BOOL)a3;
- (void)setAcceptLocalDeviceInvitationDisplayableError:(id)a3;
- (void)setAcceptRemoteDeviceInvitation:(BOOL)a3;
- (void)setAcceptRemoteDeviceInvitationDisplayableError:(id)a3;
- (void)setIsShareActivation:(BOOL)a3;
- (void)setLocalDeviceInvitation:(id)a3;
- (void)setRemoteDeviceInvitation:(id)a3;
@end

@implementation PKSubcredentialInvitationFlowControllerContext

- (PKSubcredentialInvitationFlowControllerContext)initWithInvitation:(id)a3 localDeviceWebService:(id)a4 remoteDeviceWebService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(PKSubcredentialProvisioningFlowControllerContext *)self initWithFlowType:5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localDeviceInvitation, a3);
    [(PKSubcredentialProvisioningFlowControllerContext *)v13 setLocalDeviceWebService:v10];
    [(PKSubcredentialProvisioningFlowControllerContext *)v13 setRemoteDeviceWebService:v11];
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKSubcredentialInvitationFlowControllerContext;
  id v4 = [(PKSubcredentialProvisioningFlowControllerContext *)&v6 copyWithZone:a3];
  [v4 setLocalDeviceInvitation:self->_localDeviceInvitation];
  [v4 setRemoteDeviceInvitation:self->_remoteDeviceInvitation];
  [v4 setAcceptLocalDeviceInvitation:self->_acceptLocalDeviceInvitation];
  [v4 setAcceptLocalDeviceInvitationDisplayableError:self->_acceptLocalDeviceInvitationDisplayableError];
  [v4 setAcceptRemoteDeviceInvitation:self->_acceptRemoteDeviceInvitation];
  [v4 setAcceptRemoteDeviceInvitationDisplayableError:self->_acceptRemoteDeviceInvitationDisplayableError];
  return v4;
}

- (PKAppletSubcredentialSharingInvitation)localDeviceInvitation
{
  return self->_localDeviceInvitation;
}

- (void)setLocalDeviceInvitation:(id)a3
{
}

- (PKAppletSubcredentialSharingInvitation)remoteDeviceInvitation
{
  return self->_remoteDeviceInvitation;
}

- (void)setRemoteDeviceInvitation:(id)a3
{
}

- (BOOL)acceptLocalDeviceInvitation
{
  return self->_acceptLocalDeviceInvitation;
}

- (void)setAcceptLocalDeviceInvitation:(BOOL)a3
{
  self->_acceptLocalDeviceInvitation = a3;
}

- (NSError)acceptLocalDeviceInvitationDisplayableError
{
  return self->_acceptLocalDeviceInvitationDisplayableError;
}

- (void)setAcceptLocalDeviceInvitationDisplayableError:(id)a3
{
}

- (BOOL)acceptRemoteDeviceInvitation
{
  return self->_acceptRemoteDeviceInvitation;
}

- (void)setAcceptRemoteDeviceInvitation:(BOOL)a3
{
  self->_acceptRemoteDeviceInvitation = a3;
}

- (NSError)acceptRemoteDeviceInvitationDisplayableError
{
  return self->_acceptRemoteDeviceInvitationDisplayableError;
}

- (void)setAcceptRemoteDeviceInvitationDisplayableError:(id)a3
{
}

- (BOOL)isShareActivation
{
  return self->_isShareActivation;
}

- (void)setIsShareActivation:(BOOL)a3
{
  self->_isShareActivation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptRemoteDeviceInvitationDisplayableError, 0);
  objc_storeStrong((id *)&self->_acceptLocalDeviceInvitationDisplayableError, 0);
  objc_storeStrong((id *)&self->_remoteDeviceInvitation, 0);

  objc_storeStrong((id *)&self->_localDeviceInvitation, 0);
}

@end
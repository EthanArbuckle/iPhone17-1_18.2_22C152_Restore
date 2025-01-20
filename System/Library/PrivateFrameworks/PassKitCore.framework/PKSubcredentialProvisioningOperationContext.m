@interface PKSubcredentialProvisioningOperationContext
- (BOOL)hasAcceptedInvitation;
- (NSData)trackingAttestation;
- (NSURL)passURL;
- (OS_dispatch_queue)operationQueue;
- (PKAppletSubcredential)addedCredential;
- (PKAppletSubcredentialSharingInvitation)sentInvitation;
- (PKPaymentPass)downloadedPass;
- (PKSubcredentialEncryptedContainer)registrationData;
- (PKSubcredentialEncryptedContainer)vehicleMobilizationEncryptedContainer;
- (PKSubcredentialProvisioningOperationContext)initWithQueue:(id)a3;
- (void)setAddedCredential:(id)a3;
- (void)setDownloadedPass:(id)a3;
- (void)setHasAcceptedInvitation:(BOOL)a3;
- (void)setPassURL:(id)a3;
- (void)setRegistrationData:(id)a3;
- (void)setSentInvitation:(id)a3;
- (void)setTrackingAttestation:(id)a3;
- (void)setVehicleMobilizationEncryptedContainer:(id)a3;
@end

@implementation PKSubcredentialProvisioningOperationContext

- (PKSubcredentialProvisioningOperationContext)initWithQueue:(id)a3
{
  id v5 = a3;
  v6 = [(PKSubcredentialProvisioningOperationContext *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_operationQueue, a3);
  }

  return v7;
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

- (PKAppletSubcredential)addedCredential
{
  return self->_addedCredential;
}

- (void)setAddedCredential:(id)a3
{
}

- (PKSubcredentialEncryptedContainer)registrationData
{
  return self->_registrationData;
}

- (void)setRegistrationData:(id)a3
{
}

- (NSData)trackingAttestation
{
  return self->_trackingAttestation;
}

- (void)setTrackingAttestation:(id)a3
{
}

- (PKSubcredentialEncryptedContainer)vehicleMobilizationEncryptedContainer
{
  return self->_vehicleMobilizationEncryptedContainer;
}

- (void)setVehicleMobilizationEncryptedContainer:(id)a3
{
}

- (PKAppletSubcredentialSharingInvitation)sentInvitation
{
  return self->_sentInvitation;
}

- (void)setSentInvitation:(id)a3
{
}

- (BOOL)hasAcceptedInvitation
{
  return self->_hasAcceptedInvitation;
}

- (void)setHasAcceptedInvitation:(BOOL)a3
{
  self->_hasAcceptedInvitation = a3;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
}

- (PKPaymentPass)downloadedPass
{
  return self->_downloadedPass;
}

- (void)setDownloadedPass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedPass, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_sentInvitation, 0);
  objc_storeStrong((id *)&self->_vehicleMobilizationEncryptedContainer, 0);
  objc_storeStrong((id *)&self->_trackingAttestation, 0);
  objc_storeStrong((id *)&self->_registrationData, 0);
  objc_storeStrong((id *)&self->_addedCredential, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
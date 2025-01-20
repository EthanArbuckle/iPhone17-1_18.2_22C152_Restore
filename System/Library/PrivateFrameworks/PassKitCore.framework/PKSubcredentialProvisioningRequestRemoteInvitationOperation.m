@interface PKSubcredentialProvisioningRequestRemoteInvitationOperation
+ (BOOL)canRequestInvitation:(id)a3;
- (PKSubcredentialProvisioningRequestRemoteInvitationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (void)performOperation;
@end

@implementation PKSubcredentialProvisioningRequestRemoteInvitationOperation

+ (BOOL)canRequestInvitation:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (PKSubcredentialProvisioningRequestRemoteInvitationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKSubcredentialProvisioningRequestRemoteInvitationOperation;
  v9 = [(PKSubcredentialProvisioningOperation *)&v22 initWithConfiguration:v8 context:a4 delegate:a5];
  if (!v9) {
    goto LABEL_5;
  }
  v10 = [v8 remoteDeviceInvitation];
  uint64_t v11 = [v10 remoteDeviceWebService];
  remoteDeviceWebService = v9->_remoteDeviceWebService;
  v9->_remoteDeviceWebService = (PKPaymentWebService *)v11;

  uint64_t v13 = [(PKPaymentWebService *)v9->_remoteDeviceWebService targetDevice];
  remoteTargetDevice = v9->_remoteTargetDevice;
  v9->_remoteTargetDevice = (PKPaymentWebServiceTargetDeviceProtocol *)v13;

  uint64_t v15 = [v10 invitation];
  invitation = v9->_invitation;
  v9->_invitation = (PKAppletSubcredentialSharingInvitation *)v15;

  if (!v9->_invitation)
  {
    v18 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      v19 = "No invitation to request";
LABEL_10:
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, v19, v21, 2u);
    }
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }
  if (!v9->_remoteTargetDevice)
  {
    v18 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      v19 = "No remote target device to accept invitation on";
      goto LABEL_10;
    }
    goto LABEL_11;
  }

LABEL_5:
  v17 = v9;
LABEL_12:

  return v17;
}

- (void)performOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKSubcredentialProvisioningRequestRemoteInvitationOperation;
  [(PKSubcredentialProvisioningOperation *)&v10 performOperation];
  if ([(id)objc_opt_class() canRequestInvitation:self->_remoteTargetDevice])
  {
    v3 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      invitation = self->_invitation;
      *(_DWORD *)buf = 138412290;
      v12 = invitation;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Requesting invitation similar to: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    remoteTargetDevice = self->_remoteTargetDevice;
    remoteDeviceWebService = self->_remoteDeviceWebService;
    v7 = self->_invitation;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__PKSubcredentialProvisioningRequestRemoteInvitationOperation_performOperation__block_invoke;
    v8[3] = &unk_1E56E15F8;
    objc_copyWeak(&v9, (id *)buf);
    [(PKPaymentWebServiceTargetDeviceProtocol *)remoteTargetDevice paymentWebService:remoteDeviceWebService requestSubcredentialInvitation:v7 completion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:21 description:@"Remote device not supported"];
  }
}

void __79__PKSubcredentialProvisioningRequestRemoteInvitationOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = PKPairedOrPairingDevice();
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"54EDC00B-9FDF-442B-93A8-0562A7EBCCE0"];
      int v7 = [v5 supportsCapability:v6];

      if (v7)
      {
        id v8 = @"Failed to request invite";
        id v9 = WeakRetained;
        uint64_t v10 = 13;
      }
      else
      {
        id v8 = @"Failed to request invite, feature not supported on watch";
        id v9 = WeakRetained;
        uint64_t v10 = 21;
      }
      [v9 failWithErrorCode:v10 description:v8 underlyingError:v3];
    }
    else
    {
      uint64_t v11 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Invitation requested successfully", v12, 2u);
      }

      [WeakRetained advanceToState:15];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_remoteTargetDevice, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);
}

@end
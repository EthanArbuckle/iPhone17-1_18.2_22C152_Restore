@interface PKSubcredentialProvisioningDeviceRegistrationOperation
- (BOOL)canCancelOperation;
- (PKSubcredentialProvisioningDeviceRegistrationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (void)cancelOperation;
- (void)performOperation;
@end

@implementation PKSubcredentialProvisioningDeviceRegistrationOperation

- (PKSubcredentialProvisioningDeviceRegistrationOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)PKSubcredentialProvisioningDeviceRegistrationOperation;
  v5 = [(PKSubcredentialProvisioningOperation *)&v14 initWithConfiguration:a3 context:a4 delegate:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(PKSubcredentialProvisioningOperation *)v5 configuration];
    v8 = [v7 localDeviceConfiguration];

    v9 = [PKPaymentProvisioningController alloc];
    v10 = [v8 webService];
    uint64_t v11 = [(PKPaymentProvisioningController *)v9 initWithWebService:v10];
    provisioningController = v6->_provisioningController;
    v6->_provisioningController = (PKPaymentProvisioningController *)v11;
  }
  return v6;
}

- (void)performOperation
{
  v7.receiver = self;
  v7.super_class = (Class)PKSubcredentialProvisioningDeviceRegistrationOperation;
  [(PKSubcredentialProvisioningOperation *)&v7 performOperation];
  v3 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Performing device registration", buf, 2u);
  }

  provisioningController = self->_provisioningController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__PKSubcredentialProvisioningDeviceRegistrationOperation_performOperation__block_invoke;
  v5[3] = &unk_1E56DD150;
  v5[4] = self;
  [(PKPaymentProvisioningController *)provisioningController validatePreconditionsAndRegister:v5];
}

void __74__PKSubcredentialProvisioningDeviceRegistrationOperation_performOperation__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) context];
  objc_super v7 = [v6 operationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKSubcredentialProvisioningDeviceRegistrationOperation_performOperation__block_invoke_2;
  block[3] = &unk_1E56DD128;
  uint64_t v8 = *(void *)(a1 + 32);
  char v12 = a2;
  block[4] = v8;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __74__PKSubcredentialProvisioningDeviceRegistrationOperation_performOperation__block_invoke_2(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[48]) {
    return;
  }
  if (*(unsigned char *)(a1 + 48) && !*(void *)(a1 + 40))
  {
    id v6 = [v2 configuration];
    v3 = [v6 ownerConfiguration];

    if (v3)
    {
      uint64_t v4 = 5;
    }
    else
    {
      id v5 = [v6 acceptInvitationConfiguration];

      if (!v5) {
        goto LABEL_10;
      }
      uint64_t v4 = 3;
    }
    [*(id *)(a1 + 32) advanceToState:v4];
    goto LABEL_10;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Registration failed with status: preconditionsVerified %d", *(unsigned __int8 *)(a1 + 48));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) failWithErrorCode:6 description:v6 underlyingError:*(void *)(a1 + 40)];
LABEL_10:
}

- (BOOL)canCancelOperation
{
  return 1;
}

- (void)cancelOperation
{
  self->_operationCancelled = 1;
  id v3 = [(PKSubcredentialProvisioningOperation *)self delegate];
  [v3 operationWasCanceled:self];
}

- (void).cxx_destruct
{
}

@end
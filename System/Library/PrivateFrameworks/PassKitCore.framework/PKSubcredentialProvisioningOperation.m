@interface PKSubcredentialProvisioningOperation
+ (id)operationForState:(int64_t)a3 configuration:(id)a4 context:(id)a5 delegate:(id)a6;
- (BOOL)canBeRestarted;
- (BOOL)canCancelOperation;
- (BOOL)isInProgress;
- (PKSubcredentialProvisioningConfiguration)configuration;
- (PKSubcredentialProvisioningOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (PKSubcredentialProvisioningOperationContext)context;
- (PKSubcredentialProvisioningOperationDelegate)delegate;
- (void)advanceToState:(int64_t)a3;
- (void)cancelOperation;
- (void)failWithError:(id)a3;
- (void)failWithErrorCode:(int64_t)a3 description:(id)a4;
- (void)failWithErrorCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5;
- (void)performOperation;
@end

@implementation PKSubcredentialProvisioningOperation

+ (id)operationForState:(int64_t)a3 configuration:(id)a4 context:(id)a5 delegate:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  switch(a3)
  {
    case 2:
      v12 = PKSubcredentialProvisioningConnectivityCheckOperation;
      goto LABEL_18;
    case 3:
      v14 = [v9 acceptInvitationConfiguration];
      v15 = PKSubcredentialProvisioningAcceptInvitationOperation;
      goto LABEL_9;
    case 4:
      v12 = PKSubcredentialProvisioningAccountAttestationOperation;
      goto LABEL_18;
    case 5:
      v14 = [v9 ownerConfiguration];
      v15 = PKSubcredentialProvisioningPrewarmSessionOperation;
      goto LABEL_9;
    case 6:
      v14 = [v9 ownerConfiguration];
      v15 = PKSubcredentialProvisioningHoldNearReaderOperation;
      goto LABEL_9;
    case 7:
      v14 = [v9 ownerConfiguration];
      v15 = PKSubcredentialProvisioningPairingOperation;
LABEL_9:
      v13 = (void *)[[v15 alloc] initWithConfiguration:v14 context:v10 delegate:v11];

      break;
    case 8:
      v12 = PKSubcredentialProvisioningDeviceRegistrationOperation;
      goto LABEL_18;
    case 9:
      v12 = PKSubcredentialProvisioningRegisteringCredentialOperation;
      goto LABEL_18;
    case 10:
      v12 = PKSubcredentialProvisioningDownloadPassOperation;
      goto LABEL_18;
    case 11:
      v12 = PKSubcredentialProvisioningDownloadAndTrackCredentialOperation;
      goto LABEL_18;
    case 12:
      v12 = PKSubcredentialProvisioningAddPassOperation;
      goto LABEL_18;
    case 13:
      v12 = PKSubcredentialProvisioningSendInvitationOperation;
      goto LABEL_18;
    case 14:
      v12 = PKSubcredentialProvisioningRequestRemoteInvitationOperation;
      goto LABEL_18;
    case 15:
      v12 = PKSubcredentialProvisioningAcceptRemoteInvitationOperation;
LABEL_18:
      v13 = (void *)[[v12 alloc] initWithConfiguration:v9 context:v10 delegate:v11];
      break;
    default:
      v13 = 0;
      break;
  }

  return v13;
}

- (PKSubcredentialProvisioningOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(PKSubcredentialProvisioningOperation *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (void)performOperation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_inProgress)
  {
    v3 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Perform operation invoked twice on %@", (uint8_t *)&v6, 0xCu);
    }
  }
  self->_inProgress = 1;
}

- (void)cancelOperation
{
}

- (BOOL)isInProgress
{
  return self->_inProgress;
}

- (void)advanceToState:(int64_t)a3
{
  self->_inProgress = 0;
  v5 = [(PKSubcredentialProvisioningOperation *)self delegate];
  if (v5)
  {
    id v6 = v5;
    [v5 operation:self advanceToState:a3];
    v5 = v6;
  }
}

- (void)failWithError:(id)a3
{
  id v6 = a3;
  self->_inProgress = 0;
  v4 = [(PKSubcredentialProvisioningOperation *)self delegate];
  v5 = v4;
  if (v4) {
    [v4 operation:self failWithError:v6];
  }
}

- (void)failWithErrorCode:(int64_t)a3 description:(id)a4
{
}

- (void)failWithErrorCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  if ((unint64_t)a4 | (unint64_t)a5)
  {
    uint64_t v8 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v9 = a5;
    id v10 = a4;
    id v12 = objc_alloc_init(v8);
    [v12 setValue:v10 forKey:*MEMORY[0x1E4F28228]];

    [v12 setValue:v9 forKey:*MEMORY[0x1E4F28A50]];
  }
  else
  {
    id v12 = 0;
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:a3 userInfo:v12];
  [(PKSubcredentialProvisioningOperation *)self failWithError:v11];
}

- (PKSubcredentialProvisioningOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKSubcredentialProvisioningOperationDelegate *)WeakRetained;
}

- (PKSubcredentialProvisioningConfiguration)configuration
{
  return self->_configuration;
}

- (PKSubcredentialProvisioningOperationContext)context
{
  return self->_context;
}

- (BOOL)canCancelOperation
{
  return self->_canCancelOperation;
}

- (BOOL)canBeRestarted
{
  return self->_canBeRestarted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
@interface PKSubcredentialProvisioningPrewarmSessionOperation
- (BOOL)canCancelOperation;
- (id)_manufacturerIdentifier;
- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4;
- (void)cancelOperation;
- (void)performOperation;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)startPrewarming;
@end

@implementation PKSubcredentialProvisioningPrewarmSessionOperation

- (void)performOperation
{
  v11.receiver = self;
  v11.super_class = (Class)PKSubcredentialProvisioningPrewarmSessionOperation;
  [(PKSubcredentialProvisioningOperation *)&v11 performOperation];
  v3 = [(PKSubcredentialProvisioningPairingSessionOperation *)self pairingSession];
  v4 = v3;
  if (!v3)
  {
    v6 = @"Unable to get pairing session";
    v7 = self;
    uint64_t v8 = 0;
LABEL_7:
    [(PKSubcredentialProvisioningOperation *)v7 failWithErrorCode:v8 description:v6];
    goto LABEL_11;
  }
  uint64_t v5 = [v3 state];
  if (v5 == 3)
  {
    v6 = @"Session was invalidated";
    v7 = self;
    uint64_t v8 = 1;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    [(PKSubcredentialProvisioningPrewarmSessionOperation *)self startPrewarming];
  }
  else
  {
    v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Waiting for session to become active...", v10, 2u);
    }
  }
LABEL_11:
}

- (void)startPrewarming
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(PKSubcredentialProvisioningPrewarmSessionOperation *)self _manufacturerIdentifier];
  v4 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Prewarming pairing session with manufacturer: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = [(PKSubcredentialProvisioningPairingSessionOperation *)self pairingSession];
  id v6 = (id)[v5 prewarmWithManufacturerIdentifier:v3];
}

- (BOOL)canCancelOperation
{
  return 1;
}

- (void)cancelOperation
{
  v3 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling prewarm operation by ending session", v5, 2u);
  }

  self->_operationWasCancelled = 1;
  v4 = [(PKSubcredentialProvisioningPairingSessionOperation *)self pairingSession];
  [v4 endSession];
}

- (id)_manufacturerIdentifier
{
  v2 = [(PKSubcredentialProvisioningOperation *)self configuration];
  v3 = [v2 ownerConfiguration];

  if (v3)
  {
    v4 = [v3 manufacturerIdentifier];
    if (!v4)
    {
      v4 = [v3 issuerIdentifier];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  int v7 = v6;
  if (a4 == 2)
  {
    id v11 = v6;
    BOOL v9 = [(PKSubcredentialProvisioningOperation *)self isInProgress];
    int v7 = v11;
    if (!v9) {
      goto LABEL_10;
    }
    [(PKSubcredentialProvisioningPrewarmSessionOperation *)self startPrewarming];
  }
  else
  {
    if (a4 != 3) {
      goto LABEL_10;
    }
    id v11 = v6;
    if (self->_operationWasCancelled)
    {
      uint64_t v8 = [(PKSubcredentialProvisioningOperation *)self delegate];
      [v8 operationWasCanceled:self];
    }
    else
    {
      BOOL v10 = [(PKSubcredentialProvisioningOperation *)self isInProgress];
      int v7 = v11;
      if (!v10) {
        goto LABEL_10;
      }
      [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:1 description:@"Session was invalidated unexpectedly"];
    }
  }
  int v7 = v11;
LABEL_10:
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_operationWasCancelled)
  {
    BOOL v9 = [(PKSubcredentialProvisioningOperation *)self delegate];
    [v9 operationWasCanceled:self];
  }
  else if (v7)
  {
    BOOL v10 = PKConvertDAErrorToSubcredentialProvisioningErrorDomain(v7, @"Prewarming failed");

    [(PKSubcredentialProvisioningOperation *)self failWithError:v10];
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Prewarming completed successfully", v12, 2u);
    }

    [(PKSubcredentialProvisioningOperation *)self advanceToState:6];
  }
}

@end
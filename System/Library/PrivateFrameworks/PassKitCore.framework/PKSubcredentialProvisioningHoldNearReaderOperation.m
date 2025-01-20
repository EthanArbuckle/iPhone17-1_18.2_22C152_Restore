@interface PKSubcredentialProvisioningHoldNearReaderOperation
- (BOOL)canCancelOperation;
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4;
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5;
- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3;
- (void)cancelOperation;
- (void)performOperation;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)startPairing;
@end

@implementation PKSubcredentialProvisioningHoldNearReaderOperation

- (void)performOperation
{
  v11.receiver = self;
  v11.super_class = (Class)PKSubcredentialProvisioningHoldNearReaderOperation;
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
    [(PKSubcredentialProvisioningHoldNearReaderOperation *)self startPairing];
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

- (void)startPairing
{
  v3 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v11 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Starting key pairing...", v11, 2u);
  }

  v4 = [(PKSubcredentialProvisioningOperation *)self configuration];
  uint64_t v5 = [v4 ownerConfiguration];

  v6 = [(PKSubcredentialProvisioningPairingSessionOperation *)self pairingSession];
  v7 = [v5 keyName];
  uint64_t v8 = [v5 pairingPassword];
  v9 = objc_msgSend(v6, "startPairingWithKeyDisplayName:pairingPassword:radioTechnologies:bindingAttestation:", v7, v8, objc_msgSend(v5, "radioTechnologies"), 0);

  if (v9)
  {
    v10 = PKConvertDAErrorToSubcredentialProvisioningErrorDomain(v9, @"Unable to start pairing");

    [(PKSubcredentialProvisioningOperation *)self failWithError:v10];
  }
}

- (BOOL)canCancelOperation
{
  return 1;
}

- (void)cancelOperation
{
  if (!self->_operationWasCancelled)
  {
    self->_operationWasCancelled = 1;
    id v2 = [(PKSubcredentialProvisioningPairingSessionOperation *)self pairingSession];
    [v2 endSession];
  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v8 = a3;
  if (a4 == 2)
  {
    if ([(PKSubcredentialProvisioningOperation *)self isInProgress]) {
      [(PKSubcredentialProvisioningHoldNearReaderOperation *)self startPairing];
    }
  }
  else if (a4 == 3)
  {
    if (self->_operationWasCancelled)
    {
      v6 = [(PKSubcredentialProvisioningOperation *)self delegate];
      if (v6)
      {
        v7 = v6;
        [v6 operationWasCanceled:self];
      }
    }
    else if ([(PKSubcredentialProvisioningOperation *)self isInProgress])
    {
      [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:1 description:@"Session was invalidated unexpectedly"];
    }
  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(PKSubcredentialProvisioningOperation *)self context];
  [v9 setAddedCredential:v8];

  v10 = [(PKSubcredentialProvisioningOperation *)self context];
  [v10 setRegistrationData:v7];

  objc_super v11 = [(PKSubcredentialProvisioningOperation *)self delegate];
  [v11 operation:self addedCredential:v8];

  [(PKSubcredentialProvisioningOperation *)self advanceToState:9];
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4
{
  id v5 = a4;
  if (!self->_operationWasCancelled)
  {
    id v7 = v5;
    uint64_t v6 = PKConvertDAErrorToSubcredentialProvisioningErrorDomain(v5, @"Pairing failed");

    [(PKSubcredentialProvisioningOperation *)self failWithError:v6];
    id v5 = (id)v6;
  }
}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
}

@end
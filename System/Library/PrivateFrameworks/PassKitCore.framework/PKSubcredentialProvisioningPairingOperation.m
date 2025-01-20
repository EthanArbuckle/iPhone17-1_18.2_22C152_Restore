@interface PKSubcredentialProvisioningPairingOperation
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4;
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5;
- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
@end

@implementation PKSubcredentialProvisioningPairingOperation

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  if (a4 == 3) {
    [(PKSubcredentialProvisioningOperation *)self failWithErrorCode:1 description:@"Session was invalidated unexpectedly"];
  }
}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
  v3 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Entered pairing state without having started pairing...", v4, 2u);
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

  v11 = [(PKSubcredentialProvisioningOperation *)self delegate];
  [v11 operation:self addedCredential:v8];

  [(PKSubcredentialProvisioningOperation *)self advanceToState:9];
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4
{
  PKConvertDAErrorToSubcredentialProvisioningErrorDomain(a4, @"Pairing failed");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PKSubcredentialProvisioningOperation *)self failWithError:v5];
}

@end
@interface PKSubcredentialProvisioningPairingSessionOperation
- (PKSubcredentialProvisioningPairingSessionOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5;
- (id)pairingSession;
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4;
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5;
- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4;
- (void)appletSubcredentialPairingSession:(id)a3 didFinishProbingTerminalWithError:(id)a4 brandCode:(unint64_t)a5;
- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3;
- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4;
@end

@implementation PKSubcredentialProvisioningPairingSessionOperation

- (PKSubcredentialProvisioningPairingSessionOperation)initWithConfiguration:(id)a3 context:(id)a4 delegate:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PKSubcredentialProvisioningPairingSessionOperation;
  v5 = [(PKSubcredentialProvisioningOperation *)&v9 initWithConfiguration:a3 context:a4 delegate:a5];
  v6 = v5;
  if (!v5
    || ([(PKSubcredentialProvisioningPairingSessionOperation *)v5 pairingSession],
        v7 = (PKSubcredentialProvisioningPairingSessionOperation *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v7 = v6;
  }

  return v7;
}

- (id)pairingSession
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(PKSubcredentialProvisioningOperation *)self configuration];
  v3 = [v2 ownerConfiguration];

  v4 = [v3 session];
  if (!v4)
  {
    v5 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Pairing operation is missing its session: %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return v4;
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4
{
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5
{
}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
}

- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4
{
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4
{
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishProbingTerminalWithError:(id)a4 brandCode:(unint64_t)a5
{
}

@end
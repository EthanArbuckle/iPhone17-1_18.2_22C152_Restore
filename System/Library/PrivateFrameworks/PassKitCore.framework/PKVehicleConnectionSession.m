@interface PKVehicleConnectionSession
+ (void)sessionForPass:(PKSecureElementPass *)pass delegate:(id)delegate completion:(void *)completion;
- (BOOL)sendData:(NSData *)message error:(NSError *)error;
- (PKVehicleConnectionSession)init;
- (PKVehicleConnectionSession)new;
- (PKVehicleConnectionSessionConnectionState)connectionStatus;
- (id)_initWithDelegate:(id)a3 sessionIdentifier:(id)a4 passLibrary:(id)a5 assertion:(id)a6;
- (id)delegate;
- (void)_updateConnectionState:(int64_t)a3;
- (void)dealloc;
- (void)invalidate;
- (void)passLibraryReceivedInterruption;
- (void)vehicleConnectionDidRecievePassthroughData:(id)a3;
@end

@implementation PKVehicleConnectionSession

+ (void)sessionForPass:(PKSecureElementPass *)pass delegate:(id)delegate completion:(void *)completion
{
  v7 = pass;
  id v8 = delegate;
  id v9 = completion;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PKVehicleConnectionSession_sessionForPass_delegate_completion___block_invoke;
  v13[3] = &unk_1E56DDC30;
  v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  v12 = v7;
  +[PKAssertion acquireAssertionOfType:8 withReason:@"PKVehicleConnectionSession opened" completion:v13];
}

void __65__PKVehicleConnectionSession_sessionForPass_delegate_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    id v11 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Could not acquire vehicle connection assertion", v12, 2u);
    }

    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v8 = +[PKPassLibrary sharedInstance];
    id v9 = [a1[4] uniqueID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__PKVehicleConnectionSession_sessionForPass_delegate_completion___block_invoke_2;
    v13[3] = &unk_1E56DDC08;
    id v14 = a1[5];
    id v15 = v8;
    id v16 = v5;
    id v17 = a1[6];
    id v10 = v8;
    [v10 startVehicleConnectionSessionWithPassUniqueIdentifier:v9 completion:v13];
  }
}

void __65__PKVehicleConnectionSession_sessionForPass_delegate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[PKVehicleConnectionSession alloc] _initWithDelegate:*(void *)(a1 + 32) sessionIdentifier:v4 passLibrary:*(void *)(a1 + 40) assertion:*(void *)(a1 + 48)];
  }
  else
  {
    [*(id *)(a1 + 48) invalidate];
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (PKVehicleConnectionSession)init
{
  return 0;
}

- (PKVehicleConnectionSession)new
{
  return 0;
}

- (id)_initWithDelegate:(id)a3 sessionIdentifier:(id)a4 passLibrary:(id)a5 assertion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKVehicleConnectionSession;
  id v14 = [(PKVehicleConnectionSession *)&v21 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v10);
    objc_storeStrong((id *)&v15->_passLibrary, a5);
    [(PKPassLibrary *)v15->_passLibrary addDelegate:v15];
    v15->_connectionStatus = 2;
    objc_storeStrong((id *)&v15->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v15->_assertion, a6);
    objc_initWeak(&location, v15);
    assertion = v15->_assertion;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88__PKVehicleConnectionSession__initWithDelegate_sessionIdentifier_passLibrary_assertion___block_invoke;
    v18[3] = &unk_1E56DD818;
    objc_copyWeak(&v19, &location);
    [(PKAssertion *)assertion setInvalidationHandler:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __88__PKVehicleConnectionSession__initWithDelegate_sessionIdentifier_passLibrary_assertion___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained invalidate];
    v2 = (void *)v3[3];
    v3[3] = 0;

    WeakRetained = v3;
  }
}

- (void)dealloc
{
  assertion = self->_assertion;
  if (assertion)
  {
    [(PKAssertion *)assertion invalidate];
    id v4 = self->_assertion;
    self->_assertion = 0;
  }
  else
  {
    [(PKVehicleConnectionSession *)self invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)PKVehicleConnectionSession;
  [(PKVehicleConnectionSession *)&v5 dealloc];
}

- (BOOL)sendData:(NSData *)message error:(NSError *)error
{
  id v6 = message;
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
  {
    BOOL v8 = [(PKPassLibrary *)self->_passLibrary sendRKEPassThroughMessage:v6 forSessionIdentifier:sessionIdentifier error:error];
  }
  else if (error)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:2 userInfo:0];
    BOOL v8 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)invalidate
{
}

- (void)vehicleConnectionDidRecievePassthroughData:(id)a3
{
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 sessionDidReceiveData:v8];
  }
}

- (void)_updateConnectionState:(int64_t)a3
{
  self->_connectionStatus = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 sessionDidChangeConnectionState:a3];
  }
}

- (void)passLibraryReceivedInterruption
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (PKVehicleConnectionSessionConnectionState)connectionStatus
{
  return self->_connectionStatus;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end
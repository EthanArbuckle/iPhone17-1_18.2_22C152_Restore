@interface PKSubcredentialProvisioningViewModel
- (PKSubcredentialProvisioningConfiguration)config;
- (PKSubcredentialProvisioningController)provisioningController;
- (PKSubcredentialProvisioningViewModel)initWithDelegate:(id)a3;
- (void)cancelProvisioningWithCompletion:(id)a3;
- (void)rescindSimilarInvitationsToSharingRequest:(id)a3 withWebService:(id)a4 completion:(id)a5;
- (void)setConfig:(id)a3;
- (void)setNewAuthRandomIfNecessaryWithConfiguration:(id)a3 completion:(id)a4;
- (void)setProvisioningController:(id)a3;
- (void)startProvisioning;
@end

@implementation PKSubcredentialProvisioningViewModel

- (PKSubcredentialProvisioningViewModel)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(PKSubcredentialProvisioningViewModel *)self init];
  if (v5)
  {
    v6 = (PKSubcredentialProvisioningController *)objc_alloc_init(MEMORY[0x1E4F85080]);
    provisioningController = v5->_provisioningController;
    v5->_provisioningController = v6;

    [(PKSubcredentialProvisioningController *)v5->_provisioningController setDelegate:v4];
  }

  return v5;
}

- (void)startProvisioning
{
  objc_initWeak(&location, self);
  config = self->_config;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PKSubcredentialProvisioningViewModel_startProvisioning__block_invoke;
  v4[3] = &unk_1E59CB100;
  objc_copyWeak(&v5, &location);
  [(PKSubcredentialProvisioningViewModel *)self setNewAuthRandomIfNecessaryWithConfiguration:config completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__PKSubcredentialProvisioningViewModel_startProvisioning__block_invoke(uint64_t a1, int a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v6 = [WeakRetained[2] remoteDeviceConfiguration];
      v7 = v6;
      if (v6)
      {
        v8 = [v6 sharingRequest];
        v9 = [v7 localDeviceWebService];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __57__PKSubcredentialProvisioningViewModel_startProvisioning__block_invoke_2;
        v13[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v14, v3);
        [v5 rescindSimilarInvitationsToSharingRequest:v8 withWebService:v9 completion:v13];

        objc_destroyWeak(&v14);
      }
      else
      {
        [v5[1] startProvisioningWithConfiguration:v5[2]];
      }
    }
    else
    {
      v7 = [WeakRetained[1] delegate];
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28228];
      v16[0] = @"Failed to set auth random";
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      v12 = [v10 errorWithDomain:*MEMORY[0x1E4F87EC8] code:0 userInfo:v11];

      if (objc_opt_respondsToSelector())
      {
        [v7 subcredentialProvisioningController:v5[1] didFinishWithError:v12 inState:0];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v7 subcredentialProvisioningController:v5[1] didFinishWithError:v12];
      }
      if (objc_opt_respondsToSelector()) {
        [v7 subcredentialProvisioningController:v5[1] didEnterState:0];
      }
    }
  }
}

void __57__PKSubcredentialProvisioningViewModel_startProvisioning__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[1] startProvisioningWithConfiguration:WeakRetained[2]];
    v2 = v3;
  }
}

- (void)cancelProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  provisioningController = self->_provisioningController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PKSubcredentialProvisioningViewModel_cancelProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E59CAA98;
  id v8 = v4;
  id v6 = v4;
  [(PKSubcredentialProvisioningController *)provisioningController cancelProvisioningWithCompletion:v7];
}

uint64_t __73__PKSubcredentialProvisioningViewModel_cancelProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setNewAuthRandomIfNecessaryWithConfiguration:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 configurationType];
  if (v7 - 2 < 2)
  {
    id v8 = [v5 remoteDeviceInvitation];
    uint64_t v9 = [v8 remoteDeviceWebService];
    goto LABEL_5;
  }
  if (v7 <= 1)
  {
    id v8 = [v5 localDeviceConfiguration];
    uint64_t v9 = [v8 webService];
LABEL_5:
    v10 = (void *)v9;

    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:
  v11 = [v10 targetDevice];
  if (v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __96__PKSubcredentialProvisioningViewModel_setNewAuthRandomIfNecessaryWithConfiguration_completion___block_invoke;
    v14[3] = &unk_1E59D5718;
    id v15 = v6;
    [v11 paymentWebService:v10 setNewAuthRandomIfNecessaryReturningPairingState:v14];
  }
  else
  {
    v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Missing target device", v13, 2u);
    }

    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

uint64_t __96__PKSubcredentialProvisioningViewModel_setNewAuthRandomIfNecessaryWithConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)rescindSimilarInvitationsToSharingRequest:(id)a3 withWebService:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a5;
  v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Bypassing rescind step and returning immediately.", v11, 2u);
  }

  if (v9) {
    v9[2](v9);
  }
}

- (PKSubcredentialProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (PKSubcredentialProvisioningConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
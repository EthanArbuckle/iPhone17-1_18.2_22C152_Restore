@interface PKPeerPaymentDocumentSubmissionController
- (PKPeerPaymentAccountResolutionController)accountResolutionController;
- (PKPeerPaymentDocumentSubmissionController)initWithPeerPaymentWebService:(id)a3 identityVerificationResponse:(id)a4 setupDelegate:(id)a5 context:(int64_t)a6;
- (PKPeerPaymentIdentityVerificationResponse)identityVerificationResponse;
- (PKPeerPaymentWebService)webService;
- (void)contactApplePressed;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)setAccountResolutionController:(id)a3;
- (void)setIdentityVerificationResponse:(id)a3;
- (void)setWebService:(id)a3;
- (void)uploadID;
@end

@implementation PKPeerPaymentDocumentSubmissionController

- (PKPeerPaymentDocumentSubmissionController)initWithPeerPaymentWebService:(id)a3 identityVerificationResponse:(id)a4 setupDelegate:(id)a5 context:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [v12 acceptableDocuments];
  v15 = PKPassKitBundle();
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentDocumentSubmissionController;
  v16 = [(PKPaymentDocumentSubmissionController *)&v23 initWithSetupDelegate:v13 context:a6 acceptableDocuments:v14 featureIdentifier:1 localizationBundle:v15 preferredLanguage:0];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_webService, a3);
    objc_storeStrong((id *)&v16->_identityVerificationResponse, a4);
    v17 = [(PKPeerPaymentWebService *)v16->_webService peerPaymentService];
    v18 = [v17 account];

    id v19 = objc_alloc_init(MEMORY[0x1E4F848A0]);
    v20 = [[PKPeerPaymentAccountResolutionController alloc] initWithAccount:v18 webService:v16->_webService context:a6 delegate:v16 passLibraryDataProvider:v19];
    accountResolutionController = v16->_accountResolutionController;
    v16->_accountResolutionController = v20;
  }
  return v16;
}

- (void)uploadID
{
  if ([(PKPaymentDocumentSubmissionController *)self state] != 5)
  {
    [(PKPaymentDocumentSubmissionController *)self setState:5];
    if (self->_webService
      && (-[PKPeerPaymentIdentityVerificationResponse encryptionCertificates](self->_identityVerificationResponse, "encryptionCertificates"), v3 = objc_claimAutoreleasedReturnValue(), uint64_t v4 = [v3 count], v3, v4))
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F84D98]);
      v6 = [(PKPaymentDocumentSubmissionController *)self frontID];
      v7 = v6;
      if (v6)
      {
        v8 = UIImageJPEGRepresentation(v6, 0.9);
        [v5 setFrontImageData:v8];
      }
      v9 = [(PKPaymentDocumentSubmissionController *)self backID];
      v10 = v9;
      if (v9)
      {
        id v11 = UIImageJPEGRepresentation(v9, 0.9);
        [v5 setBackImageData:v11];
      }
      id v12 = [(PKPeerPaymentIdentityVerificationResponse *)self->_identityVerificationResponse encryptionCertificates];
      [v5 setCertificates:v12];

      id v13 = [(PKPaymentDocumentSubmissionController *)self selectedDocument];
      objc_msgSend(v5, "setDocumentType:", objc_msgSend(v13, "documentType"));
      v14 = [v13 countryCode];
      [v5 setDocumentCountryCode:v14];

      webService = self->_webService;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke;
      v16[3] = &unk_1E59D2B20;
      v16[4] = self;
      [(PKPeerPaymentWebService *)webService peerPaymentDocumentSubmissionRequest:v5 completion:v16];
    }
    else
    {
      [(PKPaymentDocumentSubmissionController *)self setState:6];
    }
  }
}

void __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 setIdleTimerDisabled:0];

  uint64_t v3 = [*(id *)(a1 + 32) state];
  if (*(void *)(a1 + 40))
  {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E78], 0);
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = 6;
LABEL_7:
    [v4 setState:v5];
  }
  else
  {
    switch([*(id *)(a1 + 48) status])
    {
      case 0:
        MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E90], 0);
        id v6 = [*(id *)(*(void *)(a1 + 32) + 96) targetDevice];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke_3;
        v8[3] = &unk_1E59D2AF8;
        v8[4] = *(void *)(a1 + 32);
        v8[5] = v3;
        [v6 updateAccountWithCompletion:v8];

        break;
      case 1:
      case 2:
      case 4:
        uint64_t v4 = *(void **)(a1 + 32);
        uint64_t v5 = 8;
        goto LABEL_7;
      case 3:
        MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E78], 0);
        uint64_t v4 = *(void **)(a1 + 32);
        uint64_t v5 = 11;
        goto LABEL_7;
      default:
        break;
    }
  }
  uint64_t result = [*(id *)(a1 + 32) state];
  if (v3 != result) {
    return [*(id *)(a1 + 32) stateChanged];
  }
  return result;
}

uint64_t __53__PKPeerPaymentDocumentSubmissionController_uploadID__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 state];
  if (v3 == 2)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F85E88];
    uint64_t v5 = 9;
    goto LABEL_5;
  }
  if (v3 == 3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F85E80];
    uint64_t v5 = 10;
LABEL_5:
    MEMORY[0x1A6220EC0](*v4, 0);
    goto LABEL_7;
  }
  uint64_t v5 = 7;
LABEL_7:
  [*(id *)(a1 + 32) setState:v5];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) state];
  if (v6 != result)
  {
    id v8 = *(void **)(a1 + 32);
    return [v8 stateChanged];
  }
  return result;
}

- (void)contactApplePressed
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Presenting contact apple support alert...", v4, 2u);
  }

  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E70], 0);
  [(PKPeerPaymentAccountResolutionController *)self->_accountResolutionController presentFlowForAccountResolution:3 configuration:0 completion:&__block_literal_global_76];
}

void __64__PKPeerPaymentDocumentSubmissionController_contactApplePressed__block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = @"NO";
    if (a2) {
      uint64_t v4 = @"YES";
    }
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Presented contact apple support alert with success %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(PKPaymentDocumentSubmissionController *)self delegate];
  [v7 presentViewController:v6 animated:1 completion:0];
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  id v4 = [(PKPaymentDocumentSubmissionController *)self delegate];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (PKPeerPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
}

- (PKPeerPaymentIdentityVerificationResponse)identityVerificationResponse
{
  return self->_identityVerificationResponse;
}

- (void)setIdentityVerificationResponse:(id)a3
{
}

- (PKPeerPaymentAccountResolutionController)accountResolutionController
{
  return self->_accountResolutionController;
}

- (void)setAccountResolutionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountResolutionController, 0);
  objc_storeStrong((id *)&self->_identityVerificationResponse, 0);

  objc_storeStrong((id *)&self->_webService, 0);
}

@end
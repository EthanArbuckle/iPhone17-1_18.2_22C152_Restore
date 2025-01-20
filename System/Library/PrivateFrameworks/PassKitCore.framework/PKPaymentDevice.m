@interface PKPaymentDevice
+ (id)clientHardwarePlatformInfoHTTPHeader;
+ (id)clientInfoHTTPHeader;
- (BOOL)hasRegistrationRegionMap;
- (BOOL)skipLocationCheck;
- (PKPaymentDevice)init;
- (PKPaymentDevice)initWithCallbackQueue:(id)a3;
- (id)configurationData;
- (id)primarySecureElementIdentifier;
- (id)trustedDeviceEnrollmentInfo;
- (void)SEPParingInformationWithCompletion:(id)a3;
- (void)_executeDeviceMetadataFetchTasksCompletionHandlers;
- (void)_finishLocationFixWithLocation:(id)a3;
- (void)_populateDeviceMetadata:(id)a3 withFields:(unint64_t)a4 completion:(id)a5;
- (void)configurationDataWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)deleteApplicationWithAID:(id)a3;
- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)paymentDeviceMetadataFields:(unint64_t)a3 completion:(id)a4;
- (void)provisioningDataIncludingDeviceMetadata:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)queueConnectionToTrustedServiceManagerForPushTopic:(id)a3 withCompletion:(id)a4;
- (void)queueConnectionToTrustedServiceManagerWithCompletion:(id)a3;
- (void)registrationDataWithAuthToken:(id)a3 completionHandler:(id)a4;
- (void)rewrapDataWithCompletionHandler:(id)a3;
- (void)setRegistrationRegionMap:(id)a3 primaryRegionTopic:(id)a4;
- (void)setSkipLocationCheck:(BOOL)a3;
- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)signatureForAuthToken:(id)a3 completion:(id)a4;
@end

@implementation PKPaymentDevice

- (PKPaymentDevice)initWithCallbackQueue:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentDevice;
  v6 = [(PKPaymentDevice *)&v14 init];
  if (v6)
  {
    v7 = objc_alloc_init(PKSecureElement);
    secureElement = v6->_secureElement;
    v6->_secureElement = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    metdataFetchTasks = v6->_metdataFetchTasks;
    v6->_metdataFetchTasks = v9;

    objc_storeStrong((id *)&v6->_callbackQueue, a3);
    dispatch_queue_t v11 = dispatch_queue_create("PKPaymentDevice", 0);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v11;
  }
  return v6;
}

- (PKPaymentDevice)init
{
  return [(PKPaymentDevice *)self initWithCallbackQueue:MEMORY[0x1E4F14428]];
}

- (void)dealloc
{
  locationFixTimeout = self->_locationFixTimeout;
  if (locationFixTimeout) {
    dispatch_source_cancel(locationFixTimeout);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDevice;
  [(PKPaymentDevice *)&v4 dealloc];
}

+ (id)clientInfoHTTPHeader
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PKPaymentDevice_clientInfoHTTPHeader__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB402A48 != -1) {
    dispatch_once(&qword_1EB402A48, block);
  }
  v2 = (void *)_MergedGlobals_190;
  return v2;
}

void __39__PKPaymentDevice_clientInfoHTTPHeader__block_invoke()
{
  v0 = NSString;
  v1 = PKProductType();
  id v22 = [v0 stringWithFormat:@"%@", v1];

  v2 = PKClientHTTPHeaderOSPartOverride();
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = NSString;
    v6 = (void *)MGCopyAnswer();
    v7 = PKOSVersion();
    v8 = PKDeviceBuildVersion();
    id v4 = [v5 stringWithFormat:@"%@;%@;%@", v6, v7, v8];
  }
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 infoDictionary];
  uint64_t v11 = *MEMORY[0x1E4F1D020];
  v12 = [v10 objectForKey:*MEMORY[0x1E4F1D020]];

  v13 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v14 = [v13 infoDictionary];
  v15 = [v14 objectForKey:v11];

  v16 = NSString;
  v17 = [v9 bundleIdentifier];
  v18 = [v13 bundleIdentifier];
  v19 = [v16 stringWithFormat:@"%@/%@ (%@/%@)", v17, v12, v18, v15];

  uint64_t v20 = [NSString stringWithFormat:@"<%@> <%@> <%@>", v22, v4, v19];
  v21 = (void *)_MergedGlobals_190;
  _MergedGlobals_190 = v20;
}

+ (id)clientHardwarePlatformInfoHTTPHeader
{
  if (qword_1EB402A50 != -1) {
    dispatch_once(&qword_1EB402A50, &__block_literal_global_5);
  }
  v2 = (void *)qword_1EB402A40;
  return v2;
}

void __55__PKPaymentDevice_clientHardwarePlatformInfoHTTPHeader__block_invoke()
{
  v0 = PKClientHTTPHeaderHardwarePlatformOverride();
  id v3 = v0;
  if (v0)
  {
    id v1 = v0;
  }
  else
  {
    PKHardwarePlatform();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  v2 = (void *)qword_1EB402A40;
  qword_1EB402A40 = (uint64_t)v1;
}

- (void)queueConnectionToTrustedServiceManagerForPushTopic:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void, void))v7;
  secureElement = self->_secureElement;
  if (secureElement)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__PKPaymentDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke;
    v12[3] = &unk_1E56D8798;
    v12[4] = self;
    id v13 = v7;
    [(PKSecureElement *)secureElement connectToServerWithPushTopic:v6 completion:v12];
  }
  else
  {
    v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "No secure element, cannot connect to server with push topic.", v11, 2u);
    }

    if (v8) {
      v8[2](v8, 0, 0);
    }
  }
}

void __85__PKPaymentDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __85__PKPaymentDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_2;
    v5[3] = &unk_1E56D8680;
    char v7 = a2;
    id v6 = v2;
    id v4 = v5;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke;
    block[3] = &unk_1E56D8360;
    id v9 = v4;
    dispatch_async(v3, block);
  }
}

void __85__PKPaymentDevice_queueConnectionToTrustedServiceManagerForPushTopic_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  }
  id v3 = (id)v2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registrationDataWithAuthToken:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke;
    aBlock[3] = &unk_1E56D89F0;
    id v14 = v6;
    v15 = self;
    id v16 = v7;
    v8 = (void (**)(void))_Block_copy(aBlock);
    id v9 = v8;
    secureElement = self->_secureElement;
    if (secureElement)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_390;
      v11[3] = &unk_1E56D8D00;
      v12 = v8;
      [(PKSecureElement *)secureElement initializeSecureElementIfNecessaryWithHandler:v11];
    }
    else
    {
      v8[2](v8);
    }
  }
}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(PKPaymentDeviceRegistrationData);
  [(PKPaymentDeviceRegistrationData *)v2 setAuthorizationHeader:*(void *)(a1 + 32)];
  -[PKPaymentDeviceRegistrationData setDevSigned:](v2, "setDevSigned:", [*(id *)(*(void *)(a1 + 40) + 32) isProductionSigned] ^ 1);
  id v3 = PKProductType();
  [(PKPaymentDeviceRegistrationData *)v2 setProductType:v3];

  id v4 = PKSerialNumber();
  [(PKPaymentDeviceRegistrationData *)v2 setDeviceSerialNumber:v4];

  id v5 = PKMLBSerialNumber();
  [(PKPaymentDeviceRegistrationData *)v2 setDeviceMLBSerialNumber:v5];

  id v6 = [*(id *)(*(void *)(a1 + 40) + 32) primarySecureElementIdentifier];
  [(PKPaymentDeviceRegistrationData *)v2 setSecureElementIdentifier:v6];

  [(PKPaymentDeviceRegistrationData *)v2 setWalletDeleted:(unint64_t)PKCurrentPassbookState() > 1];
  id v7 = dispatch_group_create();
  v8 = v7;
  uint64_t v9 = *(void *)(a1 + 40);
  if (*(void *)(v9 + 32))
  {
    dispatch_group_enter(v7);
    v10 = *(void **)(*(void *)(a1 + 40) + 32);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_2;
    v29[3] = &unk_1E56D8C88;
    uint64_t v11 = v2;
    v30 = v11;
    v12 = v8;
    v31 = v12;
    [v10 stateInformationWithCompletion:v29];
    dispatch_group_enter(v12);
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(*(void *)(a1 + 40) + 32);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_3;
    v26[3] = &unk_1E56D8CB0;
    v15 = v11;
    v27 = v15;
    id v16 = v12;
    v28 = v16;
    [v14 signatureForAuthToken:v13 completion:v26];
    dispatch_group_enter(v16);
    v17 = *(void **)(*(void *)(a1 + 40) + 32);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_4;
    v23[3] = &unk_1E56D8CD8;
    v24 = v15;
    v25 = v16;
    [v17 signedPlatformDataWithCompletion:v23];

    uint64_t v9 = *(void *)(a1 + 40);
  }
  v18 = *(NSObject **)(v9 + 56);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_5;
  v20[3] = &unk_1E56D8A18;
  v21 = v2;
  id v22 = *(id *)(a1 + 48);
  v19 = v2;
  dispatch_group_notify(v8, v18, v20);
}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSecureElementStateInformation:a2];
  id v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSignedAuthToken:a2];
  id v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setPlatformData:a2];
  [*(id *)(a1 + 32) setPlatformDataSignature:v6];

  id v7 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v7);
}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) secureElementIdentifier];
  if (v2
    && (id v3 = (void *)v2,
        [*(id *)(a1 + 32) secureElementStateInformation],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [*(id *)(a1 + 32) secureElementStateInformation];
      uint64_t v9 = [*(id *)(a1 + 32) secureElementIdentifier];
      int v10 = 134218240;
      uint64_t v11 = v8;
      __int16 v12 = 2048;
      uint64_t v13 = v9;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Discarding invalid registration data: Secure Element State Information=%p SEID=%p", (uint8_t *)&v10, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __67__PKPaymentDevice_registrationDataWithAuthToken_completionHandler___block_invoke_390(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKPaymentDevice: se-sep sync failed!!! Proceeding with registration...", v10, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    if (PKRunningInPassd() && (secureElement = self->_secureElement) != 0)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __76__PKPaymentDevice_signData_signatureEntanglementMode_withCompletionHandler___block_invoke;
      v14[3] = &unk_1E56D8D28;
      id v15 = v9;
      [(PKSecureElement *)secureElement signChallenge:v8 signatureEntanglementMode:a4 completion:v14];
    }
    else
    {
      uint64_t v11 = +[PKPassLibrary sharedInstance];
      [v11 signData:v8 signatureEntanglementMode:a4 withCompletionHandler:v9];
    }
  }
  else
  {
    __int16 v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "No challenge provided to sign", v13, 2u);
    }

    if (v9) {
      (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
    }
  }
}

uint64_t __76__PKPaymentDevice_signData_signatureEntanglementMode_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 16))(result, a2, a3, 0);
  }
  return result;
}

- (void)signatureForAuthToken:(id)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    secureElement = self->_secureElement;
    if (secureElement)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __52__PKPaymentDevice_signatureForAuthToken_completion___block_invoke;
      v18[3] = &unk_1E56D8D50;
      id v19 = v7;
      [(PKSecureElement *)secureElement signatureForAuthToken:v6 completion:v18];
      int v10 = v19;
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "No secure element, cannot sign authToken", v17, 2u);
    }

    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"No secure element, cannot sign authToken";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    int v10 = [v15 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v16];

    if (!v8) {
      goto LABEL_12;
    }
LABEL_11:
    ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
    goto LABEL_12;
  }
  uint64_t v11 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "No authToken provided to sign", v17, 2u);
  }

  if (v8)
  {
    __int16 v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21 = @"No authToken provided to sign";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    int v10 = [v12 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v13];

    goto LABEL_11;
  }
LABEL_13:
}

uint64_t __52__PKPaymentDevice_signatureForAuthToken_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)rewrapDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E56D8D78;
    void aBlock[4] = self;
    id v12 = v4;
    id v6 = _Block_copy(aBlock);
    id v7 = v6;
    secureElement = self->_secureElement;
    if (secureElement)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke_402;
      v9[3] = &unk_1E56D8DA0;
      id v10 = v6;
      [(PKSecureElement *)secureElement signedPlatformDataWithCompletion:v9];
    }
    else
    {
      (*((void (**)(void *, void))v6 + 2))(v6, 0);
    }
  }
}

void __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E56D8A18;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platformData];
  if (v2
    && (id v3 = (void *)v2,
        [*(id *)(a1 + 32) platformDataSignature],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Rewrap data not available", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __51__PKPaymentDevice_rewrapDataWithCompletionHandler___block_invoke_402(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc_init(PKPaymentDevicePlatfomData);
  [(PKPaymentDevicePlatfomData *)v7 setPlatformData:v6];

  [(PKPaymentDevicePlatfomData *)v7 setPlatformDataSignature:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)configurationData
{
  configurationData = self->_configurationData;
  if (!configurationData)
  {
    id v4 = objc_alloc_init(PKPaymentDeviceConfigurationData);
    id v5 = [(PKSecureElement *)self->_secureElement primarySecureElementIdentifier];
    [(PKPaymentDeviceConfigurationData *)v4 setSecureElementIdentifier:v5];

    [(PKPaymentDeviceConfigurationData *)v4 setDevSigned:[(PKSecureElement *)self->_secureElement isProductionSigned] ^ 1];
    id v6 = [(PKSecureElement *)self->_secureElement primaryJSBLSequenceCounter];
    [(PKPaymentDeviceConfigurationData *)v4 setPrimaryJSBLSequenceCounter:v6];

    id v7 = self->_configurationData;
    self->_configurationData = v4;

    configurationData = self->_configurationData;
  }
  return configurationData;
}

- (id)trustedDeviceEnrollmentInfo
{
  id v3 = PKUniqueDeviceIdentifier();
  id v4 = objc_alloc_init(PKTrustedDeviceEnrollmentInfo);
  id v5 = PKAssignedDeviceName();
  [(PKTrustedDeviceEnrollmentInfo *)v4 setDeviceName:v5];

  id v6 = PKSerialNumber();
  [(PKTrustedDeviceEnrollmentInfo *)v4 setDeviceSerialNumber:v6];

  [(PKTrustedDeviceEnrollmentInfo *)v4 setDeviceUDID:v3];
  id v7 = PKProductType();
  [(PKTrustedDeviceEnrollmentInfo *)v4 setProductType:v7];

  secureElement = self->_secureElement;
  if (secureElement)
  {
    id v9 = [(PKSecureElement *)secureElement primarySecureElementIdentifier];
    [(PKTrustedDeviceEnrollmentInfo *)v4 setSecureElementIdentifier:v9];

    [(PKTrustedDeviceEnrollmentInfo *)v4 setSupportsAccessExpressMode:[(PKSecureElement *)self->_secureElement supportsExpressModeForExpressPassType:2]];
  }

  return v4;
}

- (void)provisioningDataIncludingDeviceMetadata:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v4) {
      uint64_t v7 = 498;
    }
    else {
      uint64_t v7 = 256;
    }
    id v8 = objc_alloc_init(PKPaymentDeviceProvisioningData);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__PKPaymentDevice_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke;
    v10[3] = &unk_1E56D8DC8;
    uint64_t v11 = v8;
    id v12 = v6;
    id v9 = v8;
    [(PKPaymentDevice *)self _populateDeviceMetadata:v9 withFields:v7 completion:v10];
  }
}

uint64_t __81__PKPaymentDevice_provisioningDataIncludingDeviceMetadata_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)paymentDeviceMetadataFields:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(PKPaymentDeviceMetadata);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__PKPaymentDevice_paymentDeviceMetadataFields_completion___block_invoke;
    v8[3] = &unk_1E56D8DF0;
    id v9 = v6;
    [(PKPaymentDevice *)self _populateDeviceMetadata:v7 withFields:a3 completion:v8];
  }
}

uint64_t __58__PKPaymentDevice_paymentDeviceMetadataFields_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_populateDeviceMetadata:(id)a3 withFields:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (v8 && a4)
    {
      internalQueue = self->_internalQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke;
      v13[3] = &unk_1E56D8A40;
      unint64_t v17 = a4;
      id v14 = v8;
      id v15 = self;
      id v16 = v10;
      id v12 = v13;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __dispatch_async_ar_block_invoke;
      block[3] = &unk_1E56D8360;
      id v19 = v12;
      dispatch_async(internalQueue, block);
    }
    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

void __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x10) != 0)
  {
    id v3 = *(void **)(a1 + 32);
    BOOL v4 = PKAssignedDeviceName();
    [v3 setDeviceName:v4];

    uint64_t v2 = *(void *)(a1 + 56);
    if ((v2 & 8) == 0)
    {
LABEL_3:
      if ((v2 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v2 & 8) == 0)
  {
    goto LABEL_3;
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = PKSerialNumber();
  [v5 setSerialNumber:v6];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 2) == 0)
  {
LABEL_4:
    if ((v2 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = PKUniqueDeviceIdentifier();
  [v7 setUniqueDeviceIdentifier:v8];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 4) == 0)
  {
LABEL_5:
    if ((v2 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  id v9 = *(void **)(a1 + 32);
  id v10 = PKUniqueChipIdentifier();
  [v9 setUniqueChipIdentifier:v10];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 1) == 0)
  {
LABEL_6:
    if ((v2 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(*(void *)(a1 + 40) + 32) primarySecureElementIdentifier];
  [v11 setSecureElementIdentifier:v12];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x100) == 0)
  {
LABEL_7:
    if ((v2 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v13 = *(void **)(a1 + 32);
  id v14 = [*(id *)(*(void *)(a1 + 40) + 32) primaryJSBLSequenceCounter];
  [v13 setPrimaryJSBLSequenceCounter:v14];

  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 0x20) == 0)
  {
LABEL_8:
    if ((v2 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
LABEL_16:
  id v15 = PKDevicePhoneNumber();
  if ([v15 length]) {
    [*(id *)(a1 + 32) setPhoneNumber:v15];
  }

  if ((*(void *)(a1 + 56) & 0x40) != 0)
  {
LABEL_19:
    id v16 = PKDevicePhoneNumberSignature();
    unint64_t v17 = v16;
    if (v16)
    {
      v18 = *(void **)(a1 + 32);
      id v19 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F242D0]];
      [v18 setSignedPhoneNumber:v19];

      uint64_t v20 = *(void **)(a1 + 32);
      v21 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F242D8]];
      [v20 setSignedPhoneNumberVersion:v21];
    }
  }
LABEL_22:
  uint64_t v22 = (void *)MEMORY[0x1E4F1E600];
  v23 = PKPassKitCoreBundle();
  v24 = [v23 bundlePath];
  int v25 = [v22 authorizationStatusForBundlePath:v24];

  if ([MEMORY[0x1E4F1E600] locationServicesEnabled]
    && (v25 - 3) <= 0xFFFFFFFD
    && ([*(id *)(a1 + 40) skipLocationCheck] & 1) == 0
    && (*(unsigned char *)(a1 + 56) & 0x80) != 0)
  {
    v30 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "Can determine device location.", buf, 2u);
    }

    uint64_t v31 = *(void *)(a1 + 40);
    if (!*(void *)(v31 + 8))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_407;
      block[3] = &unk_1E56D8AE0;
      void block[4] = v31;
      dispatch_sync(MEMORY[0x1E4F14428], block);
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "Requesting when in user authorization for PassKitCore", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 40) + 8) requestWhenInUseAuthorization];
    v32 = [*(id *)(*(void *)(a1 + 40) + 8) location];
    v29 = v32;
    if (!*(void *)(*(void *)(a1 + 40) + 24) && v32 && _LocationMeetsAccuracyCriteria(v32))
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "Immediately retrieved location", buf, 2u);
      }

      [*(id *)(a1 + 32) setLocation:v29];
      v33 = *(NSObject **)(*(void *)(a1 + 40) + 56);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_411;
      v48[3] = &unk_1E56D83D8;
      v50 = (PKPaymentDeviceMetadataFetchTask *)*(id *)(a1 + 48);
      id v49 = *(id *)(a1 + 32);
      v34 = v48;
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v55 = 3221225472;
      v56 = __dispatch_async_ar_block_invoke;
      v57 = &unk_1E56D8360;
      id v58 = v34;
      dispatch_async(v33, buf);

      v35 = v50;
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "Start updating location…", buf, 2u);
      }

      v35 = objc_alloc_init(PKPaymentDeviceMetadataFetchTask);
      [(PKPaymentDeviceMetadataFetchTask *)v35 setDeviceMetadata:*(void *)(a1 + 32)];
      [(PKPaymentDeviceMetadataFetchTask *)v35 setRequestedFields:*(void *)(a1 + 56)];
      [(PKPaymentDeviceMetadataFetchTask *)v35 setRemaningFields:128];
      [(PKPaymentDeviceMetadataFetchTask *)v35 setCompletion:*(void *)(a1 + 48)];
      [*(id *)(*(void *)(a1 + 40) + 48) addObject:v35];
      uint64_t v36 = *(void *)(a1 + 40);
      if (!*(void *)(v36 + 24))
      {
        dispatch_source_t v37 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v36 + 64));
        uint64_t v38 = *(void *)(a1 + 40);
        v39 = *(void **)(v38 + 24);
        *(void *)(v38 + 24) = v37;

        v40 = *(NSObject **)(*(void *)(a1 + 40) + 24);
        dispatch_time_t v41 = dispatch_walltime(0, 10000000000);
        dispatch_source_set_timer(v40, v41, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        v42 = *(void **)(a1 + 40);
        v43 = (void *)v42[3];
        objc_initWeak((id *)buf, v42);
        v44 = *(NSObject **)(*(void *)(a1 + 40) + 24);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_410;
        handler[3] = &unk_1E56D8E18;
        objc_copyWeak(v52, (id *)buf);
        v52[1] = v43;
        dispatch_source_set_event_handler(v44, handler);
        dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 40) + 24));
        [*(id *)(*(void *)(a1 + 40) + 8) startUpdatingLocation];
        objc_destroyWeak(v52);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    v26 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Returning device metadata without location", buf, 2u);
    }

    v27 = *(NSObject **)(*(void *)(a1 + 40) + 56);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_412;
    v45[3] = &unk_1E56D83D8;
    id v47 = *(id *)(a1 + 48);
    id v46 = *(id *)(a1 + 32);
    v28 = v45;
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v55 = 3221225472;
    v56 = __dispatch_async_ar_block_invoke;
    v57 = &unk_1E56D8360;
    id v58 = v28;
    dispatch_async(v27, buf);

    v29 = v47;
  }
}

void __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_407(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1E600]);
  PKPassKitCoreBundle();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v7 bundlePath];
  uint64_t v4 = [v2 initWithEffectiveBundlePath:v3 delegate:*(void *)(a1 + 32) onQueue:MEMORY[0x1E4F14428]];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;
}

void __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_410(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x192FDC630]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = *((void *)WeakRetained + 3);
    if (v5)
    {
      if (*(void *)(a1 + 40) == v5)
      {
        id v6 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v7 = 0;
          _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Location did time out", v7, 2u);
        }

        [v4 _finishLocationFixWithLocation:0];
      }
    }
  }
}

uint64_t __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_411(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __65__PKPaymentDevice__populateDeviceMetadata_withFields_completion___block_invoke_412(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)hasRegistrationRegionMap
{
  return [(PKSecureElement *)self->_secureElement hasRegistrationInformation];
}

- (void)setRegistrationRegionMap:(id)a3 primaryRegionTopic:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Setting registration information on Secure Element %@ primaryRegionTopic %@", (uint8_t *)&v9, 0x16u);
  }

  [(PKSecureElement *)self->_secureElement setRegistrationInformation:v6 primaryRegionTopic:v7];
}

- (void)deleteApplicationWithAID:(id)a3
{
}

- (void)SEPParingInformationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void, void, void))v4;
  secureElement = self->_secureElement;
  if (secureElement)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__PKPaymentDevice_SEPParingInformationWithCompletion___block_invoke;
    v9[3] = &unk_1E56D8D00;
    id v10 = v4;
    [(PKSecureElement *)secureElement SEPPairingInfoWithCompletion:v9];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "No secure element, cannot return SEP Pairing info", v8, 2u);
    }

    if (v5) {
      v5[2](v5, 0, 0, 0);
    }
  }
}

uint64_t __54__PKPaymentDevice_SEPParingInformationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)primarySecureElementIdentifier
{
  return [(PKSecureElement *)self->_secureElement primarySecureElementIdentifier];
}

- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4
{
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Location did update", buf, 2u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v31 count:16];
  id v11 = v9;
  if (!v10) {
    goto LABEL_16;
  }
  uint64_t v12 = v10;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v23 != v14) {
        objc_enumerationMutation(v9);
      }
      id v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      if (_LocationMeetsAccuracyCriteria(v16))
      {
        id v17 = v16;

        uint64_t v13 = v17;
      }
    }
    uint64_t v12 = [v9 countByEnumeratingWithState:&v22 objects:v31 count:16];
  }
  while (v12);

  if (v13)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Found candidate location", buf, 2u);
    }

    internalQueue = self->_internalQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54__PKPaymentDevice_locationManager_didUpdateLocations___block_invoke;
    v20[3] = &unk_1E56D8A90;
    void v20[4] = self;
    id v21 = v13;
    id v19 = v20;
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __dispatch_async_ar_block_invoke;
    v29 = &unk_1E56D8360;
    id v30 = v19;
    id v11 = v13;
    dispatch_async(internalQueue, buf);

LABEL_16:
  }
}

uint64_t __54__PKPaymentDevice_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishLocationFixWithLocation:*(void *)(a1 + 40)];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a4 code];
  id v8 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Location did fail", buf, 2u);
    }

    internalQueue = self->_internalQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__PKPaymentDevice_locationManager_didFailWithError___block_invoke;
    v14[3] = &unk_1E56D8AE0;
    void v14[4] = self;
    id v11 = v14;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&buf[16] = __dispatch_async_ar_block_invoke;
    id v16 = &unk_1E56D8360;
    id v17 = v11;
    dispatch_async(internalQueue, buf);
  }
  else
  {
    if (v9)
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%@: Location Manager %@ unable to retreve location, will retry.", buf, 0x16u);
    }
  }
}

uint64_t __52__PKPaymentDevice_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishLocationFixWithLocation:0];
}

- (void)_finishLocationFixWithLocation:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_metdataFetchTasks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "remaningFields", (void)v15);
        if ((v11 & 0x80) != 0)
        {
          [v10 setRemaningFields:v11 & 0xFFFFFFFFFFFFFF7FLL];
          if (v4)
          {
            uint64_t v12 = [v10 deviceMetadata];
            [v12 setLocation:v4];
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  locationFixTimeout = self->_locationFixTimeout;
  if (locationFixTimeout)
  {
    dispatch_source_cancel(locationFixTimeout);
    uint64_t v14 = self->_locationFixTimeout;
    self->_locationFixTimeout = 0;
  }
  [(PKPaymentDevice *)self _executeDeviceMetadataFetchTasksCompletionHandlers];
}

- (void)_executeDeviceMetadataFetchTasksCompletionHandlers
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = self->_metdataFetchTasks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    long long v16 = v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "remaningFields", v16))
        {
          [(NSMutableArray *)v3 addObject:v9];
        }
        else
        {
          uint64_t v10 = [v9 completion];
          uint64_t v11 = v10;
          if (v10)
          {
            callbackQueue = self->_callbackQueue;
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v18[0] = __69__PKPaymentDevice__executeDeviceMetadataFetchTasksCompletionHandlers__block_invoke;
            v18[1] = &unk_1E56D83D8;
            id v13 = v10;
            v18[2] = v9;
            id v19 = v13;
            uint64_t v14 = v17;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __dispatch_async_ar_block_invoke;
            block[3] = &unk_1E56D8360;
            id v25 = v14;
            dispatch_async(callbackQueue, block);
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  metdataFetchTasks = self->_metdataFetchTasks;
  self->_metdataFetchTasks = v3;
}

void __69__PKPaymentDevice__executeDeviceMetadataFetchTasksCompletionHandlers__block_invoke(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Calling device metadata completion handler", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) deviceMetadata];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)queueConnectionToTrustedServiceManagerWithCompletion:(id)a3
{
}

- (void)configurationDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    callbackQueue = self->_callbackQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__PKPaymentDevice_configurationDataWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E56D83D8;
    void v8[4] = self;
    id v9 = v4;
    uint64_t v7 = v8;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke;
    block[3] = &unk_1E56D8360;
    id v11 = v7;
    dispatch_async(callbackQueue, block);
  }
}

void __58__PKPaymentDevice_configurationDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) configurationData];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (BOOL)skipLocationCheck
{
  return self->_skipLocationCheck;
}

- (void)setSkipLocationCheck:(BOOL)a3
{
  self->_skipLocationCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_metdataFetchTasks, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_locationFixTimeout, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
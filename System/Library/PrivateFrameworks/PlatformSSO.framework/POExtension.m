@interface POExtension
- (BOOL)canPerformRegistration;
- (NSArray)authenticationMethods;
- (NSNumber)sdkVersionString;
- (NSString)containerAppBundleIdentifier;
- (POExtension)initWithExtensionBundleIdentifier:(id)a3;
- (POExtension)initWithExtensionBundleIdentifier:(id)a3 extensionManager:(id)a4;
- (POExtensionDelegate)delegate;
- (id)supportedDeviceEncryptionAlgorithms;
- (id)supportedDeviceSigningAlgorithms;
- (id)supportedUserSecureEnclaveKeySigningAlgorithms;
- (int64_t)protocolVersion;
- (int64_t)supportedGrantTypes;
- (void)_unload;
- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5;
- (void)beginDeviceRegistrationUsingOptions:(int64_t)a3 extensionData:(id)a4 completion:(id)a5;
- (void)beginUserRegistrationUsingUserName:(id)a3 authenticationMethod:(int)a4 options:(int64_t)a5 extensionData:(id)a6 completion:(id)a7;
- (void)close;
- (void)dealloc;
- (void)keyWillRotateForKeyType:(int64_t)a3 newKey:(__SecKey *)a4 extensionData:(id)a5 completion:(id)a6;
- (void)presentAuthorizationViewControllerInWindow:(id)a3 hints:(id)a4 completion:(id)a5;
- (void)registrationDidCancelWithCompletion:(id)a3;
- (void)registrationDidCompleteWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)unload;
@end

@implementation POExtension

- (POExtension)initWithExtensionBundleIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x263F25260];
  id v5 = a3;
  v6 = [v4 sharedInstance];
  v7 = [(POExtension *)self initWithExtensionBundleIdentifier:v5 extensionManager:v6];

  return v7;
}

- (POExtension)initWithExtensionBundleIdentifier:(id)a3 extensionManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)POExtension;
  v8 = [(POExtension *)&v15 init];
  if (!v8) {
    goto LABEL_4;
  }
  uint64_t v9 = [v7 loadExtensionWithBundleIdentifier:v6];
  extension = v8->_extension;
  v8->_extension = (SOExtension *)v9;

  v11 = v8->_extension;
  if (v11)
  {
    [(SOExtension *)v11 saveDelegate:v8 forRequestIdentifier:@"platform sso"];
LABEL_4:
    v12 = v8;
    goto LABEL_8;
  }
  v13 = PO_LOG_POExtension();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[POExtension initWithExtensionBundleIdentifier:extensionManager:]();
  }

  v12 = 0;
LABEL_8:

  return v12;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[POExtension dealloc]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_230E51000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (void)unload
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = PO_LOG_POExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[POExtension unload]";
    __int16 v6 = 2112;
    id v7 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  [(POExtension *)self close];
  [(POExtension *)self _unload];
}

- (void)_unload
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = PO_LOG_POExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[POExtension _unload]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  [(SOExtension *)self->_extension unload];
  [(SOExtension *)self->_extension removeDelegateForRequestIdentifier:@"platform sso"];
  extension = self->_extension;
  self->_extension = 0;

  extensionViewController = self->_extensionViewController;
  self->_extensionViewController = 0;
}

- (void)close
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = PO_LOG_POExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[POExtension close]";
    __int16 v6 = 2112;
    id v7 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_11);
}

- (NSString)containerAppBundleIdentifier
{
  return (NSString *)[(SOExtension *)self->_extension containerAppBundleIdentifier];
}

- (NSArray)authenticationMethods
{
  return (NSArray *)[(SOExtension *)self->_extension authenticationMethods];
}

- (void)beginDeviceRegistrationUsingOptions:(int64_t)a3 extensionData:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = PO_LOG_POExtension();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[POExtension beginDeviceRegistrationUsingOptions:extensionData:completion:]";
    __int16 v20 = 2048;
    int64_t v21 = a3;
    __int16 v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_230E51000, v10, OS_LOG_TYPE_DEFAULT, "%s options = %ld on %@", buf, 0x20u);
  }

  extension = self->_extension;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke;
  v14[3] = &unk_264BBF718;
  id v16 = v9;
  int64_t v17 = a3;
  v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  id v13 = v9;
  [(SOExtension *)extension requestAuthorizationViewControllerWithCompletion:v14];
}

void __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = PO_LOG_POExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v6;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_INFO, "requestAuthorizationViewControllerWithCompletion: remoteViewController = %{public}@, error = %{public}@", buf, 0x16u);
  }

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = *(void **)(v9 + 8);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2;
    v15[3] = &unk_264BBF6F0;
    v15[4] = v9;
    uint64_t v12 = *(void *)(a1 + 56);
    id v16 = *(id *)(a1 + 48);
    [v11 beginDeviceRegistrationUsingOptions:v12 extensionData:v10 completion:v15];
    id v13 = v16;
  }
  else
  {
    v14 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_4;
    block[3] = &unk_264BBF6A0;
    id v18 = *(id *)(a1 + 48);
    dispatch_async(v14, block);

    id v13 = v18;
  }
}

uint64_t __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v4 = PO_LOG_POExtension();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_cold_1(a2);
  }

  uint64_t v5 = [*(id *)(a1 + 32) sdkVersionString];
  uint64_t v6 = [v5 compare:&unk_26E5D3428];

  if (v6 == -1) {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_8);
  }
  id v7 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_9;
  v8[3] = &unk_264BBF6C8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = a2;
  dispatch_async(v7, v8);
}

uint64_t __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_9(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)beginUserRegistrationUsingUserName:(id)a3 authenticationMethod:(int)a4 options:(int64_t)a5 extensionData:(id)a6 completion:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = PO_LOG_POExtension();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v27 = "-[POExtension beginUserRegistrationUsingUserName:authenticationMethod:options:extensionData:completion:]";
    __int16 v28 = 1026;
    int v29 = a4;
    __int16 v30 = 2048;
    int64_t v31 = a5;
    __int16 v32 = 2112;
    v33 = self;
    _os_log_impl(&dword_230E51000, v15, OS_LOG_TYPE_DEFAULT, "%s authenticationMethod = %{public}d, options = %ld on %@", buf, 0x26u);
  }

  extension = self->_extension;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke;
  v20[3] = &unk_264BBF740;
  v20[4] = self;
  id v21 = v12;
  int v25 = a4;
  id v23 = v14;
  int64_t v24 = a5;
  id v22 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v14;
  [(SOExtension *)extension requestAuthorizationViewControllerWithCompletion:v20];
}

void __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = PO_LOG_POExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = v6;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_INFO, "requestAuthorizationViewControllerWithCompletion: remoteViewController = %{public}@, error = %{public}@", buf, 0x16u);
  }

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = *(void **)(v9 + 8);
    uint64_t v12 = *(unsigned int *)(a1 + 72);
    uint64_t v13 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2;
    v17[3] = &unk_264BBF6F0;
    v17[4] = v9;
    uint64_t v14 = *(void *)(a1 + 64);
    id v18 = *(id *)(a1 + 56);
    [v11 beginUserRegistrationUsingUserName:v10 authenticationMethod:v12 options:v14 extensionData:v13 completion:v17];
    id v15 = v18;
  }
  else
  {
    id v16 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_12;
    block[3] = &unk_264BBF6A0;
    id v20 = *(id *)(a1 + 56);
    dispatch_async(v16, block);

    id v15 = v20;
  }
}

uint64_t __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_12(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v4 = PO_LOG_POExtension();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_cold_1(a2);
  }

  uint64_t v5 = [*(id *)(a1 + 32) sdkVersionString];
  uint64_t v6 = [v5 compare:&unk_26E5D3428];

  if (v6 == -1) {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_15_0);
  }
  id v7 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_16;
  v8[3] = &unk_264BBF6C8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = a2;
  dispatch_async(v7, v8);
}

uint64_t __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_16(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)registrationDidCompleteWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PO_LOG_POExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[POExtension registrationDidCompleteWithCompletion:]";
    __int16 v12 = 2112;
    uint64_t v13 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  extension = self->_extension;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__POExtension_registrationDidCompleteWithCompletion___block_invoke;
  v8[3] = &unk_264BBF768;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SOExtension *)extension requestAuthorizationViewControllerWithCompletion:v8];
}

void __53__POExtension_registrationDidCompleteWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = PO_LOG_POExtension();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_INFO, "requestAuthorizationViewControllerWithCompletion: remoteViewController = %{public}@, error = %{public}@", buf, 0x16u);
  }

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
    id v9 = *(void **)(*(void *)(a1 + 32) + 8);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__POExtension_registrationDidCompleteWithCompletion___block_invoke_2;
    v10[3] = &unk_264BBF6A0;
    id v11 = *(id *)(a1 + 40);
    [v9 registrationDidCompleteWithCompletion:v10];
  }
  else
  {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_19);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __53__POExtension_registrationDidCompleteWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_21);
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

- (void)registrationDidCancelWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PO_LOG_POExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[POExtension registrationDidCancelWithCompletion:]";
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__POExtension_registrationDidCancelWithCompletion___block_invoke;
  v8[3] = &unk_264BBF568;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __51__POExtension_registrationDidCancelWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__POExtension_registrationDidCancelWithCompletion___block_invoke_2;
  v2[3] = &unk_264BBF6A0;
  id v3 = *(id *)(a1 + 40);
  [v1 registrationDidCancelWithCompletion:v2];
}

void __51__POExtension_registrationDidCancelWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_23);
  int v2 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__POExtension_registrationDidCancelWithCompletion___block_invoke_4;
  block[3] = &unk_264BBF6A0;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __51__POExtension_registrationDidCancelWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)supportedGrantTypes
{
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__3;
  id v15 = __Block_byref_object_dispose__3;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  extension = self->_extension;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__POExtension_supportedGrantTypes__block_invoke;
  v6[3] = &unk_264BBF7B8;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  [(SOExtension *)extension setupNonUISessionWithCompletion:v6];
  dispatch_semaphore_wait((dispatch_semaphore_t)v12[5], 0xFFFFFFFFFFFFFFFFLL);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v4;
}

intptr_t __34__POExtension_supportedGrantTypes__block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    int v2 = *(void **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __34__POExtension_supportedGrantTypes__block_invoke_2;
    v5[3] = &unk_264BBF790;
    int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    return [v2 supportedGrantTypesCompletion:v5];
  }
  else
  {
    int64_t v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return dispatch_semaphore_signal(v4);
  }
}

intptr_t __34__POExtension_supportedGrantTypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (int64_t)protocolVersion
{
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__3;
  id v15 = __Block_byref_object_dispose__3;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  extension = self->_extension;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__POExtension_protocolVersion__block_invoke;
  v6[3] = &unk_264BBF7B8;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  [(SOExtension *)extension setupNonUISessionWithCompletion:v6];
  dispatch_semaphore_wait((dispatch_semaphore_t)v12[5], 0xFFFFFFFFFFFFFFFFLL);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  return v4;
}

intptr_t __30__POExtension_protocolVersion__block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    int v2 = *(void **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __30__POExtension_protocolVersion__block_invoke_2;
    v5[3] = &unk_264BBF790;
    int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    return [v2 protocolVersionCompletion:v5];
  }
  else
  {
    int64_t v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return dispatch_semaphore_signal(v4);
  }
}

intptr_t __30__POExtension_protocolVersion__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (id)supportedDeviceSigningAlgorithms
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  dispatch_semaphore_t v16 = __Block_byref_object_copy__3;
  id v17 = __Block_byref_object_dispose__3;
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  extension = self->_extension;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__POExtension_supportedDeviceSigningAlgorithms__block_invoke;
  v6[3] = &unk_264BBF7B8;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  [(SOExtension *)extension setupNonUISessionWithCompletion:v6];
  dispatch_semaphore_wait((dispatch_semaphore_t)v14[5], 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

intptr_t __47__POExtension_supportedDeviceSigningAlgorithms__block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    int v2 = *(void **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__POExtension_supportedDeviceSigningAlgorithms__block_invoke_2;
    v5[3] = &unk_264BBF7E0;
    int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    return [v2 supportedDeviceSigningAlgorithmsCompletion:v5];
  }
  else
  {
    id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return dispatch_semaphore_signal(v4);
  }
}

void __47__POExtension_supportedDeviceSigningAlgorithms__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (id)supportedDeviceEncryptionAlgorithms
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  dispatch_semaphore_t v16 = __Block_byref_object_copy__3;
  id v17 = __Block_byref_object_dispose__3;
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  extension = self->_extension;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__POExtension_supportedDeviceEncryptionAlgorithms__block_invoke;
  v6[3] = &unk_264BBF7B8;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  [(SOExtension *)extension setupNonUISessionWithCompletion:v6];
  dispatch_semaphore_wait((dispatch_semaphore_t)v14[5], 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

intptr_t __50__POExtension_supportedDeviceEncryptionAlgorithms__block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    int v2 = *(void **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __50__POExtension_supportedDeviceEncryptionAlgorithms__block_invoke_2;
    v5[3] = &unk_264BBF7E0;
    int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    return [v2 supportedDeviceEncryptionAlgorithmsCompletion:v5];
  }
  else
  {
    id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return dispatch_semaphore_signal(v4);
  }
}

void __50__POExtension_supportedDeviceEncryptionAlgorithms__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (id)supportedUserSecureEnclaveKeySigningAlgorithms
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  dispatch_semaphore_t v16 = __Block_byref_object_copy__3;
  id v17 = __Block_byref_object_dispose__3;
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  extension = self->_extension;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__POExtension_supportedUserSecureEnclaveKeySigningAlgorithms__block_invoke;
  v6[3] = &unk_264BBF7B8;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  [(SOExtension *)extension setupNonUISessionWithCompletion:v6];
  dispatch_semaphore_wait((dispatch_semaphore_t)v14[5], 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

intptr_t __61__POExtension_supportedUserSecureEnclaveKeySigningAlgorithms__block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    int v2 = *(void **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __61__POExtension_supportedUserSecureEnclaveKeySigningAlgorithms__block_invoke_2;
    v5[3] = &unk_264BBF7E0;
    int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    return [v2 supportedUserSecureEnclaveKeySigningAlgorithmsCompletion:v5];
  }
  else
  {
    id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return dispatch_semaphore_signal(v4);
  }
}

void __61__POExtension_supportedUserSecureEnclaveKeySigningAlgorithms__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (BOOL)canPerformRegistration
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = PO_LOG_POExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[POExtension canPerformRegistration]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  extension = self->_extension;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__POExtension_canPerformRegistration__block_invoke;
  v7[3] = &unk_264BBF7B8;
  v7[4] = self;
  v7[5] = buf;
  v7[6] = &v8;
  [(SOExtension *)extension setupNonUISessionWithCompletion:v7];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
  BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(buf, 8);

  return v5;
}

intptr_t __37__POExtension_canPerformRegistration__block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    int v2 = *(void **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __37__POExtension_canPerformRegistration__block_invoke_2;
    v5[3] = &unk_264BBF808;
    int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    return [v2 canPerformRegistrationCompletion:v5];
  }
  else
  {
    id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return dispatch_semaphore_signal(v4);
  }
}

intptr_t __37__POExtension_canPerformRegistration__block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)presentAuthorizationViewControllerInWindow:(id)a3 hints:(id)a4 completion:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a5;
  uint64_t v7 = PO_LOG_POExtension();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[POExtension presentAuthorizationViewControllerInWindow:hints:completion:]";
    __int16 v11 = 2112;
    id v12 = self;
    _os_log_impl(&dword_230E51000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  if (self->_extensionViewController)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else if (v6)
  {
    uint64_t v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"No extension registration view controller"];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v8);
  }
}

- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a5;
  uint64_t v7 = PO_LOG_POExtension();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[POExtension authorization:didCompleteWithCredential:error:]";
    __int16 v14 = 2112;
    dispatch_semaphore_t v15 = self;
    _os_log_impl(&dword_230E51000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_32);
  uint64_t v8 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__POExtension_authorization_didCompleteWithCredential_error___block_invoke_2;
  v10[3] = &unk_264BBF4F0;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, v10);
}

void __61__POExtension_authorization_didCompleteWithCredential_error___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) delegate];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 requestDidCompleteWithError:*(void *)(a1 + 40)];
  }
}

- (void)keyWillRotateForKeyType:(int64_t)a3 newKey:(__SecKey *)a4 extensionData:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)[objc_alloc(MEMORY[0x263F16D70]) initWithKey:a4];
  extension = self->_extension;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke;
  v17[3] = &unk_264BBF830;
  id v20 = v11;
  int64_t v21 = a3;
  v17[4] = self;
  id v18 = v12;
  id v19 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  [(SOExtension *)extension setupNonUISessionWithCompletion:v17];
}

void __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void *)(a1 + 64);
    id v9 = [*(id *)(a1 + 40) endpoint];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_38;
    v13[3] = &unk_264BBF6F0;
    id v10 = &v14;
    uint64_t v11 = *(void *)(a1 + 48);
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 56);
    [v7 keyWillRotateForKeyType:v8 keyProxyEndpoint:v9 extensionData:v11 completion:v13];
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_2;
    v16[3] = &unk_264BBECA8;
    id v10 = &v17;
    id v17 = v5;
    id v12 = __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_2((uint64_t)v16);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_2(uint64_t a1)
{
  v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to call key rotation on extension."];
  int v2 = PO_LOG_POExtension();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_2_cold_1();
  }

  return v1;
}

uint64_t __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_38(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (POExtensionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (POExtensionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)sdkVersionString
{
  return self->_sdkVersionString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sdkVersionString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extensionViewController, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)initWithExtensionBundleIdentifier:extensionManager:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_230E51000, v0, OS_LOG_TYPE_ERROR, "PlatformSSO extension not found (%{public}@)", v1, 0xCu);
}

void __76__POExtension_beginDeviceRegistrationUsingOptions_extensionData_completion___block_invoke_2_cold_1(uint64_t a1)
{
  v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_230E51000, v2, v3, "beginDeviceRegistrationUsingLoginManager completed, uint64_t result = %{public}@", v4, v5, v6, v7, v8);
}

void __104__POExtension_beginUserRegistrationUsingUserName_authenticationMethod_options_extensionData_completion___block_invoke_2_cold_1(uint64_t a1)
{
  v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_230E51000, v2, v3, "beginUserRegistrationUsingLoginManager completed, uint64_t result = %{public}@", v4, v5, v6, v7, v8);
}

void __71__POExtension_keyWillRotateForKeyType_newKey_extensionData_completion___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_230E51000, v0, OS_LOG_TYPE_ERROR, "%{public}@", v1, 0xCu);
}

@end
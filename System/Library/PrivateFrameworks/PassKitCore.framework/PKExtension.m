@interface PKExtension
- (NSExtension)extension;
- (NSString)containingAppBundleIdentifier;
- (NSString)containingApplicationIdentifier;
- (NSString)extensionPointIdentifier;
- (NSString)identifier;
- (PKExtension)initWithIdentifier:(id)a3 extension:(id)a4 provider:(id)a5;
- (PKExtensionProvider)provider;
- (id)description;
- (int64_t)type;
- (void)beginExtensionRequestWithCompletion:(id)a3;
- (void)beginExtensionRequestWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)beginLocalExtensionServiceWithUserInteraction:(BOOL)a3 completion:(id)a4 timeout:(unint64_t)a5 timeoutHandler:(id)a6;
- (void)completeLocalExtensionServiceWithCompletion:(id)a3;
- (void)performTestExtensionServiceRequestWithCompletion:(id)a3;
- (void)setContainingAppBundleIdentifier:(id)a3;
- (void)setContainingApplicationIdentifier:(id)a3;
- (void)setExtension:(id)a3;
- (void)setProvider:(id)a3;
@end

@implementation PKExtension

- (PKExtension)initWithIdentifier:(id)a3 extension:(id)a4 provider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PKExtension;
  v11 = [(PKExtension *)&v25 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_storeWeak((id *)&v11->_provider, v10);
    objc_storeStrong((id *)&v11->_extension, a4);
    v14 = [(PKExtension *)v11 extension];
    v15 = [v14 _plugIn];
    v16 = [v15 containingUrl];

    if (v16)
    {
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithURL:v16 allowPlaceholder:1 error:0];
      uint64_t v18 = [v17 bundleIdentifier];
      containingAppBundleIdentifier = v11->_containingAppBundleIdentifier;
      v11->_containingAppBundleIdentifier = (NSString *)v18;

      uint64_t v20 = [v17 applicationIdentifier];
      containingApplicationIdentifier = v11->_containingApplicationIdentifier;
      v11->_containingApplicationIdentifier = (NSString *)v20;
    }
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.passkit.extension.timeout", 0);
    v23 = (void *)_serialQueue;
    _serialQueue = (uint64_t)v22;
  }
  return v11;
}

- (int64_t)type
{
  v2 = [(PKExtension *)self extensionPointIdentifier];
  v3 = @"com.apple.PassKit.in-app-payment-ui";
  if (v2 == v3)
  {

LABEL_16:
    int64_t v10 = 0;
    goto LABEL_17;
  }
  v4 = v3;
  if (v2 && v3)
  {
    char v5 = [(__CFString *)v2 isEqualToString:v3];

    if (v5) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v6 = v2;
  v7 = @"com.apple.PassKit.payment-information-event";
  if (v6 == v7)
  {

    goto LABEL_14;
  }
  id v8 = v7;
  if (!v2 || !v7)
  {

    goto LABEL_16;
  }
  int v9 = [(__CFString *)v6 isEqualToString:v7];

  if (!v9) {
    goto LABEL_16;
  }
LABEL_14:
  int64_t v10 = 1;
LABEL_17:

  return v10;
}

- (NSString)extensionPointIdentifier
{
  v2 = [(PKExtension *)self extension];
  v3 = [v2 extensionPointIdentifier];

  return (NSString *)v3;
}

- (void)performTestExtensionServiceRequestWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "performing test request", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PKExtension_performTestExtensionServiceRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E56E4E48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PKExtension *)self beginExtensionRequestWithCompletion:v7];
}

void __64__PKExtension_performTestExtensionServiceRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 extensionContext];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v5 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retrieved an extension context", buf, 2u);
    }

    id v6 = [[PKBarcodeEventMetadataRequest alloc] initWithBarcodeIdentifier:@"test" deviceAccountIdentifier:@"testBundle"];
    v7 = (void *)MEMORY[0x1E4F1E5E8];
    id v8 = [*(id *)(a1 + 32) extension];
    int v9 = [v8 _extensionBundle];
    int64_t v10 = [v9 bundleIdentifier];
    v11 = (void *)[v7 newAssertionForBundleIdentifier:v10 withReason:@"payment metadata"];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__PKExtension_performTestExtensionServiceRequestWithCompletion___block_invoke_92;
    v15[3] = &unk_1E56E4E20;
    id v16 = v11;
    id v17 = v3;
    id v18 = *(id *)(a1 + 40);
    id v12 = v11;
    [v4 handleInformationRequest:v6 completion:v15];
  }
  else
  {
    v13 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Failed to retrieve extension context", buf, 2u);
    }

    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      (*(void (**)(uint64_t, void))(v14 + 16))(v14, 0);
    }
  }
}

void __64__PKExtension_performTestExtensionServiceRequestWithCompletion___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  char v5 = [v4 paymentInformation];

  id v6 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    int v9 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "response is %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 40) invalidate];
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v5);
  }
}

- (void)beginLocalExtensionServiceWithUserInteraction:(BOOL)a3 completion:(id)a4 timeout:(unint64_t)a5 timeoutHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Beginning extension request", buf, 2u);
  }

  dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)_serialQueue);
  uint64_t v14 = (void *)_timer;
  _timer = (uint64_t)v13;

  v15 = _timer;
  dispatch_time_t v16 = dispatch_time(0, 1000000000 * a5);
  dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  id v17 = _timer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke;
  handler[3] = &unk_1E56D8A18;
  handler[4] = self;
  id v18 = v11;
  id v24 = v18;
  dispatch_source_set_event_handler(v17, handler);
  _extensionRunning = 1;
  dispatch_resume((dispatch_object_t)_timer);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "starting request", buf, 2u);
  }

  v19 = [(PKExtension *)self extension];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_96;
  v21[3] = &unk_1E56E4E70;
  v21[4] = self;
  id v22 = v10;
  id v20 = v10;
  [v19 beginExtensionRequestWithOptions:v8 inputItems:0 completion:v21];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Successfully started request", buf, 2u);
  }
}

void __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke(uint64_t a1)
{
  dispatch_source_cancel((dispatch_source_t)_timer);
  if (_extensionRunning)
  {
    _extensionRunning = 0;
    v2 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Local extension request timed out", v6, 2u);
    }

    id v3 = [*(id *)(a1 + 32) extension];
    [v3 cancelExtensionRequestWithIdentifier:*(void *)(*(void *)(a1 + 32) + 8)];

    id v4 = [*(id *)(a1 + 32) extension];
    [v4 _kill:9];

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Error beginning extension request: %@", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
  else
  {
    int v9 = _serialQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_97;
    v11[3] = &unk_1E56DEB98;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    id v10 = *(id *)(a1 + 40);
    id v13 = 0;
    id v14 = v10;
    dispatch_async(v9, v11);
  }
}

void __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_97(uint64_t a1)
{
  if (_extensionRunning)
  {
    v2 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "extension is running", buf, 2u);
    }

    id v3 = [*(id *)(a1 + 32) extension];
    id v4 = [v3 _extensionContextForUUID:*(void *)(a1 + 40)];

    id v5 = *(void **)(a1 + 56);
    if (v5)
    {
      id v6 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_98;
      block[3] = &unk_1E56D8428;
      id v10 = v5;
      id v8 = v4;
      id v9 = *(id *)(a1 + 48);
      dispatch_async(v6, block);
    }
  }
}

uint64_t __95__PKExtension_beginLocalExtensionServiceWithUserInteraction_completion_timeout_timeoutHandler___block_invoke_98(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)completeLocalExtensionServiceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PKExtension_completeLocalExtensionServiceWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __59__PKExtension_completeLocalExtensionServiceWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) extension];
  [v2 cancelExtensionRequestWithIdentifier:*(void *)(*(void *)(a1 + 32) + 8)];

  if (_extensionRunning)
  {
    _extensionRunning = 0;
    dispatch_source_cancel((dispatch_source_t)_timer);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)beginExtensionRequestWithCompletion:(id)a3
{
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if (!self->_extension)
    {
      uint64_t v7 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKExtension can't begin extension request due to nil NSExtension", buf, 2u);
      }

      v6[2](v6, 0);
    }
    *(void *)buf = 0;
    v26 = buf;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    id v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)_serialQueue);
    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __59__PKExtension_beginExtensionRequestWithOptions_completion___block_invoke;
    id v20 = &unk_1E56E4E98;
    v21 = self;
    id v10 = v8;
    id v22 = v10;
    id v24 = buf;
    id v11 = v6;
    id v23 = v11;
    dispatch_source_set_event_handler(v10, &v17);
    dispatch_resume(v10);
    id v12 = [PKExtensionRequestHandler alloc];
    id v13 = -[PKExtensionRequestHandler _initWithExtension:extensionRequestOptions:](v12, "_initWithExtension:extensionRequestOptions:", self->_extension, a3, v17, v18, v19, v20, v21);
    dispatch_source_cancel(v10);
    char v14 = 0;
    atomic_compare_exchange_strong((atomic_uchar *volatile)v26 + 24, (unsigned __int8 *)&v14, 1u);
    if (v14)
    {
      [v13 invalidate];
    }
    else if (v13 && ![v13 isInvalidated])
    {
      id v16 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v29 = 138412290;
        v30 = self;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "%@ successfully began extension request", v29, 0xCu);
      }

      ((void (**)(id, id))v11)[2](v11, v13);
    }
    else
    {
      v15 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v29 = 138412290;
        v30 = self;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "%@ failed to begin extension request", v29, 0xCu);
      }

      v11[2](v11, 0);
    }

    _Block_object_dispose(buf, 8);
  }
}

void __59__PKExtension_beginExtensionRequestWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "%@ begin extension request timed out", (uint8_t *)&v5, 0xCu);
  }

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  char v4 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 24), (unsigned __int8 *)&v4, 1u);
  if (!v4) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  char v4 = v3;
  if (self->_identifier) {
    [v3 appendFormat:@"identifier: %@", self->_identifier];
  }
  [v4 appendFormat:@">"];
  int v5 = (void *)[v4 copy];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)containingAppBundleIdentifier
{
  return self->_containingAppBundleIdentifier;
}

- (void)setContainingAppBundleIdentifier:(id)a3
{
}

- (NSString)containingApplicationIdentifier
{
  return self->_containingApplicationIdentifier;
}

- (void)setContainingApplicationIdentifier:(id)a3
{
}

- (PKExtensionProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (PKExtensionProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_containingApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_containingAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
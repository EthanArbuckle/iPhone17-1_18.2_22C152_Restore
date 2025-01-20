@interface PKAutomaticPassPresentationSuppressor
+ (id)sharedInstance;
- (BOOL)isSuppressing;
- (PKAutomaticPassPresentationSuppressor)init;
- (unint64_t)requestSuppressionWithResponseHandler:(id)a3;
- (void)_acquireSuppressionAssertionIfNeededWithCompletion:(id)a3;
- (void)_acquireSuppressionAssertionWithCompletion:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)dealloc;
- (void)endSuppressionWithRequestToken:(unint64_t)a3;
@end

@implementation PKAutomaticPassPresentationSuppressor

+ (id)sharedInstance
{
  if (qword_1EB4031F8 != -1) {
    dispatch_once(&qword_1EB4031F8, &__block_literal_global_148);
  }
  v2 = (void *)_MergedGlobals_249;
  return v2;
}

void __55__PKAutomaticPassPresentationSuppressor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKAutomaticPassPresentationSuppressor);
  v1 = (void *)_MergedGlobals_249;
  _MergedGlobals_249 = (uint64_t)v0;
}

- (PKAutomaticPassPresentationSuppressor)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKAutomaticPassPresentationSuppressor;
  v2 = [(PKAutomaticPassPresentationSuppressor *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.passkit.automatic-pass-presentation-suppression", 0);
    suppressorQueue = v2->_suppressorQueue;
    v2->_suppressorQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_suppressorQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PKAutomaticPassPresentationSuppressor_init__block_invoke;
    block[3] = &unk_1E56D8AE0;
    v8 = v2;
    dispatch_sync(v5, block);
  }
  return v2;
}

void __45__PKAutomaticPassPresentationSuppressor_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  *(void *)(*(void *)(a1 + 32) + 40) = 1;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:*(void *)(a1 + 32) selector:sel__applicationDidEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
  [v5 addObserver:*(void *)(a1 + 32) selector:sel__applicationWillEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
  +[PKAssertion preheatConnection];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PKAssertion *)self->_suppressionAssertion setInvalidationHandler:0];
  [(PKAssertion *)self->_suppressionAssertion invalidate];
  v4.receiver = self;
  v4.super_class = (Class)PKAutomaticPassPresentationSuppressor;
  [(PKAutomaticPassPresentationSuppressor *)&v4 dealloc];
}

- (unint64_t)requestSuppressionWithResponseHandler:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if (PKNearFieldRadioIsAvailable())
  {
    suppressorQueue = self->_suppressorQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__PKAutomaticPassPresentationSuppressor_requestSuppressionWithResponseHandler___block_invoke;
    block[3] = &unk_1E56DC5F0;
    void block[4] = self;
    block[5] = &v13;
    dispatch_sync(suppressorQueue, block);
    [(PKAutomaticPassPresentationSuppressor *)self _acquireSuppressionAssertionIfNeededWithCompletion:v4];
  }
  else if (v4)
  {
    v6 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__PKAutomaticPassPresentationSuppressor_requestSuppressionWithResponseHandler___block_invoke_2;
    v10[3] = &unk_1E56D8360;
    id v11 = v4;
    v7 = v10;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __dispatch_async_ar_block_invoke_13;
    v17[3] = &unk_1E56D8360;
    id v18 = v7;
    dispatch_async(v6, v17);
  }
  unint64_t v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __79__PKAutomaticPassPresentationSuppressor_requestSuppressionWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 40);
  *(void *)(v1 + 40) = v2 + 1;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  return [*(id *)(*(void *)(a1 + 32) + 16) addIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

uint64_t __79__PKAutomaticPassPresentationSuppressor_requestSuppressionWithResponseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endSuppressionWithRequestToken:(unint64_t)a3
{
  suppressorQueue = self->_suppressorQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PKAutomaticPassPresentationSuppressor_endSuppressionWithRequestToken___block_invoke;
  v5[3] = &unk_1E56DE608;
  v5[4] = self;
  v5[5] = a3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_13;
  block[3] = &unk_1E56D8360;
  id v7 = v4;
  dispatch_async(suppressorQueue, block);
}

uint64_t __72__PKAutomaticPassPresentationSuppressor_endSuppressionWithRequestToken___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeIndex:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (!result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v3 invalidate];
  }
  return result;
}

- (BOOL)isSuppressing
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  suppressorQueue = self->_suppressorQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PKAutomaticPassPresentationSuppressor_isSuppressing__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(suppressorQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__PKAutomaticPassPresentationSuppressor_isSuppressing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8) != 0;
  return result;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  suppressorQueue = self->_suppressorQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PKAutomaticPassPresentationSuppressor__applicationDidEnterBackground___block_invoke;
  v5[3] = &unk_1E56D8AE0;
  v5[4] = self;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_13;
  block[3] = &unk_1E56D8360;
  id v7 = v4;
  dispatch_async(suppressorQueue, block);
}

void __72__PKAutomaticPassPresentationSuppressor__applicationDidEnterBackground___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  suppressorQueue = self->_suppressorQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__PKAutomaticPassPresentationSuppressor__applicationWillEnterForeground___block_invoke;
  v5[3] = &unk_1E56D8AE0;
  v5[4] = self;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_13;
  block[3] = &unk_1E56D8360;
  id v7 = v4;
  dispatch_async(suppressorQueue, block);
}

void __73__PKAutomaticPassPresentationSuppressor__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 24)) {
    goto LABEL_10;
  }
  uint64_t v3 = *(void **)(v2 + 32);
  if (!v3) {
    goto LABEL_10;
  }
  [v3 timeIntervalSinceNow];
  if (fabs(v4) >= 86400.0)
  {
    uint64_t v2 = *(void *)(a1 + 32);
LABEL_10:
    [*(id *)(v2 + 16) removeAllIndexes];
    goto LABEL_11;
  }
  uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Re-Acquiring Assertion as Suppression Still Relevant", v10, 2u);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeAllIndexes];
    [*(id *)(*(void *)(a1 + 32) + 16) addIndexes:*(void *)(*(void *)(a1 + 32) + 24)];
  }
  [*(id *)(a1 + 32) _acquireSuppressionAssertionIfNeededWithCompletion:0];
LABEL_11:
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = 0;
}

- (void)_acquireSuppressionAssertionIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  suppressionAssertion = self->_suppressionAssertion;
  if (suppressionAssertion)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __92__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionIfNeededWithCompletion___block_invoke;
    v7[3] = &unk_1E56D8798;
    v7[4] = self;
    id v8 = v4;
    +[PKAssertion isAssertionValid:suppressionAssertion completion:v7];
  }
  else
  {
    [(PKAutomaticPassPresentationSuppressor *)self _acquireSuppressionAssertionWithCompletion:v4];
  }
}

uint64_t __92__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionIfNeededWithCompletion___block_invoke(uint64_t a1, int a2)
{
  if (!a2) {
    return [*(id *)(a1 + 32) _acquireSuppressionAssertionWithCompletion:*(void *)(a1 + 40)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 4);
  }
  return result;
}

- (void)_acquireSuppressionAssertionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v6 = [v5 bundleIdentifier];

  id v7 = [NSString stringWithFormat:@"Automatic Pass Presentation Suppression API from %@", v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke;
  v9[3] = &unk_1E56ED408;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  +[PKAssertion acquireAssertionOfType:5 withReason:v7 completion:v9];
}

void __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_2;
  v12[3] = &unk_1E56D8BA8;
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v6;
  id v16 = *(id *)(a1 + 40);
  char v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_13;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 16);
  if (v2)
  {
    if ([v3 count])
    {
      objc_initWeak(&location, *(id *)(a1 + 40));
      [*(id *)(*(void *)(a1 + 40) + 8) setInvalidationHandler:0];
      [*(id *)(*(void *)(a1 + 40) + 8) invalidate];
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 8), *(id *)(a1 + 32));
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_3;
      v7[3] = &unk_1E56E4508;
      id v4 = *(void **)(a1 + 32);
      v7[4] = *(void *)(a1 + 40);
      objc_copyWeak(&v8, &location);
      [v4 setInvalidationHandler:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
      uint64_t v5 = 4;
    }
    else
    {
      [*(id *)(a1 + 32) invalidate];
      uint64_t v5 = 3;
    }
  }
  else
  {
    [v3 removeAllIndexes];
    if ([*(id *)(a1 + 48) code] == -1) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  return result;
}

void __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_4;
  v3[3] = &unk_1E56DD818;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  uint64_t v2 = v3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_13;
  block[3] = &unk_1E56D8360;
  id v6 = v2;
  dispatch_async(v1, block);

  objc_destroyWeak(&v4);
}

void __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[2] removeAllIndexes];
    id v2 = v3[1];
    v3[1] = 0;

    WeakRetained = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressorQueue, 0);
  objc_storeStrong((id *)&self->_backgroundedDate, 0);
  objc_storeStrong((id *)&self->_backgrounedSuppressionIdentifiers, 0);
  objc_storeStrong((id *)&self->_suppressionRequestTokens, 0);
  objc_storeStrong((id *)&self->_suppressionAssertion, 0);
}

@end
@interface SiriPresentationStateProvider
- (BOOL)shouldProvideUpdates;
- (BOOL)updatesAvailable;
- (SiriPresentationStateProvider)initWithSiriPresentationIdentifier:(int64_t)a3 delegate:(id)a4;
- (SiriPresentationStateProviderDelegate)delegate;
- (void)_dispatchedDiffAndApplyMutatedStatus:(id)a3;
- (void)_invokeOnDispatchQueue:(id)a3;
- (void)_setupProviderForSiriPresentationIdentifier:(int64_t)a3;
- (void)barrierWithCompletion:(id)a3;
- (void)beginProvidingPresentationStateUpdates;
- (void)setDelegate:(id)a3;
- (void)setShouldProvideUpdates:(BOOL)a3;
- (void)setUpdatesAvailable:(BOOL)a3;
- (void)stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption:(BOOL)a3;
@end

@implementation SiriPresentationStateProvider

- (SiriPresentationStateProvider)initWithSiriPresentationIdentifier:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SiriPresentationStateProvider;
  v7 = [(SiriPresentationStateProvider *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("SiriPresentationStateProvider", v9);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v10;

    [(SiriPresentationStateProvider *)v8 _setupProviderForSiriPresentationIdentifier:a3];
  }

  return v8;
}

- (void)_setupProviderForSiriPresentationIdentifier:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77__SiriPresentationStateProvider__setupProviderForSiriPresentationIdentifier___block_invoke;
  v3[3] = &__block_descriptor_40_e39_v16__0__SiriPresentationStateProvider_8l;
  v3[4] = a3;
  [(SiriPresentationStateProvider *)self _invokeOnDispatchQueue:v3];
}

void __77__SiriPresentationStateProvider__setupProviderForSiriPresentationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F6C728];
  id v4 = a2;
  id v5 = [v3 alloc];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__SiriPresentationStateProvider__setupProviderForSiriPresentationIdentifier___block_invoke_2;
  v7[3] = &__block_descriptor_40_e40_v16__0___SASPresentationStateMutating__8l;
  v7[4] = *(void *)(a1 + 32);
  id v6 = (void *)[v5 initWithBuilder:v7];
  [v4 _dispatchedDiffAndApplyMutatedStatus:v6];
}

void __77__SiriPresentationStateProvider__setupProviderForSiriPresentationIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 stringWithSiriPresentationIdentifier:v3];
  [v4 setPresentationIdentifier:v5];
}

- (void)beginProvidingPresentationStateUpdates
{
}

void __71__SiriPresentationStateProvider_beginProvidingPresentationStateUpdates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = a2;
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SiriPresentationStateProvider beginProvidingPresentationStateUpdates]_block_invoke";
    _os_log_impl(&dword_221664000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [v2 setShouldProvideUpdates:1];
  if ([v2 updatesAvailable])
  {
    id v4 = [v2 delegate];
    [v4 presentationStateProvider:v2 presentationStateDidChange:v2[1]];

    [v2 setUpdatesAvailable:0];
  }
}

- (void)stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __102__SiriPresentationStateProvider_stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption___block_invoke;
  v3[3] = &__block_descriptor_33_e39_v16__0__SiriPresentationStateProvider_8l;
  BOOL v4 = a3;
  [(SiriPresentationStateProvider *)self _invokeOnDispatchQueue:v3];
}

void __102__SiriPresentationStateProvider_stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  BOOL v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 32);
    int v6 = 136315394;
    uint64_t v7 = "-[SiriPresentationStateProvider stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = v5;
    _os_log_impl(&dword_221664000, v4, OS_LOG_TYPE_DEFAULT, "%s resendLastUpdateOnResumption: %{BOOL}d", (uint8_t *)&v6, 0x12u);
  }
  [v3 setShouldProvideUpdates:0];
  if (*(unsigned char *)(a1 + 32) && v3[1]) {
    [v3 setUpdatesAvailable:1];
  }
}

- (void)barrierWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SiriPresentationStateProvider_barrierWithCompletion___block_invoke;
  block[3] = &unk_2645BCDD8;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __55__SiriPresentationStateProvider_barrierWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[SiriPresentationStateProvider barrierWithCompletion:]_block_invoke";
    _os_log_impl(&dword_221664000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_dispatchedDiffAndApplyMutatedStatus:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([(SASPresentationState *)self->_presentationState isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_presentationState, a3);
    uint64_t v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      presentationState = self->_presentationState;
      int v9 = 136315394;
      uint64_t v10 = "-[SiriPresentationStateProvider _dispatchedDiffAndApplyMutatedStatus:]";
      __int16 v11 = 2112;
      v12 = presentationState;
      _os_log_impl(&dword_221664000, v6, OS_LOG_TYPE_DEFAULT, "%s New Presentation State detected %@", (uint8_t *)&v9, 0x16u);
    }
    [(SiriPresentationStateProvider *)self setUpdatesAvailable:1];
    if ([(SiriPresentationStateProvider *)self shouldProvideUpdates])
    {
      id v8 = [(SiriPresentationStateProvider *)self delegate];
      [v8 presentationStateProvider:self presentationStateDidChange:self->_presentationState];

      [(SiriPresentationStateProvider *)self setUpdatesAvailable:0];
    }
  }
}

- (void)_invokeOnDispatchQueue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__SiriPresentationStateProvider__invokeOnDispatchQueue___block_invoke;
    block[3] = &unk_2645BCE00;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(dispatchQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

uint64_t __56__SiriPresentationStateProvider__invokeOnDispatchQueue___block_invoke(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 40))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return MEMORY[0x270F9A758]();
}

- (SiriPresentationStateProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriPresentationStateProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldProvideUpdates
{
  return self->_shouldProvideUpdates;
}

- (void)setShouldProvideUpdates:(BOOL)a3
{
  self->_shouldProvideUpdates = a3;
}

- (BOOL)updatesAvailable
{
  return self->_updatesAvailable;
}

- (void)setUpdatesAvailable:(BOOL)a3
{
  self->_updatesAvailable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_presentationState, 0);
}

@end
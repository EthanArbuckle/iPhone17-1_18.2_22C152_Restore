@interface ICQPreferencesFreshmintManager
- (BOOL)shouldShowFreshmint;
- (ICQOffer)offer;
- (ICQUpgradeFlowManager)freshmintFlowManager;
- (ICQUpgradeFlowManagerDelegate)delegate;
- (id)freshmintFlowCompletion;
- (void)beginFlowWithDelegate:(id)a3 offer:(id)a4 url:(id)a5 completion:(id)a6;
- (void)beginFlowWithICQLink:(id)a3 completion:(id)a4;
- (void)beginFlowWithICQLink:(id)a3 presenter:(id)a4 completion:(id)a5;
- (void)runFreshmintCompletionDidComplete:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFreshmintFlowCompletion:(id)a3;
- (void)setFreshmintFlowManager:(id)a3;
- (void)setOffer:(id)a3;
- (void)setShouldShowFreshmint:(BOOL)a3;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
@end

@implementation ICQPreferencesFreshmintManager

- (void)beginFlowWithDelegate:(id)a3 offer:(id)a4 url:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = _ICQGetLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "Presenting Freshmint offer.", v19, 2u);
  }

  objc_storeWeak((id *)&self->_delegate, v13);
  v15 = [[ICQUpgradeFlowManager alloc] initWithOffer:v12];

  [(ICQPreferencesFreshmintManager *)self setFreshmintFlowManager:v15];
  v16 = [(ICQPreferencesFreshmintManager *)self freshmintFlowManager];
  [v16 setDelegate:self];

  v17 = (void *)[v10 copy];
  [(ICQPreferencesFreshmintManager *)self setFreshmintFlowCompletion:v17];

  v18 = [(ICQPreferencesFreshmintManager *)self freshmintFlowManager];
  [v18 _beginRemoteFlowWithURL:v11];
}

- (void)beginFlowWithICQLink:(id)a3 completion:(id)a4
{
}

- (void)beginFlowWithICQLink:(id)a3 presenter:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v14 = a3;
  id v10 = [[ICQUpgradeFlowManager alloc] initWithOffer:self->_offer];
  freshmintFlowManager = self->_freshmintFlowManager;
  self->_freshmintFlowManager = v10;

  [(ICQUpgradeFlowManager *)self->_freshmintFlowManager setDelegate:self];
  id v12 = (void *)[v8 copy];

  id freshmintFlowCompletion = self->_freshmintFlowCompletion;
  self->_id freshmintFlowCompletion = v12;

  [(ICQUpgradeFlowManager *)self->_freshmintFlowManager beginRemoteUpgradeFlowWithICQLink:v14 presenter:v9];
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v4 = a3;
  [(ICQPreferencesFreshmintManager *)self runFreshmintCompletionDidComplete:0];
  id v5 = [(ICQPreferencesFreshmintManager *)self delegate];
  [v5 upgradeFlowManagerDidCancel:v4];
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4 = a3;
  [(ICQPreferencesFreshmintManager *)self runFreshmintCompletionDidComplete:1];
  id v5 = [(ICQPreferencesFreshmintManager *)self delegate];
  [v5 upgradeFlowManagerDidComplete:v4];
}

- (void)runFreshmintCompletionDidComplete:(BOOL)a3
{
  [(ICQPreferencesFreshmintManager *)self setShouldShowFreshmint:0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__ICQPreferencesFreshmintManager_runFreshmintCompletionDidComplete___block_invoke;
  v5[3] = &unk_264921D90;
  v5[4] = self;
  BOOL v6 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __68__ICQPreferencesFreshmintManager_runFreshmintCompletionDidComplete___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) freshmintFlowCompletion];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) freshmintFlowCompletion];
    v3[2](v3, *(unsigned __int8 *)(a1 + 40), 0);

    id v4 = *(void **)(a1 + 32);
    [v4 setFreshmintFlowCompletion:0];
  }
}

- (BOOL)shouldShowFreshmint
{
  return self->_shouldShowFreshmint;
}

- (void)setShouldShowFreshmint:(BOOL)a3
{
  self->_shouldShowFreshmint = a3;
}

- (ICQUpgradeFlowManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQUpgradeFlowManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
}

- (ICQUpgradeFlowManager)freshmintFlowManager
{
  return self->_freshmintFlowManager;
}

- (void)setFreshmintFlowManager:(id)a3
{
}

- (id)freshmintFlowCompletion
{
  return self->_freshmintFlowCompletion;
}

- (void)setFreshmintFlowCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_freshmintFlowCompletion, 0);
  objc_storeStrong((id *)&self->_freshmintFlowManager, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
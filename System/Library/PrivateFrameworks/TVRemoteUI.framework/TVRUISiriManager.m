@interface TVRUISiriManager
+ (id)sharedManager;
- (SiriActivationAssertion)siriAssertion;
- (_TVRUIEventDelegate)buttonActionsDelegate;
- (void)_activateSiriAssertion;
- (void)_donateTipsTrigger;
- (void)_registerForSiriButtonEvents;
- (void)_releaseSiriAssertion;
- (void)_unregisterForSiriButtonEvents;
- (void)buttonEventListenerDidReceiveButtonDownWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4;
- (void)buttonEventListenerDidReceiveButtonLongPressWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4;
- (void)buttonEventListenerDidReceiveButtonUpWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4;
- (void)dealloc;
- (void)registerForSiriEvents;
- (void)setButtonActionsDelegate:(id)a3;
- (void)setSiriAssertion:(id)a3;
- (void)unregisterForSiriEvents;
@end

@implementation TVRUISiriManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __33__TVRUISiriManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(TVRUISiriManager);
  uint64_t v1 = sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)registerForSiriEvents
{
  [(TVRUISiriManager *)self _activateSiriAssertion];
  [(TVRUISiriManager *)self _registerForSiriButtonEvents];
}

- (void)unregisterForSiriEvents
{
  [(TVRUISiriManager *)self _releaseSiriAssertion];
  [(TVRUISiriManager *)self _unregisterForSiriButtonEvents];
}

- (void)dealloc
{
  [(TVRUISiriManager *)self unregisterForSiriEvents];
  v3.receiver = self;
  v3.super_class = (Class)TVRUISiriManager;
  [(TVRUISiriManager *)&v3 dealloc];
}

- (void)_activateSiriAssertion
{
  objc_super v3 = [(TVRUISiriManager *)self siriAssertion];

  if (!v3)
  {
    v4 = _TVRUISiriLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Grabbing activation assertion", v9, 2u);
    }

    id v5 = objc_alloc(MEMORY[0x263F6C750]);
    v6 = [MEMORY[0x263F086E0] mainBundle];
    v7 = [v6 bundleIdentifier];
    v8 = (void *)[v5 initWithIdentifier:v7 reason:1];
    [(TVRUISiriManager *)self setSiriAssertion:v8];
  }
}

- (void)_releaseSiriAssertion
{
  objc_super v3 = [(TVRUISiriManager *)self siriAssertion];

  if (v3)
  {
    v4 = _TVRUISiriLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Releasing activation assertion", v6, 2u);
    }

    id v5 = [(TVRUISiriManager *)self siriAssertion];
    [v5 invalidate];

    [(TVRUISiriManager *)self setSiriAssertion:0];
  }
}

- (void)_registerForSiriButtonEvents
{
  id v5 = [MEMORY[0x263F6C758] listener];
  objc_super v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 bundleIdentifier];
  [v5 registerWithListener:self identifier:v4];
}

- (void)_unregisterForSiriButtonEvents
{
  id v4 = [MEMORY[0x263F6C758] listener];
  v2 = [MEMORY[0x263F086E0] mainBundle];
  objc_super v3 = [v2 bundleIdentifier];
  [v4 unregisterListenerWithIdentifier:v3];
}

- (void)buttonEventListenerDidReceiveButtonDownWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  id v5 = +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 3, 4, a4);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__TVRUISiriManager_buttonEventListenerDidReceiveButtonDownWithButtonIdentifier_atTimestamp___block_invoke;
  v7[3] = &unk_264800638;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __92__TVRUISiriManager_buttonEventListenerDidReceiveButtonDownWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) buttonActionsDelegate];
  [v2 generatedButtonEvent:*(void *)(a1 + 40)];
}

- (void)buttonEventListenerDidReceiveButtonLongPressWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  id v5 = +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, 4, a4);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __97__TVRUISiriManager_buttonEventListenerDidReceiveButtonLongPressWithButtonIdentifier_atTimestamp___block_invoke;
  v7[3] = &unk_264800638;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __97__TVRUISiriManager_buttonEventListenerDidReceiveButtonLongPressWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) buttonActionsDelegate];
  [v2 generatedButtonEvent:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) _donateTipsTrigger];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"TVRUISiriManagerSiriActivated" object:0];
}

- (void)buttonEventListenerDidReceiveButtonUpWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  id v5 = +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, 4, a4);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__TVRUISiriManager_buttonEventListenerDidReceiveButtonUpWithButtonIdentifier_atTimestamp___block_invoke;
  v7[3] = &unk_264800638;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __90__TVRUISiriManager_buttonEventListenerDidReceiveButtonUpWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) buttonActionsDelegate];
  [v2 generatedButtonEvent:*(void *)(a1 + 40)];

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"TVRUISiriManagerSiriDeactivated" object:0];
}

- (void)_donateTipsTrigger
{
  id v2 = _TVRUITipsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_227326000, v2, OS_LOG_TYPE_DEFAULT, "Donating trigger for Siri tip context", v8, 2u);
  }

  id v3 = BiomeLibrary();
  id v4 = [v3 Discoverability];
  id v5 = [v4 Signals];

  id v6 = [v5 source];
  v7 = (void *)[objc_alloc(MEMORY[0x263F2A0D8]) initWithContentIdentifier:@"com.apple.TVRemoteUI.userIntentButton-tapped" context:0 osBuild:0 userInfo:0];
  [v6 sendEvent:v7];
}

- (_TVRUIEventDelegate)buttonActionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonActionsDelegate);
  return (_TVRUIEventDelegate *)WeakRetained;
}

- (void)setButtonActionsDelegate:(id)a3
{
}

- (SiriActivationAssertion)siriAssertion
{
  return self->_siriAssertion;
}

- (void)setSiriAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriAssertion, 0);
  objc_destroyWeak((id *)&self->_buttonActionsDelegate);
}

@end
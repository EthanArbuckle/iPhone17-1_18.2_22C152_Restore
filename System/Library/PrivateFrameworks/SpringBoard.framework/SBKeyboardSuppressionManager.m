@interface SBKeyboardSuppressionManager
+ (SBKeyboardSuppressionManager)sharedInstance;
- (SBKeyboardSuppressionManager)init;
- (id)acquireKeyboardSuppressionAssertionWithReason:(id)a3 predicate:(id)a4 displayIdentity:(id)a5;
- (id)description;
- (void)_setKeyboardSuppressed:(BOOL)a3 forReason:(id)a4 withPredicate:(id)a5 displayIdentity:(id)a6;
- (void)startSuppressingKeyboardWithReason:(id)a3 predicate:(id)a4 displayIdentity:(id)a5;
- (void)stopSuppressingKeyboardWithReason:(id)a3;
@end

@implementation SBKeyboardSuppressionManager

- (void)stopSuppressingKeyboardWithReason:(id)a3
{
}

- (void)_setKeyboardSuppressed:(BOOL)a3 forReason:(id)a4 withPredicate:(id)a5 displayIdentity:(id)a6
{
  BOOL v8 = a3;
  id v19 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [(NSMutableDictionary *)self->_keyboardSuppressionAssertions objectForKey:v19];
  v13 = v12;
  if (v8)
  {
    v14 = +[SBSceneManagerCoordinator sharedInstance];
    v15 = [v14 sceneDeactivationManager];
    v16 = (void *)[v15 newAssertionWithReason:8];

    v17 = [MEMORY[0x1E4F42790] transitionContext];
    v18 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.25];
    [v17 setAnimationSettings:v18];
    [(NSMutableDictionary *)self->_keyboardSuppressionAssertions setObject:v16 forKeyedSubscript:v19];
    if (v11) {
      objc_msgSend(v16, "sb_acquireWithPredicate:transitionContext:displayIdentity:", v10, v17, v11);
    }
    else {
      [v16 acquireWithPredicate:v10 transitionContext:v17];
    }
    [v13 relinquish];
  }
  else
  {

    if (!v13) {
      goto LABEL_9;
    }
    v13 = [(NSMutableDictionary *)self->_keyboardSuppressionAssertions objectForKeyedSubscript:v19];
    [v13 relinquish];
    [(NSMutableDictionary *)self->_keyboardSuppressionAssertions removeObjectForKey:v19];
  }

LABEL_9:
}

+ (SBKeyboardSuppressionManager)sharedInstance
{
  if (sharedInstance_token_0 != -1) {
    dispatch_once(&sharedInstance_token_0, &__block_literal_global_106);
  }
  v2 = (void *)sharedInstance___sharedKeyboardManager;
  return (SBKeyboardSuppressionManager *)v2;
}

uint64_t __46__SBKeyboardSuppressionManager_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBKeyboardSuppressionManager);
  v1 = (void *)sharedInstance___sharedKeyboardManager;
  sharedInstance___sharedKeyboardManager = (uint64_t)v0;

  return kdebug_trace();
}

- (SBKeyboardSuppressionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBKeyboardSuppressionManager;
  v2 = [(SBKeyboardSuppressionManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    keyboardSuppressionAssertions = v2->_keyboardSuppressionAssertions;
    v2->_keyboardSuppressionAssertions = v3;
  }
  return v2;
}

- (void)startSuppressingKeyboardWithReason:(id)a3 predicate:(id)a4 displayIdentity:(id)a5
{
}

- (id)acquireKeyboardSuppressionAssertionWithReason:(id)a3 predicate:(id)a4 displayIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = objc_alloc(MEMORY[0x1E4F4F838]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__SBKeyboardSuppressionManager_acquireKeyboardSuppressionAssertionWithReason_predicate_displayIdentity___block_invoke;
  v15[3] = &unk_1E6AFA6D0;
  objc_copyWeak(&v17, &location);
  id v12 = v8;
  id v16 = v12;
  v13 = (void *)[v11 initWithIdentifier:@"SBKeyboardSuppressionManager" forReason:v12 invalidationBlock:v15];
  [(SBKeyboardSuppressionManager *)self _setKeyboardSuppressed:1 forReason:v12 withPredicate:v9 displayIdentity:v10];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __104__SBKeyboardSuppressionManager_acquireKeyboardSuppressionAssertionWithReason_predicate_displayIdentity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained stopSuppressingKeyboardWithReason:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringWithFormat:@"<%@: %p, suppression reasons: %@>", v5, self, self->_keyboardSuppressionAssertions];

  return v6;
}

- (void).cxx_destruct
{
}

@end
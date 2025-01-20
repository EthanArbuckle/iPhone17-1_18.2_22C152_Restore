@interface SiriUIInstrumentationManager
+ (id)sharedManager;
- (AFAnalyticsTurnBasedInstrumentationContext)currentInstrumentationTurnContext;
- (SiriUIInstrumentationManager)init;
- (id)associatedDialogIdentifiersForAceObjectIdentifier:(id)a3;
- (void)emitUUFRPresentedEventWith:(id)a3 snippetClass:(id)a4 dialogIdentifier:(id)a5 dialogPhase:(id)a6;
- (void)storeCurrentInstrumentationTurnContext:(id)a3;
@end

@implementation SiriUIInstrumentationManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

uint64_t __45__SiriUIInstrumentationManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(SiriUIInstrumentationManager);
  uint64_t v1 = sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SiriUIInstrumentationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUIInstrumentationManager;
  return [(SiriUIInstrumentationManager *)&v3 init];
}

- (AFAnalyticsTurnBasedInstrumentationContext)currentInstrumentationTurnContext
{
  v2 = [MEMORY[0x263F754A8] sharedManager];
  objc_super v3 = [v2 currentInstrumentationTurnContext];

  return (AFAnalyticsTurnBasedInstrumentationContext *)v3;
}

- (void)storeCurrentInstrumentationTurnContext:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263F754A8];
  id v4 = a3;
  id v5 = [v3 sharedManager];
  [v5 storeCurrentInstrumentationTurnContext:v4];
}

- (void)emitUUFRPresentedEventWith:(id)a3 snippetClass:(id)a4 dialogIdentifier:(id)a5 dialogPhase:(id)a6
{
  v9 = (void *)MEMORY[0x263F754A8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v9 sharedManager];
  [v14 emitUUFRPresentedEventWith:v13 snippetClass:v12 dialogIdentifier:v11 dialogPhase:v10];
}

- (id)associatedDialogIdentifiersForAceObjectIdentifier:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263F754A8];
  id v4 = a3;
  id v5 = [v3 sharedManager];
  v6 = [v5 associatedDialogIdentifiersForAceObjectIdentifier:v4];

  return v6;
}

@end
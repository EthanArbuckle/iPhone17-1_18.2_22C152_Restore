@interface VRXTurnBasedInstrumentationEvent
- (BOOL)requiresNewTurn;
- (void)emitWithTurnIdentifier:(id)a3;
- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4;
@end

@implementation VRXTurnBasedInstrumentationEvent

- (BOOL)requiresNewTurn
{
  return 0;
}

- (void)emitWithTurnIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"You must override %@ in a subclass", v5 format];
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  NSStringFromSelector(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 raise:v5, @"You must override %@ in a subclass", v6 format];
}

@end
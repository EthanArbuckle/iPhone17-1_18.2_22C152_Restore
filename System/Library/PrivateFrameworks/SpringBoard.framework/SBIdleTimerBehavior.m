@interface SBIdleTimerBehavior
+ (id)autoLockBehavior;
+ (id)behaviorForBehaviorProvider:(id)a3;
+ (id)behaviorWithDuration:(int64_t)a3 mode:(int64_t)a4 warnMode:(int64_t)a5;
+ (id)defaultBehavior;
+ (id)disabledBehavior;
+ (id)lockScreenBehavior;
- (NSString)description;
- (double)customIdleExpirationTimeout;
- (double)customIdleWarningTimeout;
- (id)_initWithBehaviorProvider:(id)a3;
- (id)_initWithDuration:(int64_t)a3 mode:(int64_t)a4 warnMode:(int64_t)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (void)_appendInnerDescriptionToFormatter:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBIdleTimerBehavior

uint64_t __52__SBIdleTimerBehavior_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendInnerDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (int64_t)idleTimerMode
{
  return self->_idleTimerMode;
}

- (id)_initWithBehaviorProvider:(id)a3
{
  id v4 = a3;
  v5 = -[SBIdleTimerBehavior _initWithDuration:mode:warnMode:](self, "_initWithDuration:mode:warnMode:", [v4 idleTimerDuration], objc_msgSend(v4, "idleTimerMode"), objc_msgSend(v4, "idleWarnMode"));
  char v6 = objc_opt_respondsToSelector();
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (v6) {
    objc_msgSend(v4, "customIdleWarningTimeout", 0.0);
  }
  v5[4] = v8;
  if (objc_opt_respondsToSelector())
  {
    [v4 customIdleExpirationTimeout];
    uint64_t v7 = v9;
  }
  v5[5] = v7;

  return v5;
}

- (id)_initWithDuration:(int64_t)a3 mode:(int64_t)a4 warnMode:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SBIdleTimerBehavior;
  id result = [(SBIdleTimerBehavior *)&v9 init];
  if (result)
  {
    *((void *)result + 2) = a4;
    *((void *)result + 3) = a3;
    *((void *)result + 1) = a5;
  }
  return result;
}

- (int64_t)idleWarnMode
{
  return self->_idleWarnMode;
}

- (int64_t)idleTimerDuration
{
  return self->_idleTimerDuration;
}

- (double)customIdleExpirationTimeout
{
  return self->_customIdleExpirationTimeout;
}

- (double)customIdleWarningTimeout
{
  return self->_customIdleWarningTimeout;
}

- (void)_appendInnerDescriptionToFormatter:(id)a3
{
  id v9 = a3;
  id v4 = NSStringFromIdleTimerDuration();
  [v9 appendString:v4 withName:@"duration"];

  v5 = NSStringFromSBFIdleTimerMode();
  [v9 appendString:v5 withName:@"mode"];

  char v6 = NSStringFromIdleWarnMode();
  [v9 appendString:v6 withName:@"warnMode"];

  if ((BSFloatIsZero() & 1) == 0) {
    id v7 = (id)[v9 appendTimeInterval:@"customIdleExpirationTimeout" withName:0 decomposeUnits:self->_customIdleExpirationTimeout];
  }
  if ((BSFloatIsZero() & 1) == 0) {
    id v8 = (id)[v9 appendTimeInterval:@"customIdleWarningTimeout" withName:0 decomposeUnits:self->_customIdleWarningTimeout];
  }
}

+ (id)behaviorForBehaviorProvider:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithBehaviorProvider:v4];

  return v5;
}

+ (id)autoLockBehavior
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithDuration:12 mode:1 warnMode:2];
  return v2;
}

+ (id)disabledBehavior
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithDuration:14 mode:3 warnMode:1];
  return v2;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SBIdleTimerBehavior_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E6AF5290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

+ (id)defaultBehavior
{
  v3 = +[SBLockScreenManager sharedInstance];
  if ([v3 isUILocked])
  {

LABEL_4:
    char v6 = [a1 lockScreenBehavior];
    goto LABEL_6;
  }
  id v4 = +[SBCoverSheetPresentationManager sharedInstance];
  int v5 = [v4 isVisible];

  if (v5) {
    goto LABEL_4;
  }
  char v6 = [a1 autoLockBehavior];
LABEL_6:
  return v6;
}

+ (id)lockScreenBehavior
{
  v3 = +[SBLockScreenManager sharedInstance];
  id v4 = [v3 lockScreenEnvironment];
  int v5 = [v4 idleTimerController];

  if (objc_opt_respondsToSelector())
  {
    char v6 = [v5 requestIdleTimerBehaviorForReason:@"lockScreenIdleTimerDescriptor"];
    id v7 = [a1 behaviorForBehaviorProvider:v6];
  }
  else
  {
    id v7 = (void *)[objc_alloc((Class)a1) _initWithDuration:1 mode:1 warnMode:2];
  }

  return v7;
}

+ (id)behaviorWithDuration:(int64_t)a3 mode:(int64_t)a4 warnMode:(int64_t)a5
{
  int v5 = (void *)[objc_alloc((Class)a1) _initWithDuration:a3 mode:a4 warnMode:a5];
  return v5;
}

- (id)succinctDescription
{
  v2 = [(SBIdleTimerBehavior *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBIdleTimerBehavior *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  int v5 = [(SBIdleTimerBehavior *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__SBIdleTimerBehavior_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

uint64_t __61__SBIdleTimerBehavior_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendInnerDescriptionToFormatter:*(void *)(a1 + 40)];
}

@end
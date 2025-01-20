@interface PBUIPosterFloatingView
- (BOOL)effectsAreBakedIn;
- (BOOL)floatingLayerHasStandin;
- (BOOL)isFloatingLayerStandin;
- (NSString)cacheIdentifier;
- (NSString)description;
- (PBUIPosterFloatingView)initWithFrame:(CGRect)a3;
- (UIView)defaultFloatingLayerStandin;
- (_UILegibilitySettings)legibilitySettings;
- (id)acquireSourceUsageAssertionForView:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)setDefaultFloatingLayerStandin:(id)a3;
- (void)setFloatingLayerHasStandin:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
@end

@implementation PBUIPosterFloatingView

- (PBUIPosterFloatingView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PBUIPosterFloatingView;
  v3 = -[PBUIPosterFloatingView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = (void *)MEMORY[0x1E4F4F6E8];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__PBUIPosterFloatingView_initWithFrame___block_invoke;
    v8[3] = &unk_1E62B2800;
    objc_copyWeak(&v9, &location);
    uint64_t v5 = [v4 assertionWithIdentifier:@"FloatingLayer" stateDidChangeHandler:v8];
    currentUsers = v3->_currentUsers;
    v3->_currentUsers = (BSCompoundAssertion *)v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __40__PBUIPosterFloatingView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = [v6 context];
    uint64_t v5 = objc_msgSend(v4, "bs_containsObjectPassingTest:", &__block_literal_global_0);

    [WeakRetained setFloatingLayerHasStandin:v5];
  }
}

uint64_t __40__PBUIPosterFloatingView_initWithFrame___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isFloatingLayerStandin];
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_currentUsers invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBUIPosterFloatingView;
  [(PBUIPosterFloatingView *)&v3 dealloc];
}

- (BOOL)floatingLayerHasStandin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultFloatingLayerStandin);
  char v3 = [WeakRetained isHidden];

  return v3;
}

- (void)setFloatingLayerHasStandin:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultFloatingLayerStandin);
  [WeakRetained setHidden:v3];
}

- (id)acquireSourceUsageAssertionForView:(id)a3
{
  id v5 = a3;
  NSClassFromString(&cfstr_Pbuiposterfloa.isa);
  if (!v5)
  {
    objc_super v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterFloatingView acquireSourceUsageAssertionForView:](a2);
    }
LABEL_11:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC4C0E7CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBUIPosterFloatingLayerReplicaClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterFloatingView acquireSourceUsageAssertionForView:](a2);
    }
    goto LABEL_11;
  }

  id v6 = (void *)MEMORY[0x1E4F4F718];
  id v7 = v5;
  v8 = [v6 succinctDescriptionForObject:v7];
  id v9 = [(BSCompoundAssertion *)self->_currentUsers acquireForReason:v8 withContext:v7];

  return v9;
}

- (BOOL)effectsAreBakedIn
{
  return 0;
}

- (NSString)cacheIdentifier
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[(PBUIPosterFloatingView *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(PBUIPosterFloatingView *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIPosterFloatingView floatingLayerHasStandin](self, "floatingLayerHasStandin"), @"floatingLayerHasStandin");
  id v6 = [(PBUIPosterFloatingView *)self cacheIdentifier];
  [v4 appendString:v6 withName:@"cacheIdentifier"];

  id v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[PBUIPosterFloatingView effectsAreBakedIn](self, "effectsAreBakedIn"), @"effectsAreBakedIn");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultFloatingLayerStandin);
  id v9 = (id)[v4 appendObject:WeakRetained withName:@"defaultFloatingLayerStandin"];

  v10 = [(BSCompoundAssertion *)self->_currentUsers context];
  if (v10)
  {
    objc_super v11 = [(BSCompoundAssertion *)self->_currentUsers context];
    v12 = [v11 allObjects];
    [v4 appendArraySection:v12 withName:@"currentUsers" skipIfEmpty:0];
  }
  else
  {
    [v4 appendArraySection:0 withName:@"currentUsers" skipIfEmpty:0];
  }

  return v4;
}

- (id)succinctDescription
{
  v2 = [(PBUIPosterFloatingView *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (UIView)defaultFloatingLayerStandin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultFloatingLayerStandin);
  return (UIView *)WeakRetained;
}

- (void)setDefaultFloatingLayerStandin:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (BOOL)isFloatingLayerStandin
{
  return self->_floatingLayerHasStandin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_defaultFloatingLayerStandin);
  objc_storeStrong((id *)&self->_currentUsers, 0);
}

- (void)acquireSourceUsageAssertionForView:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

@end
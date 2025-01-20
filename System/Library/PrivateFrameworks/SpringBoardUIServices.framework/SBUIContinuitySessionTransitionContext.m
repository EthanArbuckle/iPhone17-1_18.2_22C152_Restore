@interface SBUIContinuitySessionTransitionContext
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BSAnimationSettings)animationSettings;
- (NSString)description;
- (SBUIContinuitySessionTransitionContext)init;
- (SBUIContinuitySessionTransitionContext)initWithBSXPCCoder:(id)a3;
- (id)_initWithBSSettings:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)succinctDescription;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setAnimationSettings:(id)a3;
@end

@implementation SBUIContinuitySessionTransitionContext

- (SBUIContinuitySessionTransitionContext)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  v4 = [(SBUIContinuitySessionTransitionContext *)self _initWithBSSettings:v3];

  return v4;
}

- (id)_initWithBSSettings:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBUIContinuitySessionAppearanceSettings.m", 182, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBUIContinuitySessionTransitionContext;
  v6 = [(SBUIContinuitySessionTransitionContext *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 mutableCopy];
    mutableSettings = v6->_mutableSettings;
    v6->_mutableSettings = (BSMutableSettings *)v7;

    [(BSMutableSettings *)v6->_mutableSettings setDescriptionProvider:v6];
  }

  return v6;
}

- (void)dealloc
{
  [(BSMutableSettings *)self->_mutableSettings setDescriptionProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)SBUIContinuitySessionTransitionContext;
  [(SBUIContinuitySessionTransitionContext *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBUIContinuitySessionTransitionContext *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    v6 = [(SBUIContinuitySessionTransitionContext *)self animationSettings];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__SBUIContinuitySessionTransitionContext_isEqual___block_invoke;
    v10[3] = &unk_1E5CCE480;
    objc_super v11 = v4;
    id v7 = (id)[v5 appendObject:v6 counterpart:v10];

    char v8 = [v5 isEqual];
  }

  return v8;
}

uint64_t __50__SBUIContinuitySessionTransitionContext_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) animationSettings];
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x1E4F4F758] builder];
  v4 = [(SBUIContinuitySessionTransitionContext *)self animationSettings];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

- (void)setAnimationSettings:(id)a3
{
}

- (BSAnimationSettings)animationSettings
{
  return (BSAnimationSettings *)[(BSMutableSettings *)self->_mutableSettings objectForSetting:1];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  mutableSettings = self->_mutableSettings;
  id v4 = a3;
  id v5 = (id)[(BSMutableSettings *)mutableSettings copy];
  [v4 encodeObject:v5 forKey:@"settings"];
}

- (SBUIContinuitySessionTransitionContext)initWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"settings"];

  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBUIContinuitySessionAppearanceSettings.m" lineNumber:240 description:@"Unable to decode settings"];
  }
  id v7 = [(SBUIContinuitySessionTransitionContext *)self _initWithBSSettings:v6];

  return v7;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"animationSettings";
  }
  else {
    return 0;
  }
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  objc_super v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__SBUIContinuitySessionTransitionContext_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E5CCC878;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

void __68__SBUIContinuitySessionTransitionContext_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) animationSettings];
  id v2 = (id)[v1 appendObject:v3 withName:@"animationSettings" skipIfNil:1];
}

- (void).cxx_destruct
{
}

@end
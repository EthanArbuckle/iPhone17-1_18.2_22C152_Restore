@interface SBLockScreenPluginContext
+ (id)contextWithName:(id)a3;
- (FBSProcess)process;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)name;
- (SBLockScreenPluginLifecycleObserver)observer;
- (id)auxiliaryAnimation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setAuxiliaryAnimation:(id)a3;
- (void)setName:(id)a3;
- (void)setObserver:(id)a3;
- (void)setProcess:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation SBLockScreenPluginContext

+ (id)contextWithName:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SBLockScreenPluginContext);
  [(SBLockScreenPluginContext *)v4 setName:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SBLockScreenPluginContext);
  [(SBLockScreenPluginContext *)v4 setName:self->_name];
  [(SBLockScreenPluginContext *)v4 setUserInfo:self->_userInfo];
  [(SBLockScreenPluginContext *)v4 setProcess:self->_process];
  [(SBLockScreenPluginContext *)v4 setAuxiliaryAnimation:self->_auxiliaryAnimation];
  return v4;
}

- (NSString)description
{
  return (NSString *)[(SBLockScreenPluginContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBLockScreenPluginContext *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_name withName:@"name"];
  v5 = FBSProcessPrettyDescription();
  id v6 = (id)[v3 appendObject:v5 withName:@"process"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBLockScreenPluginContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBLockScreenPluginContext *)self succinctDescriptionBuilder];
  id v6 = v5;
  if (self->_userInfo)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__SBLockScreenPluginContext_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_2645D4318;
    id v9 = v5;
    v10 = self;
    [v9 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];
  }

  return v6;
}

uint64_t __67__SBLockScreenPluginContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 16) withName:@"userInfo" skipIfEmpty:1];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (FBSProcess)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (id)auxiliaryAnimation
{
  return self->_auxiliaryAnimation;
}

- (void)setAuxiliaryAnimation:(id)a3
{
}

- (SBLockScreenPluginLifecycleObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong(&self->_auxiliaryAnimation, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
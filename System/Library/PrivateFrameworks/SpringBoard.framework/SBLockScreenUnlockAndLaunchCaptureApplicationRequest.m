@interface SBLockScreenUnlockAndLaunchCaptureApplicationRequest
- (BOOL)isEqual:(id)a3;
- (NSSet)launchActions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setLaunchActions:(id)a3;
@end

@implementation SBLockScreenUnlockAndLaunchCaptureApplicationRequest

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBLockScreenUnlockAndLaunchCaptureApplicationRequest;
  id v4 = [(SBLockScreenUnlockRequest *)&v7 copyWithZone:a3];
  v5 = [(SBLockScreenUnlockAndLaunchCaptureApplicationRequest *)self launchActions];
  [v4 setLaunchActions:v5];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_isEqual___block_invoke;
  v14[3] = &unk_1E6AF5420;
  id v6 = v4;
  id v15 = v6;
  v16 = self;
  id v7 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v14, 0);
  launchActions = self->_launchActions;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_isEqual___block_invoke_2;
  v12[3] = &unk_1E6AF9E90;
  id v13 = v6;
  id v9 = v6;
  id v10 = (id)[v5 appendObject:launchActions counterpart:v12];
  LOBYTE(launchActions) = [v5 isEqual];

  return (char)launchActions;
}

id __64__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)SBLockScreenUnlockAndLaunchCaptureApplicationRequest;
  return objc_msgSendSuper2(&v3, sel_isEqual_, v1);
}

uint64_t __64__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) launchActions];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendSuper];
  id v5 = (id)[v3 appendObject:self->_launchActions withName:@"launchActions" skipIfNil:1];
  id v6 = [v3 build];

  return v6;
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x1E4F4F758] builder];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_hash__block_invoke;
  v8[3] = &unk_1E6AF5470;
  v8[4] = self;
  id v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v8, 0);
  id v5 = (id)[v3 appendObject:self->_launchActions];
  unint64_t v6 = [v3 hash];

  return v6;
}

id __60__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_hash__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)SBLockScreenUnlockAndLaunchCaptureApplicationRequest;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (void)setLaunchActions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
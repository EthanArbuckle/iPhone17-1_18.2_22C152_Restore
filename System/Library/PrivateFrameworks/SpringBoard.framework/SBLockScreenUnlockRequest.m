@interface SBLockScreenUnlockRequest
- (BOOL)confirmedNotInPocket;
- (BOOL)forceAlertAuthenticationUI;
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsBiometricPresentation;
- (BSProcessHandle)process;
- (NSString)name;
- (NSString)subtitle;
- (NSString)title;
- (NSString)unlockDestination;
- (SBApplication)destinationApplication;
- (SBWindowScene)windowScene;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)intent;
- (int)source;
- (unint64_t)hash;
- (void)setConfirmedNotInPocket:(BOOL)a3;
- (void)setDestinationApplication:(id)a3;
- (void)setForceAlertAuthenticationUI:(BOOL)a3;
- (void)setIntent:(int)a3;
- (void)setName:(id)a3;
- (void)setProcess:(id)a3;
- (void)setSource:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnlockDestination:(id)a3;
- (void)setWantsBiometricPresentation:(BOOL)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation SBLockScreenUnlockRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_destinationApplication, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (int)source
{
  return self->_source;
}

- (int)intent
{
  return self->_intent;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (void)setName:(id)a3
{
}

- (void)setIntent:(int)a3
{
  self->_intent = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(SBLockScreenUnlockRequest *)self name];
  [v4 setName:v5];

  objc_msgSend(v4, "setSource:", -[SBLockScreenUnlockRequest source](self, "source"));
  objc_msgSend(v4, "setIntent:", -[SBLockScreenUnlockRequest intent](self, "intent"));
  v6 = [(SBLockScreenUnlockRequest *)self process];
  [v4 setProcess:v6];

  v7 = [(SBLockScreenUnlockRequest *)self destinationApplication];
  [v4 setDestinationApplication:v7];

  objc_msgSend(v4, "setWantsBiometricPresentation:", -[SBLockScreenUnlockRequest wantsBiometricPresentation](self, "wantsBiometricPresentation"));
  objc_msgSend(v4, "setForceAlertAuthenticationUI:", -[SBLockScreenUnlockRequest forceAlertAuthenticationUI](self, "forceAlertAuthenticationUI"));
  v8 = [(SBLockScreenUnlockRequest *)self title];
  [v4 setTitle:v8];

  v9 = [(SBLockScreenUnlockRequest *)self subtitle];
  [v4 setSubtitle:v9];

  v10 = [(SBLockScreenUnlockRequest *)self unlockDestination];
  [v4 setUnlockDestination:v10];

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_name withName:@"name" skipIfNil:1];
  v5 = NSStringFromUnlockSource();
  [v3 appendString:v5 withName:@"source"];

  v6 = NSStringFromUnlockIntent();
  [v3 appendString:v6 withName:@"intent"];

  v7 = [MEMORY[0x1E4F4F718] succinctDescriptionForObject:self->_process];
  id v8 = (id)[v3 appendObject:v7 withName:@"process" skipIfNil:1];

  v9 = [MEMORY[0x1E4F4F718] succinctDescriptionForObject:self->_destinationApplication];
  id v10 = (id)[v3 appendObject:v9 withName:@"destinationApplication" skipIfNil:1];

  id v11 = (id)[v3 appendBool:self->_wantsBiometricPresentation withName:@"wantsBiometricPresentation"];
  id v12 = (id)[v3 appendBool:self->_forceAlertAuthenticationUI withName:@"forcesAlertAuthenticationUI"];
  [v3 appendString:self->_title withName:@"title" skipIfEmpty:1];
  [v3 appendString:self->_subtitle withName:@"subtitle" skipIfEmpty:1];
  [v3 appendString:self->_unlockDestination withName:@"unlockDestination" skipIfEmpty:1];
  v13 = [v3 build];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  name = self->_name;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke;
  v58[3] = &unk_1E6AFD560;
  id v7 = v4;
  id v59 = v7;
  id v8 = (id)[v5 appendString:name counterpart:v58];
  uint64_t source = self->_source;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_2;
  v56[3] = &unk_1E6AF9660;
  id v10 = v7;
  id v57 = v10;
  id v11 = (id)[v5 appendInteger:source counterpart:v56];
  uint64_t intent = self->_intent;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_3;
  v54[3] = &unk_1E6AF9660;
  id v13 = v10;
  id v55 = v13;
  id v14 = (id)[v5 appendInteger:intent counterpart:v54];
  uint64_t v15 = (int)[(BSProcessHandle *)self->_process pid];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_4;
  v52[3] = &unk_1E6AF9660;
  id v16 = v13;
  id v53 = v16;
  id v17 = (id)[v5 appendInteger:v15 counterpart:v52];
  destinationApplication = self->_destinationApplication;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_5;
  v50[3] = &unk_1E6AF9E90;
  id v19 = v16;
  id v51 = v19;
  id v20 = (id)[v5 appendObject:destinationApplication counterpart:v50];
  BOOL wantsBiometricPresentation = self->_wantsBiometricPresentation;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_6;
  v48[3] = &unk_1E6AF99E8;
  id v22 = v19;
  id v49 = v22;
  id v23 = (id)[v5 appendBool:wantsBiometricPresentation counterpart:v48];
  BOOL forceAlertAuthenticationUI = self->_forceAlertAuthenticationUI;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_7;
  v46[3] = &unk_1E6AF99E8;
  id v25 = v22;
  id v47 = v25;
  id v26 = (id)[v5 appendBool:forceAlertAuthenticationUI counterpart:v46];
  title = self->_title;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_8;
  v44[3] = &unk_1E6AFD560;
  id v28 = v25;
  id v45 = v28;
  id v29 = (id)[v5 appendString:title counterpart:v44];
  subtitle = self->_subtitle;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_9;
  v42[3] = &unk_1E6AFD560;
  id v31 = v28;
  id v43 = v31;
  id v32 = (id)[v5 appendString:subtitle counterpart:v42];
  unlockDestination = self->_unlockDestination;
  uint64_t v37 = MEMORY[0x1E4F143A8];
  uint64_t v38 = 3221225472;
  v39 = __37__SBLockScreenUnlockRequest_isEqual___block_invoke_10;
  v40 = &unk_1E6AFD560;
  id v41 = v31;
  id v34 = v31;
  id v35 = (id)[v5 appendString:unlockDestination counterpart:&v37];
  LOBYTE(v31) = objc_msgSend(v5, "isEqual", v37, v38, v39, v40);

  return (char)v31;
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) name];
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) source];
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) intent];
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) process];
  uint64_t v2 = (int)[v1 pid];

  return v2;
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) destinationApplication];
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) wantsBiometricPresentation];
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceAlertAuthenticationUI];
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) title];
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) subtitle];
}

uint64_t __37__SBLockScreenUnlockRequest_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) unlockDestination];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_name];
  id v5 = (id)[v3 appendInteger:self->_source];
  id v6 = (id)[v3 appendInteger:self->_intent];
  id v7 = (id)[v3 appendObject:self->_process];
  id v8 = (id)[v3 appendObject:self->_destinationApplication];
  id v9 = (id)[v3 appendBool:self->_wantsBiometricPresentation];
  id v10 = (id)[v3 appendBool:self->_forceAlertAuthenticationUI];
  id v11 = (id)[v3 appendString:self->_title];
  id v12 = (id)[v3 appendString:self->_subtitle];
  id v13 = (id)[v3 appendString:self->_unlockDestination];
  unint64_t v14 = [v3 hash];

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (BSProcessHandle)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (SBApplication)destinationApplication
{
  return self->_destinationApplication;
}

- (void)setDestinationApplication:(id)a3
{
}

- (BOOL)wantsBiometricPresentation
{
  return self->_wantsBiometricPresentation;
}

- (void)setWantsBiometricPresentation:(BOOL)a3
{
  self->_BOOL wantsBiometricPresentation = a3;
}

- (BOOL)forceAlertAuthenticationUI
{
  return self->_forceAlertAuthenticationUI;
}

- (void)setForceAlertAuthenticationUI:(BOOL)a3
{
  self->_BOOL forceAlertAuthenticationUI = a3;
}

- (BOOL)confirmedNotInPocket
{
  return self->_confirmedNotInPocket;
}

- (void)setConfirmedNotInPocket:(BOOL)a3
{
  self->_confirmedNotInPocket = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)unlockDestination
{
  return self->_unlockDestination;
}

- (void)setUnlockDestination:(id)a3
{
}

- (void)setWindowScene:(id)a3
{
}

@end
@interface SBStartupTransitionContext
- (BKSDisplayRenderOverlay)overlay;
- (BOOL)fromLocked;
- (BOOL)fromUserPowerDown;
- (BOOL)hasUserSwitchOverlayMismatch;
- (BOOL)isDark;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLogin;
- (BOOL)isLogout;
- (NSString)description;
- (NSString)fromApplicationBundleID;
- (NSString)reason;
- (NSURL)applicationLaunchURL;
- (id)_initWithRebootContext:(id)a3;
- (id)_initWithRepresentation:(id)a3 loginSession:(BOOL)a4;
- (id)_initWithRestartRequest:(id)a3 fromLocked:(BOOL)a4 fromApplication:(id)a5;
- (id)_initWithShutdownContext:(id)a3;
- (id)_representation;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_parseOverlayInfo;
- (void)_reallyInitFromRepresentation:(id)a3;
- (void)setApplicationLaunchURL:(id)a3;
- (void)setDark:(BOOL)a3;
- (void)setFromApplicationBundleID:(id)a3;
- (void)setFromLocked:(BOOL)a3;
- (void)setFromUserPowerDown:(BOOL)a3;
- (void)setHasUserSwitchOverlayMismatch:(BOOL)a3;
- (void)setLogin:(BOOL)a3;
- (void)setLogout:(BOOL)a3;
- (void)setOverlay:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation SBStartupTransitionContext

- (id)_initWithRepresentation:(id)a3 loginSession:(BOOL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBStartupTransitionContext;
  v7 = [(SBStartupTransitionContext *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_isLoginSession = a4;
    [(SBStartupTransitionContext *)v7 _reallyInitFromRepresentation:v6];
  }

  return v8;
}

- (id)_initWithRestartRequest:(id)a3 fromLocked:(BOOL)a4 fromApplication:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBStartupTransitionContext;
  objc_super v10 = [(SBStartupTransitionContext *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v8 reason];
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;

    uint64_t v13 = [v8 applicationLaunchURL];
    applicationLaunchURL = v10->_applicationLaunchURL;
    v10->_applicationLaunchURL = (NSURL *)v13;

    v10->_fromLocked = a4;
    objc_storeStrong((id *)&v10->_fromApplicationBundleID, a5);
    v15 = [MEMORY[0x1E4F624D0] sharedInstance];
    v16 = [v15 initializationContext];
    v10->_isDark = [v16 wasBootedDark];
  }
  return v10;
}

- (id)_initWithRebootContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBStartupTransitionContext;
  v5 = [(SBStartupTransitionContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 reason];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    v5->_isDark = [v4 isDark];
  }

  return v5;
}

- (id)_initWithShutdownContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBStartupTransitionContext;
  v5 = [(SBStartupTransitionContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 reason];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    v5->_fromUserPowerDown = [v4 fromUserPowerDown];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL isLogin = self->_isLogin;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __38__SBStartupTransitionContext_isEqual___block_invoke;
  v50[3] = &unk_1E6AF99E8;
  id v7 = v4;
  id v51 = v7;
  id v8 = (id)[v5 appendBool:isLogin counterpart:v50];
  BOOL isLogout = self->_isLogout;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_2;
  v48[3] = &unk_1E6AF99E8;
  id v10 = v7;
  id v49 = v10;
  id v11 = (id)[v5 appendBool:isLogout counterpart:v48];
  BOOL isDark = self->_isDark;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_3;
  v46[3] = &unk_1E6AF99E8;
  id v13 = v10;
  id v47 = v13;
  id v14 = (id)[v5 appendBool:isDark counterpart:v46];
  BOOL fromLocked = self->_fromLocked;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_4;
  v44[3] = &unk_1E6AF99E8;
  id v16 = v13;
  id v45 = v16;
  id v17 = (id)[v5 appendBool:fromLocked counterpart:v44];
  overlay = self->_overlay;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_5;
  v42[3] = &unk_1E6AF5180;
  id v19 = v16;
  id v43 = v19;
  id v20 = (id)[v5 appendObject:overlay counterpart:v42];
  applicationLaunchURL = self->_applicationLaunchURL;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_6;
  v40[3] = &unk_1E6AF5180;
  id v22 = v19;
  id v41 = v22;
  id v23 = (id)[v5 appendObject:applicationLaunchURL counterpart:v40];
  fromApplicationBundleID = self->_fromApplicationBundleID;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_7;
  v38[3] = &unk_1E6AF5180;
  id v25 = v22;
  id v39 = v25;
  id v26 = (id)[v5 appendObject:fromApplicationBundleID counterpart:v38];
  reason = self->_reason;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_8;
  v36[3] = &unk_1E6AF5180;
  id v28 = v25;
  id v37 = v28;
  id v29 = (id)[v5 appendObject:reason counterpart:v36];
  BOOL fromUserPowerDown = self->_fromUserPowerDown;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __38__SBStartupTransitionContext_isEqual___block_invoke_9;
  v34[3] = &unk_1E6AF99E8;
  id v35 = v28;
  id v31 = v28;
  id v32 = (id)[v5 appendBool:fromUserPowerDown counterpart:v34];
  LOBYTE(v28) = [v5 isEqual];

  return (char)v28;
}

uint64_t __38__SBStartupTransitionContext_isEqual___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 34);
}

uint64_t __38__SBStartupTransitionContext_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 35);
}

uint64_t __38__SBStartupTransitionContext_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 33);
}

uint64_t __38__SBStartupTransitionContext_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 32);
}

id __38__SBStartupTransitionContext_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

id __38__SBStartupTransitionContext_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __38__SBStartupTransitionContext_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __38__SBStartupTransitionContext_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

uint64_t __38__SBStartupTransitionContext_isEqual___block_invoke_9(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 48);
}

- (void)_reallyInitFromRepresentation:(id)a3
{
  id v18 = a3;
  objc_msgSend(v18, "bs_safeObjectForKey:ofType:", @"__reason", objc_opt_class());
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  reason = self->_reason;
  self->_reason = v4;

  self->_BOOL fromLocked = 0;
  uint64_t v6 = objc_msgSend(v18, "bs_safeObjectForKey:ofType:", @"__fromLocked", objc_opt_class());
  id v7 = v6;
  if (v6) {
    self->_BOOL fromLocked = [v6 BOOLValue];
  }
  applicationLaunchURL = self->_applicationLaunchURL;
  self->_applicationLaunchURL = 0;

  objc_super v9 = [v18 objectForKeyedSubscript:@"__appLaunchURL"];
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    id v11 = self->_applicationLaunchURL;
    self->_applicationLaunchURL = v10;
  }
  v12 = [v18 objectForKeyedSubscript:@"__fromAppBundleID"];
  fromApplicationBundleID = self->_fromApplicationBundleID;
  self->_fromApplicationBundleID = v12;

  id v14 = [MEMORY[0x1E4F624D0] sharedInstance];
  v15 = [v14 initializationContext];
  self->_BOOL isDark = [v15 wasBootedDark];

  self->_BOOL fromUserPowerDown = 0;
  id v16 = objc_msgSend(v18, "bs_safeObjectForKey:ofType:", @"__fromUserPowerDown", objc_opt_class());
  id v17 = v16;
  if (v16) {
    self->_BOOL fromUserPowerDown = [v16 BOOLValue];
  }
  [(SBStartupTransitionContext *)self _parseOverlayInfo];
}

- (id)_representation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  reason = self->_reason;
  if (reason) {
    [v3 setObject:reason forKeyedSubscript:@"__reason"];
  }
  applicationLaunchURL = self->_applicationLaunchURL;
  if (applicationLaunchURL)
  {
    id v7 = [(NSURL *)applicationLaunchURL absoluteString];
    [v4 setObject:v7 forKeyedSubscript:@"__appLaunchURL"];
  }
  fromApplicationBundleID = self->_fromApplicationBundleID;
  if (fromApplicationBundleID) {
    [v4 setObject:fromApplicationBundleID forKeyedSubscript:@"__fromAppBundleID"];
  }
  objc_super v9 = [NSNumber numberWithBool:self->_fromLocked];
  [v4 setObject:v9 forKeyedSubscript:@"__fromLocked"];

  id v10 = [NSNumber numberWithBool:self->_fromUserPowerDown];
  [v4 setObject:v10 forKeyedSubscript:@"__fromUserPowerDown"];

  return v4;
}

- (NSString)description
{
  return (NSString *)[(SBStartupTransitionContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBStartupTransitionContext *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBStartupTransitionContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBStartupTransitionContext *)self succinctDescriptionBuilder];
  [v4 appendString:self->_reason withName:@"restartReason"];
  id v5 = (id)[v4 appendObject:self->_applicationLaunchURL withName:@"applicationLaunchURL" skipIfNil:1];
  id v6 = (id)[v4 appendObject:self->_fromApplicationBundleID withName:@"fromApplication" skipIfNil:1];
  id v7 = (id)[v4 appendBool:self->_fromLocked withName:@"fromLocked"];
  id v8 = (id)[v4 appendBool:self->_fromUserPowerDown withName:@"fromUserPowerDown"];
  id v9 = (id)[v4 appendBool:self->_isDark withName:@"fromDarkBoot"];
  id v10 = (id)[v4 appendBool:self->_isLogin withName:@"isLogin"];
  id v11 = (id)[v4 appendBool:self->_isLogout withName:@"isLogout"];
  id v12 = (id)[v4 appendBool:self->_isLoginSession withName:@"isLoginSession"];
  if (self->_overlay)
  {
    id v13 = [v4 activeMultilinePrefix];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__SBStartupTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
    v15[3] = &unk_1E6AF5290;
    id v16 = v4;
    id v17 = self;
    [v16 appendBodySectionWithName:0 multilinePrefix:v13 block:v15];
  }
  return v4;
}

id __68__SBStartupTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"overlay" skipIfNil:1];
}

- (void)_parseOverlayInfo
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Overlay user switch mismatch due to being inside a login session and booting with the login overlay.", v1, 2u);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSURL)applicationLaunchURL
{
  return self->_applicationLaunchURL;
}

- (void)setApplicationLaunchURL:(id)a3
{
}

- (NSString)fromApplicationBundleID
{
  return self->_fromApplicationBundleID;
}

- (void)setFromApplicationBundleID:(id)a3
{
}

- (BOOL)fromLocked
{
  return self->_fromLocked;
}

- (void)setFromLocked:(BOOL)a3
{
  self->_BOOL fromLocked = a3;
}

- (BOOL)fromUserPowerDown
{
  return self->_fromUserPowerDown;
}

- (void)setFromUserPowerDown:(BOOL)a3
{
  self->_BOOL fromUserPowerDown = a3;
}

- (BOOL)isLogin
{
  return self->_isLogin;
}

- (void)setLogin:(BOOL)a3
{
  self->_BOOL isLogin = a3;
}

- (BOOL)isLogout
{
  return self->_isLogout;
}

- (void)setLogout:(BOOL)a3
{
  self->_BOOL isLogout = a3;
}

- (BKSDisplayRenderOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (BOOL)isDark
{
  return self->_isDark;
}

- (void)setDark:(BOOL)a3
{
  self->_BOOL isDark = a3;
}

- (BOOL)hasUserSwitchOverlayMismatch
{
  return self->_hasUserSwitchOverlayMismatch;
}

- (void)setHasUserSwitchOverlayMismatch:(BOOL)a3
{
  self->_hasUserSwitchOverlayMismatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_applicationLaunchURL, 0);
  objc_storeStrong((id *)&self->_fromApplicationBundleID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
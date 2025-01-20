@interface VCAccessSpecifier
+ (id)accessSpecifierFilteredForAssociatedAppBundleIdentifier:(id)a3 bundleIdentifier:(id)a4;
+ (id)accessSpecifierForAuditToken:(id *)a3;
+ (id)accessSpecifierForCurrentConnection;
+ (id)accessSpecifierForCurrentProcess;
+ (id)accessSpecifierForTask:(__SecTask *)a3 auditToken:(id)a4 sandboxCapabilities:(int64_t)a5;
+ (id)accessSpecifierForXPCConnection:(id)a3;
+ (id)accessSpecifierUnrestricted;
+ (id)accessSpecifierUnrestrictedWithAssociatedAppBundleIdentifier:(id)a3 bundleIdentifier:(id)a4;
+ (id)accessSpecifierWithNoAccess;
+ (id)accessSpecifierWithNoAccessForBundleIdentifier:(id)a3;
- (BOOL)allowConnection;
- (BOOL)allowDropletCreation;
- (BOOL)allowFullRuntimeAccess;
- (BOOL)allowHomeResidentShortcutRunning;
- (BOOL)allowIntentsExtensionDiscovery;
- (BOOL)allowLinkContextualActionRunningForBundleIdentifier:(id)a3;
- (BOOL)allowReadAccessForContextualActions;
- (BOOL)allowReadAccessForDonations;
- (BOOL)allowReadAccessForSleepWorkflows;
- (BOOL)allowReadAccessToShortcutsLibrary;
- (BOOL)allowReadAccessToSingleStepShortcutsWithBundleIdentifier:(id)a3;
- (BOOL)allowReadAccessToSuggestionsWithBundleIdentifier:(id)a3;
- (BOOL)allowReadingOnScreenContent;
- (BOOL)allowResettingAutomationConfirmationLevel;
- (BOOL)allowRootlessShortcutStorageAccess;
- (BOOL)allowRunningTestHarnessTests;
- (BOOL)allowShortcutImport;
- (BOOL)allowStepwiseExecution;
- (BOOL)allowUnrestrictedAccess;
- (BOOL)allowVariableInjection;
- (BOOL)allowWriteAccessForSleepWorkflows;
- (BOOL)allowWriteAccessToSuggestionsWithBundleIdentifier:(id)a3;
- (BOOL)hasEntitlements:(int64_t)a3;
- (BOOL)hasSandboxCapabilities:(int64_t)a3;
- (BOOL)isBackgroundShortcutRunner;
- (BOOL)isRemovalService;
- (BOOL)isSettingsApp;
- (BOOL)isSpringBoard;
- (BSAuditToken)auditToken;
- (NSString)associatedAppBundleIdentifier;
- (NSString)bundleIdentifier;
- (VCAccessSpecifier)init;
- (VCAccessSpecifier)initWithSecTask:(__SecTask *)a3 auditToken:(id)a4 bundleIdentifier:(id)a5 associatedAppBundleIdentifier:(id)a6 entitlements:(int64_t)a7 sandboxCapabilities:(int64_t)a8;
- (__SecTask)task;
- (id)associatedAppBundleIdentifierFromBundleRecord;
- (id)bundleIdentifierFromTask;
- (id)description;
- (int64_t)entitlements;
- (int64_t)sandboxCapabilities;
- (void)dealloc;
@end

@implementation VCAccessSpecifier

+ (id)accessSpecifierForTask:(__SecTask *)a3 auditToken:(id)a4 sandboxCapabilities:(int64_t)a5
{
  v83[15] = *MEMORY[0x1E4F143B8];
  v83[0] = @"com.apple.siri.VoiceShortcuts.xpc";
  v83[1] = @"com.apple.shortcuts.library-read-access";
  uint64_t v6 = *MEMORY[0x1E4F300D8];
  v83[2] = @"com.apple.shortcuts.home-resident";
  v83[3] = v6;
  v83[4] = @"com.apple.shortcuts.health-access";
  v83[5] = @"com.apple.shortcuts.background-running";
  v83[6] = @"com.apple.shortcuts.contextual-actions-client";
  v83[7] = @"com.apple.shortcuts.import-shortcuts";
  v83[8] = @"com.apple.rootless.storage.shortcuts";
  v83[9] = @"com.apple.shortcuts.on-screen-content-service";
  v83[10] = @"com.apple.shortcuts.background-runner";
  v83[11] = @"com.apple.shortcuts.test-harness-runner";
  v83[12] = @"com.apple.shortcuts.droplet-creation";
  v83[13] = @"com.apple.shortcuts.stepwise-execution";
  v83[14] = @"com.apple.shortcuts.variable-injection";
  v7 = (void *)MEMORY[0x1E4F1C978];
  id v79 = a4;
  [v7 arrayWithObjects:v83 count:15];
  v81 = a3;
  CFArrayRef v78 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef v8 = SecTaskCopyValuesForEntitlements(a3, v78, 0);
  v9 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.siri.VoiceShortcuts.xpc"];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  unsigned int v77 = [v11 BOOLValue];
  v12 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.library-read-access"];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  int v76 = [v14 BOOLValue];
  v15 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.home-resident"];
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  id v17 = v16;

  int v75 = [v17 BOOLValue];
  v18 = [(__CFDictionary *)v8 objectForKeyedSubscript:v6];
  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }
  id v20 = v19;

  int v74 = [v20 BOOLValue];
  v21 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.health-access"];
  if (v21)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  id v23 = v22;

  int v73 = [v23 BOOLValue];
  v24 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.background-running"];
  if (v24)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
  }
  id v26 = v25;

  int v72 = [v26 BOOLValue];
  v27 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.contextual-actions-client"];
  if (v27)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
  }
  id v29 = v28;

  int v71 = [v29 BOOLValue];
  v30 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.import-shortcuts"];
  if (v30)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }
  id v32 = v31;

  int v70 = [v32 BOOLValue];
  v33 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.rootless.storage.shortcuts"];
  if (v33)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v34 = v33;
    }
    else {
      v34 = 0;
    }
  }
  else
  {
    v34 = 0;
  }
  id v35 = v34;

  int v36 = [v35 BOOLValue];
  v37 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.on-screen-content-service"];
  if (v37)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v38 = v37;
    }
    else {
      v38 = 0;
    }
  }
  else
  {
    v38 = 0;
  }
  id v39 = v38;

  int v40 = [v39 BOOLValue];
  v41 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.automation-confirmation-reset"];
  if (v41)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v42 = v41;
    }
    else {
      v42 = 0;
    }
  }
  else
  {
    v42 = 0;
  }
  id v43 = v42;

  int v44 = [v43 BOOLValue];
  v45 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.background-runner"];
  if (v45)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v46 = v45;
    }
    else {
      v46 = 0;
    }
  }
  else
  {
    v46 = 0;
  }
  id v47 = v46;

  int v48 = [v47 BOOLValue];
  v49 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.test-harness-runner"];
  if (v49)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v50 = v49;
    }
    else {
      v50 = 0;
    }
  }
  else
  {
    v50 = 0;
  }
  id v51 = v50;

  int v52 = [v51 BOOLValue];
  v53 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.droplet-creation"];
  if (v53)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v54 = v53;
    }
    else {
      v54 = 0;
    }
  }
  else
  {
    v54 = 0;
  }
  id v55 = v54;

  int v56 = [v55 BOOLValue];
  v57 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.stepwise-execution"];
  if (v57)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v58 = v57;
    }
    else {
      v58 = 0;
    }
  }
  else
  {
    v58 = 0;
  }
  id v59 = v58;

  int v60 = [v59 BOOLValue];
  v61 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"com.apple.shortcuts.variable-injection"];
  if (v61)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v62 = v61;
    }
    else {
      v62 = 0;
    }
  }
  else
  {
    v62 = 0;
  }
  uint64_t v63 = v77;
  if (v76) {
    uint64_t v63 = v77 | 4;
  }
  if (v75) {
    v63 |= 8uLL;
  }
  if (v74) {
    v63 |= 0x10uLL;
  }
  if (v73) {
    v63 |= 0x20uLL;
  }
  if (v72) {
    v63 |= 0x40uLL;
  }
  if (v71) {
    v63 |= 0x80uLL;
  }
  if (v70) {
    v63 |= 0x100uLL;
  }
  if (v36) {
    v63 |= 0x200uLL;
  }
  if (v40) {
    v63 |= 0x400uLL;
  }
  if (v44) {
    v63 |= 0x800uLL;
  }
  if (v48) {
    v63 |= 0x1000uLL;
  }
  if (v52) {
    v63 |= 0x2000uLL;
  }
  if (v56) {
    v63 |= 0x4000uLL;
  }
  if (v60) {
    uint64_t v64 = v63 | 0x8000;
  }
  else {
    uint64_t v64 = v63;
  }
  id v65 = v62;

  int v66 = [v65 BOOLValue];
  if (v66) {
    uint64_t v67 = v64 | 0x10000;
  }
  else {
    uint64_t v67 = v64;
  }

  v68 = (void *)[objc_alloc((Class)a1) initWithSecTask:v81 auditToken:v79 bundleIdentifier:0 associatedAppBundleIdentifier:0 entitlements:v67 sandboxCapabilities:a5];
  return v68;
}

- (VCAccessSpecifier)initWithSecTask:(__SecTask *)a3 auditToken:(id)a4 bundleIdentifier:(id)a5 associatedAppBundleIdentifier:(id)a6 entitlements:(int64_t)a7 sandboxCapabilities:(int64_t)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v26.receiver = self;
  v26.super_class = (Class)VCAccessSpecifier;
  v18 = [(VCAccessSpecifier *)&v26 init];
  v19 = v18;
  if (v18)
  {
    v18->_task = a3;
    if (a3) {
      CFRetain(a3);
    }
    objc_storeStrong((id *)&v19->_auditToken, a4);
    uint64_t v20 = [v16 copy];
    bundleIdentifier = v19->_bundleIdentifier;
    v19->_bundleIdentifier = (NSString *)v20;

    uint64_t v22 = [v17 copy];
    associatedAppBundleIdentifier = v19->_associatedAppBundleIdentifier;
    v19->_associatedAppBundleIdentifier = (NSString *)v22;

    v19->_entitlements = a7;
    v19->_sandboxCapabilities = a8;
    v24 = v19;
  }

  return v19;
}

- (BOOL)hasEntitlements:(int64_t)a3
{
  return (a3 & ~[(VCAccessSpecifier *)self entitlements]) == 0;
}

- (id)description
{
  v20[11] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t v6 = [(VCAccessSpecifier *)self entitlements];
  v19[0] = &unk_1F0CADEA8;
  v19[1] = &unk_1F0CADEC0;
  v20[0] = @"unrestricted";
  v20[1] = @"library-read";
  v19[2] = &unk_1F0CADED8;
  v19[3] = &unk_1F0CADEF0;
  v20[2] = @"home-resident";
  v20[3] = @"import-shortcuts";
  v19[4] = &unk_1F0CADF08;
  v19[5] = &unk_1F0CADF20;
  v20[4] = @"on-screen-content-service";
  v20[5] = @"automation-confirmation-reset";
  v19[6] = &unk_1F0CADF38;
  v19[7] = &unk_1F0CADF50;
  v20[6] = @"background-runner";
  v20[7] = @"test-harness-runner";
  v19[8] = &unk_1F0CADF68;
  v19[9] = &unk_1F0CADF80;
  v20[8] = @"droplet-creation";
  v20[9] = @"stepwise-execution";
  v19[10] = &unk_1F0CADF98;
  v20[10] = @"variable-injection";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:11];
  CFDictionaryRef v8 = objc_opt_new();
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __VCDescriptionOfEntitlements_block_invoke;
  id v16 = &unk_1E6077468;
  id v17 = v8;
  int64_t v18 = v6;
  id v9 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:&v13];
  v10 = [v9 componentsJoinedByString:@" "];

  id v11 = [v3 stringWithFormat:@"<%@: %p entitlements=%@>", v5, self, v10, v13, v14, v15, v16];

  return v11;
}

- (BOOL)allowConnection
{
  if ([(VCAccessSpecifier *)self entitlements]) {
    return 1;
  }
  v4 = [(VCAccessSpecifier *)self associatedAppBundleIdentifier];
  BOOL v3 = [v4 length] != 0;

  return v3;
}

- (int64_t)entitlements
{
  return self->_entitlements;
}

- (BOOL)allowUnrestrictedAccess
{
  return [(VCAccessSpecifier *)self hasEntitlements:1];
}

+ (id)accessSpecifierForCurrentProcess
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VCAccessSpecifier_accessSpecifierForCurrentProcess__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessSpecifierForCurrentProcess_onceToken != -1) {
    dispatch_once(&accessSpecifierForCurrentProcess_onceToken, block);
  }
  v2 = (void *)accessSpecifierForCurrentProcess_accessSpecifier;
  return v2;
}

+ (id)accessSpecifierForXPCConnection:(id)a3
{
  if (a3) {
    [a3 auditToken];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  v4 = [a1 accessSpecifierForAuditToken:v6];
  return v4;
}

void __53__VCAccessSpecifier_accessSpecifierForCurrentProcess__block_invoke(uint64_t a1)
{
  SecTaskRef v2 = SecTaskCreateFromSelf(0);
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    SecTaskRef v4 = v2;
    v5 = (void *)MEMORY[0x1E4F4F6A8];
    int64_t v6 = [MEMORY[0x1E4F28F80] processInfo];
    v7 = v6;
    if (v6) {
      objc_msgSend(v6, "if_auditToken");
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    CFDictionaryRef v8 = [v5 tokenFromAuditToken:v11];
    uint64_t v9 = [v3 accessSpecifierForTask:v4 auditToken:v8 sandboxCapabilities:0];
    v10 = (void *)accessSpecifierForCurrentProcess_accessSpecifier;
    accessSpecifierForCurrentProcess_accessSpecifier = v9;

    CFRelease(v4);
  }
  else
  {
    accessSpecifierForCurrentProcess_accessSpecifier = [*(id *)(a1 + 32) accessSpecifierWithNoAccess];
    MEMORY[0x1F41817F8]();
  }
}

+ (id)accessSpecifierForAuditToken:(id *)a3
{
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v12.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v12.val[4] = v5;
  SecTaskRef v6 = SecTaskCreateWithAuditToken(0, &v12);
  if (v6)
  {
    SecTaskRef v7 = v6;
    long long v8 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v12.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v12.val[4] = v8;
    uint64_t v9 = [MEMORY[0x1E4F4F6A8] tokenFromAuditToken:&v12];
    v10 = [a1 accessSpecifierForTask:v7 auditToken:v9 sandboxCapabilities:0];

    CFRelease(v7);
  }
  else
  {
    v10 = [a1 accessSpecifierWithNoAccess];
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (int64_t)sandboxCapabilities
{
  return self->_sandboxCapabilities;
}

- (__SecTask)task
{
  return self->_task;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (BOOL)allowVariableInjection
{
  return [(VCAccessSpecifier *)self hasEntitlements:0x10000];
}

- (BOOL)allowStepwiseExecution
{
  return [(VCAccessSpecifier *)self hasEntitlements:0x8000];
}

- (BOOL)allowDropletCreation
{
  return [(VCAccessSpecifier *)self hasEntitlements:0x4000];
}

- (BOOL)allowRunningTestHarnessTests
{
  return [(VCAccessSpecifier *)self hasEntitlements:0x2000];
}

- (BOOL)isBackgroundShortcutRunner
{
  return [(VCAccessSpecifier *)self hasEntitlements:4096];
}

- (BOOL)allowResettingAutomationConfirmationLevel
{
  if ([(VCAccessSpecifier *)self allowUnrestrictedAccess]) {
    return 1;
  }
  return [(VCAccessSpecifier *)self hasEntitlements:2048];
}

- (BOOL)allowReadingOnScreenContent
{
  if ([(VCAccessSpecifier *)self allowUnrestrictedAccess]) {
    return 1;
  }
  return [(VCAccessSpecifier *)self hasEntitlements:1024];
}

- (BOOL)allowRootlessShortcutStorageAccess
{
  return [(VCAccessSpecifier *)self hasEntitlements:512];
}

- (BOOL)allowReadAccessForContextualActions
{
  return [(VCAccessSpecifier *)self hasEntitlements:128];
}

- (BOOL)allowIntentsExtensionDiscovery
{
  return [(VCAccessSpecifier *)self hasEntitlements:16];
}

- (BOOL)isRemovalService
{
  SecTaskRef v2 = [(VCAccessSpecifier *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.shortcuts.appremoval"];

  return v3;
}

- (BOOL)isSpringBoard
{
  SecTaskRef v2 = [(VCAccessSpecifier *)self associatedAppBundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.springboard"];

  return v3;
}

- (BOOL)isSettingsApp
{
  SecTaskRef v2 = [(VCAccessSpecifier *)self associatedAppBundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.Preferences"];

  return v3;
}

- (BOOL)allowReadAccessForDonations
{
  if ([(VCAccessSpecifier *)self allowUnrestrictedAccess]) {
    return 1;
  }
  return [(VCAccessSpecifier *)self hasEntitlements:32];
}

- (BOOL)allowReadAccessForSleepWorkflows
{
  if ([(VCAccessSpecifier *)self allowUnrestrictedAccess]) {
    return 1;
  }
  return [(VCAccessSpecifier *)self hasEntitlements:32];
}

- (BOOL)allowWriteAccessForSleepWorkflows
{
  if ([(VCAccessSpecifier *)self allowUnrestrictedAccess]) {
    return 1;
  }
  return [(VCAccessSpecifier *)self hasEntitlements:32];
}

- (BOOL)allowHomeResidentShortcutRunning
{
  return [(VCAccessSpecifier *)self hasEntitlements:8];
}

- (BOOL)allowLinkContextualActionRunningForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(VCAccessSpecifier *)self allowFullRuntimeAccess])
  {
    char v5 = 1;
  }
  else
  {
    SecTaskRef v6 = [(VCAccessSpecifier *)self auditToken];

    if (v6)
    {
      SecTaskRef v7 = [MEMORY[0x1E4F96448] descriptor];
      [v7 setValues:1];
      long long v8 = (void *)MEMORY[0x1E4F96438];
      uint64_t v9 = (void *)MEMORY[0x1E4F96430];
      v10 = (void *)MEMORY[0x1E4F96478];
      id v11 = [(VCAccessSpecifier *)self auditToken];
      audit_token_t v12 = objc_msgSend(v10, "targetWithPid:", objc_msgSend(v11, "pid"));
      uint64_t v13 = [v9 predicateMatchingTarget:v12];
      uint64_t v14 = [v8 statesForPredicate:v13 withDescriptor:v7 error:0];

      id v15 = [v14 lastObject];
      LODWORD(v12) = [v15 taskState];

      if (v12 == 4)
      {
        id v16 = [(VCAccessSpecifier *)self associatedAppBundleIdentifier];
        char v5 = [v16 isEqualToString:v4];
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (BOOL)allowFullRuntimeAccess
{
  if ([(VCAccessSpecifier *)self allowUnrestrictedAccess]
    || [(VCAccessSpecifier *)self hasEntitlements:64]
    || [(VCAccessSpecifier *)self allowReadAccessForSleepWorkflows])
  {
    return 1;
  }
  return [(VCAccessSpecifier *)self allowReadAccessForContextualActions];
}

- (BOOL)allowReadAccessToShortcutsLibrary
{
  if ([(VCAccessSpecifier *)self allowUnrestrictedAccess]) {
    return 1;
  }
  return [(VCAccessSpecifier *)self hasEntitlements:4];
}

- (BOOL)allowReadAccessToSuggestionsWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(VCAccessSpecifier *)self allowUnrestrictedAccess])
  {
    BOOL v5 = 1;
  }
  else
  {
    SecTaskRef v6 = [(VCAccessSpecifier *)self associatedAppBundleIdentifier];
    BOOL v5 = ([v6 isEqualToString:v4] & 1) != 0
      || [(VCAccessSpecifier *)self hasEntitlements:32];
  }
  return v5;
}

- (BOOL)allowWriteAccessToSuggestionsWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(VCAccessSpecifier *)self allowUnrestrictedAccess])
  {
    char v5 = 1;
  }
  else
  {
    SecTaskRef v6 = [(VCAccessSpecifier *)self associatedAppBundleIdentifier];
    char v5 = [v6 isEqualToString:v4];
  }
  return v5;
}

- (BOOL)allowReadAccessToSingleStepShortcutsWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(VCAccessSpecifier *)self allowUnrestrictedAccess]
    || [(VCAccessSpecifier *)self hasEntitlements:4])
  {
    char v5 = 1;
  }
  else
  {
    SecTaskRef v6 = [(VCAccessSpecifier *)self associatedAppBundleIdentifier];
    char v5 = [v6 isEqualToString:v4];
  }
  return v5;
}

- (BOOL)allowShortcutImport
{
  if ([(VCAccessSpecifier *)self allowUnrestrictedAccess]) {
    return 1;
  }
  return [(VCAccessSpecifier *)self hasEntitlements:256];
}

- (BOOL)hasSandboxCapabilities:(int64_t)a3
{
  return (a3 & ~[(VCAccessSpecifier *)self sandboxCapabilities]) == 0;
}

- (id)associatedAppBundleIdentifierFromBundleRecord
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  SecTaskRef v2 = [(VCAccessSpecifier *)self bundleIdentifier];
  if (v2)
  {
    id v8 = 0;
    char v3 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v2 allowPlaceholder:0 error:&v8];
    id v4 = v8;
    if (v3)
    {
      char v5 = VCAppBundleIdentifierForBundleRecord(v3);
    }
    else
    {
      SecTaskRef v6 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[VCAccessSpecifier associatedAppBundleIdentifierFromBundleRecord]";
        __int16 v11 = 2114;
        id v12 = v4;
        _os_log_impl(&dword_1B3C5C000, v6, OS_LOG_TYPE_INFO, "%s Couldn't get LSBundleRecord from task, leaving associated app bundle identifier as nil (%{public}@)", buf, 0x16u);
      }

      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (NSString)associatedAppBundleIdentifier
{
  associatedAppBundleIdentifier = self->_associatedAppBundleIdentifier;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (associatedAppBundleIdentifier == v4)
  {
    char v5 = 0;
  }
  else if (associatedAppBundleIdentifier)
  {
    associatedAppBundleIdentifier = associatedAppBundleIdentifier;
    char v5 = associatedAppBundleIdentifier;
  }
  else
  {
    SecTaskRef v6 = [(VCAccessSpecifier *)self associatedAppBundleIdentifierFromBundleRecord];
    char v5 = v6;
    if (v6)
    {
      SecTaskRef v7 = v6;
    }
    else
    {
      SecTaskRef v7 = [MEMORY[0x1E4F1CA98] null];
    }
    associatedAppBundleIdentifier = self->_associatedAppBundleIdentifier;
    self->_associatedAppBundleIdentifier = v7;
  }

  return v5;
}

- (id)bundleIdentifierFromTask
{
  task = self->_task;
  if (!task)
  {
LABEL_5:
    SecTaskRef v6 = 0;
    goto LABEL_7;
  }
  CFTypeRef v3 = SecTaskCopyValueForEntitlement(task, @"application-identifier", 0);
  if (v3)
  {
    id v4 = v3;
    int v5 = CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
    CFRelease(v4);
    if (v5)
    {
      SecTaskRef v6 = 0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  SecTaskRef v6 = (__CFString *)SecTaskCopySigningIdentifier(task, 0);
LABEL_7:
  return v6;
}

- (NSString)bundleIdentifier
{
  bundleIdentifier = self->_bundleIdentifier;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (bundleIdentifier == v4)
  {
    int v5 = 0;
  }
  else if (bundleIdentifier)
  {
    bundleIdentifier = bundleIdentifier;
    int v5 = bundleIdentifier;
  }
  else
  {
    SecTaskRef v6 = [(VCAccessSpecifier *)self bundleIdentifierFromTask];
    int v5 = v6;
    if (v6)
    {
      SecTaskRef v7 = v6;
    }
    else
    {
      SecTaskRef v7 = [MEMORY[0x1E4F1CA98] null];
    }
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v7;
  }

  return v5;
}

- (void)dealloc
{
  task = self->_task;
  if (task) {
    CFRelease(task);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCAccessSpecifier;
  [(VCAccessSpecifier *)&v4 dealloc];
}

- (VCAccessSpecifier)init
{
  return [(VCAccessSpecifier *)self initWithSecTask:0 auditToken:0 bundleIdentifier:0 associatedAppBundleIdentifier:0 entitlements:0 sandboxCapabilities:0];
}

+ (id)accessSpecifierForCurrentConnection
{
  CFTypeRef v3 = [MEMORY[0x1E4F29268] currentConnection];
  if (v3)
  {
    objc_super v4 = [a1 accessSpecifierForXPCConnection:v3];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

+ (id)accessSpecifierWithNoAccessForBundleIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = (void *)[objc_alloc((Class)a1) initWithSecTask:0 auditToken:0 bundleIdentifier:v4 associatedAppBundleIdentifier:0 entitlements:0 sandboxCapabilities:0];

  return v5;
}

+ (id)accessSpecifierWithNoAccess
{
  SecTaskRef v2 = (void *)[objc_alloc((Class)a1) initWithSecTask:0 auditToken:0 bundleIdentifier:0 associatedAppBundleIdentifier:0 entitlements:0 sandboxCapabilities:0];
  return v2;
}

+ (id)accessSpecifierFilteredForAssociatedAppBundleIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"VCAccessSpecifier.m", 257, @"Invalid parameter not satisfying: %@", @"associatedAppBundleIdentifier" object file lineNumber description];
  }
  uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithSecTask:0 auditToken:0 bundleIdentifier:v8 associatedAppBundleIdentifier:v7 entitlements:0 sandboxCapabilities:0];

  return v9;
}

+ (id)accessSpecifierUnrestrictedWithAssociatedAppBundleIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithSecTask:0 auditToken:0 bundleIdentifier:v6 associatedAppBundleIdentifier:v7 entitlements:1 sandboxCapabilities:0];

  return v8;
}

+ (id)accessSpecifierUnrestricted
{
  SecTaskRef v2 = (void *)[objc_alloc((Class)a1) initWithSecTask:0 auditToken:0 bundleIdentifier:0 associatedAppBundleIdentifier:0 entitlements:1 sandboxCapabilities:0];
  return v2;
}

@end
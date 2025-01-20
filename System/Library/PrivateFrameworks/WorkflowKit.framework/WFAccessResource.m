@interface WFAccessResource
+ (BOOL)isSystemResource;
+ (id)userInterfaceClasses;
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (BOOL)canLogOut;
- (BOOL)logOutAffectsOtherApps;
- (BOOL)supportsMultipleAccounts;
- (NSError)availabilityError;
- (NSString)associatedAppIdentifier;
- (NSString)localizedAttemptRecoveryFromErrorMessage;
- (NSString)name;
- (NSString)resourceName;
- (NSString)username;
- (WFAccessResource)initWithDefinition:(id)a3;
- (WFAccessResource)initWithDefinition:(id)a3 enableDistributedNotifications:(BOOL)a4;
- (WFImage)icon;
- (WFWorkflow)workflow;
- (id)localizedErrorReasonForStatus:(unint64_t)a3;
- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3;
- (id)localizedImportErrorReasonForStatus:(unint64_t)a3;
- (id)localizedProtectedResourceDescription;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (int)token;
- (unint64_t)status;
- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 userInterface:(id)a5 completionHandler:(id)a6;
- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
- (void)refreshAvailability;
- (void)refreshAvailabilityWithNotification:(BOOL)a3;
- (void)setWorkflow:(id)a3;
@end

@implementation WFAccessResource

- (WFAccessResource)initWithDefinition:(id)a3 enableDistributedNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFAccessResource;
  v7 = [(WFResource *)&v21 initWithDefinition:v6];
  v8 = v7;
  if (v7)
  {
    v7->_token = -1;
    if (v4)
    {
      objc_initWeak(&location, v7);
      v22[0] = @"WFAccessResourceAvailabilityChangedNotification";
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v22[1] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];

      v12 = [v11 componentsJoinedByString:@"."];

      id v13 = v12;
      v14 = (const char *)[v13 UTF8String];
      id v15 = MEMORY[0x1E4F14428];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __70__WFAccessResource_initWithDefinition_enableDistributedNotifications___block_invoke;
      handler[3] = &unk_1E6555A28;
      objc_copyWeak(&v19, &location);
      notify_register_dispatch(v14, &v8->_token, MEMORY[0x1E4F14428], handler);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    v16 = v8;
  }

  return v8;
}

- (WFAccessResource)initWithDefinition:(id)a3
{
  return [(WFAccessResource *)self initWithDefinition:a3 enableDistributedNotifications:1];
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)WFAccessResource;
  [(WFResource *)&v3 dealloc];
}

- (BOOL)supportsMultipleAccounts
{
  return 0;
}

- (BOOL)logOutAffectsOtherApps
{
  return 1;
}

- (BOOL)canLogOut
{
  return 0;
}

- (NSString)username
{
  return 0;
}

- (NSString)resourceName
{
  return 0;
}

- (int)token
{
  return self->_token;
}

- (WFWorkflow)workflow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  return (WFWorkflow *)WeakRetained;
}

- (NSString)localizedAttemptRecoveryFromErrorMessage
{
  objc_super v3 = NSString;
  BOOL v4 = WFLocalizedString(@"Please open Settings > Privacy & Security and grant Shortcuts access to %@.");
  v5 = [(WFAccessResource *)self localizedProtectedResourceDescription];
  id v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  return (NSString *)v6;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 userInterface:(id)a5 completionHandler:(id)a6
{
  id v14 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [v14 domain];
  if ([v12 isEqualToString:@"ResourceErrorDomain"])
  {
    uint64_t v13 = [v14 code];

    if (!v13)
    {
      [(WFAccessResource *)self attemptRecoveryFromErrorWithOptionIndex:a4 userInterface:v10 completionHandler:v11];
      goto LABEL_7;
    }
  }
  else
  {
  }
  if (v11) {
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
LABEL_7:
}

- (NSError)availabilityError
{
  v13[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(WFAccessResource *)self status];
  if (v3 == 4)
  {
    BOOL v4 = 0;
  }
  else
  {
    unint64_t v5 = v3;
    uint64_t v12 = *MEMORY[0x1E4F5ABC0];
    v13[0] = self;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v7 = (void *)[v6 mutableCopy];

    v8 = [(WFAccessResource *)self localizedErrorReasonForStatus:v5];
    v9 = [(WFAccessResource *)self localizedImportErrorReasonForStatus:v5];
    id v10 = [(WFAccessResource *)self localizedErrorRecoveryOptionsForStatus:v5];
    if (v8) {
      [v7 setObject:v8 forKey:*MEMORY[0x1E4F28588]];
    }
    if (v9) {
      [v7 setObject:v9 forKey:@"WFResourceErrorImportErrorReason"];
    }
    if (v10) {
      [v7 setObject:v10 forKey:*MEMORY[0x1E4F28590]];
    }
    BOOL v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ResourceErrorDomain" code:0 userInfo:v7];
  }
  return (NSError *)v4;
}

- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (a3 == 3) {
      unint64_t v3 = @"Update Privacy Settings";
    }
    else {
      unint64_t v3 = @"Allow Access";
    }
    BOOL v4 = WFLocalizedString(v3);
    v7[0] = v4;
    unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (id)localizedImportErrorReasonForStatus:(unint64_t)a3
{
  BOOL v4 = [(WFAccessResource *)self localizedProtectedResourceDescription];
  if (a3 == 2)
  {
    unint64_t v5 = NSString;
    id v6 = @"Device restrictions prevent this shortcut from accessing %@.";
  }
  else
  {
    unint64_t v5 = NSString;
    if (a3) {
      id v6 = @"In order to answer this question, Shortcuts needs access to %@.";
    }
    else {
      id v6 = @"This shortcut requires access to %@, which is not supported on this device.";
    }
  }
  v7 = WFLocalizedString(v6);
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);

  return v8;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  BOOL v4 = [(WFAccessResource *)self localizedProtectedResourceDescription];
  if (a3 == 2)
  {
    unint64_t v5 = NSString;
    id v6 = @"Device restrictions prevent Shortcuts from accessing %@.";
  }
  else
  {
    unint64_t v5 = NSString;
    if (a3) {
      id v6 = @"Shortcuts does not have access to %@.";
    }
    else {
      id v6 = @"Access to %@ is not supported on this device.";
    }
  }
  v7 = WFLocalizedString(v6);
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);

  return v8;
}

- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, uint64_t, void))a5;
  unint64_t v9 = [(WFAccessResource *)self status];
  if (v9 == 1)
  {
    [(WFAccessResource *)self makeAvailableWithUserInterface:v7 completionHandler:v8];
  }
  else if (v9 == 3)
  {
    v8[2](v8, 1, 0);
    id v10 = (void *)MEMORY[0x1E4F1CB10];
    id v11 = NSString;
    uint64_t v12 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v13 = [v12 bundleIdentifier];
    id v14 = [v11 stringWithFormat:@"app-prefs:%@", v13];
    id v15 = [v10 URLWithString:v14];

    v16 = [MEMORY[0x1E4F5A7A0] sharedContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __92__WFAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke;
    v17[3] = &unk_1E6555AC8;
    v17[4] = self;
    id v18 = v7;
    [v16 openURL:v15 userInterface:v18 completionHandler:v17];
  }
  else
  {
    v8[2](v8, 0, 0);
  }
}

void __92__WFAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v7 = (id)objc_opt_new();
    BOOL v4 = WFLocalizedString(@"Update Privacy Settings");
    [v7 setTitle:v4];

    unint64_t v5 = [*(id *)(a1 + 32) localizedAttemptRecoveryFromErrorMessage];
    [v7 setMessage:v5];

    id v6 = [MEMORY[0x1E4F5A770] okButtonWithHandler:0];
    [v7 addButton:v6];

    [*(id *)(a1 + 40) presentAlert:v7];
  }
}

- (unint64_t)status
{
  return 0;
}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  unint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  id v7 = [v5 wfUnsupportedUserInterfaceError];
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() userInterfaceXPCInterface];
  unint64_t v9 = [(id)objc_opt_class() userInterfaceClasses];
  id v10 = v9;
  if (v8 && [v9 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
    v13[3] = &unk_1E6555AA0;
    id v15 = v7;
    v13[4] = self;
    id v14 = v6;
    [v14 requestActionInterfacePresentationForActionClassName:v12 classNamesByType:v10 completionHandler:v13];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

void __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
    v6[3] = &unk_1E6557E58;
    BOOL v4 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    [v4 makeAvailableWithRemoteInterface:a2 completionHandler:v6];
  }
  else
  {
    unint64_t v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_3;
  v9[3] = &unk_1E6555A78;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 dismissPresentedContentWithCompletionHandler:v9];
}

uint64_t __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)refreshAvailability
{
  if ([(WFAccessResource *)self status] == 4)
  {
    [(WFResource *)self updateAvailability:1 withError:0];
  }
  else
  {
    id v3 = [(WFAccessResource *)self availabilityError];
    [(WFResource *)self updateAvailability:0 withError:v3];
  }
}

- (void)refreshAvailabilityWithNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__57975;
  v26 = __Block_byref_object_dispose__57976;
  id v27 = 0;
  id v5 = [(WFResource *)self stateAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke;
  block[3] = &unk_1E6555A50;
  block[4] = self;
  block[5] = &v28;
  block[6] = &v22;
  dispatch_sync(v5, block);

  v20.receiver = self;
  v20.super_class = (Class)WFAccessResource;
  [(WFResource *)&v20 refreshAvailabilityWithNotification:v3];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__57975;
  id v14 = __Block_byref_object_dispose__57976;
  id v15 = 0;
  id v6 = [(WFResource *)self stateAccessQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke_2;
  v9[3] = &unk_1E6555A50;
  void v9[4] = self;
  v9[5] = &v16;
  v9[6] = &v10;
  dispatch_sync(v6, v9);

  if (*((unsigned __int8 *)v17 + 24) != *((unsigned __int8 *)v29 + 24)
    || ([(id)v11[5] isEqual:v23[5]] & 1) == 0 && v11[5] != v23[5])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke_3;
    aBlock[3] = &unk_1E6558B28;
    aBlock[4] = self;
    id v7 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v7[2](v7);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

void __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _isAvailable];
  uint64_t v2 = [*(id *)(a1 + 32) _availabilityError];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _isAvailable];
  uint64_t v2 = [*(id *)(a1 + 32) _availabilityError];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke_3()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"WFAccessResourceAvailabilityChangedNotification";
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  uint64_t v3 = [v2 componentsJoinedByString:@"."];

  id v4 = v3;
  notify_post((const char *)[v4 UTF8String]);
}

- (void)setWorkflow:(id)a3
{
  objc_storeWeak((id *)&self->_workflow, a3);
  [(WFResource *)self invalidateAvailability];
}

- (id)localizedProtectedResourceDescription
{
  uint64_t v3 = [MEMORY[0x1E4FB47E8] defaultContext];
  id v4 = [(WFAccessResource *)self localizedProtectedResourceDescriptionWithContext:v3];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(WFAccessResource *)self name];
  }
  id v6 = v5;

  return v6;
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  return 0;
}

- (WFImage)icon
{
  uint64_t v3 = [(WFAccessResource *)self associatedAppIdentifier];

  if (v3)
  {
    id v4 = +[ICAppRegistry sharedRegistry];
    id v5 = [(WFAccessResource *)self associatedAppIdentifier];
    id v6 = [v4 appWithIdentifier:v5];
    id v7 = [v6 icon];
  }
  else
  {
    id v7 = 0;
  }
  return (WFImage *)v7;
}

- (NSString)name
{
  uint64_t v3 = [(WFAccessResource *)self associatedAppIdentifier];

  if (v3)
  {
    id v4 = +[ICAppRegistry sharedRegistry];
    id v5 = [(WFAccessResource *)self associatedAppIdentifier];
    id v6 = [v4 appWithIdentifier:v5];
    id v7 = [v6 localizedName];
  }
  else
  {
    id v7 = 0;
  }
  return (NSString *)v7;
}

- (NSString)associatedAppIdentifier
{
  return 0;
}

void __70__WFAccessResource_initWithDefinition_enableDistributedNotifications___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshAvailabilityWithNotification];
}

+ (id)userInterfaceClasses
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)userInterfaceXPCInterface
{
  uint64_t v2 = [a1 userInterfaceProtocol];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)userInterfaceProtocol
{
  return 0;
}

+ (BOOL)isSystemResource
{
  return 0;
}

@end
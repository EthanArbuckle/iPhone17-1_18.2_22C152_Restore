id MFAccountsLog()
{
  void *v0;
  uint64_t vars8;

  if (MFAccountsLog_mf_once_token_5 != -1) {
    dispatch_once(&MFAccountsLog_mf_once_token_5, &__block_literal_global_20);
  }
  v0 = (void *)MFAccountsLog_mf_once_object_5;
  return v0;
}

id MFMessageListLoadingSignpostLog()
{
  if (MFMessageListLoadingSignpostLog_mf_once_token_10 != -1) {
    dispatch_once(&MFMessageListLoadingSignpostLog_mf_once_token_10, &__block_literal_global_13_0);
  }
  v0 = (void *)MFMessageListLoadingSignpostLog_mf_once_object_10;
  return v0;
}

id MFPowerLog()
{
  if (MFPowerLog_mf_once_token_2 != -1) {
    dispatch_once(&MFPowerLog_mf_once_token_2, &__block_literal_global_10);
  }
  v0 = (void *)MFPowerLog_mf_once_object_2;
  return v0;
}

id MFLogGeneral()
{
  if (MFLogGeneral_mf_once_token_0 != -1) {
    dispatch_once(&MFLogGeneral_mf_once_token_0, &__block_literal_global_1);
  }
  v0 = (void *)MFLogGeneral_mf_once_object_0;
  return v0;
}

id MFAutoFetchLog()
{
  if (MFAutoFetchLog_mf_once_token_3 != -1) {
    dispatch_once(&MFAutoFetchLog_mf_once_token_3, &__block_literal_global_13);
  }
  v0 = (void *)MFAutoFetchLog_mf_once_object_3;
  return v0;
}

uint64_t __MFMessageListLoadingSignpostLog_block_invoke()
{
  MFMessageListLoadingSignpostLog_mf_once_object_10 = (uint64_t)os_log_create("com.apple.email.signposts", "MFMessageListLoading");
  return MEMORY[0x1F41817F8]();
}

uint64_t __MFPowerLog_block_invoke()
{
  MFPowerLog_mf_once_object_2 = (uint64_t)os_log_create((const char *)[@"com.apple.mobilemail" UTF8String], "Power");
  return MEMORY[0x1F41817F8]();
}

uint64_t __MFLogGeneral_block_invoke()
{
  MFLogGeneral_mf_once_object_0 = (uint64_t)os_log_create((const char *)[@"com.apple.mobilemail" UTF8String], "General");
  return MEMORY[0x1F41817F8]();
}

uint64_t __MFAccountsLog_block_invoke()
{
  MFAccountsLog_mf_once_object_5 = (uint64_t)os_log_create("com.apple.email", "Accounts");
  return MEMORY[0x1F41817F8]();
}

uint64_t MFIsMobileMail()
{
  if (MFIsMobileMail_onceToken != -1) {
    dispatch_once(&MFIsMobileMail_onceToken, &__block_literal_global);
  }
  return MFIsMobileMail_sIsMobileMail;
}

void __MFIsMobileMail_block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  MFIsMobileMail_sIsMobileMail = [v0 isEqualToString:@"com.apple.mobilemail"];
}

void sub_1DB39AD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t MFMobileMailContainerPath()
{
  if (MFMobileMailContainerPath_onceToken != -1) {
    dispatch_once(&MFMobileMailContainerPath_onceToken, &__block_literal_global_9);
  }
  return MFMobileMailContainerPath_containerPath;
}

void __MFMobileMailContainerPath_block_invoke()
{
  id v4 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.mobilemail"];
  v0 = [v4 dataContainerURL];
  id v1 = [v0 path];
  uint64_t v2 = [v1 copy];
  v3 = (void *)MFMobileMailContainerPath_containerPath;
  MFMobileMailContainerPath_containerPath = v2;
}

void sub_1DB39AE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *MFMobileMailPreferenceDomain()
{
  return @"com.apple.mobilemail";
}

uint64_t MFDeviceSupportsNanoCompanion()
{
  return MGGetBoolAnswer();
}

uint64_t MFDeviceSupportsForceTouch()
{
  return MGGetBoolAnswer();
}

uint64_t MFDeviceSupportsHighRefreshRate()
{
  if (MFDeviceSupportsHighRefreshRate_onceToken != -1) {
    dispatch_once(&MFDeviceSupportsHighRefreshRate_onceToken, &__block_literal_global_0);
  }
  return MFDeviceSupportsHighRefreshRate_deviceSupportsHighRefreshRate;
}

uint64_t __MFDeviceSupportsHighRefreshRate_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  MFDeviceSupportsHighRefreshRate_deviceSupportsHighRefreshRate = result;
  return result;
}

__CFString *mf_defaultsKeyForFeature(uint64_t a1)
{
  if (a1 == 1) {
    return @"ShowSendEml";
  }
  v3 = [MEMORY[0x1E4F28B00] currentHandler];
  id v4 = [NSString stringWithUTF8String:"NSString *mf_defaultsKeyForFeature(MFMobileMailFeature)"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"MFFeaturePreferences.m", 29, @"Invalid MFMailFeature %d passed to mf_defaultsKeyForFeature", a1);

  return 0;
}

void sub_1DB39AFE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t mf_isFeatureEnabled(uint64_t a1)
{
  uint64_t v2 = mf_defaultsKeyForFeature(a1);
  v3 = v2;
  if (a1 != 1)
  {
    if (a1)
    {
      uint64_t v7 = 0;
      goto LABEL_9;
    }
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"BOOL mf_isFeatureEnabled(MFMobileMailFeature)"];
    [v4 handleFailureInFunction:v5 file:@"MFFeaturePreferences.m" lineNumber:38 description:@"MFMailFeatureInvalid passed to mf_isFeatureEnabled"];
    goto LABEL_6;
  }
  id v4 = v2;
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v6 valueForKey:v4];

  if (!v5)
  {
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = [v5 BOOLValue];
LABEL_7:

LABEL_9:
  return v7;
}

void sub_1DB39B0F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB39B128()
{
}

id MFLogNetwork()
{
  if (MFLogNetwork_mf_once_token_1 != -1) {
    dispatch_once(&MFLogNetwork_mf_once_token_1, &__block_literal_global_7);
  }
  v0 = (void *)MFLogNetwork_mf_once_object_1;
  return v0;
}

uint64_t __MFLogNetwork_block_invoke()
{
  MFLogNetwork_mf_once_object_1 = (uint64_t)os_log_create((const char *)[@"com.apple.mobilemail" UTF8String], "Network");
  return MEMORY[0x1F41817F8]();
}

uint64_t __MFAutoFetchLog_block_invoke()
{
  MFAutoFetchLog_mf_once_object_3 = (uint64_t)os_log_create("com.apple.email", "AutoFetch");
  return MEMORY[0x1F41817F8]();
}

id MFPersistenceLog()
{
  if (MFPersistenceLog_mf_once_token_4 != -1) {
    dispatch_once(&MFPersistenceLog_mf_once_token_4, &__block_literal_global_17);
  }
  v0 = (void *)MFPersistenceLog_mf_once_object_4;
  return v0;
}

uint64_t __MFPersistenceLog_block_invoke()
{
  MFPersistenceLog_mf_once_object_4 = (uint64_t)os_log_create("com.apple.email", "Persistence");
  return MEMORY[0x1F41817F8]();
}

id MFExchangeLog()
{
  if (MFExchangeLog_mf_once_token_6 != -1) {
    dispatch_once(&MFExchangeLog_mf_once_token_6, &__block_literal_global_23);
  }
  v0 = (void *)MFExchangeLog_mf_once_object_6;
  return v0;
}

uint64_t __MFExchangeLog_block_invoke()
{
  MFExchangeLog_mf_once_object_6 = (uint64_t)os_log_create("com.apple.email", "Exchange");
  return MEMORY[0x1F41817F8]();
}

id MFComposeLog()
{
  if (MFComposeLog_mf_once_token_7 != -1) {
    dispatch_once(&MFComposeLog_mf_once_token_7, &__block_literal_global_26);
  }
  v0 = (void *)MFComposeLog_mf_once_object_7;
  return v0;
}

uint64_t __MFComposeLog_block_invoke()
{
  MFComposeLog_mf_once_object_7 = (uint64_t)os_log_create("com.apple.email", "Compose");
  return MEMORY[0x1F41817F8]();
}

id MFReconciliationLog()
{
  if (MFReconciliationLog_mf_once_token_8 != -1) {
    dispatch_once(&MFReconciliationLog_mf_once_token_8, &__block_literal_global_29);
  }
  v0 = (void *)MFReconciliationLog_mf_once_object_8;
  return v0;
}

uint64_t __MFReconciliationLog_block_invoke()
{
  MFReconciliationLog_mf_once_object_8 = (uint64_t)os_log_create("com.apple.email", "Reconciliation");
  return MEMORY[0x1F41817F8]();
}

uint64_t MFGreenTeaLogger()
{
  return MEMORY[0x1F417A380]("com.apple.greentea.mobilemail");
}

id MFMessageSelectionLifecycleSignpostLog()
{
  if (MFMessageSelectionLifecycleSignpostLog_mf_once_token_6 != -1) {
    dispatch_once(&MFMessageSelectionLifecycleSignpostLog_mf_once_token_6, &__block_literal_global_2);
  }
  v0 = (void *)MFMessageSelectionLifecycleSignpostLog_mf_once_object_6;
  return v0;
}

uint64_t __MFMessageSelectionLifecycleSignpostLog_block_invoke()
{
  MFMessageSelectionLifecycleSignpostLog_mf_once_object_6 = (uint64_t)os_log_create("com.apple.email.signposts", "MFMessageSelectionLifecycleSignpostLog");
  return MEMORY[0x1F41817F8]();
}

id MFMessageLoadingSignpostLog()
{
  if (MFMessageLoadingSignpostLog_mf_once_token_7 != -1) {
    dispatch_once(&MFMessageLoadingSignpostLog_mf_once_token_7, &__block_literal_global_4);
  }
  v0 = (void *)MFMessageLoadingSignpostLog_mf_once_object_7;
  return v0;
}

uint64_t __MFMessageLoadingSignpostLog_block_invoke()
{
  MFMessageLoadingSignpostLog_mf_once_object_7 = (uint64_t)os_log_create("com.apple.email.signposts", "MFMessageLoading");
  return MEMORY[0x1F41817F8]();
}

id MFReconciliationSignpostLog()
{
  if (MFReconciliationSignpostLog_mf_once_token_8 != -1) {
    dispatch_once(&MFReconciliationSignpostLog_mf_once_token_8, &__block_literal_global_7_0);
  }
  v0 = (void *)MFReconciliationSignpostLog_mf_once_object_8;
  return v0;
}

uint64_t __MFReconciliationSignpostLog_block_invoke()
{
  MFReconciliationSignpostLog_mf_once_object_8 = (uint64_t)os_log_create("com.apple.email.signposts", "MFReconciliation");
  return MEMORY[0x1F41817F8]();
}

id MFMessageComposeLoadingSignpostLog()
{
  if (MFMessageComposeLoadingSignpostLog_mf_once_token_9 != -1) {
    dispatch_once(&MFMessageComposeLoadingSignpostLog_mf_once_token_9, &__block_literal_global_10_0);
  }
  v0 = (void *)MFMessageComposeLoadingSignpostLog_mf_once_object_9;
  return v0;
}

uint64_t __MFMessageComposeLoadingSignpostLog_block_invoke()
{
  MFMessageComposeLoadingSignpostLog_mf_once_object_9 = (uint64_t)os_log_create("com.apple.email.signposts", "MFMessageComposeLoading");
  return MEMORY[0x1F41817F8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}
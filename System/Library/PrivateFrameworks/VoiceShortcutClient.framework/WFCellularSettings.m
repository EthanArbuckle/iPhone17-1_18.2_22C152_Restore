@interface WFCellularSettings
+ (id)defaultSettings;
- (BOOL)cellularDataEnabledWithError:(id *)a3;
- (BOOL)isCellularDataCapableWithError:(id *)a3;
- (WFCellularSettings)init;
- (__CTServerConnection)connection;
- (void)dealloc;
@end

@implementation WFCellularSettings

- (__CTServerConnection)connection
{
  return self->_connection;
}

- (BOOL)isCellularDataCapableWithError:(id *)a3
{
  char v11 = 0;
  v4 = [(WFCellularSettings *)self connection];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v5 = get_CTServerConnectionGetCellularDataSettingsSymbolLoc_ptr;
  v20 = get_CTServerConnectionGetCellularDataSettingsSymbolLoc_ptr;
  if (!get_CTServerConnectionGetCellularDataSettingsSymbolLoc_ptr)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __get_CTServerConnectionGetCellularDataSettingsSymbolLoc_block_invoke;
    v15 = &unk_1E6079C28;
    v16 = &v17;
    v6 = CoreTelephonyLibrary();
    v18[3] = (uint64_t)dlsym(v6, "_CTServerConnectionGetCellularDataSettings");
    get_CTServerConnectionGetCellularDataSettingsSymbolLoc_ptr = *(_UNKNOWN **)(v16[1] + 24);
    v5 = (void *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (v5)
  {
    uint64_t v7 = ((uint64_t (*)(__CTServerConnection *, char *, void, void))v5)(v4, &v11, 0, 0);
    if (a3)
    {
      WFNSErrorFromCTError(v7);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return v11 == 1;
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "CTError WF_CTServerConnectionGetCellularDataSettings(CTServerConnectionRef, Boolean *, Boolean *, Boolean *)");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"WFCellularSettings.m", 19, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)cellularDataEnabledWithError:(id *)a3
{
  char v11 = 0;
  v4 = [(WFCellularSettings *)self connection];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v5 = (uint64_t (*)(__CTServerConnection *, char *))get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr;
  v20 = get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr;
  if (!get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_block_invoke;
    v15 = &unk_1E6079C28;
    v16 = &v17;
    v6 = CoreTelephonyLibrary();
    v18[3] = (uint64_t)dlsym(v6, "_CTServerConnectionGetCellularDataIsEnabled");
    get_CTServerConnectionGetCellularDataIsEnabledSymbolLoc_ptr = *(_UNKNOWN **)(v16[1] + 24);
    v5 = (uint64_t (*)(__CTServerConnection *, char *))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (v5)
  {
    uint64_t v7 = v5(v4, &v11);
    WFNSErrorFromCTError(v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v11 == 1;
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "CTError WF_CTServerConnectionGetCellularDataIsEnabled(CTServerConnectionRef, Boolean *)");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"WFCellularSettings.m", 17, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (void)dealloc
{
  CFRelease(self->_connection);
  v3.receiver = self;
  v3.super_class = (Class)WFCellularSettings;
  [(WFCellularSettings *)&v3 dealloc];
}

- (WFCellularSettings)init
{
  v15.receiver = self;
  v15.super_class = (Class)WFCellularSettings;
  v2 = [(WFCellularSettings *)&v15 init];
  objc_super v3 = v2;
  if (!v2) {
    goto LABEL_6;
  }
  v12[0] = 0;
  long long v13 = 0u;
  uint64_t v14 = 0;
  v12[1] = v2;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  v4 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  v24 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  if (!get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __get_CTServerConnectionCreateWithIdentifierSymbolLoc_block_invoke;
    uint64_t v19 = &unk_1E6079C28;
    v20 = &v21;
    v5 = CoreTelephonyLibrary();
    v6 = dlsym(v5, "_CTServerConnectionCreateWithIdentifier");
    *(void *)(v20[1] + 24) = v6;
    get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr = *(_UNKNOWN **)(v20[1] + 24);
    v4 = (void *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (v4)
  {
    uint64_t v7 = (const void *)((uint64_t (*)(void, __CFString *, uint64_t (*)(), void *))v4)(*MEMORY[0x1E4F1CF80], @"com.apple.shortcuts", WFCoreTelephonyConnectionCallbackStub, v12);
    v3->_connection = (__CTServerConnection *)CFRetain(v7);
    CFRelease(v7);
    v8 = v3;
LABEL_6:

    return v3;
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  char v11 = objc_msgSend(NSString, "stringWithUTF8String:", "CTServerConnectionRef WF_CTServerConnectionCreateWithIdentifier(CFAllocatorRef, CFStringRef, CTServerConnectionCallback, _CTServerConnectionContext *)");
  objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"WFCellularSettings.m", 16, @"%s", dlerror());

  __break(1u);
  return result;
}

+ (id)defaultSettings
{
  if (defaultSettings_onceToken != -1) {
    dispatch_once(&defaultSettings_onceToken, &__block_literal_global_9618);
  }
  v2 = (void *)defaultSettings_settings;
  return v2;
}

uint64_t __37__WFCellularSettings_defaultSettings__block_invoke()
{
  v0 = objc_alloc_init(WFCellularSettings);
  uint64_t v1 = defaultSettings_settings;
  defaultSettings_settings = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
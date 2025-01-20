@interface BRCClientPrivilegesDescriptor
+ (BOOL)_isNonSandboxedForAuditToken:(id *)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)canFetchUserQuota;
- (BOOL)hasAuditToken;
- (BOOL)isAllowedToAccessAnyCloudService;
- (BOOL)isAutomationEntitled;
- (BOOL)isBRCTL;
- (BOOL)isFolderSharingProxyEntitled;
- (BOOL)isNonAppSandboxed;
- (BOOL)isProxyEntitled;
- (BOOL)isSharingPrivateInterfaceEntitled;
- (BOOL)isSharingProxyEntitled;
- (BOOL)isSyncBubbleClientEntitled;
- (BRCClientPrivilegesDescriptor)initWithAuditToken:(id *)a3;
- (BRCClientPrivilegesDescriptor)initWithNonSandboxedAppWithAppLibraryIDs:(id)a3 bundleID:(id)a4 auditToken:(id *)a5;
- (NSSet)appLibraryIDs;
- (NSString)applicationIdentifier;
- (NSString)defaultAppLibraryID;
- (char)_computeCloudEnabledStatusWithoutLogOutStatus;
- (char)cloudEnabledStatusWithHasSession:(BOOL)a3;
- (id)description;
- (int)pid;
- (void)_computeCloudEnabledStatusWithoutLogOutStatus;
- (void)_finishSetupWithClientContainerIDs:(id)a3;
- (void)auditToken;
- (void)pid;
- (void)updateCloudEnabledStatus;
@end

@implementation BRCClientPrivilegesDescriptor

- (BRCClientPrivilegesDescriptor)initWithAuditToken:(id *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)BRCClientPrivilegesDescriptor;
  v4 = [(BRCClientPrivilegesDescriptor *)&v16 init];
  v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)a3->var0;
    *(_OWORD *)(v4 + 72) = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)(v4 + 56) = v6;
    v4[26] = 1;
    long long v14 = *(_OWORD *)a3->var0;
    long long v15 = *(_OWORD *)&a3->var0[4];
    v7 = (void *)BRCopyEntitlementsForAuditToken();
    uint64_t v8 = BREntitledApplicationIdentifier();
    v9 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v8;

    v5[24] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x263F323E0], v14, v15);
    v5[25] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x263F323E8]);
    if (v5[18])
    {
      v5[17] = 1;
      *(_DWORD *)(v5 + 19) = 16843009;
      v5[23] = 1;
LABEL_10:
      v12 = BREntitledContainerIdentifiers();
      [v5 _finishSetupWithClientContainerIDs:v12];

      return (BRCClientPrivilegesDescriptor *)v5;
    }
    v5[19] = BRIsEntitledForAnyiCloudService();
    v5[17] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x263F32348]);
    if (v5[24])
    {
      v5[20] = 1;
    }
    else
    {
      int v10 = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x263F32378]);
      v5[20] = v10;
      if (!v10)
      {
        v5[21] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x263F32418]);
        v5[23] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x263F32410]);
        char v11 = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x263F323F0]);
        goto LABEL_9;
      }
    }
    char v11 = 1;
    v5[21] = 1;
    v5[23] = 1;
LABEL_9:
    v5[22] = v11;
    v5[27] = objc_msgSend(v7, "brc_BOOLeanValueForKey:", *MEMORY[0x263F32428]);
    goto LABEL_10;
  }
  return (BRCClientPrivilegesDescriptor *)v5;
}

- (void)_finishSetupWithClientContainerIDs:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (v4)
  {
    v5 = [MEMORY[0x263EFFA08] setWithArray:v4];
    appLibraryIDs = self->_appLibraryIDs;
    self->_appLibraryIDs = v5;

    id v4 = v15;
  }
  if ([v4 count])
  {
    v7 = [v15 objectAtIndexedSubscript:0];
    defaultAppLibraryID = self->_defaultAppLibraryID;
    self->_defaultAppLibraryID = v7;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
  {
    int v10 = applicationIdentifier;
  }
  else
  {
    if (![(BRCClientPrivilegesDescriptor *)self hasPid]) {
      goto LABEL_10;
    }
    [(BRCClientPrivilegesDescriptor *)self pid];
    BRCExecutableNameForProcessIdentifier();
    int v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  debugIdentifier = self->_debugIdentifier;
  self->_debugIdentifier = v10;

LABEL_10:
  if (!self->_debugIdentifier)
  {
    self->_debugIdentifier = (NSString *)@"Client";
  }
  if ([(BRCClientPrivilegesDescriptor *)self hasPid])
  {
    v12 = [(NSString *)self->_debugIdentifier stringByAppendingFormat:@"[%d]", [(BRCClientPrivilegesDescriptor *)self pid]];
    v13 = self->_debugIdentifier;
    self->_debugIdentifier = v12;
  }
  long long v14 = self;
  objc_sync_enter(v14);
  v14->_cloudEnabledStatusWithoutLogOutStatus = [(BRCClientPrivilegesDescriptor *)v14 _computeCloudEnabledStatusWithoutLogOutStatus];
  objc_sync_exit(v14);
}

- (int)pid
{
  if (![(BRCClientPrivilegesDescriptor *)self hasPid])
  {
    id v4 = brc_bread_crumbs();
    v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(BRCClientPrivilegesDescriptor *)(uint64_t)v4 pid];
    }
  }
  return self->_auditToken.val[5];
}

- (BOOL)hasAuditToken
{
  return self->_hasAuditToken;
}

- (char)_computeCloudEnabledStatusWithoutLogOutStatus
{
  if ([(BRCClientPrivilegesDescriptor *)self isAutomationEntitled]
    || [(BRCClientPrivilegesDescriptor *)self isProxyEntitled])
  {
    return 1;
  }
  if (![(BRCClientPrivilegesDescriptor *)self isAllowedToAccessAnyCloudService]) {
    return -3;
  }
  if (![(BRCClientPrivilegesDescriptor *)self isNonAppSandboxed])
  {
    [(BRCClientPrivilegesDescriptor *)self auditToken];
    if (!TCCAccessCheckAuditToken())
    {
      v9 = brc_bread_crumbs();
      int v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientPrivilegesDescriptor _computeCloudEnabledStatusWithoutLogOutStatus]();
      }
      char v3 = -1;
      goto LABEL_17;
    }
  }
  v5 = [(BRCClientPrivilegesDescriptor *)self applicationIdentifier];

  if (v5)
  {
    long long v6 = [MEMORY[0x263F53C50] sharedConnection];
    v7 = [(BRCClientPrivilegesDescriptor *)self applicationIdentifier];
    char v8 = [v6 isCloudSyncAllowed:v7];

    if ((v8 & 1) == 0)
    {
      v9 = brc_bread_crumbs();
      int v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientPrivilegesDescriptor _computeCloudEnabledStatusWithoutLogOutStatus]();
      }
      char v3 = -2;
LABEL_17:

      return v3;
    }
  }
  return 1;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (BOOL)isProxyEntitled
{
  return self->_isProxyEntitled;
}

- (BOOL)isAutomationEntitled
{
  return self->_isAutomationEntitled;
}

- (BOOL)isNonAppSandboxed
{
  return self->_isNonAppSandboxed;
}

- (BOOL)isAllowedToAccessAnyCloudService
{
  return self->_isAllowedToAccessAnyCloudService;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  char v3 = self;
  if (!BYTE2(self->var0[6]))
  {
    long long v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(BRCClientPrivilegesDescriptor *)(uint64_t)v6 auditToken];
    }
  }
  long long v5 = *(_OWORD *)&v3[2].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&v3[1].var0[6];
  *(_OWORD *)&retstr->var0[4] = v5;
  return self;
}

- (char)cloudEnabledStatusWithHasSession:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v3) {
    char v5 = 1;
  }
  else {
    char v5 = -4;
  }
  if (v4->_cloudEnabledStatusWithoutLogOutStatus == 1) {
    char cloudEnabledStatusWithoutLogOutStatus = v5;
  }
  else {
    char cloudEnabledStatusWithoutLogOutStatus = v4->_cloudEnabledStatusWithoutLogOutStatus;
  }
  objc_sync_exit(v4);

  return cloudEnabledStatusWithoutLogOutStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAppLibraryID, 0);
  objc_storeStrong((id *)&self->_appLibraryIDs, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
}

- (BRCClientPrivilegesDescriptor)initWithNonSandboxedAppWithAppLibraryIDs:(id)a3 bundleID:(id)a4 auditToken:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = objc_opt_class();
  long long v11 = *(_OWORD *)&self->_auditToken.val[4];
  long long v21 = *(_OWORD *)self->_auditToken.val;
  long long v22 = v11;
  if ([v10 _isNonSandboxedForAuditToken:&v21])
  {
    v20.receiver = self;
    v20.super_class = (Class)BRCClientPrivilegesDescriptor;
    v12 = [(BRCClientPrivilegesDescriptor *)&v20 init];
    v13 = v12;
    if (v12)
    {
      v12->_isNonAppSandboxed = 1;
      objc_storeStrong((id *)&v12->_applicationIdentifier, a4);
      v13->_isAllowedToAccessAnyCloudService = 1;
      long long v14 = *(_OWORD *)a5->var0;
      *(_OWORD *)&v13->_auditToken.val[4] = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)v13->_auditToken.val = v14;
      v13->_hasAuditToken = 1;
      *(_DWORD *)&v13->_isProxyEntitled = 16843009;
      [(id)*MEMORY[0x263F323E8] UTF8String];
      id v15 = (void *)xpc_copy_entitlement_for_token();
      BOOL v16 = MEMORY[0x2455DA2C0]() == MEMORY[0x263EF86E0] && xpc_BOOL_get_value(v15);
      v13->_isBRCTL = v16;
      [(BRCClientPrivilegesDescriptor *)v13 _finishSetupWithClientContainerIDs:v8];
    }
  }
  else
  {
    long long v17 = *(_OWORD *)&a5->var0[4];
    long long v21 = *(_OWORD *)a5->var0;
    long long v22 = v17;
    v13 = [(BRCClientPrivilegesDescriptor *)self initWithAuditToken:&v21];
  }
  v18 = v13;

  return v18;
}

- (BOOL)canFetchUserQuota
{
  return self->_isAutomationEntitled || self->_canGetApplicationInfo;
}

- (id)description
{
  return self->_debugIdentifier;
}

+ (BOOL)_isNonSandboxedForAuditToken:(id *)a3
{
  return 0;
}

- (void)updateCloudEnabledStatus
{
  obj = self;
  objc_sync_enter(obj);
  obj->_char cloudEnabledStatusWithoutLogOutStatus = [(BRCClientPrivilegesDescriptor *)obj _computeCloudEnabledStatusWithoutLogOutStatus];
  objc_sync_exit(obj);
}

- (BOOL)isSharingProxyEntitled
{
  return self->_isSharingProxyEntitled;
}

- (BOOL)isFolderSharingProxyEntitled
{
  return self->_isFolderSharingProxyEntitled;
}

- (BOOL)isSharingPrivateInterfaceEntitled
{
  return self->_isSharingPrivateInterfaceEntitled;
}

- (BOOL)isBRCTL
{
  return self->_isBRCTL;
}

- (NSSet)appLibraryIDs
{
  return self->_appLibraryIDs;
}

- (NSString)defaultAppLibraryID
{
  return self->_defaultAppLibraryID;
}

- (BOOL)isSyncBubbleClientEntitled
{
  return self->_isSyncBubbleClientEntitled;
}

- (void)pid
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: self.hasPid%@", (uint8_t *)&v2, 0xCu);
}

- (void)auditToken
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _hasAuditToken%@", (uint8_t *)&v2, 0xCu);
}

- (void)_computeCloudEnabledStatusWithoutLogOutStatus
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] %@ is restricted from sync (TCC)%@");
}

@end
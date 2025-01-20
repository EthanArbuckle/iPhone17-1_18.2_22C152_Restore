@interface NSXPCConnection(SafariCoreExtras)
+ (id)safari_applicationRecordForConnectedProcessWithAuditToken:()SafariCoreExtras;
+ (uint64_t)safari_applicationWithAuditToken:()SafariCoreExtras hasApprovedWebCredentialsDomainAssociationForDomain:;
- (id)safari_applicationRecordForConnectedProcess;
- (id)safari_arrayForEntitlement:()SafariCoreExtras;
- (id)safari_arrayForEntitlement:()SafariCoreExtras containingObjectsOfClass:;
- (uint64_t)safari_BOOLForEntitlement:()SafariCoreExtras;
- (uint64_t)safari_hasApprovedWebCredentialsDomainAssociationForDomain:()SafariCoreExtras;
@end

@implementation NSXPCConnection(SafariCoreExtras)

- (id)safari_applicationRecordForConnectedProcess
{
  v1 = (void *)MEMORY[0x1E4F29268];
  [a1 auditToken];
  v2 = objc_msgSend(v1, "safari_applicationRecordForConnectedProcessWithAuditToken:", &v4);
  return v2;
}

+ (id)safari_applicationRecordForConnectedProcessWithAuditToken:()SafariCoreExtras
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v3 = a3[1];
  v13[0] = *a3;
  v13[1] = v3;
  id v12 = 0;
  uint64_t v4 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:v13 error:&v12];
  id v5 = v12;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      goto LABEL_10;
    }
    v7 = (id)WBS_LOG_CHANNEL_PREFIXXPC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      +[NSXPCConnection(SafariCoreExtras) safari_applicationRecordForConnectedProcessWithAuditToken:v7];
    }
  }
  else
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXXPC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(v5, "safari_privacyPreservingDescription");
      +[NSXPCConnection(SafariCoreExtras) safari_applicationRecordForConnectedProcessWithAuditToken:v7];
    }
  }

  id v6 = 0;
LABEL_10:

  return v6;
}

+ (uint64_t)safari_applicationWithAuditToken:()SafariCoreExtras hasApprovedWebCredentialsDomainAssociationForDomain:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v6 = a3[1];
  v17[0] = *a3;
  v17[1] = v6;
  v7 = WBSApplicationIdentifierFromAuditToken(v17);
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F9F408]);
    v9 = (void *)[v8 initWithServiceType:*MEMORY[0x1E4F9F418] applicationIdentifier:v7 domain:v5];
    id v16 = 0;
    v10 = [MEMORY[0x1E4F9F400] serviceDetailsWithServiceSpecifier:v9 error:&v16];
    id v11 = v16;
    if (v10)
    {
      uint64_t v12 = objc_msgSend(v10, "safari_containsObjectPassingTest:", &__block_literal_global_32);
    }
    else
    {
      v13 = (id)WBS_LOG_CHANNEL_PREFIXXPC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(v11, "safari_privacyPreservingDescription");
        *(_DWORD *)buf = 138543362;
        v19 = v14;
        _os_log_impl(&dword_1B728F000, v13, OS_LOG_TYPE_DEFAULT, "Could not load shared web credentials: %{public}@", buf, 0xCu);
      }
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (uint64_t)safari_BOOLForEntitlement:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "valueForEntitlement:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)safari_arrayForEntitlement:()SafariCoreExtras
{
  uint64_t v1 = objc_msgSend(a1, "valueForEntitlement:");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    long long v3 = (void *)v1;
  }
  else {
    long long v3 = 0;
  }
  if (isKindOfClass) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (void *)v1;
  }

  return v3;
}

- (id)safari_arrayForEntitlement:()SafariCoreExtras containingObjectsOfClass:
{
  id v5 = objc_msgSend(a1, "safari_arrayForEntitlement:");
  if ([v5 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __89__NSXPCConnection_SafariCoreExtras__safari_arrayForEntitlement_containingObjectsOfClass___block_invoke;
    v8[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v8[4] = a4;
    long long v6 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v8);
  }
  else
  {
    long long v6 = 0;
  }

  return v6;
}

- (uint64_t)safari_hasApprovedWebCredentialsDomainAssociationForDomain:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = objc_opt_class();
  [a1 auditToken];
  uint64_t v6 = objc_msgSend(v5, "safari_applicationWithAuditToken:hasApprovedWebCredentialsDomainAssociationForDomain:", &v8, v4);

  return v6;
}

+ (void)safari_applicationRecordForConnectedProcessWithAuditToken:()SafariCoreExtras .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Could not fetch bundle record for connected process: %{public}@.", buf, 0xCu);
}

+ (void)safari_applicationRecordForConnectedProcessWithAuditToken:()SafariCoreExtras .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Connected process bundle record has unexpected type: %{public}@.", buf, 0xCu);
}

@end
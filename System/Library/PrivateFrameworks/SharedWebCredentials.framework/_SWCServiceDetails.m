@interface _SWCServiceDetails
+ (BOOL)auditTokenHasReadAccess:(id *)a3;
+ (BOOL)auditTokenHasWriteAccess:(id *)a3;
+ (BOOL)currentProcessHasReadAccess;
+ (BOOL)currentProcessHasWriteAccess;
+ (BOOL)isDeveloperModeEnabled;
+ (BOOL)supportsSecureCoding;
+ (id)_serviceDetailsWithServiceSpecifier:(id)a3 URLComponents:(id)a4 limit:(unint64_t)a5 callerAuditToken:(id *)a6 error:(id *)a7;
+ (id)new;
+ (id)serviceDetailsWithServiceSpecifier:(id)a3 URLComponents:(id)a4 limit:(unint64_t)a5 auditToken:(id *)a6 error:(id *)a7;
+ (id)serviceDetailsWithServiceSpecifier:(id)a3 URLComponents:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
+ (id)serviceDetailsWithServiceSpecifier:(id)a3 error:(id *)a4;
+ (id)serviceDetailsWithServiceSpecifier:(id)a3 limit:(unint64_t)a4 auditToken:(id *)a5 error:(id *)a6;
+ (id)serviceDetailsWithServiceSpecifier:(id)a3 limit:(unint64_t)a4 error:(id *)a5;
+ (void)setAdditionalServiceDetailsForApplicationIdentifiers:(id)a3 usingContentsOfDictionary:(id)a4 completionHandler:(id)a5;
+ (void)setDeveloperModeEnabled:(BOOL)a3 completionHandler:(id)a4;
+ (void)synchronizeWithCompletionHandler:(id)a3;
- (BOOL)isAlwaysEnabled;
- (BOOL)isApproved;
- (BOOL)isEnterpriseManaged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemApplication;
- (BOOL)isSystemPlaceholder;
- (BOOL)isUpdating;
- (BOOL)isWatchKitExtension;
- (BOOL)setUserApprovalState:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)wasProvidedByAdditionalServiceDetailsProvider;
- (BOOL)wasReadFromDisk;
- (NSNumber)isEnabledByDefault;
- (_SWCServiceDetails)init;
- (_SWCServiceDetails)initWithCoder:(id)a3;
- (_SWCServiceSpecifier)serviceSpecifier;
- (char)modeOfOperation;
- (id)_initWithServiceSpecifier:(id)a3 fields:(const SWCFields *)a4;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (unint64_t)hash;
- (unsigned)frameworkApprovalState;
- (unsigned)siteApprovalState;
- (unsigned)userApprovalState;
- (void)encodeWithCoder:(id)a3;
- (void)setUserApprovalState:(unsigned __int8)a3;
- (void)waitForSiteApprovalWithCompletionHandler:(id)a3;
@end

@implementation _SWCServiceDetails

+ (id)serviceDetailsWithServiceSpecifier:(id)a3 error:(id *)a4
{
  v4 = [a1 _serviceDetailsWithServiceSpecifier:a3 URLComponents:0 limit:-1 callerAuditToken:0 error:a4];
  return v4;
}

+ (id)serviceDetailsWithServiceSpecifier:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  v5 = [a1 _serviceDetailsWithServiceSpecifier:a3 URLComponents:0 limit:a4 callerAuditToken:0 error:a5];
  return v5;
}

+ (id)serviceDetailsWithServiceSpecifier:(id)a3 limit:(unint64_t)a4 auditToken:(id *)a5 error:(id *)a6
{
  v6 = [a1 _serviceDetailsWithServiceSpecifier:a3 URLComponents:0 limit:a4 callerAuditToken:a5 error:a6];
  return v6;
}

+ (id)serviceDetailsWithServiceSpecifier:(id)a3 URLComponents:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  v6 = [a1 _serviceDetailsWithServiceSpecifier:a3 URLComponents:a4 limit:a5 callerAuditToken:0 error:a6];
  return v6;
}

+ (id)serviceDetailsWithServiceSpecifier:(id)a3 URLComponents:(id)a4 limit:(unint64_t)a5 auditToken:(id *)a6 error:(id *)a7
{
  v7 = [a1 _serviceDetailsWithServiceSpecifier:a3 URLComponents:a4 limit:a5 callerAuditToken:a6 error:a7];
  return v7;
}

+ (id)new
{
}

- (_SWCServiceDetails)init
{
}

- (id)_initWithServiceSpecifier:(id)a3 fields:(const SWCFields *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SWCServiceDetails;
  v8 = [(_SWCServiceDetails *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serviceSpecifier, a3);
    if (a4)
    {
      __int16 v11 = *(_WORD *)a4;
      char relativeOrder = a4->relativeOrder;
    }
    else
    {
      char relativeOrder = 0;
      __int16 v11 = 0;
    }
    *(_WORD *)&v9->_fields = v11;
    v9->_fields.char relativeOrder = relativeOrder;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SWCServiceDetails *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_SWCServiceSpecifier *)self->_serviceSpecifier isEqual:v4->_serviceSpecifier];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(_SWCServiceSpecifier *)self->_serviceSpecifier hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(_SWCServiceSpecifier *)self->_serviceSpecifier serviceType];
  BOOL v5 = [(_SWCServiceSpecifier *)self->_serviceSpecifier applicationIdentifier];
  v6 = [(_SWCServiceSpecifier *)self->_serviceSpecifier domain];
  id v7 = _SWCServiceApprovalStateGetDebugDescription(*(_WORD *)&self->_fields & 3);
  v8 = _SWCServiceApprovalStateGetDebugDescription((*(unsigned char *)&self->_fields >> 2) & 3);
  v9 = (void *)[v3 initWithFormat:@"{ s = %@, a = %@, d = %@, ua = %@, sa = %@ }", v4, v5, v6, v7, v8];

  return v9;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(_SWCServiceDetails *)self description];
  v6 = (void *)[v3 initWithFormat:@"<%@ %p> %@", v4, self, v5];

  return v6;
}

- (id)redactedDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(_SWCServiceSpecifier *)self->_serviceSpecifier serviceType];
  BOOL v5 = [(_SWCServiceSpecifier *)self->_serviceSpecifier SWCApplicationIdentifier];
  v6 = [v5 redactedDescription];
  id v7 = [(_SWCServiceSpecifier *)self->_serviceSpecifier SWCDomain];
  v8 = [v7 redactedDescription];
  v9 = _SWCServiceApprovalStateGetDebugDescription(*(_WORD *)&self->_fields & 3);
  v10 = _SWCServiceApprovalStateGetDebugDescription((*(unsigned char *)&self->_fields >> 2) & 3);
  __int16 v11 = (void *)[v3 initWithFormat:@"{ s = %@, a = %@, d = %@, ua = %@, sa = %@ }", v4, v6, v8, v9, v10];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_serviceSpecifier forKey:@"serviceSpecifier"];
  [v4 encodeInt64:*(_WORD *)&self->_fields | ((unint64_t)self->_fields.relativeOrder << 16) forKey:@"fields"];
}

- (_SWCServiceDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"serviceSpecifier");
  uint64_t v6 = [v4 decodeInt64ForKey:@"fields"];
  __int16 v9 = v6;
  char v10 = BYTE2(v6);
  id v7 = [(_SWCServiceDetails *)self _initWithServiceSpecifier:v5 fields:&v9];

  return v7;
}

- (_SWCServiceSpecifier)serviceSpecifier
{
  return (_SWCServiceSpecifier *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

- (BOOL)isApproved
{
  return (*(_WORD *)&self->_fields & 3) == 1 || (*(_WORD *)&self->_fields & 0xC) == 4;
}

- (unsigned)userApprovalState
{
  return *(_WORD *)&self->_fields & 3;
}

- (void)setUserApprovalState:(unsigned __int8)a3
{
}

- (BOOL)setUserApprovalState:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  id v7 = _SWCGetServerConnection();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69___SWCServiceDetails_SWCServiceApproval__setUserApprovalState_error___block_invoke;
  v15[3] = &unk_1E5E519D8;
  v15[4] = &v16;
  v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v15];
  serviceSpecifier = self->_serviceSpecifier;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69___SWCServiceDetails_SWCServiceApproval__setUserApprovalState_error___block_invoke_2;
  v13[3] = &unk_1E5E51B58;
  v13[5] = &v22;
  v13[6] = &v16;
  v13[4] = self;
  char v14 = v5;
  [v8 setUserApprovalState:v5 forServiceWithServiceSpecifier:serviceSpecifier completionHandler:v13];
  int v10 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((unsigned char *)v23 + 24))
  {
    *a4 = (id) v17[5];
    int v10 = *((unsigned __int8 *)v23 + 24);
  }
  BOOL v11 = v10 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v11;
}

- (unsigned)siteApprovalState
{
  SWCFields fields = self->_fields;
  if ((*(unsigned char *)&fields & 0x20) != 0) {
    return 0;
  }
  else {
    return (*(unsigned int *)&fields >> 2) & 3;
  }
}

- (unsigned)frameworkApprovalState
{
  return (*(_WORD *)&self->_fields >> 2) & (*(_WORD *)&self->_fields << 26 >> 31) & 3;
}

- (void)waitForSiteApprovalWithCompletionHandler:(id)a3
{
  uint64_t v5 = (void (**)(id, _SWCServiceDetails *, void))a3;
  if (!v5)
  {
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SWCServiceDetails.mm", 239, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  if ((*(_WORD *)&self->_fields & 0xC) != 0)
  {
    v5[2](v5, self, 0);
  }
  else
  {
    uint64_t v6 = _SWCGetServerConnection();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83___SWCServiceDetails_SWCServiceApproval__waitForSiteApprovalWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E5E51B80;
    id v7 = v5;
    id v12 = v7;
    v8 = [v6 remoteObjectProxyWithErrorHandler:v11];
    __int16 v9 = [(_SWCServiceDetails *)self serviceSpecifier];
    [v8 waitForSiteApprovalWithServiceSpecifier:v9 completionHandler:v7];
  }
}

+ (BOOL)currentProcessHasReadAccess
{
  int v3 = _SWCGetAuditTokenForSelf(v6);
  if (v3)
  {
    v5[0] = v6[0];
    v5[1] = v6[1];
    LOBYTE(v3) = [a1 auditTokenHasReadAccess:v5];
  }
  return v3;
}

+ (BOOL)auditTokenHasReadAccess:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  v8[2] = *(_OWORD *)a3->var0;
  v8[3] = v4;
  int v5 = _SWCCanAuditTokenConnect();
  if (v5)
  {
    long long v6 = *(_OWORD *)&a3->var0[4];
    v8[0] = *(_OWORD *)a3->var0;
    v8[1] = v6;
    LOBYTE(v5) = _SWCIsAuditTokenEntitled(v8, 0);
  }
  return v5;
}

+ (BOOL)currentProcessHasWriteAccess
{
  int v3 = _SWCGetAuditTokenForSelf(v6);
  if (v3)
  {
    v5[0] = v6[0];
    v5[1] = v6[1];
    LOBYTE(v3) = [a1 auditTokenHasWriteAccess:v5];
  }
  return v3;
}

+ (BOOL)auditTokenHasWriteAccess:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  v8[2] = *(_OWORD *)a3->var0;
  v8[3] = v4;
  int v5 = _SWCCanAuditTokenConnect();
  if (v5)
  {
    long long v6 = *(_OWORD *)&a3->var0[4];
    v8[0] = *(_OWORD *)a3->var0;
    v8[1] = v6;
    LOBYTE(v5) = _SWCIsAuditTokenEntitled(v8, 1);
  }
  return v5;
}

- (BOOL)isUpdating
{
  return (*(_WORD *)&self->_fields >> 4) & 1;
}

- (BOOL)isSystemApplication
{
  return (*(_WORD *)&self->_fields >> 5) & 1;
}

- (BOOL)wasReadFromDisk
{
  return (*(_WORD *)&self->_fields & 0x1C00) == 1024;
}

- (BOOL)wasProvidedByAdditionalServiceDetailsProvider
{
  return (*(_WORD *)&self->_fields & 0x1C00) == 3072;
}

- (BOOL)isAlwaysEnabled
{
  return (*(_WORD *)&self->_fields & 0xC0) == 0x40
      && [(_SWCServiceDetails *)self isSystemApplication];
}

- (NSNumber)isEnabledByDefault
{
  uint64_t v2 = (*(_WORD *)&self->_fields >> 6) - 1;
  if (v2 > 2) {
    return 0;
  }
  int v3 = (NSNumber *)qword_1E5E51C80[v2];
  if ([(_SWCServiceDetails *)self isSystemApplication]) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)isWatchKitExtension
{
  return 0;
}

- (BOOL)isSystemPlaceholder
{
  return (*(_WORD *)&self->_fields >> 9) & 1;
}

- (BOOL)isEnterpriseManaged
{
  return HIBYTE(*(_WORD *)&self->_fields) & 1;
}

- (char)modeOfOperation
{
  uint64_t v2 = [(_SWCServiceSpecifier *)self->_serviceSpecifier SWCDomain];
  char v3 = [v2 modeOfOperation];

  return v3;
}

+ (void)setAdditionalServiceDetailsForApplicationIdentifiers:(id)a3 usingContentsOfDictionary:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v25 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"SWCServiceDetails.mm", 397, @"Invalid parameter not satisfying: %@", @"applicationIdentifiers != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"SWCServiceDetails.mm", 398, @"Invalid parameter not satisfying: %@", @"jsonDataByDomainName != nil" object file lineNumber description];

LABEL_3:
  BOOL v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v33;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = [[_SWCApplicationIdentifier alloc] initWithString:*(void *)(*((void *)&v32 + 1) + 8 * v15)];
        if (v16) {
          [v11 addObject:v16];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v13);
  }

  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke;
  v30[3] = &unk_1E5E51BA8;
  id v18 = v17;
  id v31 = v18;
  [v10 enumerateKeysAndObjectsUsingBlock:v30];
  v19 = _SWCGetServerConnection();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke_2;
  v28[3] = &unk_1E5E51B80;
  id v20 = v25;
  id v29 = v20;
  id v21 = [v19 remoteObjectProxyWithErrorHandler:v28];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke_3;
  v26[3] = &unk_1E5E51BD0;
  id v22 = v20;
  id v27 = v22;
  [v21 setAdditionalServiceDetailsForApplicationIdentifiers:v11 usingContentsOfDictionary:v18 completionHandler:v26];
}

+ (void)synchronizeWithCompletionHandler:(id)a3
{
  id v3 = a3;
  long long v4 = _SWCGetServerConnection();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72___SWCServiceDetails_Synchronization__synchronizeWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5E51B80;
  id v5 = v3;
  id v11 = v5;
  long long v6 = [v4 remoteObjectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72___SWCServiceDetails_Synchronization__synchronizeWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5E51BD0;
  id v7 = v5;
  id v9 = v7;
  [v6 addAllAppsWithCompletionHandler:v8];
}

+ (BOOL)isDeveloperModeEnabled
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v2 = _SWCGetServerConnection();
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_6];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _OWORD v6[2] = __59___SWCServiceDetails_DeveloperMode__isDeveloperModeEnabled__block_invoke_2;
  v6[3] = &unk_1E5E51C18;
  v6[4] = &v7;
  [v3 getDeveloperModeEnabledWithCompletionHandler:v6];
  char v4 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (void)setDeveloperModeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  long long v6 = _SWCGetServerConnection();
  uint64_t v7 = &__block_literal_global_144;
  if (v5) {
    uint64_t v7 = v5;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79___SWCServiceDetails_DeveloperMode__setDeveloperModeEnabled_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5E51B80;
  id v8 = v7;
  id v11 = v8;
  uint64_t v9 = [v6 remoteObjectProxyWithErrorHandler:v10];
  [v9 setDeveloperModeEnabled:v4 completionHandler:v8];
}

+ (id)_serviceDetailsWithServiceSpecifier:(id)a3 URLComponents:(id)a4 limit:(unint64_t)a5 callerAuditToken:(id *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  id v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__1;
  id v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  if (a6)
  {
    [MEMORY[0x1E4F29238] valueWithBytes:a6 objCType:"{?=[8I]}"];
    a6 = (const $115C4C562B26FF47E01F9F4EA65B5887 *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v13 = _SWCGetServerConnection();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __110___SWCServiceDetails_Private___serviceDetailsWithServiceSpecifier_URLComponents_limit_callerAuditToken_error___block_invoke;
  v20[3] = &unk_1E5E519D8;
  v20[4] = &v21;
  uint64_t v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v20];
  uint64_t v15 = [v12 URL];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __110___SWCServiceDetails_Private___serviceDetailsWithServiceSpecifier_URLComponents_limit_callerAuditToken_error___block_invoke_2;
  v19[3] = &unk_1E5E51C60;
  v19[4] = &v27;
  v19[5] = &v21;
  [v14 getDetailsWithServiceSpecifier:v11 URL:v15 limit:a5 callerAuditToken:a6 completionHandler:v19];

  uint64_t v16 = (void *)v28[5];
  if (a7 && !v16)
  {
    *a7 = (id) v22[5];
    uint64_t v16 = (void *)v28[5];
  }
  id v17 = v16;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v17;
}

@end
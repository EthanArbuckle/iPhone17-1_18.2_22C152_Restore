@interface RBSProcessIdentity
+ (BOOL)shouldManageExtensionWithExtensionPoint:(id)a3;
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)_identityForXPCServiceIdentifier:(id)a3 variant:(int64_t)a4;
+ (id)decodeFromJob:(id)a3 uuid:(id)a4;
+ (id)extensionIdentityForBundleIdentifier:(id)a3 persona:(id)a4 instanceUUID:(id)a5 hostIdentifier:(id)a6 validationToken:(id)a7;
+ (id)extensionIdentityForPlugInKitIdentifier:(id)a3 bundledURL:(id)a4 hostIdentifier:(id)a5 UUID:(id)a6;
+ (id)extensionIdentityForPlugInKitIdentifier:(id)a3 hostIdentifier:(id)a4 UUID:(id)a5;
+ (id)externalExtensionIdentityForExtensionKitIdentifier:(id)a3 bundledURL:(id)a4 hostIdentifier:(id)a5 UUID:(id)a6;
+ (id)externalExtensionIdentityForExtensionKitIdentifier:(id)a3 hostIdentifier:(id)a4 UUID:(id)a5;
+ (id)identityForAngelJobLabel:(id)a3;
+ (id)identityForApplicationJobLabel:(id)a3;
+ (id)identityForApplicationJobLabel:(id)a3 bundleID:(id)a4 platform:(int)a5;
+ (id)identityForDaemonJobLabel:(id)a3;
+ (id)identityForDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5;
+ (id)identityForEmbeddedApplicationIdentifier:(id)a3;
+ (id)identityForEmbeddedApplicationIdentifier:(id)a3 auid:(unsigned int)a4;
+ (id)identityForEmbeddedApplicationIdentifier:(id)a3 jobLabel:(id)a4 auid:(unsigned int)a5 platform:(int)a6;
+ (id)identityForExecutablePath:(id)a3 pid:(int)a4 auid:(unsigned int)a5;
+ (id)identityForLSApplicationIdentity:(id)a3;
+ (id)identityForLSApplicationIdentity:(id)a3 LSApplicationRecord:(id)a4;
+ (id)identityForLSApplicationIdentity:(id)a3 LSApplicationRecord:(id)a4 uuid:(id)a5;
+ (id)identityForLaunchdJobLabel:(id)a3 isMultiInstance:(BOOL)a4 pid:(int)a5 auid:(unsigned int)a6;
+ (id)identityForMacApplicationJobLabel:(id)a3 appID:(id)a4 bundleID:(id)a5 platform:(int)a6;
+ (id)identityForMacApplicationJobLabel:(id)a3 appID:(id)a4 platform:(int)a5;
+ (id)identityForPlugInKitIdentifier:(id)a3;
+ (id)identityForUnbundledMacApplicationJobLabel:(id)a3;
+ (id)identityForUnknownServiceWithJobLabel:(id)a3;
+ (id)identityForWrappedInfoProvider:(id)a3;
+ (id)identityForWrappedInfoProvider:(id)a3 uuid:(id)a4;
+ (id)identityForXPCServiceExecutablePath:(id)a3 host:(id)a4;
+ (id)identityForXPCServiceExecutablePath:(id)a3 pid:(int)a4 auid:(unsigned int)a5 host:(id)a6 UUID:(id)a7;
+ (id)identityForXPCServiceIdentifier:(id)a3;
+ (id)identityForXPCServiceIdentifier:(id)a3 hostInstance:(id)a4 UUID:(id)a5 persona:(id)a6 validationToken:(id)a7 variant:(int64_t)a8;
+ (id)identityForXPCServiceIdentifier:(id)a3 hostInstance:(id)a4 UUID:(id)a5 variant:(int64_t)a6;
+ (id)identityOfCurrentProcess;
- (BOOL)_matchesIdentity:(id)a3;
- (BOOL)hasConsistentLaunchdJob;
- (BOOL)inheritsCoalitionBand;
- (BOOL)isAngel;
- (BOOL)isAnonymous;
- (BOOL)isApplication;
- (BOOL)isDaemon;
- (BOOL)isDext;
- (BOOL)isEmbeddedApplication;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentity:(id)a3;
- (BOOL)isExtension;
- (BOOL)isExternal;
- (BOOL)isMultiInstanceExtension;
- (BOOL)isXPCService;
- (BOOL)matchesProcess:(id)a3;
- (BOOL)supportsLaunchingDirectly;
- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3;
- (NSData)validationToken;
- (NSString)angelJobLabel;
- (NSString)applicationJobLabel;
- (NSString)consistentLaunchdJobLabel;
- (NSString)daemonJobLabel;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)dextContainingAppBundleID;
- (NSString)dextLabel;
- (NSString)dextServerName;
- (NSString)embeddedApplicationIdentifier;
- (NSString)persona;
- (NSString)personaString;
- (NSString)shortDescription;
- (NSString)xpcServiceIdentifier;
- (NSUUID)uuid;
- (RBSProcessIdentifier)hostIdentifier;
- (RBSProcessIdentity)hostIdentity;
- (RBSProcessIdentity)init;
- (RBSProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4;
- (RBSProcessIdentity)initWithRBSXPCCoder:(id)a3;
- (id)_init;
- (id)copyWithAuid:(unsigned int)a3;
- (id)encodeForJob;
- (id)processPredicate;
- (int)platform;
- (unint64_t)hash;
- (unsigned)auid;
- (unsigned)defaultManageFlags;
- (unsigned)osServiceType;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessIdentity

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)embeddedApplicationIdentifier
{
  return 0;
}

- (BOOL)isApplication
{
  return 0;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessIdentifier)hostIdentifier
{
  return 0;
}

- (BOOL)isXPCService
{
  return 0;
}

+ (id)identityForLaunchdJobLabel:(id)a3 isMultiInstance:(BOOL)a4 pid:(int)a5 auid:(unsigned int)a6
{
  BOOL v7 = a4;
  id v8 = a3;
  v9 = v8;
  if (a5 || !v7)
  {
    if (v8)
    {
      v11 = [RBSOSServiceProcessIdentity alloc];
      if (v7) {
        uint64_t v12 = a5;
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = [(RBSOSServiceProcessIdentity *)v11 _initDaemonWithJobLabel:v9 pid:v12 auid:0];
      goto LABEL_13;
    }
    v10 = rbs_process_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[RBSProcessIdentity identityForLaunchdJobLabel:isMultiInstance:pid:auid:](v10);
    }
  }
  else
  {
    v10 = rbs_process_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[RBSProcessIdentity identityForLaunchdJobLabel:isMultiInstance:pid:auid:]();
    }
  }

  id v13 = 0;
LABEL_13:

  return v13;
}

- (NSString)shortDescription
{
  return self->_description;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)RBSProcessIdentity;
  return [(RBSProcessIdentity *)&v3 init];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSProcessIdentity *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && [(RBSProcessIdentity *)self isEqualToIdentity:v4];
  }

  return v6;
}

- (BOOL)isEqualToIdentity:(id)a3
{
  v4 = (RBSProcessIdentity *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = self->_hash == v4->_hash
  }
      && self->_pid == v4->_pid
      && [(RBSProcessIdentity *)self _matchesIdentity:v4];

  return v6;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)hasConsistentLaunchdJob
{
  return 0;
}

- (NSString)applicationJobLabel
{
  return 0;
}

- (unsigned)osServiceType
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationToken, 0);
  objc_storeStrong((id *)&self->_persona, 0);
  objc_storeStrong((id *)&self->_angelJobLabel, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

- (BOOL)isExtension
{
  return 0;
}

- (BOOL)isDaemon
{
  return 0;
}

- (NSString)consistentLaunchdJobLabel
{
  return 0;
}

- (BOOL)isDext
{
  return 0;
}

+ (id)identityOfCurrentProcess
{
  v2 = +[RBSConnection sharedInstance];
  objc_super v3 = -[RBSConnection identity]((uint64_t)v2);

  return v3;
}

- (RBSProcessIdentity)hostIdentity
{
  return 0;
}

- (int)platform
{
  return 0;
}

+ (id)identityForExecutablePath:(id)a3 pid:(int)a4 auid:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = [RBSOpaqueProcessIdentity alloc];
  v9 = [v7 lastPathComponent];

  id v10 = [(RBSOpaqueProcessIdentity *)v8 _initOpaqueWithPid:v6 name:v9 auid:v5];
  return v10;
}

+ (id)extensionIdentityForBundleIdentifier:(id)a3 persona:(id)a4 instanceUUID:(id)a5 hostIdentifier:(id)a6 validationToken:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v14)
  {
    id v17 = 0;
    goto LABEL_5;
  }
  id v23 = 0;
  v16 = +[RBSProcessHandle handleForIdentifier:v14 error:&v23];
  id v17 = v23;
  if (v16)
  {
    v18 = [v16 identity];
    uint64_t v19 = +[RBSProcessInstance instanceWithIdentifier:v14 identity:v18];

    id v17 = (id)v19;
LABEL_5:
    v20 = +[RBSProcessIdentity identityForXPCServiceIdentifier:v11 hostInstance:v17 UUID:v13 persona:v12 validationToken:v15 variant:2];
    goto LABEL_9;
  }
  v21 = rbs_process_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    +[RBSProcessIdentity extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:]();
  }

  v20 = 0;
LABEL_9:

  return v20;
}

+ (id)decodeFromJob:(id)a3 uuid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = xpc_dictionary_get_int64(v5, "TYPE") - 1;
  if (v7 <= 6
    && ((0x7Bu >> v7) & 1) != 0
    && (objc_opt_class(), (id v8 = (objc_class *)(id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)[[v8 alloc] initWithDecodeFromJob:v5 uuid:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)identityForXPCServiceIdentifier:(id)a3 hostInstance:(id)a4 UUID:(id)a5 persona:(id)a6 validationToken:(id)a7 variant:(int64_t)a8
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v15)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"RBSProcessIdentity.m", 293, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"RBSProcessIdentity.m", 293, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:NSStringClass]" object file lineNumber description];
  }
  uint64_t v20 = 3;
  if (v19) {
    uint64_t v20 = 1;
  }
  if (a8 <= 1) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v20;
  }
  v22 = +[RBSXPCServiceDefinition definitionWithIdentifier:v15 variant:a8 scope:v21];
  id v23 = +[RBSXPCServiceIdentity identityWithDefinition:v22 sessionID:0 host:v19 UUID:v18 persona:v17 validationToken:v16];

  id v24 = [[RBSXPCServiceProcessIdentity alloc] _initWithXPCServiceID:v23 pid:0 auid:0];
  return v24;
}

+ (id)identityForXPCServiceExecutablePath:(id)a3 pid:(int)a4 auid:(unsigned int)a5 host:(id)a6 UUID:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = v12;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v15)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, a1, @"RBSProcessIdentity.m", 386, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, a1, @"RBSProcessIdentity.m", 386, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:NSStringClass]" object file lineNumber description];
  }
  id v16 = v15;
  [v16 UTF8String];
  id v17 = (void *)xpc_bundle_create();
  uint64_t error = xpc_bundle_get_error();
  if (!error)
  {
    uint64_t v20 = xpc_bundle_get_info_dictionary();
    if (v20)
    {
      string = (char *)xpc_dictionary_get_string(v20, (const char *)[ (id) *MEMORY[0x1E4F1CFF8] UTF8String]);
      if (string) {
        string = (char *)[[NSString alloc] initWithUTF8String:string];
      }
      id v23 = _CFXPCCreateCFObjectFromXPCObject();
      id v24 = v23;
      if (string)
      {
        if (v23)
        {
          v25 = RBSDictionaryForKey(v23, @"XPCService");
          v26 = RBSExtensionPointFromBundleDict(v24);

          if (v26)
          {
            v46 = v25;
            if (v13) {
              int v27 = 1;
            }
            else {
              int v27 = 3;
            }
            uint64_t v28 = 2;
            goto LABEL_31;
          }
          if (v25)
          {
            v29 = RBSStringForKey(v25, @"ServiceType");
            v30 = v29;
            v46 = v25;
            if (!v29 || ([v29 isEqualToString:@"Application"] & 1) != 0)
            {
              int v31 = 1;
LABEL_30:
              int v43 = v31;

              uint64_t v28 = 1;
              int v27 = v43;
LABEL_31:
              int v44 = v27;
              v30 = +[RBSXPCServiceDefinition definitionWithIdentifier:variant:scope:](RBSXPCServiceDefinition, "definitionWithIdentifier:variant:scope:", string, v28);
              v45 = string;
              if (v30)
              {
                v42 = v30;
                uint64_t v41 = +[RBSXPCServiceIdentity identityWithDefinition:v30 sessionID:0 host:v13 UUID:v14 persona:0 validationToken:0];
                v32 = rbs_process_log();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  [v16 lastPathComponent];
                  v33 = int v40 = v28;
                  *(_DWORD *)buf = 138545154;
                  v48 = string;
                  __int16 v49 = 2114;
                  v50 = v33;
                  __int16 v51 = 1024;
                  int v52 = objc_msgSend(v13, "rbs_pid");
                  __int16 v53 = 1024;
                  int v54 = v40;
                  __int16 v55 = 1024;
                  int v56 = v44;
                  __int16 v57 = 2112;
                  id v58 = v14;
                  __int16 v59 = 1024;
                  int v60 = v9;
                  __int16 v61 = 1024;
                  int v62 = 0;
                  _os_log_impl(&dword_191FE8000, v32, OS_LOG_TYPE_DEFAULT, "Resolved XPC Service %{public}@ (%{public}@) with host pid %d, variant %d, scope %d, uuid %@, pid %d, and auid %d", buf, 0x3Eu);
                }
                v34 = v41;
                id v21 = [[RBSXPCServiceProcessIdentity alloc] _initWithXPCServiceID:v41 pid:v9 auid:0];
                v35 = v46;
                v30 = v42;
              }
              else
              {
                v34 = rbs_process_log();
                v35 = v46;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                  +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.4(v16, v34);
                }
                id v21 = 0;
              }

              v25 = v35;
              string = v45;
              goto LABEL_39;
            }
            if ([v30 isEqualToString:@"System"])
            {
              int v31 = 3;
              goto LABEL_30;
            }
            if ([v30 isEqualToString:@"User"])
            {
              int v31 = 2;
              goto LABEL_30;
            }
            v37 = rbs_process_log();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.5();
            }
          }
          else
          {
            v30 = rbs_process_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:]();
            }
          }
          id v21 = 0;
LABEL_39:

          goto LABEL_40;
        }
        id v24 = rbs_process_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:]();
        }
LABEL_23:
        id v21 = 0;
LABEL_40:

        goto LABEL_41;
      }
      string = (char *)v23;
    }
    else
    {
      string = 0;
    }
    id v24 = rbs_process_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:]();
    }
    goto LABEL_23;
  }
  uint64_t v19 = error;
  uint64_t v20 = rbs_process_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.6(v19, (uint64_t)v16, v20);
  }
  id v21 = 0;
LABEL_41:

  return v21;
}

- (BOOL)isEmbeddedApplication
{
  return 0;
}

- (NSString)xpcServiceIdentifier
{
  return 0;
}

- (unsigned)defaultManageFlags
{
  return 0;
}

- (NSUUID)uuid
{
  return 0;
}

- (BOOL)isAnonymous
{
  return 1;
}

- (NSString)personaString
{
  return 0;
}

+ (BOOL)shouldManageExtensionWithExtensionPoint:(id)a3
{
  return +[RBSXPCServiceProcessIdentity shouldManageExtensionWithExtensionPoint:a3];
}

+ (id)identityForPlugInKitIdentifier:(id)a3
{
  return +[RBSProcessIdentity _identityForXPCServiceIdentifier:a3 variant:2];
}

- (unsigned)auid
{
  return 0;
}

+ (id)identityForApplicationJobLabel:(id)a3 bundleID:(id)a4 platform:(int)a5
{
  id v5 = a4;
  id v6 = [[RBSEmbeddedAppProcessIdentity alloc] _initEmbeddedAppWithBundleID:v5];

  return v6;
}

+ (id)identityForUnbundledMacApplicationJobLabel:(id)a3
{
  id v3 = a3;
  id v4 = [[RBSOSServiceProcessIdentity alloc] _initUnknownOSServiceWithJobLabel:v3];

  return v4;
}

+ (id)identityForEmbeddedApplicationIdentifier:(id)a3 jobLabel:(id)a4 auid:(unsigned int)a5 platform:(int)a6
{
  id v6 = a3;
  id v7 = [[RBSEmbeddedAppProcessIdentity alloc] _initEmbeddedAppWithBundleID:v6];

  return v7;
}

+ (id)identityForWrappedInfoProvider:(id)a3 uuid:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  id v4 = objc_msgSend(a3, "fetchWrappedInfoWithError:", &v12, a4);
  id v5 = v12;
  if (v4)
  {
    id v6 = [v4 persistentJobLabel];

    if (v6)
    {
      id v7 = [v4 persistentJobLabel];
      id v8 = +[RBSProcessIdentity identityForUnknownServiceWithJobLabel:v7];
    }
    else
    {
      id v8 = [[RBSEmbeddedAppProcessIdentity alloc] _initEmbeddedAppWithAppInfo:v4];
    }
  }
  else
  {
    uint64_t v9 = rbs_general_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v5 description];
      *(_DWORD *)buf = 138543362;
      id v14 = v10;
      _os_log_impl(&dword_191FE8000, v9, OS_LOG_TYPE_DEFAULT, "_initEmbeddedAppWithAppInfoProvider failed due to %{public}@", buf, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

+ (id)identityForWrappedInfoProvider:(id)a3
{
  return +[RBSProcessIdentity identityForWrappedInfoProvider:a3 uuid:0];
}

+ (id)identityForEmbeddedApplicationIdentifier:(id)a3
{
  return (id)[a1 identityForEmbeddedApplicationIdentifier:a3 auid:0];
}

+ (id)identityForEmbeddedApplicationIdentifier:(id)a3 auid:(unsigned int)a4
{
  return +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:a3 jobLabel:0 auid:*(void *)&a4 platform:6];
}

+ (id)identityForLSApplicationIdentity:(id)a3
{
  return +[RBSProcessIdentity identityForWrappedInfoProvider:a3];
}

+ (id)identityForLSApplicationIdentity:(id)a3 LSApplicationRecord:(id)a4
{
  id v4 = +[RBSIdentityAndRecordInfoProvider _providerWithIdentity:a3 record:a4];
  id v5 = +[RBSProcessIdentity identityForWrappedInfoProvider:v4];

  return v5;
}

+ (id)identityForLSApplicationIdentity:(id)a3 LSApplicationRecord:(id)a4 uuid:(id)a5
{
  id v7 = a5;
  id v8 = +[RBSIdentityAndRecordInfoProvider _providerWithIdentity:a3 record:a4];
  uint64_t v9 = +[RBSProcessIdentity identityForWrappedInfoProvider:v8 uuid:v7];

  return v9;
}

+ (id)identityForUnknownServiceWithJobLabel:(id)a3
{
  id v3 = a3;
  id v4 = [[RBSOSServiceProcessIdentity alloc] _initUnknownOSServiceWithJobLabel:v3];

  return v4;
}

+ (id)identityForApplicationJobLabel:(id)a3
{
  return +[RBSProcessIdentity identityForApplicationJobLabel:a3 bundleID:a3 platform:0];
}

+ (id)identityForMacApplicationJobLabel:(id)a3 appID:(id)a4 platform:(int)a5
{
  return +[RBSProcessIdentity identityForLSApplicationIdentity:a4];
}

+ (id)identityForMacApplicationJobLabel:(id)a3 appID:(id)a4 bundleID:(id)a5 platform:(int)a6
{
  return +[RBSProcessIdentity identityForLSApplicationIdentity:a4];
}

+ (id)identityForDaemonJobLabel:(id)a3
{
  id v3 = a3;
  id v4 = [[RBSOSServiceProcessIdentity alloc] _initDaemonWithJobLabel:v3 pid:0 auid:0];

  return v4;
}

+ (id)identityForAngelJobLabel:(id)a3
{
  id v3 = a3;
  id v4 = [[RBSOSServiceProcessIdentity alloc] _initAngelWithJobLabel:v3];

  return v4;
}

+ (id)identityForDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[RBSDextProcessIdentity alloc] _initDextWithServerName:v9 tagString:v8 containingAppBundleID:v7];

  return v10;
}

- (RBSProcessIdentity)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSProcessIdentity.m" lineNumber:248 description:@"-init is not allowed on RBSProcessIdentity"];

  return 0;
}

- (id)copyWithAuid:(unsigned int)a3
{
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  id v3 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  id result = (id)_os_crash_msg();
  __break(1u);
  return result;
}

+ (id)identityForXPCServiceIdentifier:(id)a3 hostInstance:(id)a4 UUID:(id)a5 variant:(int64_t)a6
{
  return (id)[a1 identityForXPCServiceIdentifier:a3 hostInstance:a4 UUID:a5 persona:0 validationToken:0 variant:a6];
}

+ (id)_identityForXPCServiceIdentifier:(id)a3 variant:(int64_t)a4
{
  return +[RBSProcessIdentity identityForXPCServiceIdentifier:a3 hostInstance:0 UUID:0 variant:a4];
}

+ (id)identityForXPCServiceIdentifier:(id)a3
{
  return +[RBSProcessIdentity _identityForXPCServiceIdentifier:a3 variant:0];
}

+ (id)extensionIdentityForPlugInKitIdentifier:(id)a3 hostIdentifier:(id)a4 UUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v11 = 0;
    goto LABEL_5;
  }
  id v17 = 0;
  id v10 = +[RBSProcessHandle handleForIdentifier:v8 error:&v17];
  id v11 = v17;
  if (v10)
  {
    id v12 = [v10 identity];
    uint64_t v13 = +[RBSProcessInstance instanceWithIdentifier:v8 identity:v12];

    id v11 = (id)v13;
LABEL_5:
    id v14 = +[RBSProcessIdentity identityForXPCServiceIdentifier:v7 hostInstance:v11 UUID:v9 variant:2];
    goto LABEL_9;
  }
  uint64_t v15 = rbs_process_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    +[RBSProcessIdentity extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:]();
  }

  id v14 = 0;
LABEL_9:

  return v14;
}

+ (id)externalExtensionIdentityForExtensionKitIdentifier:(id)a3 hostIdentifier:(id)a4 UUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v11 = 0;
    goto LABEL_5;
  }
  id v17 = 0;
  id v10 = +[RBSProcessHandle handleForIdentifier:v8 error:&v17];
  id v11 = v17;
  if (v10)
  {
    id v12 = [v10 identity];
    uint64_t v13 = +[RBSProcessInstance instanceWithIdentifier:v8 identity:v12];

    id v11 = (id)v13;
LABEL_5:
    id v14 = +[RBSProcessIdentity identityForXPCServiceIdentifier:v7 hostInstance:v11 UUID:v9 variant:3];
    goto LABEL_9;
  }
  uint64_t v15 = rbs_process_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    +[RBSProcessIdentity extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:]();
  }

  id v14 = 0;
LABEL_9:

  return v14;
}

+ (id)extensionIdentityForPlugInKitIdentifier:(id)a3 bundledURL:(id)a4 hostIdentifier:(id)a5 UUID:(id)a6
{
  return (id)[a1 extensionIdentityForPlugInKitIdentifier:a3 hostIdentifier:a5 UUID:a6];
}

+ (id)externalExtensionIdentityForExtensionKitIdentifier:(id)a3 bundledURL:(id)a4 hostIdentifier:(id)a5 UUID:(id)a6
{
  return (id)[a1 externalExtensionIdentityForExtensionKitIdentifier:a3 hostIdentifier:a5 UUID:a6];
}

+ (id)identityForXPCServiceExecutablePath:(id)a3 host:(id)a4
{
  return +[RBSProcessIdentity identityForXPCServiceExecutablePath:a3 pid:0 auid:0 host:a4 UUID:0];
}

- (BOOL)isMultiInstanceExtension
{
  return 0;
}

- (BOOL)isExternal
{
  return 0;
}

- (BOOL)isAngel
{
  return 0;
}

- (NSString)daemonJobLabel
{
  return 0;
}

- (NSString)dextServerName
{
  return 0;
}

- (NSString)dextLabel
{
  return 0;
}

- (NSString)dextContainingAppBundleID
{
  return 0;
}

- (BOOL)supportsLaunchingDirectly
{
  return 0;
}

- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3
{
  return 0;
}

- (id)encodeForJob
{
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  id v2 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  id result = (id)_os_crash_msg();
  __break(1u);
  return result;
}

- (RBSProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  id v7 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  id result = (RBSProcessIdentity *)_os_crash_msg();
  __break(1u);
  return result;
}

- (BOOL)_matchesIdentity:(id)a3
{
  return self->_pid == *((_DWORD *)a3 + 2);
}

- (BOOL)matchesProcess:(id)a3
{
  id v4 = [a3 identity];
  LOBYTE(self) = [(RBSProcessIdentity *)self _matchesIdentity:v4];

  return (char)self;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingIdentity:self];
}

- (BOOL)inheritsCoalitionBand
{
  return 0;
}

- (NSString)debugDescription
{
  uint64_t v3 = [(RBSProcessIdentity *)self auid];
  uint64_t v4 = v3;
  id v5 = NSString;
  description = self->_description;
  uint64_t pid = self->_pid;
  if ((int)pid <= 0) {
    id v8 = &stru_1EE2E2768;
  }
  else {
    id v8 = @" pid=";
  }
  if ((int)pid < 1)
  {
    id v9 = &stru_1EE2E2768;
    if (v3) {
      goto LABEL_6;
    }
  }
  else
  {
    id v9 = [NSNumber numberWithInt:pid];
    if (v4)
    {
LABEL_6:
      id v10 = [NSNumber numberWithUnsignedInt:v4];
      id v11 = [v5 stringWithFormat:@"<%@%@%@%@%@>", description, v8, v9, @" AUID=", v10];

      goto LABEL_9;
    }
  }
  id v11 = [v5 stringWithFormat:@"<%@%@%@%@%@>", description, v8, v9, &stru_1EE2E2768, &stru_1EE2E2768];
LABEL_9:
  if ((int)pid >= 1) {

  }
  return (NSString *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v3 = a3;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  id v4 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

- (RBSProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v3 = a3;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  id v4 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  id result = (RBSProcessIdentity *)_os_crash_msg();
  __break(1u);
  return result;
}

- (NSString)angelJobLabel
{
  return self->_angelJobLabel;
}

- (NSString)persona
{
  return self->_persona;
}

- (NSData)validationToken
{
  return self->_validationToken;
}

+ (void)identityForLaunchdJobLabel:isMultiInstance:pid:auid:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 1024;
  int v3 = 0;
  _os_log_error_impl(&dword_191FE8000, v0, OS_LOG_TYPE_ERROR, "invalid pid (0) for multi-instance job: %@, auid: %d", v1, 0x12u);
}

+ (void)identityForLaunchdJobLabel:(os_log_t)log isMultiInstance:pid:auid:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_191FE8000, log, OS_LOG_TYPE_ERROR, "identityForDaemonLaunchProperties called with nil job label", v1, 2u);
}

+ (void)extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_191FE8000, v0, v1, "Could not get process handle for host process: %@", v2, v3, v4, v5, v6);
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_191FE8000, v0, v1, "No bundle ID found for: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_191FE8000, v0, v1, "Could not load info.plist into NSDictionary for path %{public}@", v2, v3, v4, v5, v6);
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_191FE8000, v0, v1, "The info.plist in %{public}@ does not contain a \"NSExtension\", \"XPCService\", or \"EXAppExtensionAttributes\" key", v2, v3, v4, v5, v6);
}

+ (void)identityForXPCServiceExecutablePath:(void *)a1 pid:(NSObject *)a2 auid:host:UUID:.cold.4(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 lastPathComponent];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_191FE8000, a2, OS_LOG_TYPE_ERROR, "Couldn't generate XPCService definition for %{public}@", v4, 0xCu);
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_191FE8000, v0, v1, "Could not rationalize xpc service at: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)identityForXPCServiceExecutablePath:(NSObject *)a3 pid:auid:host:UUID:.cold.6(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  xpc_strerror();
  OUTLINED_FUNCTION_1();
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_191FE8000, a3, OS_LOG_TYPE_ERROR, "Error (%{public}s) creating xpc service bundle for %{public}@", v5, 0x16u);
}

@end
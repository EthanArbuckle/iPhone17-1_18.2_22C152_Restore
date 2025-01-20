@interface RBSXPCServiceProcessIdentity
+ (BOOL)shouldManageExtensionWithExtensionPoint:(id)a3;
- (BOOL)_matchesIdentity:(id)a3;
- (BOOL)inheritsCoalitionBand;
- (BOOL)isAnonymous;
- (BOOL)isEqualToIdentity:(id)a3;
- (BOOL)isExtension;
- (BOOL)isExternal;
- (BOOL)isMultiInstanceExtension;
- (BOOL)isXPCService;
- (BOOL)supportsLaunchingDirectly;
- (RBSXPCServiceProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4;
- (RBSXPCServiceProcessIdentity)initWithRBSXPCCoder:(id)a3;
- (id)_initWithXPCServiceID:(id)a3 pid:(int)a4 auid:(unsigned int)a5;
- (id)encodeForJob;
- (id)hostIdentifier;
- (id)hostIdentity;
- (id)personaString;
- (id)uuid;
- (id)validationToken;
- (id)xpcServiceIdentifier;
- (unsigned)defaultManageFlags;
- (void)encodeForJob;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSXPCServiceProcessIdentity

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_serviceIdentity forKey:@"_serviceIdentity"];
  if (self->super._pid >= 1) {
    objc_msgSend(v4, "encodeInt64:forKey:");
  }
}

- (id)xpcServiceIdentifier
{
  v2 = [(RBSXPCServiceIdentity *)self->_serviceIdentity definition];
  v3 = [v2 identifier];

  return v3;
}

- (id)_initWithXPCServiceID:(id)a3 pid:(int)a4 auid:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  v44.receiver = self;
  v44.super_class = (Class)RBSXPCServiceProcessIdentity;
  v10 = [(RBSProcessIdentity *)&v44 _init];
  v11 = v10;
  if (v10)
  {
    id v43 = v9;
    v12 = v10 + 7;
    objc_storeStrong(v10 + 7, a3);
    if (a4 >= 1) {
      *((_DWORD *)v11 + 2) = a4;
    }
    v13 = [*v12 definition];
    uint64_t v14 = [v13 variant];

    if (v14 == 3) {
      v15 = @"extextension";
    }
    else {
      v15 = @"xpcservice";
    }
    v16 = NSString;
    v17 = [*v12 definition];
    v18 = [v17 identifier];
    uint64_t v19 = [*v12 host];
    v20 = (void *)v19;
    if (v19) {
      v21 = (__CFString *)v19;
    }
    else {
      v21 = @"no host";
    }
    v22 = [*v12 validationToken];
    uint64_t v23 = [v22 hash];
    if (v5) {
      [v16 stringWithFormat:@"%@<%@(%@)(%d)>{vt hash: %lu}", v15, v18, v21, v5, v23];
    }
    else {
    uint64_t v24 = [v16 stringWithFormat:@"%@<%@(%@)>{vt hash: %lu}", v15, v18, v21, v23];
    }
    id v25 = v11[2];
    v11[2] = (id)v24;

    v26 = [v11 uuid];

    if (v26)
    {
      v27 = NSString;
      id v28 = v11[2];
      v29 = [v11 uuid];
      uint64_t v30 = [v27 stringWithFormat:@"%@[uuid:%@]", v28, v29];
      id v31 = v11[2];
      v11[2] = (id)v30;
    }
    v32 = [v11 personaString];

    if (v32)
    {
      v33 = NSString;
      id v34 = v11[2];
      v35 = [v11 personaString];
      uint64_t v36 = [v33 stringWithFormat:@"%@{persona:%@}", v34, v35];
      id v37 = v11[2];
      v11[2] = (id)v36;
    }
    uint64_t v38 = *((unsigned int *)v11 + 2);
    if (v38)
    {
      uint64_t v39 = [NSString stringWithFormat:@"%@:%d", v11[2], v38];
      id v40 = v11[2];
      v11[2] = (id)v39;
    }
    v11[3] = (id)[*v12 hash];
    v41 = v11;
    id v9 = v43;
  }

  return v11;
}

- (id)uuid
{
  return [(RBSXPCServiceIdentity *)self->_serviceIdentity uuid];
}

- (id)personaString
{
  return [(RBSXPCServiceIdentity *)self->_serviceIdentity personaString];
}

- (BOOL)isEqualToIdentity:(id)a3
{
  id v4 = (RBSXPCServiceProcessIdentity *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    unint64_t v5 = [(RBSProcessIdentity *)self hash];
    BOOL v6 = v5 == [(RBSProcessIdentity *)v4 hash]
      && [(RBSXPCServiceProcessIdentity *)self _matchesIdentity:v4];
  }

  return v6;
}

- (BOOL)_matchesIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_2;
  }
  serviceIdentity = self->_serviceIdentity;
  id v9 = (RBSXPCServiceIdentity *)v4[7];
  if (serviceIdentity == v9)
  {
    char v6 = 1;
    goto LABEL_3;
  }
  if (!serviceIdentity || v9 == 0) {
LABEL_2:
  }
    char v6 = 0;
  else {
    char v6 = -[RBSXPCServiceIdentity isEqual:](serviceIdentity, "isEqual:");
  }
LABEL_3:

  return v6;
}

- (BOOL)isXPCService
{
  return 1;
}

- (BOOL)isAnonymous
{
  return 0;
}

- (void).cxx_destruct
{
}

- (RBSXPCServiceProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  string = xpc_dictionary_get_string(v6, "i");
  if (string)
  {
    v29 = [NSString stringWithUTF8String:string];
    int64_t int64 = xpc_dictionary_get_int64(v6, "p");
    int64_t v9 = xpc_dictionary_get_int64(v6, "h");
    uuid = xpc_dictionary_get_uuid(v6, "hu");
    if (uuid) {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
    }
    else {
      v11 = 0;
    }
    v13 = xpc_dictionary_get_value(v6, "H");
    if (v13)
    {
      uint64_t v14 = +[RBSProcessIdentity decodeFromJob:v13 uuid:v11];
    }
    else
    {
      uint64_t v14 = 0;
    }

    int64_t v26 = xpc_dictionary_get_int64(v6, "e");
    int64_t v25 = xpc_dictionary_get_int64(v6, "r");
    v15 = xpc_dictionary_get_string(v6, "o");
    if (v15)
    {
      v27 = [NSString stringWithUTF8String:v15];
    }
    else
    {
      v27 = 0;
    }
    size_t length = 0;
    data = (void *)xpc_dictionary_get_data(v6, "v", &length);
    id v17 = v7;
    if (data)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      data = (void *)[v18 initWithBytes:data length:length];
    }
    uint64_t v19 = 0;
    if (v9) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 3;
    }
    if (v9 && v14)
    {
      v21 = +[RBSProcessIdentifier identifierWithPid:v9];
      uint64_t v19 = +[RBSProcessInstance instanceWithIdentifier:v21 identity:v14];
    }
    v22 = +[RBSXPCServiceDefinition definitionWithIdentifier:v29 variant:v25 scope:v20];
    id v7 = v17;
    uint64_t v23 = +[RBSXPCServiceIdentity identityWithDefinition:v22 sessionID:0 host:v19 UUID:v17 persona:v27 validationToken:data];
    self = (RBSXPCServiceProcessIdentity *)[(RBSXPCServiceProcessIdentity *)self _initWithXPCServiceID:v23 pid:int64 auid:v26];

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (RBSXPCServiceProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceIdentity"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"_pid"];

  id v7 = (RBSXPCServiceProcessIdentity *)[(RBSXPCServiceProcessIdentity *)self _initWithXPCServiceID:v5 pid:v6 auid:0];
  return v7;
}

- (BOOL)isMultiInstanceExtension
{
  if (![(RBSXPCServiceProcessIdentity *)self isExtension]) {
    return 0;
  }
  v3 = [(RBSXPCServiceIdentity *)self->_serviceIdentity uuid];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isExtension
{
  v2 = [(RBSXPCServiceIdentity *)self->_serviceIdentity definition];
  BOOL v3 = [v2 variant] > 1;

  return v3;
}

- (unsigned)defaultManageFlags
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (defaultManageFlags_onceToken != -1) {
    dispatch_once(&defaultManageFlags_onceToken, &__block_literal_global_1);
  }
  BOOL v3 = (void *)defaultManageFlags___xpcserviceUnmanagedSet;
  BOOL v4 = [(RBSXPCServiceIdentity *)self->_serviceIdentity definition];
  uint64_t v5 = [v4 identifier];
  LODWORD(v3) = [v3 containsObject:v5];

  if (v3)
  {
    uint64_t v6 = rbs_process_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      serviceIdentity = self->_serviceIdentity;
      int v12 = 138412290;
      v13 = serviceIdentity;
      _os_log_impl(&dword_191FE8000, v6, OS_LOG_TYPE_INFO, "Not managing %@", (uint8_t *)&v12, 0xCu);
    }

    return 0;
  }
  else
  {
    int64_t v9 = [(RBSXPCServiceIdentity *)self->_serviceIdentity host];
    v10 = [v9 identity];
    unsigned __int8 v11 = [v10 defaultManageFlags];

    return v11;
  }
}

- (id)encodeForJob
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 4);
  int64_t pid = self->super._pid;
  if (pid) {
    xpc_dictionary_set_int64(empty, "p", pid);
  }
  uint64_t v5 = [(RBSXPCServiceProcessIdentity *)self hostIdentifier];
  int v6 = [v5 pid];

  if (v6) {
    xpc_dictionary_set_int64(empty, "h", v6);
  }
  id v7 = [(RBSXPCServiceProcessIdentity *)self hostIdentity];
  v8 = [v7 uuid];

  if (v8)
  {
    *(void *)uuid = 0;
    uint64_t v24 = 0;
    [v8 getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(empty, "hu", uuid);
  }
  int64_t v9 = [(RBSXPCServiceIdentity *)self->_serviceIdentity host];
  v10 = [v9 identity];

  if (v10)
  {
    unsigned __int8 v11 = [v10 encodeForJob];
    if (v11)
    {
      xpc_dictionary_set_value(empty, "H", v11);
    }
    else
    {
      int v12 = rbs_process_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        [(RBSXPCServiceProcessIdentity *)(uint64_t)v10 encodeForJob];
      }
    }
  }
  id v13 = [(RBSXPCServiceProcessIdentity *)self xpcServiceIdentifier];
  uint64_t v14 = (const char *)[v13 UTF8String];

  if (v14) {
    xpc_dictionary_set_string(empty, "i", v14);
  }
  id v15 = [(RBSXPCServiceProcessIdentity *)self personaString];
  v16 = (const char *)[v15 UTF8String];

  if (v16) {
    xpc_dictionary_set_string(empty, "o", v16);
  }
  id v17 = [(RBSXPCServiceProcessIdentity *)self validationToken];
  id v18 = v17;
  if (v17)
  {
    id v19 = v17;
    xpc_dictionary_set_data(empty, "v", (const void *)[v19 bytes], objc_msgSend(v19, "length"));
  }
  uint64_t v20 = [(RBSXPCServiceIdentity *)self->_serviceIdentity definition];
  int64_t v21 = [v20 variant];

  xpc_dictionary_set_int64(empty, "r", v21);
  return empty;
}

- (id)hostIdentifier
{
  v2 = [(RBSXPCServiceIdentity *)self->_serviceIdentity host];
  BOOL v3 = [v2 identifier];

  return v3;
}

- (id)validationToken
{
  return [(RBSXPCServiceIdentity *)self->_serviceIdentity validationToken];
}

- (id)hostIdentity
{
  v2 = [(RBSXPCServiceIdentity *)self->_serviceIdentity host];
  BOOL v3 = [v2 identity];

  return v3;
}

- (BOOL)isExternal
{
  v2 = [(RBSXPCServiceIdentity *)self->_serviceIdentity definition];
  BOOL v3 = [v2 variant] == 3;

  return v3;
}

+ (BOOL)shouldManageExtensionWithExtensionPoint:(id)a3
{
  return 1;
}

uint64_t __50__RBSXPCServiceProcessIdentity_defaultManageFlags__block_invoke()
{
  defaultManageFlags___xpcserviceUnmanagedSet = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.FileProvider.ArchiveService", @"com.apple.SMBClientProvider.FileProvider", @"com.apple.SafariServices.ContentBlockerLoader", @"com.apple.CallKit.CallDirectory", @"com.apple.AppleMediaServicesUI.SpyglassPurchases", 0);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)supportsLaunchingDirectly
{
  if (![(RBSXPCServiceProcessIdentity *)self isExtension]) {
    return 0;
  }
  BOOL v3 = [(RBSXPCServiceProcessIdentity *)self hostIdentity];
  BOOL v4 = +[RBSProcessHandle currentProcess];
  uint64_t v5 = [v4 identity];
  int v6 = (void *)v5;
  if (v3 == (void *)v5)
  {
    char v7 = 1;
  }
  else
  {
    char v7 = 0;
    if (v3 && v5) {
      char v7 = [v3 isEqual:v5];
    }
  }

  return v7;
}

- (BOOL)inheritsCoalitionBand
{
  serviceIdentity = self->_serviceIdentity;
  if (!serviceIdentity) {
    return 0;
  }
  BOOL v3 = [(RBSXPCServiceIdentity *)serviceIdentity definition];
  BOOL v4 = [v3 variant] == 1 && objc_msgSend(v3, "scope") == 1;

  return v4;
}

- (void)encodeForJob
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_191FE8000, log, OS_LOG_TYPE_FAULT, "error encoding host identity for job: %@ of %@", (uint8_t *)&v3, 0x16u);
}

@end
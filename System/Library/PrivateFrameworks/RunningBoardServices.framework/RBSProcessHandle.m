@interface RBSProcessHandle
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)_cachedHandleForKey:(uint64_t)a1;
+ (id)currentProcess;
+ (id)handleForIdentifier:(id)a3 error:(id *)a4;
+ (id)handleForKey:(unint64_t)a3 fetchIfNeeded:(BOOL)a4;
+ (id)handleForLegacyHandle:(id)a3 error:(id *)a4;
+ (id)handleForPredicate:(id)a3 error:(id *)a4;
+ (id)observeForImminentAssertionsExpiration:(id)a3;
+ (void)_cacheHandle:(uint64_t)a1;
+ (void)clearAllHandles;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)hasConsistentLaunchdJob;
- (BOOL)isApplication;
- (BOOL)isDaemon;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLifecycleManaged;
- (BOOL)isReported;
- (BOOL)isValid;
- (BOOL)isXPCService;
- (BOOL)matchesProcess:(id)a3;
- (NSString)beforeTranslocationBundlePath;
- (NSString)consistentJobLabel;
- (NSString)daemonJobLabel;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)executablePath;
- (NSString)name;
- (NSString)xpcServiceIdentifier;
- (NSUUID)uuid;
- (RBSProcessBundle)bundle;
- (RBSProcessExitContext)lastExitContext;
- (RBSProcessHandle)hostProcess;
- (RBSProcessHandle)init;
- (RBSProcessHandle)initWithIdentity:(id)a3;
- (RBSProcessHandle)initWithInstance:(id)a3 auditToken:(id)a4 bundleData:(id)a5 manageFlags:(unsigned __int8)a6 beforeTranslocationBundlePath:(id)a7 executablePath:(id)a8 cache:(BOOL)a9;
- (RBSProcessHandle)initWithLaunchContext:(id)a3;
- (RBSProcessHandle)initWithRBSXPCCoder:(id)a3;
- (RBSProcessIdentity)identity;
- (RBSProcessInstance)instance;
- (RBSProcessLimitations)activeLimitations;
- (RBSProcessState)currentState;
- _initWithIdentity:(void *)a3 beforeTranslocationBundlePath:(void *)a4 executablePath:;
- (double)elapsedCPUTimeForFrontBoard;
- (id)currentStateMatchingDescriptor:(id)a3;
- (id)endowmentInfoForHandle;
- (id)legacyHandle;
- (id)processPredicate;
- (int)pid;
- (int)platform;
- (unint64_t)hash;
- (unsigned)euid;
- (void)_fullEncode:(uint64_t)a1;
- (void)_keepAlive;
- (void)dealloc;
- (void)elapsedCPUTimeForFrontBoard;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)fullEncode:(id)a3 forKey:(id)a4;
- (void)intendToExitWith:(id)a3;
- (void)monitorForDeath:(id)a3;
@end

@implementation RBSProcessHandle

- (BOOL)isReported
{
  return self->_data >> 63;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSProcessHandle *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && [(RBSProcessHandle *)self matchesProcess:v4];
  }

  return v6;
}

- (RBSProcessBundle)bundle
{
  return self->_bundle;
}

- (BOOL)matchesProcess:(id)a3
{
  v4 = (RBSProcessHandle *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if ([(RBSProcessHandle *)v4 rbs_pid] == -1)
  {
    identity = self->_identity;
    v9 = [(RBSProcessHandle *)v5 identity];
    char v7 = [(RBSProcessIdentity *)identity isEqual:v9];
  }
  else
  {
    int pid = self->_pid;
    char v7 = pid == [(RBSProcessHandle *)v5 rbs_pid];
  }

  return v7;
}

- (int)pid
{
  return self->_pid;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessHandle)initWithRBSXPCCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 decodeUInt64ForKey:@"&"];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = rbs_process_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[RBSProcessHandle initWithRBSXPCCoder:](v7, v8);
    }

    v9 = +[RBSProcessHandle handleForKey:v7 fetchIfNeeded:1];
  }
  else
  {
    v10 = [v5 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"_codedHandle"];
    if (v10)
    {
      uint64_t v11 = +[RBSXPCCoder coderWithMessage:v10];

      id v5 = (id)v11;
    }
    v24.receiver = self;
    v24.super_class = (Class)RBSProcessHandle;
    v12 = [(RBSProcessHandle *)&v24 init];
    if (v12)
    {
      v12->_data = [v5 decodeUInt64ForKey:@"_data"];
      uint64_t v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_identity"];
      identity = v12->_identity;
      v12->_identity = (RBSProcessIdentity *)v13;

      if (!v12->_identity)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2 object:v12 file:@"RBSProcessHandle.m" lineNumber:698 description:@"Expect nonnil identity"];
      }
      v12->_int pid = [v5 decodeUInt64ForKey:@"_pid"];
      if (objc_opt_class())
      {
        uint64_t v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_bsAuditToken"];
        bsAuditToken = v12->_bsAuditToken;
        v12->_bsAuditToken = (BSAuditToken *)v15;
      }
      uint64_t v17 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_bundle"];
      bundle = v12->_bundle;
      v12->_bundle = (RBSProcessBundle *)v17;

      if ((v12->_data & 0x4000000000000000) != 0)
      {
        v19 = v12->_bundle;
        v20 = +[RBSProcessIdentifier identifierWithPid:v12->_pid];
        v21 = +[RBSProcessInstance instanceWithIdentifier:v20 identity:v12->_identity];
        [(RBSProcessBundle *)v19 setInstance:v21];
      }
    }
    self = v12;

    v9 = self;
  }

  return v9;
}

+ (id)handleForKey:(unint64_t)a3 fetchIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  uint64_t v7 = +[RBSProcessHandle _cachedHandleForKey:]((uint64_t)RBSProcessHandle, v6);
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    v9 = +[RBSConnection sharedInstance];
    v10 = [v9 handleForKey:v6];

    uint64_t v11 = rbs_process_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      unint64_t v14 = a3;
      __int16 v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_191FE8000, v11, OS_LOG_TYPE_DEFAULT, "Hit the server for a process handle %llx that resolved to: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    if (v10)
    {
      uint64_t v7 = +[RBSProcessHandle _cacheHandle:]((uint64_t)RBSProcessHandle, v10);
    }
    else
    {
      v10 = rbs_process_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[RBSProcessHandle handleForKey:fetchIfNeeded:](a3, v10);
      }
      uint64_t v7 = 0;
    }
  }
  return v7;
}

+ (id)_cachedHandleForKey:(uint64_t)a1
{
  id v2 = a2;
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
  v3 = [(id)__ProcessHandles objectForKey:v2];

  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
  -[RBSProcessHandle _keepAlive](v3);
  return v3;
}

- (void)_keepAlive
{
  if (a1)
  {
    id v1 = a1;
    dispatch_time_t v2 = dispatch_time(0, 1000000000);
    v3 = +[RBSWorkloop sharedBackgroundWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__RBSProcessHandle__keepAlive__block_invoke;
    block[3] = &unk_1E57413F8;
    id v6 = v1;
    id v4 = v1;
    dispatch_after(v2, v3, block);
  }
}

- (void)dealloc
{
  unint64_t v3 = self->_data & 0x1FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    uint64_t v4 = [NSNumber numberWithUnsignedLongLong:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (self->_pid < 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:");
  }
  if (v4 | v5)
  {
    id v6 = +[RBSWorkloop sharedBackgroundWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__RBSProcessHandle_dealloc__block_invoke;
    block[3] = &unk_1E57413D0;
    id v9 = (id)v4;
    id v10 = (id)v5;
    dispatch_async(v6, block);
  }
  v7.receiver = self;
  v7.super_class = (Class)RBSProcessHandle;
  [(RBSProcessHandle *)&v7 dealloc];
}

- (BOOL)isLifecycleManaged
{
  return (HIBYTE(self->_data) >> 5) & 1;
}

- (void)fullEncode:(id)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F29060];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 currentThread];
  id v10 = [v9 threadDictionary];

  [v10 setObject:MEMORY[0x1E4F1CC38] forKey:@"RBSProcessHandleFullEncode"];
  [v8 encodeObject:self forKey:v7];

  [v10 removeObjectForKey:@"RBSProcessHandleFullEncode"];
}

- (NSString)description
{
  unint64_t v3 = NSString;
  if ((self->_data & 0x4000000000000000) != 0)
  {
    uint64_t v5 = [(RBSProcessIdentity *)self->_identity shortDescription];
    uint64_t v6 = [v3 stringWithFormat:@"[%@:%d]", v5, self->_pid];
  }
  else
  {
    id v4 = [NSString alloc];
    uint64_t v5 = [(RBSProcessIdentity *)self->_identity shortDescription];
    uint64_t v6 = [v4 initWithFormat:@"<inert:[%@:%d]*>", v5, 0xFFFFFFFFLL];
  }
  id v7 = (void *)v6;

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_cachedName, 0);
  objc_storeStrong((id *)&self->_bsAuditToken, 0);
  objc_storeStrong((id *)&self->_codedHandle, 0);
  objc_storeStrong((id *)&self->_legacyHandle, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_taskPort, 0);
}

- (RBSProcessState)currentState
{
  if ((self->_data & 0x4000000000000000) != 0)
  {
    id v4 = +[RBSProcessStateDescriptor descriptor];
    [v4 setValues:-1];
    dispatch_time_t v2 = [(RBSProcessHandle *)self currentStateMatchingDescriptor:v4];
  }
  else
  {
    dispatch_time_t v2 = 0;
  }
  return (RBSProcessState *)v2;
}

- (id)currentStateMatchingDescriptor:(id)a3
{
  if ((self->_data & 0x4000000000000000) != 0)
  {
    id v5 = a3;
    uint64_t v6 = +[RBSConnection sharedInstance];
    id v7 = [(RBSProcessHandle *)self processPredicate];
    id v8 = [v6 statesForPredicate:v7 withDescriptor:v5 error:0];

    unint64_t v3 = [v8 firstObject];
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

+ (id)currentProcess
{
  dispatch_time_t v2 = +[RBSConnection sharedInstance];
  unint64_t v3 = -[RBSConnection handle]((uint64_t)v2);

  return v3;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingHandle:self];
}

- (RBSProcessInstance)instance
{
  if ((self->_data & 0x4000000000000000) != 0)
  {
    id v4 = +[RBSProcessIdentifier identifierWithPid:self->_pid];
    dispatch_time_t v2 = +[RBSProcessInstance instanceWithIdentifier:v4 identity:self->_identity];
  }
  else
  {
    dispatch_time_t v2 = 0;
  }
  return (RBSProcessInstance *)v2;
}

+ (id)handleForIdentifier:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "rbs_pid");
  if ((int)v7 <= 0)
  {
    if (a4)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28588];
      v17[0] = @"Invalid process identifier";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a4 = [v10 errorWithDomain:@"RBSRequestErrorDomain" code:1 userInfo:v11];
    }
    v12 = 0;
  }
  else
  {
    uint64_t v8 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v6;
LABEL_9:
      v12 = v9;
      goto LABEL_10;
    }
    if (v8 == getpid())
    {
      id v9 = [a1 currentProcess];
      goto LABEL_9;
    }
    unint64_t v14 = [NSNumber numberWithInt:v8];
    v12 = +[RBSProcessHandle _cachedHandleForKey:]((uint64_t)RBSProcessHandle, v14);

    if (!v12)
    {
      __int16 v15 = +[RBSProcessPredicate predicateMatchingIdentifier:v6];
      v12 = [a1 handleForPredicate:v15 error:a4];
    }
  }
LABEL_10:

  return v12;
}

+ (id)handleForPredicate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[RBSConnection sharedInstance];
  uint64_t v7 = [v6 handleForPredicate:v5 error:a4];

  if (v7)
  {
    uint64_t v8 = +[RBSProcessHandle _cacheHandle:]((uint64_t)RBSProcessHandle, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

+ (void)_cacheHandle:(uint64_t)a1
{
  dispatch_time_t v2 = a2;
  self;
  uint64_t v3 = v2[6] & 0x1FFFFFFFFFFFFFFFLL;
  uint64_t v4 = [v2 pid];
  if (v3) {
    BOOL v5 = (int)v4 <= 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v6 = rbs_process_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[RBSProcessHandle _cacheHandle:]((uint64_t)v2, v6);
    }

    uint64_t v7 = v2;
  }
  else
  {
    uint64_t v8 = v4;
    os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
    if (!__ProcessHandles)
    {
      uint64_t v9 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      id v10 = (void *)__ProcessHandles;
      __ProcessHandles = v9;
    }
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:v3];
    v12 = [(id)__ProcessHandles objectForKey:v11];

    if (v12)
    {
      [(id)__ProcessHandles objectForKey:v11];
      v2 = int v13 = v2;
    }
    else
    {
      [(id)__ProcessHandles setObject:v2 forKey:v11];
      unint64_t v14 = (void *)__ProcessHandles;
      int v13 = [NSNumber numberWithInt:v8];
      [v14 setObject:v2 forKey:v13];
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
    -[RBSProcessHandle _keepAlive](v2);
    uint64_t v7 = v2;
  }
  return v7;
}

- (NSString)daemonJobLabel
{
  if ([(RBSProcessHandle *)self isDaemon])
  {
    uint64_t v3 = [(RBSProcessIdentity *)self->_identity consistentLaunchdJobLabel];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)isDaemon
{
  return [(RBSProcessIdentity *)self->_identity osServiceType] == 2;
}

- (BOOL)isApplication
{
  return [(RBSProcessIdentity *)self->_identity isApplication];
}

- (RBSProcessHandle)initWithIdentity:(id)a3
{
  return (RBSProcessHandle *)-[RBSProcessHandle _initWithIdentity:beforeTranslocationBundlePath:executablePath:](self, a3, 0, 0);
}

- (RBSProcessHandle)initWithInstance:(id)a3 auditToken:(id)a4 bundleData:(id)a5 manageFlags:(unsigned __int8)a6 beforeTranslocationBundlePath:(id)a7 executablePath:(id)a8 cache:(BOOL)a9
{
  int v11 = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"RBSProcessHandle.m", 281, @"Invalid parameter not satisfying: %@", @"instance" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  v38 = [MEMORY[0x1E4F28B00] currentHandler];
  [v38 handleFailureInMethod:a2, self, @"RBSProcessHandle.m", 282, @"Invalid parameter not satisfying: %@", @"auditToken" object file lineNumber description];

LABEL_3:
  v41.receiver = self;
  v41.super_class = (Class)RBSProcessHandle;
  v21 = [(RBSProcessHandle *)&v41 init];
  if (v21)
  {
    uint32_t v22 = objc_msgSend(v16, "rbs_pid");
    uint32_t v23 = arc4random();
    if (v23 <= v22) {
      uint64_t v24 = v22;
    }
    else {
      uint64_t v24 = v23;
    }
    v21->_data = ((unint64_t)(v11 != 0) << 63) | ((unint64_t)(v11 & 1) << 61) | ((int)v22 | (unint64_t)(v24 << 32)) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
    uint64_t v25 = [v16 identity];
    identity = v21->_identity;
    v21->_identity = (RBSProcessIdentity *)v25;

    v21->_int pid = objc_msgSend(v16, "rbs_pid");
    if (v17) {
      [v17 realToken];
    }
    else {
      memset(&atoken, 0, sizeof(atoken));
    }
    v21->_euid = audit_token_to_euid(&atoken);
    if (objc_opt_class())
    {
      v27 = (void *)MEMORY[0x1E4F4F6B0];
      if (v17) {
        [v17 realToken];
      }
      else {
        memset(v39, 0, sizeof(v39));
      }
      uint64_t v28 = [v27 tokenFromAuditToken:v39];
      bsAuditToken = v21->_bsAuditToken;
      v21->_bsAuditToken = (BSAuditToken *)v28;
    }
    uint64_t v30 = +[RBSProcessBundle bundleWithDataSource:v18];
    bundle = v21->_bundle;
    v21->_bundle = (RBSProcessBundle *)v30;

    if (a9) {
      id v32 = +[RBSProcessHandle _cacheHandle:]((uint64_t)RBSProcessHandle, v21);
    }
    v33 = objc_alloc_init(RBSXPCCoder);
    -[RBSProcessHandle _fullEncode:]((uint64_t)v21, v33);
    uint64_t v34 = [(RBSXPCCoder *)v33 createMessage];
    codedHandle = v21->_codedHandle;
    v21->_codedHandle = (OS_xpc_object *)v34;
  }
  return v21;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F29060] currentThread];
  id v6 = [v5 threadDictionary];
  uint64_t v7 = [v6 objectForKey:@"RBSProcessHandleFullEncode"];

  if (!v7 && (self->_data & 0x4000000000000000) != 0)
  {
    p_data = &self->_data;
    uint64_t v9 = rbs_process_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[RBSProcessHandle encodeWithRBSXPCCoder:](p_data, v9);
    }

    [v4 encodeUInt64:*p_data & 0x1FFFFFFFFFFFFFFFLL forKey:@"&"];
  }
  else
  {
    -[RBSProcessHandle _fullEncode:]((uint64_t)self, v4);
  }
}

- (void)_fullEncode:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      [v3 encodeObject:v5 forKey:@"_codedHandle"];
    }
    else
    {
      id v6 = rbs_general_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        int v8 = *(_DWORD *)(a1 + 64);
        int v10 = 138412802;
        uint64_t v11 = a1;
        __int16 v12 = 2048;
        uint64_t v13 = v7;
        __int16 v14 = 1024;
        int v15 = v8;
        _os_log_impl(&dword_191FE8000, v6, OS_LOG_TYPE_DEFAULT, "Full encoding handle %@, with data %llx, and pid %d", (uint8_t *)&v10, 0x1Cu);
      }

      [v4 encodeObject:*(void *)(a1 + 72) forKey:@"_identity"];
      [v4 encodeUInt64:*(int *)(a1 + 64) forKey:@"_pid"];
      if (objc_opt_class()) {
        [v4 encodeObject:*(void *)(a1 + 40) forKey:@"_bsAuditToken"];
      }
      [v4 encodeObject:*(void *)(a1 + 80) forKey:@"_bundle"];
      uint64_t v9 = *(void *)(a1 + 48);
      if (v9) {
        [v4 encodeUInt64:v9 forKey:@"_data"];
      }
    }
  }
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_bsAuditToken;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result realToken];
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (NSString)consistentJobLabel
{
  return [(RBSProcessIdentity *)self->_identity consistentLaunchdJobLabel];
}

void __27__RBSProcessHandle_dealloc__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
  if (*(void *)(a1 + 32)) {
    id v2 = (id)objc_msgSend((id)__ProcessHandles, "objectForKey:");
  }
  if (*(void *)(a1 + 40)) {
    id v3 = (id)objc_msgSend((id)__ProcessHandles, "objectForKey:");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
}

- (NSString)executablePath
{
  return 0;
}

- (BOOL)isXPCService
{
  return [(RBSProcessIdentity *)self->_identity isXPCService];
}

- (double)elapsedCPUTimeForFrontBoard
{
  kern_return_t v20;
  int v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  kern_return_t v32;
  int v33;
  NSObject *v34;
  mach_msg_type_number_t v35;
  integer_t v36[2];
  uint64_t v37;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  long long v40;
  uint64_t v41;

  if ((self->_data & 0x4000000000000000) == 0)
  {
    id v2 = rbs_process_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      [(RBSProcessHandle *)v2 elapsedCPUTimeForFrontBoard];
    }
LABEL_15:

    return 0.0;
  }
  taskPort = self->_taskPort;
  if (!taskPort)
  {
    __int16 v12 = +[RBSMachPortTaskNameRight taskNameForPID:self->_pid];
    uint64_t v13 = self->_taskPort;
    self->_taskPort = v12;

    taskPort = self->_taskPort;
    if (!taskPort)
    {
      __int16 v14 = +[RBSConnection sharedInstance];
      int v15 = +[RBSProcessIdentifier identifierWithPid:self->_pid];
      uint64_t v16 = [v14 portForIdentifier:v15];
      id v17 = self->_taskPort;
      self->_taskPort = v16;

      taskPort = self->_taskPort;
    }
  }
  task_name_t v18 = [(RBSMachPortTaskNameRight *)taskPort port];
  if (v18 - 1 > 0xFFFFFFFD)
  {
    id v2 = rbs_process_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      [(RBSProcessHandle *)v2 elapsedCPUTimeForFrontBoard];
    }
    goto LABEL_15;
  }
  task_name_t v19 = v18;
  objc_super v41 = 0;
  *(_OWORD *)task_info_out = 0u;
  v40 = 0u;
  task_info_outCnt = 10;
  id v20 = task_info(v18, 0x12u, task_info_out, &task_info_outCnt);
  if (v20)
  {
    v21 = v20;
    uint32_t v22 = 0.0;
    if (RBSPIDExists(self->_pid))
    {
      uint32_t v23 = rbs_process_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        [(RBSProcessHandle *)v21 elapsedCPUTimeForFrontBoard];
      }
    }
  }
  else
  {
    uint32_t v22 = (double)SDWORD2(v40) / 1000000.0 + (double)SDWORD1(v40) + (double)(int)v41 / 1000000.0 + (double)SHIDWORD(v40);
  }
  *(void *)v36 = 0;
  v37 = 0;
  v35 = 4;
  id v32 = task_info(v19, 3u, v36, &v35);
  if (!v32) {
    return v22 + (double)v36[1] / 1000000.0 + (double)v36[0] + (double)SHIDWORD(v37) / 1000000.0 + (double)(int)v37;
  }
  v33 = v32;
  if (RBSPIDExists(self->_pid))
  {
    uint64_t v34 = rbs_process_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      [(RBSProcessHandle *)v33 elapsedCPUTimeForFrontBoard];
    }
  }
  return v22;
}

- (RBSProcessHandle)initWithLaunchContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identity];
  uint64_t v6 = [v4 beforeTranslocationBundlePath];
  uint64_t v7 = [v4 _overrideExecutablePath];

  uint64_t v8 = (RBSProcessHandle *)-[RBSProcessHandle _initWithIdentity:beforeTranslocationBundlePath:executablePath:](self, v5, v6, v7);
  return v8;
}

- _initWithIdentity:(void *)a3 beforeTranslocationBundlePath:(void *)a4 executablePath:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    if (!v8)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel__initWithIdentity_beforeTranslocationBundlePath_executablePath_, a1, @"RBSProcessHandle.m", 328, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
    }
    v14.receiver = a1;
    v14.super_class = (Class)RBSProcessHandle;
    id v11 = objc_msgSendSuper2(&v14, sel_init);
    a1 = v11;
    if (v11)
    {
      *((void *)v11 + 6) = 0;
      objc_storeStrong((id *)v11 + 9, a2);
      a1[16] = -1;
    }
  }

  return a1;
}

- (NSString)name
{
  os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
  p_cachedName = &self->_cachedName;
  cachedName = self->_cachedName;
  if (cachedName)
  {
    uint64_t v5 = cachedName;
    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
    uint64_t v6 = [NSNumber numberWithInt:self->_pid];
    uint64_t v7 = +[RBSConnection sharedInstance];
    uint64_t v5 = [v7 processName:v6];

    if (!v5) {
      goto LABEL_5;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
  objc_storeStrong((id *)p_cachedName, v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
LABEL_5:
  return v5;
}

+ (void)clearAllHandles
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
  v0 = rbs_process_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_191FE8000, v0, OS_LOG_TYPE_DEFAULT, "Removing all cached process handles", v1, 2u);
  }

  [(id)__ProcessHandles removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
}

- (void)monitorForDeath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((self->_data & 0x4000000000000000) != 0)
  {
    uint64_t v5 = rbs_process_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = self;
      _os_log_impl(&dword_191FE8000, v5, OS_LOG_TYPE_DEFAULT, "Starting death monitoring for handle %@", buf, 0xCu);
    }

    uint64_t v6 = +[RBSConnection sharedInstance];
    uint64_t v7 = +[RBSProcessIdentifier identifierWithPid:self->_pid];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36__RBSProcessHandle_monitorForDeath___block_invoke;
    v8[3] = &unk_1E57418B0;
    v8[4] = self;
    id v9 = v4;
    [v6 subscribeToProcessDeath:v7 handler:v8];
  }
}

- (RBSProcessLimitations)activeLimitations
{
  if ((self->_data & 0x4000000000000000) != 0)
  {
    id v4 = +[RBSConnection sharedInstance];
    uint64_t v5 = [(RBSProcessHandle *)self instance];
    id v2 = [v4 limitationsForInstance:v5 error:0];
  }
  else
  {
    id v2 = 0;
  }
  return (RBSProcessLimitations *)v2;
}

- (RBSProcessHandle)hostProcess
{
  if ((self->_data & 0x4000000000000000) != 0)
  {
    id v4 = +[RBSConnection sharedInstance];
    uint64_t v5 = [(RBSProcessHandle *)self instance];
    id v2 = [v4 hostProcessForInstance:v5 error:0];
  }
  else
  {
    id v2 = 0;
  }
  return (RBSProcessHandle *)v2;
}

- (BOOL)hasConsistentLaunchdJob
{
  return [(RBSProcessIdentity *)self->_identity hasConsistentLaunchdJob];
}

+ (id)observeForImminentAssertionsExpiration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"RBSProcessHandle.m", 558, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v6 = +[RBSConnection sharedInstance];
  uint64_t v7 = -[RBSConnection observeProcessAssertionsExpirationWarningWithBlock:]((uint64_t)v6, v5);

  return v7;
}

- (NSString)beforeTranslocationBundlePath
{
  return 0;
}

- (RBSProcessHandle)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSProcessHandle.m" lineNumber:148 description:@"-init is not allowed on RBSProcessHandle"];

  return 0;
}

- (RBSProcessExitContext)lastExitContext
{
  if ((self->_data & 0x4000000000000000) != 0)
  {
    id v4 = +[RBSConnection sharedInstance];
    id v5 = [(RBSProcessHandle *)self instance];
    id v2 = [v4 lastExitContextForInstance:v5 error:0];
  }
  else
  {
    id v2 = 0;
  }
  return (RBSProcessExitContext *)v2;
}

void __36__RBSProcessHandle_monitorForDeath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = rbs_process_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v5;
    _os_log_impl(&dword_191FE8000, v4, OS_LOG_TYPE_DEFAULT, "Calling process death completion block for handle %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = a1 + 32;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v8 + 8);
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v6, v3);
  }
  else
  {
    id v9 = objc_alloc_init(RBSProcessExitContext);
    (*(void (**)(uint64_t, uint64_t, RBSProcessExitContext *))(v7 + 16))(v7, v6, v9);
  }
}

- (void)intendToExitWith:(id)a3
{
  id v4 = a3;
  if ((self->_data & 0x4000000000000000) != 0)
  {
    uint64_t v13 = +[RBSConnection sharedInstance];
    objc_super v14 = [(RBSProcessHandle *)self instance];
    [v13 intendToExit:v14 withStatus:v4];
  }
  else
  {
    uint64_t v5 = rbs_general_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessHandle intendToExitWith:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (BOOL)isValid
{
  id v2 = [(RBSProcessHandle *)self currentState];
  char v3 = [v2 isRunning];

  return v3;
}

- (id)endowmentInfoForHandle
{
  char v3 = +[RBSProcessStateDescriptor descriptor];
  [v3 setValues:32];
  id v4 = +[RBSProcessPredicate predicateMatchingHandle:self];
  uint64_t v5 = +[RBSProcessHandle handleForPredicate:v4 error:0];
  uint64_t v6 = [v5 currentStateMatchingDescriptor:v3];

  uint64_t v7 = [v6 endowmentInfos];

  return v7;
}

- (int)platform
{
  return [(RBSProcessIdentity *)self->_identity platform];
}

+ (id)handleForLegacyHandle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_opt_class())
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "pid"));
    uint64_t v8 = +[RBSProcessHandle handleForIdentifier:v7 error:a4];

    if (v8) {
      objc_storeStrong(v8 + 3, a3);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)legacyHandle
{
  if (objc_opt_class())
  {
    char v3 = self;
    objc_sync_enter(v3);
    legacyHandle = v3->_legacyHandle;
    if (!legacyHandle)
    {
      uint64_t v5 = [MEMORY[0x1E4F4F800] processHandleForAuditToken:v3->_bsAuditToken];
      id v6 = v3->_legacyHandle;
      v3->_legacyHandle = (BSProcessHandle *)v5;

      legacyHandle = v3->_legacyHandle;
    }
    uint64_t v7 = legacyHandle;
    objc_sync_exit(v3);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (NSString)xpcServiceIdentifier
{
  return [(RBSProcessIdentity *)self->_identity xpcServiceIdentifier];
}

- (NSUUID)uuid
{
  return [(RBSProcessIdentity *)self->_identity uuid];
}

- (unint64_t)hash
{
  return [(RBSProcessIdentity *)self->_identity hash] ^ self->_pid;
}

- (NSString)debugDescription
{
  if ((self->_data & 0x4000000000000000) != 0)
  {
    uint64_t v7 = [(RBSProcessHandle *)self identity];
    uint64_t v8 = [v7 auid];

    id v9 = [NSString alloc];
    id v4 = [(id)objc_opt_class() description];
    uint64_t v10 = [(RBSProcessIdentity *)self->_identity shortDescription];
    uint64_t v5 = (void *)v10;
    uint64_t pid = self->_pid;
    if (v8)
    {
      uint64_t v12 = [NSNumber numberWithUnsignedInt:v8];
      uint64_t v13 = (void *)[v9 initWithFormat:@"<%@| %@:%d%@%@%@>", v4, v5, pid, @"(", v12, @")"];

      goto LABEL_7;
    }
    uint64_t v6 = [v9 initWithFormat:@"<%@| %@:%d%@%@%@>", v4, v10, pid, &stru_1EE2E2768, &stru_1EE2E2768, &stru_1EE2E2768];
  }
  else
  {
    id v3 = [NSString alloc];
    id v4 = [(id)objc_opt_class() description];
    uint64_t v5 = [(RBSProcessIdentity *)self->_identity shortDescription];
    uint64_t v6 = [v3 initWithFormat:@"<%@| inert %@>", v4, v5, v15, v16, v17, v18];
  }
  uint64_t v13 = (void *)v6;
LABEL_7:

  return (NSString *)v13;
}

- (unsigned)euid
{
  return self->_euid;
}

+ (void)_cacheHandle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191FE8000, a2, OS_LOG_TYPE_ERROR, "Unable to cache process handle without XID or PID: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)intendToExitWith:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)handleForKey:(uint64_t)a1 fetchIfNeeded:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191FE8000, a2, OS_LOG_TYPE_ERROR, "No process found for %llx", (uint8_t *)&v2, 0xCu);
}

- (void)elapsedCPUTimeForFrontBoard
{
}

- (void)encodeWithRBSXPCCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1 & 0x1FFFFFFFFFFFFFFFLL;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_191FE8000, a2, OS_LOG_TYPE_DEBUG, "Encoding RBSProcessHandle with IPC ID %llx", (uint8_t *)&v3, 0xCu);
}

- (void)initWithRBSXPCCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_191FE8000, a2, OS_LOG_TYPE_DEBUG, "Decoded RBSProcessHandle with IPC ID %llx", (uint8_t *)&v2, 0xCu);
}

@end
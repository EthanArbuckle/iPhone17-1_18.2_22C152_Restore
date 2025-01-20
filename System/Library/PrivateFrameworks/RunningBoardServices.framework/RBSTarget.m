@interface RBSTarget
+ (BOOL)supportsRBSXPCSecureCoding;
+ (RBSTarget)targetWithEndpoint:(id)a3;
+ (RBSTarget)targetWithPid:(int)a3;
+ (RBSTarget)targetWithPid:(int)a3 environmentIdentifier:(id)a4;
+ (RBSTarget)targetWithProcessIdentifier:(id)a3;
+ (RBSTarget)targetWithProcessIdentifier:(id)a3 environmentIdentifier:(id)a4;
+ (RBSTarget)targetWithProcessIdentity:(id)a3;
+ (RBSTarget)targetWithProcessIdentity:(id)a3 environmentIdentifier:(id)a4;
+ (id)currentProcess;
+ (id)systemTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystem;
- (BOOL)matchesProcess:(id)a3;
- (NSString)debugDescription;
- (NSString)environment;
- (NSString)shortDescription;
- (OS_xpc_object)endpoint;
- (RBSProcessIdentifier)processIdentifier;
- (RBSProcessIdentity)processIdentity;
- (RBSTarget)init;
- (RBSTarget)initWithRBSXPCCoder:(id)a3;
- (id)copyWithPersonaString:(id)a3;
- (id)processPredicate;
- (unint64_t)hash;
- (void)_initWithProcessIdentifier:(void *)a3 processIdentity:(void *)a4 environmentIdentifier:(uint64_t)a5 euid:;
- (void)_initWithProcessIdentifier:(void *)a3 processIdentity:(void *)a4 environmentIdentifier:(void *)a5 endpoint:(uint64_t)a6 euid:;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSTarget

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSTarget)initWithRBSXPCCoder:(id)a3
{
  id v5 = a3;
  v6 = [v5 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:@"endpoint"];
  if (!v6)
  {
    v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"processIdentity"];
LABEL_9:
    v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"processIdentifier"];
    v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
    self = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:](self, v10, v8, v11, 0, 0);

    v9 = self;
    goto LABEL_10;
  }
  Class v7 = NSClassFromString(&cfstr_Rblaunchdprope.isa);
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"RBSTarget.m" lineNumber:138 description:@"attempt to decode endpoint-based target outside the daemon"];
  }
  v8 = [(objc_class *)v7 processIdentityForEndpoint:v6];
  if (v8) {
    goto LABEL_9;
  }
  v8 = rbs_coder_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[RBSTarget initWithRBSXPCCoder:]((uint64_t)v6, v8);
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (RBSProcessIdentifier)processIdentifier
{
  return self->_processIdentifier;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  processIdentifier = self->_processIdentifier;
  id v5 = a3;
  [v5 encodeObject:processIdentifier forKey:@"processIdentifier"];
  [v5 encodeObject:self->_processIdentity forKey:@"processIdentity"];
  [v5 encodeObject:self->_environment forKey:@"environment"];
  [v5 encodeXPCObject:self->_endpoint forKey:@"endpoint"];
}

- (NSString)environment
{
  return self->_environment;
}

- (NSString)shortDescription
{
  v2 = self;
  objc_sync_enter(v2);
  shortDescription = v2->_shortDescription;
  if (!shortDescription)
  {
    if (v2->_processIdentifier)
    {
      p_environment = &v2->_environment;
      id v5 = NSString;
      if (v2->_environment)
      {
        uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", -[RBSProcessIdentifier pid](v2->_processIdentifier, "pid"));
LABEL_8:
        v8 = (NSString *)v6;
        uint64_t v9 = [v5 stringWithFormat:@"%@<%@>", v6, *p_environment];
LABEL_14:
        v12 = v2->_shortDescription;
        v2->_shortDescription = (NSString *)v9;

        shortDescription = v8;
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", -[RBSProcessIdentifier pid](v2->_processIdentifier, "pid"));
    }
    else
    {
      processIdentity = v2->_processIdentity;
      if (!processIdentity)
      {
        if (v2->_endpoint)
        {
          uint64_t v11 = [NSString stringWithFormat:@"<%@>", v2->_endpoint];
          shortDescription = v2->_shortDescription;
          v2->_shortDescription = (NSString *)v11;
        }
        else
        {
          v2->_shortDescription = (NSString *)@"system";
        }
        goto LABEL_15;
      }
      p_environment = &v2->_environment;
      id v5 = NSString;
      if (v2->_environment)
      {
        uint64_t v6 = [(RBSProcessIdentity *)processIdentity shortDescription];
        goto LABEL_8;
      }
      uint64_t v10 = [(RBSProcessIdentity *)processIdentity shortDescription];
    }
    v8 = (NSString *)v10;
    uint64_t v9 = [v5 stringWithFormat:@"%@", v10];
    goto LABEL_14;
  }
LABEL_16:
  objc_sync_exit(v2);

  v13 = v2->_shortDescription;
  return v13;
}

- (void)_initWithProcessIdentifier:(void *)a3 processIdentity:(void *)a4 environmentIdentifier:(void *)a5 endpoint:(uint64_t)a6 euid:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)RBSTarget;
    v15 = objc_msgSendSuper2(&v25, sel_init);
    a1 = v15;
    if (v15)
    {
      if (v11)
      {
        uint64_t v16 = +[RBSProcessIdentifier identifierForIdentifier:v11];
        v17 = (void *)a1[1];
        a1[1] = v16;
      }
      else
      {
        v17 = (void *)v15[1];
        v15[1] = 0;
      }

      if (a6) {
        uint64_t v18 = [v12 copyWithAuid:a6];
      }
      else {
        uint64_t v18 = [v12 copy];
      }
      v19 = (void *)a1[2];
      a1[2] = v18;

      uint64_t v20 = [v13 copy];
      v21 = (void *)a1[3];
      a1[3] = v20;

      if (v14)
      {
        xpc_object_t v22 = xpc_copy(v14);
        v23 = (void *)a1[4];
        a1[4] = v22;
      }
    }
  }

  return a1;
}

- (id)processPredicate
{
  if (self->_endpoint)
  {
    v2 = objc_opt_new();
  }
  else
  {
    if (self->_processIdentity) {
      +[RBSProcessPredicate predicateMatchingIdentity:](RBSProcessPredicate, "predicateMatchingIdentity:");
    }
    else {
    v2 = +[RBSProcessPredicate predicateMatchingIdentifier:self->_processIdentifier];
    }
  }
  return v2;
}

- (BOOL)isSystem
{
  return !self->_processIdentifier && !self->_processIdentity && !self->_environment && self->_endpoint == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_processIdentifier, 0);
}

+ (id)currentProcess
{
  if (currentProcess_onceToken != -1) {
    dispatch_once(&currentProcess_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)currentProcess_currentProcess;
  return v2;
}

void __27__RBSTarget_currentProcess__block_invoke()
{
  v0 = [RBSTarget alloc];
  id v3 = +[RBSProcessIdentifier identifierForCurrentProcess];
  v1 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:](v0, v3, 0, 0, 0);
  v2 = (void *)currentProcess_currentProcess;
  currentProcess_currentProcess = (uint64_t)v1;
}

+ (RBSTarget)targetWithPid:(int)a3 environmentIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if ((int)v4 <= 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"RBSTarget.m" lineNumber:78 description:@"must specify a valid pid"];
  }
  v8 = [NSNumber numberWithInt:v4];
  uint64_t v9 = +[RBSTarget targetWithProcessIdentifier:v8 environmentIdentifier:v7];

  return (RBSTarget *)v9;
}

+ (RBSTarget)targetWithProcessIdentifier:(id)a3 environmentIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]([RBSTarget alloc], v6, 0, v5, 0);

  return (RBSTarget *)v7;
}

+ (RBSTarget)targetWithProcessIdentity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]([RBSTarget alloc], 0, v3, 0, 0);

  return (RBSTarget *)v4;
}

+ (RBSTarget)targetWithPid:(int)a3
{
  id v3 = [NSNumber numberWithInt:*(void *)&a3];
  uint64_t v4 = +[RBSTarget targetWithProcessIdentifier:v3];

  return (RBSTarget *)v4;
}

+ (RBSTarget)targetWithProcessIdentifier:(id)a3
{
  id v5 = a3;
  if ((int)objc_msgSend(v5, "rbs_pid") <= 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"RBSTarget.m" lineNumber:73 description:@"must specify a valid pid"];
  }
  id v6 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]([RBSTarget alloc], v5, 0, 0, 0);

  return (RBSTarget *)v6;
}

- (void)_initWithProcessIdentifier:(void *)a3 processIdentity:(void *)a4 environmentIdentifier:(uint64_t)a5 euid:
{
  if (a1)
  {
    id v9 = a4;
    id v10 = a3;
    id v11 = a2;
    id v12 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:]([RBSTarget alloc], v11, v10, v9, 0, a5);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (RBSTarget)targetWithEndpoint:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"RBSTarget.m" lineNumber:87 description:@"must specify an endpoint"];
  }
  if (MEMORY[0x192FECA30](v5) != MEMORY[0x1E4F145A0])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"RBSTarget.m" lineNumber:88 description:@"must specify a valid endpoint"];
  }
  id v6 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:]([RBSTarget alloc], 0, 0, 0, v5, 0);

  return (RBSTarget *)v6;
}

+ (id)systemTarget
{
  if (systemTarget_onceToken != -1) {
    dispatch_once(&systemTarget_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)systemTarget_systemTarget;
  return v2;
}

uint64_t __25__RBSTarget_systemTarget__block_invoke()
{
  systemTarget_systemTarget = (uint64_t)-[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]([RBSTarget alloc], 0, 0, 0, 0);
  return MEMORY[0x1F41817F8]();
}

+ (RBSTarget)targetWithProcessIdentity:(id)a3 environmentIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]([RBSTarget alloc], 0, v6, v5, 0);

  return (RBSTarget *)v7;
}

- (RBSTarget)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSTarget.m" lineNumber:93 description:@"-init is not allowed on RBSTarget"];

  return 0;
}

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  if (self->_endpoint)
  {
    char v5 = 0;
  }
  else
  {
    processIdentity = self->_processIdentity;
    if (!processIdentity) {
      processIdentity = self->_processIdentifier;
    }
    char v5 = [processIdentity matchesProcess:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  endpoint = self->_endpoint;
  if (endpoint)
  {
    return xpc_hash(endpoint);
  }
  else
  {
    unint64_t v5 = [(RBSProcessIdentifier *)self->_processIdentifier hash];
    unint64_t v6 = [(RBSProcessIdentity *)self->_processIdentity hash] ^ v5;
    return v6 ^ [(NSString *)self->_environment hash];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSTarget *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && ((processIdentifier = self->_processIdentifier, processIdentifier == v4->_processIdentifier)
       || -[RBSProcessIdentifier isEqual:](processIdentifier, "isEqual:"))
      && ((processIdentity = self->_processIdentity, processIdentity == v4->_processIdentity)
       || -[RBSProcessIdentity isEqual:](processIdentity, "isEqual:"))
      && ((environment = self->_environment, environment == v4->_environment)
       || -[NSString isEqualToString:](environment, "isEqualToString:")))
    {
      endpoint = self->_endpoint;
      id v12 = v4->_endpoint;
      if (endpoint && v12) {
        BOOL v6 = xpc_equal(endpoint, v12);
      }
      else {
        BOOL v6 = endpoint == v12;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)debugDescription
{
  endpoint = self->_endpoint;
  id v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  id v7 = (void *)v6;
  if (endpoint)
  {
    v8 = [v4 stringWithFormat:@"<%@: %p; endpoint: %@>", v6, self, self->_endpoint];
  }
  else
  {
    processIdentifier = self->_processIdentifier;
    if (processIdentifier)
    {
      objc_msgSend(NSNumber, "numberWithInt:", -[RBSProcessIdentifier pid](self->_processIdentifier, "pid"));
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = @"(n/a)";
    }
    id v11 = [(RBSProcessIdentity *)self->_processIdentity shortDescription];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; pid: %@; identity: %@; environment: %@>",
      v7,
      self,
      v10,
      v11,
    v8 = self->_environment);

    if (processIdentifier) {
  }
    }

  return (NSString *)v8;
}

- (id)copyWithPersonaString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [RBSTarget alloc];
  processIdentifier = self->_processIdentifier;
  id v7 = [(RBSProcessIdentity *)self->_processIdentity copyWithPersonaString:v4];

  v8 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:](v5, processIdentifier, v7, self->_environment, self->_endpoint, 0);
  return v8;
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (void)initWithRBSXPCCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191FE8000, a2, OS_LOG_TYPE_ERROR, "no identity found for endpoint %@", (uint8_t *)&v2, 0xCu);
}

@end
@interface RBSTerminateRequest
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)execute:(id *)a3;
- (BOOL)execute:(id *)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)targetsAllManagedProcesses;
- (NSString)description;
- (RBSProcessPredicate)allow;
- (RBSProcessPredicate)predicate;
- (RBSTerminateContext)context;
- (RBSTerminateRequest)initWithPredicate:(id)a3 context:(id)a4;
- (RBSTerminateRequest)initWithProcessIdentifier:(id)a3 context:(id)a4;
- (RBSTerminateRequest)initWithProcessIdentity:(id)a3 context:(id)a4;
- (RBSTerminateRequest)initWithRBSXPCCoder:(id)a3;
- (id)initForAllManagedWithReason:(id)a3;
- (id)initForAllManagedWithReason:(id)a3 service:(id)a4;
- (id)initWithPredicate:(void *)a3 context:(void *)a4 allowLaunch:(void *)a5 service:;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setAllow:(id)a3;
- (void)setPredicate:(id)a3;
@end

@implementation RBSTerminateRequest

- (RBSTerminateRequest)initWithPredicate:(id)a3 context:(id)a4
{
  return (RBSTerminateRequest *)-[RBSTerminateRequest initWithPredicate:context:allowLaunch:service:]((id *)&self->super.super.isa, a3, a4, 0, 0);
}

- (id)initWithPredicate:(void *)a3 context:(void *)a4 allowLaunch:(void *)a5 service:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v14 = [v11 explanation];

    if (!v14)
    {
      v15 = rbs_assertion_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[RBSTerminateRequest initWithPredicate:context:allowLaunch:service:](v15);
      }

      [v11 setExplanation:@"<no explanation given>"];
    }
    v20.receiver = a1;
    v20.super_class = (Class)RBSTerminateRequest;
    v16 = (id *)objc_msgSendSuper2(&v20, sel__init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 3, a2);
      objc_storeStrong(a1 + 4, a4);
      uint64_t v17 = [v11 copy];
      id v18 = a1[5];
      a1[5] = (id)v17;

      objc_storeStrong(a1 + 1, a5);
    }
  }

  return a1;
}

- (RBSTerminateRequest)initWithProcessIdentity:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 isEmbeddedApplication])
  {
    v8 = [v7 embeddedApplicationIdentifier];

    v9 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v8];
    id v10 = [(RBSTerminateRequest *)self initWithPredicate:v9 context:v6];

    id v11 = v10;
  }
  else
  {
    v8 = +[RBSProcessPredicate predicateMatchingIdentity:v7];

    id v12 = [(RBSTerminateRequest *)self initWithPredicate:v8 context:v6];
    id v11 = v12;
  }

  return v11;
}

- (RBSTerminateRequest)initWithProcessIdentifier:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"RBSTerminateRequest.m", 61, @"Invalid parameter not satisfying: %@", @"processIdentifier != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"RBSTerminateRequest.m", 62, @"Invalid parameter not satisfying: %@", @"context != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = +[RBSProcessPredicate predicateMatchingIdentifier:v7];
  id v11 = [(RBSTerminateRequest *)self initWithPredicate:v10 context:v9];

  return v11;
}

- (id)initForAllManagedWithReason:(id)a3 service:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"RBSTerminateRequest.m", 68, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  v9 = [[RBSTerminateContext alloc] initWithExplanation:v7];
  [(RBSTerminateContext *)v9 setReportType:0];
  [(RBSTerminateContext *)v9 setPreventIfBeingDebugged:0];
  v14.receiver = self;
  v14.super_class = (Class)RBSTerminateRequest;
  id v10 = [(RBSRequest *)&v14 _init];
  id v11 = v10;
  if (v10)
  {
    *((unsigned char *)v10 + 16) = 1;
    objc_storeStrong(v10 + 5, v9);
    objc_storeStrong(v11 + 1, a4);
  }

  return v11;
}

- (id)initForAllManagedWithReason:(id)a3
{
  id v4 = a3;
  v5 = +[RBSConnection sharedInstance];
  id v6 = [(RBSTerminateRequest *)self initForAllManagedWithReason:v4 service:v5];

  return v6;
}

- (BOOL)execute:(id *)a3
{
  return [(RBSTerminateRequest *)self execute:0 error:a3];
}

- (BOOL)execute:(id *)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    predicate = self->_predicate;
    if (predicate)
    {
      context = self->_context;
      v9 = +[RBSPreventLaunchLimitation limitationWithPredicate:predicate andException:self->_allow];
      v15[0] = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [(RBSTerminateContext *)context setAttributes:v10];
    }
  }
  service = self->_service;
  if (!service)
  {
    id v12 = +[RBSConnection sharedInstance];
    id v13 = self->_service;
    self->_service = v12;

    service = self->_service;
  }
  return [(RBSServiceLocalProtocol *)service executeTerminateRequest:self assertion:a3 error:a4];
}

- (unint64_t)hash
{
  unint64_t v3 = [(RBSProcessPredicate *)self->_predicate hash];
  return [(RBSTerminateContext *)self->_context hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSTerminateRequest *)a3;
  if (self == v4) {
    goto LABEL_23;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class() || self->_targetsAllManagedProcesses != v4->_targetsAllManagedProcesses) {
    goto LABEL_22;
  }
  context = self->_context;
  id v7 = v4->_context;
  if (context != v7)
  {
    BOOL v8 = !context || v7 == 0;
    if (v8 || !-[RBSTerminateContext isEqual:](context, "isEqual:")) {
      goto LABEL_22;
    }
  }
  predicate = self->_predicate;
  id v10 = v4->_predicate;
  if (predicate != v10)
  {
    BOOL v11 = !predicate || v10 == 0;
    if (v11 || !-[RBSProcessPredicate isEqual:](predicate, "isEqual:")) {
      goto LABEL_22;
    }
  }
  allow = self->_allow;
  id v13 = v4->_allow;
  if (allow == v13)
  {
LABEL_23:
    char v16 = 1;
    goto LABEL_24;
  }
  if (allow) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
LABEL_22:
    char v16 = 0;
    goto LABEL_24;
  }
  char v16 = -[RBSProcessPredicate isEqual:](allow, "isEqual:");
LABEL_24:

  return v16;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)v4;
  if (self->_targetsAllManagedProcesses)
  {
    allow = (RBSProcessPredicate *)@"none";
    predicate = (RBSProcessPredicate *)@"all-managed";
  }
  else
  {
    predicate = self->_predicate;
    allow = self->_allow;
  }
  BOOL v8 = (void *)[v3 initWithFormat:@"<%@| predicate:%@ allow:%@ context:%@>", v4, predicate, allow, self->_context];

  return (NSString *)v8;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_targetsAllManagedProcesses)
  {
    [v4 encodeBool:1 forKey:@"_targetsAllManagedProcesses"];
  }
  else
  {
    predicate = self->_predicate;
    if (predicate) {
      [v4 encodeObject:predicate forKey:@"_predicate"];
    }
    allow = self->_allow;
    if (allow) {
      [v7 encodeObject:allow forKey:@"_allow"];
    }
  }
  [v7 encodeObject:self->_context forKey:@"_context"];
}

- (RBSTerminateRequest)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSTerminateRequest;
  uint64_t v5 = [(RBSRequest *)&v13 _init];
  if (v5)
  {
    v5->_targetsAllManagedProcesses = [v4 decodeBoolForKey:@"_targetsAllManagedProcesses"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (RBSProcessPredicate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_allow"];
    allow = v5->_allow;
    v5->_allow = (RBSProcessPredicate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_context"];
    context = v5->_context;
    v5->_context = (RBSTerminateContext *)v10;
  }
  return v5;
}

- (BOOL)targetsAllManagedProcesses
{
  return self->_targetsAllManagedProcesses;
}

- (RBSProcessPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (RBSProcessPredicate)allow
{
  return self->_allow;
}

- (void)setAllow:(id)a3
{
}

- (RBSTerminateContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_allow, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)initWithPredicate:(os_log_t)log context:allowLaunch:service:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_191FE8000, log, OS_LOG_TYPE_FAULT, "Explanation must be set in the RBSTerminateContext before using it to initialize a RBSTerminateRequest", v1, 2u);
}

@end
@interface RBSProcessPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)predicate;
+ (id)predicateForClearTheBoard;
+ (id)predicateForMemoryMonitor;
+ (id)predicateForSymptomsd;
+ (id)predicateMatching:(id)a3;
+ (id)predicateMatchingAnyPredicate:(id)a3;
+ (id)predicateMatchingAuid:(unsigned int)a3;
+ (id)predicateMatchingBeforeTranslocationBundlePath:(id)a3;
+ (id)predicateMatchingBundleIdentifier:(id)a3;
+ (id)predicateMatchingBundleIdentifiers:(id)a3;
+ (id)predicateMatchingDextsBundledWithBundleID:(id)a3;
+ (id)predicateMatchingEuid:(unsigned int)a3;
+ (id)predicateMatchingExecPathStartsWith:(id)a3;
+ (id)predicateMatchingExtensionPoint:(id)a3;
+ (id)predicateMatchingHandle:(id)a3;
+ (id)predicateMatchingHostIdentifier:(id)a3;
+ (id)predicateMatchingIdentifier:(id)a3;
+ (id)predicateMatchingIdentifiers:(id)a3;
+ (id)predicateMatchingIdentity:(id)a3;
+ (id)predicateMatchingJobLabel:(id)a3;
+ (id)predicateMatchingLSApplicationIdentity:(id)a3;
+ (id)predicateMatchingLaunchServicesProcesses;
+ (id)predicateMatchingPlatform:(int)a3;
+ (id)predicateMatchingPredicates:(id)a3;
+ (id)predicateMatchingProcessTypeApplication;
+ (id)predicateMatchingServiceName:(id)a3;
+ (id)predicateMatchingSuspendableProcesses;
+ (id)predicateMatchingTarget:(id)a3;
+ (id)predicateNotMatchingPredicate:(id)a3;
+ (id)predicatePowerLogProcesses;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (NSString)beforeTranslocationBundlePath;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)extensionPoint;
- (NSString)jobLabel;
- (NSString)serviceName;
- (RBSProcessIdentity)processIdentity;
- (RBSProcessPredicate)initWithPredicate:(id)a3;
- (RBSProcessPredicate)initWithRBSXPCCoder:(id)a3;
- (RBSProcessPredicateImpl)predicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)processIdentifier;
- (id)processIdentifiers;
- (unint64_t)hash;
- (unsigned)auid;
- (unsigned)euid;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessPredicate

- (unint64_t)hash
{
  return [(RBSProcessPredicateImpl *)self->_predicate hash];
}

- (BOOL)matchesProcess:(id)a3
{
  return [(RBSProcessPredicateImpl *)self->_predicate matchesProcess:a3];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSProcessPredicate *)a3;
  if (self == v4) {
    goto LABEL_8;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    char v6 = 0;
    goto LABEL_9;
  }
  predicate = self->_predicate;
  v8 = v4->_predicate;
  if (predicate == v8)
  {
LABEL_8:
    char v6 = 1;
    goto LABEL_9;
  }
  char v6 = 0;
  if (predicate && v8) {
    char v6 = -[RBSProcessPredicateImpl isEqual:](predicate, "isEqual:");
  }
LABEL_9:

  return v6;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (RBSProcessPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RBSProcessPredicate *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (RBSProcessPredicateImpl *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@ %@>", v4, self->_predicate];

  return (NSString *)v5;
}

+ (id)predicateMatchingHandle:(id)a3
{
  id v3 = a3;
  id v4 = [[RBSProcessHandlePredicateImpl alloc] initWithHandle:v3];

  uint64_t v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

+ (id)predicateMatchingBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [(RBSProcessStringPredicate *)[RBSProcessBundleIdentifierPredicate alloc] initWithIdentifier:v3];

  uint64_t v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

+ (id)predicateMatchingIdentifier:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(RBSProcessIdentifierPredicate *)[RBSProcessInstancePredicate alloc] initWithIdentifier:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [RBSProcessInstancePredicate alloc];
      uint64_t v6 = [v3 instance];
      id v4 = [(RBSProcessIdentifierPredicate *)v5 initWithIdentifier:v6];
    }
    else
    {
      uint64_t v7 = +[RBSProcessIdentifier identifierForIdentifier:v3];

      id v4 = [[RBSProcessIdentifierPredicate alloc] initWithIdentifier:v7];
      id v3 = (id)v7;
    }
  }
  v8 = +[RBSProcessPredicate predicateMatching:v4];

  return v8;
}

+ (id)predicateMatchingPredicates:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] < 2)
  {
    uint64_t v5 = [v4 firstObject];
    uint64_t v12 = [v5 predicate];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "predicate", (void)v16);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    uint64_t v12 = (uint64_t)-[RBSCompoundAllPredicate initWithPredicates:]([RBSCompoundAllPredicate alloc], v5);
  }
  v13 = (void *)v12;

  v14 = (void *)[objc_alloc((Class)a1) initWithPredicate:v13];
  return v14;
}

+ (id)predicateMatching:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"RBSProcessPredicate.m", 26, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [objc_alloc((Class)a1) initWithPredicate:v5];
  }
  else
  {
    uint64_t v6 = [v5 processPredicate];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (RBSProcessPredicate)initWithPredicate:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    NSClassFromString(&cfstr_Rbsprocesspred_0.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"RBSProcessPredicate.m", 67, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:RBSProcessPredicateImplClass]" object file lineNumber description];
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)RBSProcessPredicate;
  uint64_t v7 = [(RBSProcessPredicate *)&v11 init];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_predicate, a3);
  }

  return v8;
}

- (id)processIdentifier
{
  id v3 = [(RBSProcessPredicate *)self predicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 identifier];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [(RBSProcessPredicate *)self predicate];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = [v11 processIdentifier];
    v13 = v12;
    if (v12)
    {
      id v8 = v12;
    }
    else
    {
      v14 = [(RBSProcessPredicate *)self predicate];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
      id v16 = v15;

      long long v17 = [v16 processIdentifier];
      long long v18 = v17;
      if (v17)
      {
        id v8 = v17;
      }
      else
      {
        long long v19 = [(RBSProcessPredicate *)self predicate];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v20 = v19;
        }
        else {
          v20 = 0;
        }
        id v21 = v20;

        v22 = [v21 processIdentifier];
        v23 = v22;
        if (v22)
        {
          id v8 = v22;
        }
        else
        {
          v24 = [(RBSProcessPredicate *)self predicate];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v25 = v24;
          }
          else {
            v25 = 0;
          }
          id v26 = v25;

          id v8 = [v26 processIdentifier];
        }
      }
    }
  }

  return v8;
}

- (id)processIdentifiers
{
  id v3 = [(RBSProcessPredicate *)self predicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 processIdentifiers];
  if (v6)
  {
    id v7 = (id)v6;
  }
  else
  {
    id v8 = [(RBSProcessPredicate *)self predicate];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    id v11 = [v10 processIdentifiers];
    uint64_t v12 = v11;
    if (v11)
    {
      id v7 = v11;
    }
    else
    {
      v13 = [(RBSProcessPredicate *)self predicate];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
      id v15 = v14;

      id v16 = [v15 processIdentifiers];
      long long v17 = v16;
      if (v16)
      {
        id v7 = v16;
      }
      else
      {
        long long v18 = [(RBSProcessPredicate *)self predicate];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v19 = v18;
        }
        else {
          long long v19 = 0;
        }
        id v20 = v19;

        id v7 = [v20 processIdentifiers];
      }
    }

    if (v7) {
      goto LABEL_23;
    }
    id v5 = [(RBSProcessPredicate *)self processIdentifier];
    if (v5)
    {
      v22 = (void *)MEMORY[0x1E4F1CAD0];
      v23 = +[RBSProcessIdentifier identifierForIdentifier:v5];
      id v7 = [v22 setWithObject:v23];
    }
    else
    {
      id v7 = 0;
    }
  }

LABEL_23:
  return v7;
}

- (RBSProcessPredicateImpl)predicate
{
  return self->_predicate;
}

+ (id)predicateMatchingTarget:(id)a3
{
  return +[RBSProcessPredicate predicateMatching:a3];
}

- (RBSProcessIdentity)processIdentity
{
  v2 = [(RBSProcessPredicate *)self predicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4) {
    id v5 = (void *)v4[1];
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = v5;

  return v6;
}

+ (id)predicateMatchingBundleIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = [[RBSProcessBundleIdentifiersPredicate alloc] initWithIdentifiers:v3];

  id v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

+ (id)predicateMatchingIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = [[RBSProcessIdentifiersPredicate alloc] initWithIdentifiers:v3];

  id v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

+ (id)predicateMatchingEuid:(unsigned int)a3
{
  id v3 = [(RBSProcessIntPredicate *)[RBSProcessEUIDPredicate alloc] initWithIdentifier:a3];
  id v4 = +[RBSProcessPredicate predicateMatching:v3];

  return v4;
}

+ (id)predicateMatchingProcessTypeApplication
{
  v2 = objc_alloc_init(RBSProcessPredicateTypeApplication);
  id v3 = +[RBSProcessPredicate predicateMatching:v2];

  return v3;
}

+ (id)predicatePowerLogProcesses
{
  return +[RBSProcessReportedProcesses reportedPredicate];
}

+ (id)predicateForSymptomsd
{
  return +[RBSProcessReportedProcesses reportedPredicate];
}

+ (id)predicateForMemoryMonitor
{
  return +[RBSProcessReportedProcesses reportedPredicate];
}

+ (id)predicateForClearTheBoard
{
  return +[RBSProcessReportedProcesses reportedPredicate];
}

+ (id)predicate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)predicateMatchingAnyPredicate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] < 2)
  {
    id v5 = [v4 firstObject];
    uint64_t v12 = [v5 predicate];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "predicate", (void)v16);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    uint64_t v12 = (uint64_t)-[RBSCompoundAnyPredicate initWithPredicates:]([RBSCompoundAnyPredicate alloc], v5);
  }
  v13 = (void *)v12;

  v14 = (void *)[objc_alloc((Class)a1) initWithPredicate:v13];
  return v14;
}

+ (id)predicateNotMatchingPredicate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [RBSNotPredicate alloc];
  uint64_t v7 = [v4 predicate];

  uint64_t v8 = -[RBSNotPredicate initNotWithPredicate:]((id *)&v6->super.super.isa, v7);
  uint64_t v9 = (void *)[v5 initWithPredicate:v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[RBSProcessPredicate allocWithZone:a3];
  predicate = self->_predicate;
  return [(RBSProcessPredicate *)v4 initWithPredicate:predicate];
}

+ (id)predicateMatchingAuid:(unsigned int)a3
{
  id v3 = [(RBSProcessIntPredicate *)[RBSProcessAUIDPredicate alloc] initWithIdentifier:a3];
  id v4 = +[RBSProcessPredicate predicateMatching:v3];

  return v4;
}

- (unsigned)euid
{
  id v2 = [(RBSProcessPredicate *)self predicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unsigned int v5 = [v4 identifier];
  return v5;
}

- (unsigned)auid
{
  id v2 = [(RBSProcessPredicate *)self predicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unsigned int v5 = [v4 identifier];
  return v5;
}

+ (id)predicateMatchingPlatform:(int)a3
{
  id v3 = [[RBSProcessPlatformPredicate alloc] initWithPlatform:*(void *)&a3];
  id v4 = +[RBSProcessPredicate predicateMatching:v3];

  return v4;
}

+ (id)predicateMatchingExtensionPoint:(id)a3
{
  id v3 = a3;
  id v4 = [(RBSProcessStringPredicate *)[RBSProcessExtensionPointPredicate alloc] initWithIdentifier:v3];

  unsigned int v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

+ (id)predicateMatchingBeforeTranslocationBundlePath:(id)a3
{
  id v3 = a3;
  id v4 = [[RBSProcessBeforeTranslocationBundlePathPredicate alloc] initWithIdentifier:v3];

  unsigned int v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

+ (id)predicateMatchingExecPathStartsWith:(id)a3
{
  id v3 = a3;
  id v4 = [(RBSProcessStringPredicate *)[RBSProcessExecPathStartsWithPredicate alloc] initWithIdentifier:v3];

  unsigned int v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

+ (id)predicateMatchingDextsBundledWithBundleID:(id)a3
{
  id v3 = a3;
  id v4 = [(RBSProcessStringPredicate *)[RBSProcessBundledDextPredicate alloc] initWithIdentifier:v3];

  unsigned int v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

+ (id)predicateMatchingLSApplicationIdentity:(id)a3
{
  id v3 = +[RBSProcessIdentity identityForLSApplicationIdentity:a3];
  id v4 = +[RBSProcessPredicate predicateMatchingIdentity:v3];

  return v4;
}

- (NSString)bundleIdentifier
{
  id v2 = [(RBSProcessPredicate *)self predicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unsigned int v5 = [v4 identifier];

  return (NSString *)v5;
}

- (NSString)extensionPoint
{
  id v2 = [(RBSProcessPredicate *)self predicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unsigned int v5 = [v4 identifier];

  return (NSString *)v5;
}

- (NSString)beforeTranslocationBundlePath
{
  id v2 = [(RBSProcessPredicate *)self predicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unsigned int v5 = [v4 beforeTranslocationBundlePath];

  return (NSString *)v5;
}

+ (id)predicateMatchingHostIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [(RBSProcessIdentifierPredicate *)[RBSProcessHostIdentifierPredicate alloc] initWithIdentifier:v3];

  unsigned int v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

+ (id)predicateMatchingLaunchServicesProcesses
{
  id v2 = objc_alloc_init(RBSProcessPredicateLaunchServicesProcesses);
  id v3 = +[RBSProcessPredicate predicateMatching:v2];

  return v3;
}

+ (id)predicateMatchingSuspendableProcesses
{
  id v2 = objc_alloc_init(RBSProcessPredicateSuspendable);
  id v3 = +[RBSProcessPredicate predicateMatching:v2];

  return v3;
}

+ (id)predicateMatchingJobLabel:(id)a3
{
  id v3 = a3;
  id v4 = [(RBSProcessStringPredicate *)[RBSProcessLaunchdJobLabelPredicate alloc] initWithIdentifier:v3];

  unsigned int v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

+ (id)predicateMatchingServiceName:(id)a3
{
  id v3 = a3;
  id v4 = [(RBSProcessStringPredicate *)[RBSProcessServiceNamePredicate alloc] initWithIdentifier:v3];

  unsigned int v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

+ (id)predicateMatchingIdentity:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessIdentityPredicate initWithIdentity:]([RBSProcessIdentityPredicate alloc], v3);

  unsigned int v5 = +[RBSProcessPredicate predicateMatching:v4];

  return v5;
}

- (NSString)jobLabel
{
  id v2 = [(RBSProcessPredicate *)self predicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unsigned int v5 = [v4 identifier];

  return (NSString *)v5;
}

- (NSString)serviceName
{
  id v2 = [(RBSProcessPredicate *)self predicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unsigned int v5 = [v4 identifier];

  return (NSString *)v5;
}

@end
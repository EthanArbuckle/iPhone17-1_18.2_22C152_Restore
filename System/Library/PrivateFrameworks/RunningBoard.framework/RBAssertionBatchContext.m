@interface RBAssertionBatchContext
+ (id)contextForProcess:(id)a3 acquisitionCompletionPolicy:(unint64_t)a4 withDescriptorsToAcquire:(id)a5 identifiersToInvalidate:(id)a6 daemonContext:(id)a7;
+ (id)contextForProcess:(id)a3 withDescriptorsToAcquire:(id)a4 identifiersToInvalidate:(id)a5 daemonContext:(id)a6;
- (BOOL)allowAbstractTarget;
- (BOOL)unitTesting;
- (NSArray)descriptorsToAcquire;
- (NSArray)identifiersToInvalidate;
- (RBDaemonContextProviding)daemonContext;
- (RBProcess)process;
- (id)_init;
- (id)acquisitionContextForDescriptor:(id)a3;
- (id)holdToken;
- (unint64_t)acquisitionPolicy;
- (void)setAcquisitionPolicy:(unint64_t)a3;
- (void)setAllowAbstractTarget:(BOOL)a3;
- (void)setHoldToken:(id)a3;
- (void)setUnitTesting:(BOOL)a3;
@end

@implementation RBAssertionBatchContext

- (RBProcess)process
{
  return self->_process;
}

- (unint64_t)acquisitionPolicy
{
  return self->_acquisitionPolicy;
}

- (NSArray)identifiersToInvalidate
{
  return self->_identifiersToInvalidate;
}

- (NSArray)descriptorsToAcquire
{
  return self->_descriptorsToAcquire;
}

- (id)acquisitionContextForDescriptor:(id)a3
{
  v4 = +[RBAssertionAcquisitionContext contextForProcess:self->_process withDescriptor:a3 daemonContext:self->_daemonContext];
  [v4 setHoldToken:self->_holdToken];
  [v4 setUnitTesting:self->_unitTesting];
  [v4 setAllowAbstractTarget:self->_allowAbstractTarget];
  [v4 setAcquisitionPolicy:self->_acquisitionPolicy];
  return v4;
}

+ (id)contextForProcess:(id)a3 withDescriptorsToAcquire:(id)a4 identifiersToInvalidate:(id)a5 daemonContext:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_20:
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 262, @"Invalid parameter not satisfying: %@", @"descriptors" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_21;
  }
  v26 = [MEMORY[0x263F08690] currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 261, @"Invalid parameter not satisfying: %@", @"process" object file lineNumber description];

  if (!v12) {
    goto LABEL_20;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_21:
  v28 = [MEMORY[0x263F08690] currentHandler];
  [v28 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 263, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

LABEL_4:
  v29 = v13;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    unint64_t v18 = 0;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = +[RBAssertionAcquisitionContext contextForProcess:v11 withDescriptor:*(void *)(*((void *)&v30 + 1) + 8 * i) daemonContext:v14];
        unint64_t v22 = [v21 acquisitionPolicy];
        if (v22 > v18)
        {
          unint64_t v23 = v22;
          if (RBSAcquisitionCompletionPolicyIsValid()) {
            unint64_t v18 = v23;
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v17);
  }
  else
  {
    unint64_t v18 = 0;
  }

  v24 = [a1 contextForProcess:v11 acquisitionCompletionPolicy:v18 withDescriptorsToAcquire:v15 identifiersToInvalidate:v29 daemonContext:v14];

  return v24;
}

+ (id)contextForProcess:(id)a3 acquisitionCompletionPolicy:(unint64_t)a4 withDescriptorsToAcquire:(id)a5 identifiersToInvalidate:(id)a6 daemonContext:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 290, @"Invalid parameter not satisfying: %@", @"descriptors" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 289, @"Invalid parameter not satisfying: %@", @"process" object file lineNumber description];

  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_9:
  v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 291, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

LABEL_4:
  uint64_t v17 = [[RBAssertionBatchContext alloc] _init];
  unint64_t v18 = (void *)v17[2];
  v17[2] = v13;
  id v19 = v13;

  uint64_t v20 = [v14 copy];
  v21 = (void *)v17[3];
  v17[3] = v20;

  uint64_t v22 = [v15 copy];
  unint64_t v23 = (void *)v17[4];
  v17[4] = v22;

  v17[5] = a4;
  return v17;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)RBAssertionBatchContext;
  return [(RBAssertionBatchContext *)&v3 init];
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (void)setHoldToken:(id)a3
{
}

- (void)setAllowAbstractTarget:(BOOL)a3
{
  self->_allowAbstractTarget = a3;
}

- (void)setAcquisitionPolicy:(unint64_t)a3
{
  self->_acquisitionPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonContext, 0);
  objc_storeStrong(&self->_holdToken, 0);
  objc_storeStrong((id *)&self->_identifiersToInvalidate, 0);
  objc_storeStrong((id *)&self->_descriptorsToAcquire, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (BOOL)allowAbstractTarget
{
  return self->_allowAbstractTarget;
}

- (id)holdToken
{
  return self->_holdToken;
}

- (RBDaemonContextProviding)daemonContext
{
  return self->_daemonContext;
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

@end
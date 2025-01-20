@interface RBAssertionAcquisitionContext
+ (id)contextForProcess:(id)a3 withDescriptor:(id)a4 daemonContext:(id)a5;
- (BOOL)allowAbstractTarget;
- (BOOL)unitTesting;
- (RBDaemonContextProviding)daemonContext;
- (RBProcess)process;
- (RBSAssertionDescriptor)descriptor;
- (id)holdToken;
- (unint64_t)acquisitionPolicy;
- (void)setAcquisitionPolicy:(unint64_t)a3;
- (void)setAllowAbstractTarget:(BOOL)a3;
- (void)setHoldToken:(id)a3;
- (void)setUnitTesting:(BOOL)a3;
@end

@implementation RBAssertionAcquisitionContext

- (RBDaemonContextProviding)daemonContext
{
  return self->_daemonContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonContext, 0);
  objc_storeStrong(&self->_holdToken, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (void)setAllowAbstractTarget:(BOOL)a3
{
  self->_allowAbstractTarget = a3;
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (void)setHoldToken:(id)a3
{
}

+ (id)contextForProcess:(id)a3 withDescriptor:(id)a4 daemonContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 234, @"Invalid parameter not satisfying: %@", @"process" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, a1, @"RBAssertionState.m", 235, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];

LABEL_3:
  v13 = objc_alloc_init(RBAssertionAcquisitionContext);
  objc_storeStrong((id *)&v13->_process, a3);
  objc_storeStrong((id *)&v13->_descriptor, a4);
  objc_storeStrong((id *)&v13->_daemonContext, a5);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v14 = [v11 attributes];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) applyToAcquisitionContext:v13];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  return v13;
}

- (RBSAssertionDescriptor)descriptor
{
  return self->_descriptor;
}

- (RBProcess)process
{
  return self->_process;
}

- (id)holdToken
{
  return self->_holdToken;
}

- (unint64_t)acquisitionPolicy
{
  return self->_acquisitionPolicy;
}

- (void)setAcquisitionPolicy:(unint64_t)a3
{
  self->_acquisitionPolicy = a3;
}

- (BOOL)allowAbstractTarget
{
  return self->_allowAbstractTarget;
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

@end
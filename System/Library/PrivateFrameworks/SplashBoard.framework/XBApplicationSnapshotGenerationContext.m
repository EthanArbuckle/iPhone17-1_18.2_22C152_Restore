@interface XBApplicationSnapshotGenerationContext
- (NSString)description;
- (XBApplicationLaunchCompatibilityInfo)applicationCompatibilityInfo;
- (XBApplicationSnapshotGenerationContext)initWithApplicationCompatibilityInfo:(id)a3 launchRequest:(id)a4 timeout:(double)a5;
- (XBLaunchStateRequest)launchRequest;
- (double)timeout;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation XBApplicationSnapshotGenerationContext

- (XBApplicationSnapshotGenerationContext)initWithApplicationCompatibilityInfo:(id)a3 launchRequest:(id)a4 timeout:(double)a5
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)XBApplicationSnapshotGenerationContext;
  v12 = [(XBApplicationSnapshotGenerationContext *)&v18 init];
  if (v12)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_applicationCompatibilityInfo, a3);
        uint64_t v13 = [v11 copy];
        launchRequest = v12->_launchRequest;
        v12->_launchRequest = (XBLaunchStateRequest *)v13;

        v12->_timeout = a5;
        goto LABEL_5;
      }
    }
    else
    {
      v16 = [MEMORY[0x263F08690] currentHandler];
      [v16 handleFailureInMethod:a2, v12, @"XBApplicationSnapshotGenerationContext.m", 27, @"Invalid parameter not satisfying: %@", @"applicationCompatibilityInfo" object file lineNumber description];

      if (v11) {
        goto LABEL_4;
      }
    }
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, v12, @"XBApplicationSnapshotGenerationContext.m", 28, @"Invalid parameter not satisfying: %@", @"launchRequest" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (XBLaunchStateRequest)launchRequest
{
  return self->_launchRequest;
}

- (XBApplicationLaunchCompatibilityInfo)applicationCompatibilityInfo
{
  return self->_applicationCompatibilityInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchRequest, 0);
  objc_storeStrong((id *)&self->_applicationCompatibilityInfo, 0);
}

- (NSString)description
{
  return (NSString *)[(XBApplicationSnapshotGenerationContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(XBApplicationSnapshotGenerationContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F3F658] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(XBApplicationSnapshotGenerationContext *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(XBApplicationSnapshotGenerationContext *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__XBApplicationSnapshotGenerationContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_2646A5BC0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __80__XBApplicationSnapshotGenerationContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"applicationCompatibilityInfo"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"launchRequest"];
  return (id)[*(id *)(a1 + 32) appendFloat:@"timeout" withName:*(double *)(*(void *)(a1 + 40) + 24)];
}

- (double)timeout
{
  return self->_timeout;
}

@end
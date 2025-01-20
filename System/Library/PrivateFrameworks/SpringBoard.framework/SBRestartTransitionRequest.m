@interface SBRestartTransitionRequest
- (BKSDisplayRenderOverlayDescriptor)customOverlayDescriptor;
- (BOOL)wantsPersistentSnapshot;
- (NSString)description;
- (NSString)reason;
- (NSString)requester;
- (NSURL)applicationLaunchURL;
- (SBRestartTransitionRequest)init;
- (SBRestartTransitionRequest)initWithRequester:(id)a3 reason:(id)a4;
- (double)delay;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)restartType;
- (void)setApplicationLaunchURL:(id)a3;
- (void)setCustomOverlayDescriptor:(id)a3;
- (void)setDelay:(double)a3;
- (void)setReason:(id)a3;
- (void)setRequester:(id)a3;
- (void)setRestartType:(int)a3;
- (void)setWantsPersistentSnapshot:(BOOL)a3;
@end

@implementation SBRestartTransitionRequest

- (SBRestartTransitionRequest)init
{
  return [(SBRestartTransitionRequest *)self initWithRequester:0 reason:0];
}

- (SBRestartTransitionRequest)initWithRequester:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBRestartTransitionRequest.m", 34, @"Invalid parameter not satisfying: %@", @"requester" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBRestartTransitionRequest.m", 35, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)SBRestartTransitionRequest;
  v10 = [(SBRestartTransitionRequest *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    requester = v10->_requester;
    v10->_requester = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    reason = v10->_reason;
    v10->_reason = (NSString *)v13;
  }
  return v10;
}

- (void)setWantsPersistentSnapshot:(BOOL)a3
{
  if (self->_wantsPersistentSnapshot != a3)
  {
    self->_wantsPersistentSnapshot = a3;
    if (a3)
    {
      customOverlayDescriptor = self->_customOverlayDescriptor;
      self->_customOverlayDescriptor = 0;
    }
  }
}

- (void)setCustomOverlayDescriptor:(id)a3
{
  v5 = (BKSDisplayRenderOverlayDescriptor *)a3;
  if (self->_customOverlayDescriptor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customOverlayDescriptor, a3);
    v5 = v6;
    self->_wantsPersistentSnapshot = 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[SBRestartTransitionRequest alloc] initWithRequester:self->_requester reason:self->_reason];
  v4->_restartType = self->_restartType;
  v4->_delay = self->_delay;
  v4->_wantsPersistentSnapshot = self->_wantsPersistentSnapshot;
  objc_storeStrong((id *)&v4->_customOverlayDescriptor, self->_customOverlayDescriptor);
  objc_storeStrong((id *)&v4->_applicationLaunchURL, self->_applicationLaunchURL);
  return v4;
}

- (NSString)description
{
  return (NSString *)[(SBRestartTransitionRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBRestartTransitionRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_requester withName:@"requester"];
  [v3 appendString:self->_reason withName:@"reason"];
  v4 = NSStringFromSBRestartType(self->_restartType);
  [v3 appendString:v4 withName:@"restartType"];

  if (self->_delay > 0.0) {
    id v5 = (id)objc_msgSend(v3, "appendFloat:withName:", @"delay");
  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBRestartTransitionRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBRestartTransitionRequest *)self succinctDescriptionBuilder];
  v6 = v5;
  if (self->_wantsPersistentSnapshot || self->_applicationLaunchURL || self->_customOverlayDescriptor)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__SBRestartTransitionRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E6AF5290;
    id v9 = v5;
    v10 = self;
    [v9 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];
  }
  return v6;
}

id __68__SBRestartTransitionRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 40) withName:@"wantsPersistentSnapshot" ifEqualTo:1];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"applicationLaunchURL" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"customOverlayLDescriptor" skipIfNil:1];
}

- (NSString)requester
{
  return self->_requester;
}

- (void)setRequester:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (int)restartType
{
  return self->_restartType;
}

- (void)setRestartType:(int)a3
{
  self->_restartType = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)wantsPersistentSnapshot
{
  return self->_wantsPersistentSnapshot;
}

- (BKSDisplayRenderOverlayDescriptor)customOverlayDescriptor
{
  return self->_customOverlayDescriptor;
}

- (NSURL)applicationLaunchURL
{
  return self->_applicationLaunchURL;
}

- (void)setApplicationLaunchURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationLaunchURL, 0);
  objc_storeStrong((id *)&self->_customOverlayDescriptor, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_requester, 0);
}

@end
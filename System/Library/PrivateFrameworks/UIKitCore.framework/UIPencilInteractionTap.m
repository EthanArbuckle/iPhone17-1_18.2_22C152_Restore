@interface UIPencilInteractionTap
- (NSString)debugDescription;
- (UIPencilHoverPose)hoverPose;
- (UIPencilInteractionTap)init;
- (double)timestamp;
- (id)_initWithTimestamp:(double)a3 hoverPose:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation UIPencilInteractionTap

- (id)_initWithTimestamp:(double)a3 hoverPose:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)UIPencilInteractionTap;
  v5 = (id *)objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    *((double *)v5 + 1) = a3;
    objc_storeStrong(v5 + 2, a2);
  }
  return v6;
}

- (UIPencilInteractionTap)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"UIPencilInteraction.m", 383, @"%s: init is not allowed on %@", "-[UIPencilInteractionTap init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)[(UIPencilInteractionTap *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  v2 = [(UIPencilInteractionTap *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  hoverPose = self->_hoverPose;
  if (hoverPose)
  {
    v5 = [(UIPencilHoverPose *)hoverPose succinctDescription];
  }
  else
  {
    v5 = @"(nil)";
  }
  id v6 = (id)[v3 appendObject:v5 withName:@"hoverPose"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UIPencilInteractionTap *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UIPencilInteractionTap *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__UIPencilInteractionTap_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

void __64__UIPencilInteractionTap_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__UIPencilInteractionTap_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  int8x16_t v5 = a1[2];
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

id __64__UIPencilInteractionTap_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(__CFString **)(v2 + 16);
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = @"(nil)";
  }
  return (id)[v1 appendObject:v4 withName:@"hoverPose"];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (UIPencilHoverPose)hoverPose
{
  return self->_hoverPose;
}

- (void).cxx_destruct
{
}

@end
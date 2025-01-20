@interface UIPencilInteractionSqueeze
- (NSString)debugDescription;
- (UIPencilHoverPose)hoverPose;
- (UIPencilInteractionSqueeze)init;
- (double)_normalizedForceVelocity;
- (double)timestamp;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)_initWithTimestamp:(void *)a3 eventPhase:(double)a4 normalizedForceVelocity:(double)a5 hoverPose:;
- (unint64_t)phase;
@end

@implementation UIPencilInteractionSqueeze

- (uint64_t)_initWithTimestamp:(void *)a3 eventPhase:(double)a4 normalizedForceVelocity:(double)a5 hoverPose:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)UIPencilInteractionSqueeze;
  v9 = (id *)objc_msgSendSuper2(&v12, sel_init);
  v10 = v9;
  if (!v9) {
    return (uint64_t)v10;
  }
  *((double *)v9 + 2) = a4;
  if ((unint64_t)(a2 - 1) < 4)
  {
    v9[3] = (id)(a2 - 1);
    *((double *)v9 + 1) = a5;
    objc_storeStrong(v9 + 4, a3);
    return (uint64_t)v10;
  }
  uint64_t v13 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  int v14 = 134217984;
  uint64_t v15 = a2;
  _os_log_send_and_compose_impl();
  uint64_t result = _os_crash_msg();
  __break(1u);
  return result;
}

- (UIPencilInteractionSqueeze)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"UIPencilInteraction.m", 496, @"%s: init is not allowed on %@", "-[UIPencilInteractionSqueeze init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)[(UIPencilInteractionSqueeze *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  v2 = [(UIPencilInteractionSqueeze *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = v3;
  unint64_t phase = self->_phase;
  if (phase > 3) {
    v6 = &stru_1ED0E84C0;
  }
  else {
    v6 = off_1E5304CB8[phase];
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"phase"];
  if (os_variant_has_internal_diagnostics()) {
    id v12 = (id)[v4 appendFloat:@"normalizedForceVelocity" withName:1 decimalPrecision:self->_normalizedForceVelocity];
  }
  hoverPose = self->_hoverPose;
  if (hoverPose)
  {
    v9 = [(UIPencilHoverPose *)hoverPose succinctDescription];
  }
  else
  {
    v9 = @"(nil)";
  }
  id v10 = (id)[v4 appendObject:v9 withName:@"hoverPose"];

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UIPencilInteractionSqueeze *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UIPencilInteractionSqueeze *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__UIPencilInteractionSqueeze_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

void __68__UIPencilInteractionSqueeze_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__UIPencilInteractionSqueeze_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

id __68__UIPencilInteractionSqueeze_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 24);
  if (v3 > 3) {
    id v4 = &stru_1ED0E84C0;
  }
  else {
    id v4 = off_1E5304CB8[v3];
  }
  id v5 = (id)[v2 appendObject:v4 withName:@"phase"];
  if (os_variant_has_internal_diagnostics()) {
    id v8 = (id)[*(id *)(a1 + 32) appendFloat:@"normalizedForceVelocity" withName:1 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 8)];
  }
  if (*(void *)(*(void *)(a1 + 40) + 32)) {
    id v6 = *(__CFString **)(*(void *)(a1 + 40) + 32);
  }
  else {
    id v6 = @"(nil)";
  }
  return (id)[*(id *)(a1 + 32) appendObject:v6 withName:@"hoverPose"];
}

- (double)_normalizedForceVelocity
{
  return self->_normalizedForceVelocity;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (UIPencilHoverPose)hoverPose
{
  return self->_hoverPose;
}

- (void).cxx_destruct
{
}

@end
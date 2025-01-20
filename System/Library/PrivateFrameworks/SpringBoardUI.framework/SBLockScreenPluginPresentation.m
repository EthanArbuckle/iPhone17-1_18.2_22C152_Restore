@interface SBLockScreenPluginPresentation
- (UIEdgeInsets)suggestedContentInsets;
- (_UILegibilitySettings)legibilitySettings;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setLegibilitySettings:(id)a3;
- (void)setSuggestedContentInsets:(UIEdgeInsets)a3;
@end

@implementation SBLockScreenPluginPresentation

- (id)description
{
  return [(SBLockScreenPluginPresentation *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBLockScreenPluginPresentation *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [(SBLockScreenPluginPresentation *)self suggestedContentInsets];
  v4 = NSStringFromUIEdgeInsets(v8);
  id v5 = (id)[v3 appendObject:v4 withName:@"suggestedContentInsets" skipIfNil:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBLockScreenPluginPresentation *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBLockScreenPluginPresentation *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__SBLockScreenPluginPresentation_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_2645D4318;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __72__SBLockScreenPluginPresentation_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) legibilitySettings];
  id v2 = (id)[v1 appendObject:v3 withName:@"legibilitySettings" skipIfNil:1];
}

- (UIEdgeInsets)suggestedContentInsets
{
  double top = self->suggestedContentInsets.top;
  double left = self->suggestedContentInsets.left;
  double bottom = self->suggestedContentInsets.bottom;
  double right = self->suggestedContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSuggestedContentInsets:(UIEdgeInsets)a3
{
  self->suggestedContentInsets = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
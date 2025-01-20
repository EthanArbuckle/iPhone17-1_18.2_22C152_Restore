@interface SBSystemApertureSceneElementConfiguration
- (BOOL)allowsSceneReactivation;
- (BOOL)entersBackgroundWhenBacklightIsOff;
- (BOOL)isMinimalPresentationPossible;
- (NSString)description;
- (SBSystemApertureSceneElementConfiguration)init;
- (double)maximumHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setAllowsSceneReactivation:(BOOL)a3;
- (void)setEntersBackgroundWhenBacklightIsOff:(BOOL)a3;
- (void)setMaximumHeight:(double)a3;
- (void)setMinimalPresentationPossible:(BOOL)a3;
@end

@implementation SBSystemApertureSceneElementConfiguration

- (SBSystemApertureSceneElementConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureSceneElementConfiguration;
  result = [(SBSystemApertureSceneElementConfiguration *)&v3 init];
  if (result)
  {
    result->_maximumHeight = *(double *)MEMORY[0x1E4F43ED8];
    result->_minimalPresentationPossible = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(SBSystemApertureSceneElementConfiguration *)self maximumHeight];
  objc_msgSend(v4, "setMaximumHeight:");
  objc_msgSend(v4, "setAllowsSceneReactivation:", -[SBSystemApertureSceneElementConfiguration allowsSceneReactivation](self, "allowsSceneReactivation"));
  objc_msgSend(v4, "setEntersBackgroundWhenBacklightIsOff:", -[SBSystemApertureSceneElementConfiguration entersBackgroundWhenBacklightIsOff](self, "entersBackgroundWhenBacklightIsOff"));
  objc_msgSend(v4, "setMinimalPresentationPossible:", -[SBSystemApertureSceneElementConfiguration isMinimalPresentationPossible](self, "isMinimalPresentationPossible"));
  return v4;
}

- (NSString)description
{
  return (NSString *)[(SBSystemApertureSceneElementConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSystemApertureSceneElementConfiguration *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBSystemApertureSceneElementConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBSystemApertureSceneElementConfiguration *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__SBSystemApertureSceneElementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __83__SBSystemApertureSceneElementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "allowsSceneReactivation"), @"allowsSceneReactivation", 1);
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "entersBackgroundWhenBacklightIsOff"), @"entersBackgroundWhenBacklightIsOff", 1);
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isMinimalPresentationPossible"), @"isMinimalPresentationPossible", 1);
  id result = (id)[*(id *)(a1 + 40) maximumHeight];
  if (v6 != *MEMORY[0x1E4F43ED8])
  {
    id v7 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) maximumHeight];
    return (id)objc_msgSend(v7, "appendFloat:withName:", @"maximumHeight");
  }
  return result;
}

- (BOOL)allowsSceneReactivation
{
  return self->_allowsSceneReactivation;
}

- (void)setAllowsSceneReactivation:(BOOL)a3
{
  self->_allowsSceneReactivation = a3;
}

- (BOOL)entersBackgroundWhenBacklightIsOff
{
  return self->_entersBackgroundWhenBacklightIsOff;
}

- (void)setEntersBackgroundWhenBacklightIsOff:(BOOL)a3
{
  self->_entersBackgroundWhenBacklightIsOff = a3;
}

- (BOOL)isMinimalPresentationPossible
{
  return self->_minimalPresentationPossible;
}

- (void)setMinimalPresentationPossible:(BOOL)a3
{
  self->_minimalPresentationPossible = a3;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

@end
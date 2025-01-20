@interface TRASettingsActuationContext
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSettingsActuationContext:(id)a3;
- (BOOL)preventTouchCancellation;
- (BSAnimationSettings)animationSettings;
- (TRASettingsActuationContext)init;
- (TRASettingsActuationContext)initWithAnimationSettings:(id)a3 drawingFence:(id)a4;
- (TRASettingsActuationContext)initWithAnimationSettings:(id)a3 drawingFence:(id)a4 preventTouchCancellation:(BOOL)a5;
- (TRASettingsActuationContext)initWithSettingsActuationContext:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)drawingFence;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setAnimationSettings:(id)a3;
- (void)setDrawingFence:(id)a3;
@end

@implementation TRASettingsActuationContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_drawingFence, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

- (id)drawingFence
{
  return self->_drawingFence;
}

- (TRASettingsActuationContext)initWithAnimationSettings:(id)a3 drawingFence:(id)a4 preventTouchCancellation:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TRASettingsActuationContext;
  v10 = [(TRASettingsActuationContext *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_preventTouchCancellation = a5;
    [(TRASettingsActuationContext *)v10 setAnimationSettings:v8];
    objc_storeStrong(&v11->_drawingFence, a4);
  }

  return v11;
}

- (void)setAnimationSettings:(id)a3
{
  v4 = (BSAnimationSettings *)a3;
  if (v4)
  {
    if (self->_animationSettings == v4) {
      goto LABEL_6;
    }
    v7 = v4;
    v5 = (BSAnimationSettings *)[(BSAnimationSettings *)v4 copy];
  }
  else
  {
    v7 = 0;
    v5 = [MEMORY[0x263F29BC8] settingsWithDuration:0.0];
  }
  animationSettings = self->_animationSettings;
  self->_animationSettings = v5;

  v4 = v7;
LABEL_6:
}

- (TRASettingsActuationContext)initWithAnimationSettings:(id)a3 drawingFence:(id)a4
{
  return [(TRASettingsActuationContext *)self initWithAnimationSettings:a3 drawingFence:a4 preventTouchCancellation:0];
}

- (TRASettingsActuationContext)initWithSettingsActuationContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 animationSettings];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x263F29BC8] settingsWithDuration:0.0];
  }
  v7 = [v4 drawingFence];
  uint64_t v8 = [v4 preventTouchCancellation];

  id v9 = [(TRASettingsActuationContext *)self initWithAnimationSettings:v6 drawingFence:v7 preventTouchCancellation:v8];
  if (!v5) {

  }
  return v9;
}

- (TRASettingsActuationContext)init
{
  return [(TRASettingsActuationContext *)self initWithAnimationSettings:0 drawingFence:0 preventTouchCancellation:0];
}

- (BOOL)isEqualToSettingsActuationContext:(id)a3
{
  v5 = (TRASettingsActuationContext *)a3;
  if (!v5) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRASettings.m", 690, @"Invalid parameter not satisfying: %@", @"settingsActuationContext == nil || [settingsActuationContext isKindOfClass:[TRASettingsActuationContext class]]" object file lineNumber description];
  }
  if (self == v5)
  {
    BOOL v11 = 1;
    goto LABEL_10;
  }
  animationSettings = self->_animationSettings;
  v7 = [(TRASettingsActuationContext *)v5 animationSettings];
  LODWORD(animationSettings) = [(BSAnimationSettings *)animationSettings isEqual:v7];

  if (!animationSettings) {
    goto LABEL_8;
  }
  id drawingFence = self->_drawingFence;
  id v9 = [(TRASettingsActuationContext *)v5 drawingFence];
  LODWORD(drawingFence) = [drawingFence isEqual:v9];

  if (drawingFence)
  {
    BOOL preventTouchCancellation = self->_preventTouchCancellation;
    BOOL v11 = preventTouchCancellation == [(TRASettingsActuationContext *)v5 preventTouchCancellation];
  }
  else
  {
LABEL_8:
    BOOL v11 = 0;
  }
LABEL_10:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRASettingsActuationContext *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TRASettingsActuationContext *)self isEqualToSettingsActuationContext:v4];
  }

  return v5;
}

- (id)succinctDescription
{
  v2 = [(TRASettingsActuationContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [(BSAnimationSettings *)self->_animationSettings duration];
  id v4 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", @"animation duration", 1);
  id v5 = (id)[v3 appendObject:self->_drawingFence withName:@"drawing fence"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRASettingsActuationContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setDrawingFence:(id)a3
{
}

- (BOOL)preventTouchCancellation
{
  return self->_preventTouchCancellation;
}

@end
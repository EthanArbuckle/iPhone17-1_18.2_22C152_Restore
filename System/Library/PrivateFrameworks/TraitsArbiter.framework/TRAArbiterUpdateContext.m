@interface TRAArbiterUpdateContext
- (BOOL)_hasDefaultOrientationActuationContext;
- (BOOL)forceOrientationResolution;
- (BOOL)hasAnyActuationContext;
- (NSArray)requestingParticipantsUniqueIdentifiers;
- (NSString)debugDescription;
- (NSString)reason;
- (TRAArbiterDrawingDataSource)_drawingConfigProvider;
- (TRAArbiterUpdateContext)initWithBuilder:(id)a3;
- (TRASettingsActuationContext)orientationActuationContext;
- (TRASettingsActuationContext)userInterfaceStyleActuationContext;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_setDrawingConfigurationProvider:(id)a3;
- (void)setForceOrientationResolution:(BOOL)a3;
- (void)setOrientationActuationContext:(id)a3;
- (void)setReason:(id)a3;
- (void)setRequestingParticipantsUniqueIdentifiers:(id)a3;
- (void)setUserInterfaceStyleActuationContext:(id)a3;
@end

@implementation TRAArbiterUpdateContext

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__drawingConfigProvider);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_requestingParticipantsUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleActuationContext, 0);
  objc_storeStrong((id *)&self->_orientationActuationContext, 0);
}

- (TRASettingsActuationContext)orientationActuationContext
{
  return self->_orientationActuationContext;
}

- (NSArray)requestingParticipantsUniqueIdentifiers
{
  return self->_requestingParticipantsUniqueIdentifiers;
}

- (BOOL)_hasDefaultOrientationActuationContext
{
  return self->__hasDefaultOrientationActuationContext;
}

- (BOOL)forceOrientationResolution
{
  return self->_forceOrientationResolution;
}

- (NSString)reason
{
  return self->_reason;
}

- (TRAArbiterUpdateContext)initWithBuilder:(id)a3
{
  v5 = (void (**)(id, TRAArbiterUpdateContext *))a3;
  if (!v5)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRAArbiter.m", 519, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)TRAArbiterUpdateContext;
  v6 = [(TRAArbiterUpdateContext *)&v12 init];
  if (v6)
  {
    v5[2](v5, v6);
    if (!v6->_reason)
    {
      v9 = [MEMORY[0x263F08690] currentHandler];
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      [v9 handleFailureInMethod:a2, v6, @"TRAArbiter.m", 523, @"%@ was built without specifying a reason.", v11 object file lineNumber description];
    }
  }

  return v6;
}

- (void)_setDrawingConfigurationProvider:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__drawingConfigProvider);

  v5 = v9;
  if (WeakRetained != v9 && !self->_orientationActuationContext)
  {
    v6 = [v9 defaultOrientationAnimationSettingsAnimatable:1];
    v7 = [[TRASettingsActuationContext alloc] initWithAnimationSettings:v6 drawingFence:0];
    orientationActuationContext = self->_orientationActuationContext;
    self->_orientationActuationContext = v7;

    self->__hasDefaultOrientationActuationContext = 1;
    v5 = v9;
  }
}

- (void)setReason:(id)a3
{
  if (self->_reason != a3)
  {
    self->_reason = (NSString *)[a3 copy];
    MEMORY[0x270F9A758]();
  }
}

- (void)setRequestingParticipantsUniqueIdentifiers:(id)a3
{
}

- (void)setOrientationActuationContext:(id)a3
{
  if (self->_orientationActuationContext != a3)
  {
    v4 = (TRASettingsActuationContext *)[a3 copy];
    orientationActuationContext = self->_orientationActuationContext;
    self->_orientationActuationContext = v4;

    self->__hasDefaultOrientationActuationContext = 0;
  }
}

- (void)setForceOrientationResolution:(BOOL)a3
{
  self->_forceOrientationResolution = a3;
}

- (void)setUserInterfaceStyleActuationContext:(id)a3
{
}

- (BOOL)hasAnyActuationContext
{
  return self->_orientationActuationContext || self->_userInterfaceStyleActuationContext != 0;
}

- (NSString)debugDescription
{
  return (NSString *)[(TRAArbiterUpdateContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(TRAArbiterUpdateContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAArbiterUpdateContext *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(TRAArbiterUpdateContext *)self succinctDescriptionBuilder];
  [v4 appendString:self->_reason withName:@"reason"];
  v5 = [(TRAArbiterUpdateContext *)self requestingParticipantsUniqueIdentifiers];
  [v4 appendArraySection:v5 withName:@"Requesting Participants" skipIfEmpty:0];

  id v6 = (id)[v4 appendObject:self->_userInterfaceStyleActuationContext withName:@"UserInterfaceStyle actuation context"];
  id v7 = (id)[v4 appendBool:self->_forceOrientationResolution withName:@"Force Orientation resolution"];
  id v8 = (id)[v4 appendObject:self->_orientationActuationContext withName:@"Orientation actuation context"];
  return v4;
}

- (TRASettingsActuationContext)userInterfaceStyleActuationContext
{
  return self->_userInterfaceStyleActuationContext;
}

- (TRAArbiterDrawingDataSource)_drawingConfigProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__drawingConfigProvider);
  return (TRAArbiterDrawingDataSource *)WeakRetained;
}

@end
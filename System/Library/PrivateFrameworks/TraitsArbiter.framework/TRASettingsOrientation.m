@interface TRASettingsOrientation
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOrientationSettings:(id)a3;
- (BSInterfaceOrientationMapResolving)orientationMapResolver;
- (NSString)debugDescription;
- (TRAArbitrationDeviceOrientationInputs)rawOrientationInputs;
- (TRAArbitrationDeviceOrientationInputs)validatedOrientationInputs;
- (TRASettingsOrientation)init;
- (TRASettingsOrientation)initWithOrientation:(int64_t)a3;
- (TRASettingsOrientation)initWithOrientation:(int64_t)a3 orientationMapResolver:(id)a4 validatedOrientationInputs:(id)a5 rawOrientationInputs:(id)a6;
- (TRASettingsOrientation)initWithOrientationSettings:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)orientation;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientationMapResolver:(id)a3;
- (void)setRawOrientationInputs:(id)a3;
- (void)setValidatedOrientationInputs:(id)a3;
@end

@implementation TRASettingsOrientation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawOrientationInputs, 0);
  objc_storeStrong((id *)&self->_validatedOrientationInputs, 0);
  objc_storeStrong((id *)&self->_orientationMapResolver, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TRAMutableSettingsOrientation allocWithZone:a3];
  return [(TRASettingsOrientation *)v4 initWithOrientationSettings:self];
}

- (BOOL)isEqualToOrientationSettings:(id)a3
{
  v5 = (TRASettingsOrientation *)a3;
  if (!v5) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRASettings.m", 324, @"Invalid parameter not satisfying: %@", @"orientationSettings == nil || [orientationSettings isKindOfClass:[TRASettingsOrientation class]]" object file lineNumber description];
  }
  if (self == v5)
  {
    char v13 = 1;
    goto LABEL_11;
  }
  int64_t orientation = self->_orientation;
  if (orientation != [(TRASettingsOrientation *)v5 orientation]) {
    goto LABEL_9;
  }
  orientationMapResolver = self->_orientationMapResolver;
  v8 = [(TRASettingsOrientation *)v5 orientationMapResolver];
  LODWORD(orientationMapResolver) = [(BSInterfaceOrientationMapResolving *)orientationMapResolver isEqual:v8];

  if (!orientationMapResolver) {
    goto LABEL_9;
  }
  validatedOrientationInputs = self->_validatedOrientationInputs;
  v10 = [(TRASettingsOrientation *)v5 validatedOrientationInputs];
  LODWORD(validatedOrientationInputs) = [(TRAArbitrationDeviceOrientationInputs *)validatedOrientationInputs isEqual:v10];

  if (validatedOrientationInputs)
  {
    rawOrientationInputs = self->_rawOrientationInputs;
    v12 = [(TRASettingsOrientation *)v5 rawOrientationInputs];
    char v13 = [(TRAArbitrationDeviceOrientationInputs *)rawOrientationInputs isEqual:v12];
  }
  else
  {
LABEL_9:
    char v13 = 0;
  }
LABEL_11:

  return v13;
}

- (TRASettingsOrientation)initWithOrientationSettings:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 orientation];
    v7 = [v5 orientationMapResolver];
    v8 = [v5 validatedOrientationInputs];
    v9 = [v5 rawOrientationInputs];
  }
  else
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F29C08]) initWithTargetOrientation:0 currentOrientation:0];
    v8 = [[TRAArbitrationDeviceOrientationInputs alloc] initWithCurrentDeviceOrientation:0 nonFlatDeviceOrientation:0];
    v9 = [[TRAArbitrationDeviceOrientationInputs alloc] initWithCurrentDeviceOrientation:0 nonFlatDeviceOrientation:0];
    uint64_t v6 = 0;
  }
  v10 = [(TRASettingsOrientation *)self initWithOrientation:v6 orientationMapResolver:v7 validatedOrientationInputs:v8 rawOrientationInputs:v9];

  return v10;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BSInterfaceOrientationMapResolving)orientationMapResolver
{
  return self->_orientationMapResolver;
}

- (TRAArbitrationDeviceOrientationInputs)validatedOrientationInputs
{
  return self->_validatedOrientationInputs;
}

- (TRAArbitrationDeviceOrientationInputs)rawOrientationInputs
{
  return self->_rawOrientationInputs;
}

- (TRASettingsOrientation)initWithOrientation:(int64_t)a3 orientationMapResolver:(id)a4 validatedOrientationInputs:(id)a5 rawOrientationInputs:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TRASettingsOrientation;
  v14 = [(TRASettingsOrientation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_int64_t orientation = a3;
    objc_storeStrong((id *)&v14->_orientationMapResolver, a4);
    objc_storeStrong((id *)&v15->_validatedOrientationInputs, a5);
    objc_storeStrong((id *)&v15->_rawOrientationInputs, a6);
  }

  return v15;
}

- (TRASettingsOrientation)init
{
  return [(TRASettingsOrientation *)self initWithOrientationSettings:0];
}

- (TRASettingsOrientation)initWithOrientation:(int64_t)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x263F29C08]) initWithTargetOrientation:0 currentOrientation:0];
  uint64_t v6 = [[TRAArbitrationDeviceOrientationInputs alloc] initWithCurrentDeviceOrientation:0 nonFlatDeviceOrientation:0];
  v7 = [[TRAArbitrationDeviceOrientationInputs alloc] initWithCurrentDeviceOrientation:0 nonFlatDeviceOrientation:0];
  v8 = [(TRASettingsOrientation *)self initWithOrientation:a3 orientationMapResolver:v5 validatedOrientationInputs:v6 rawOrientationInputs:v7];

  return v8;
}

- (NSString)debugDescription
{
  return (NSString *)[(TRASettingsOrientation *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRASettingsOrientation *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TRASettingsOrientation *)self isEqualToOrientationSettings:v4];
  }

  return v5;
}

- (id)succinctDescription
{
  v2 = NSString;
  v3 = TRAStringForBSInterfaceOrientation(self->_orientation);
  id v4 = [v2 stringWithFormat:@"orientation: %@", v3];

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v4 = NSString;
  BOOL v5 = TRAStringForBSDeviceOrientation([(TRAArbitrationDeviceOrientationInputs *)self->_validatedOrientationInputs currentDeviceOrientation]);
  uint64_t v6 = TRAStringForBSDeviceOrientation([(TRAArbitrationDeviceOrientationInputs *)self->_validatedOrientationInputs nonFlatDeviceOrientation]);
  v7 = [v4 stringWithFormat:@"current: %@, nonFlat: %@", v5, v6];

  v8 = NSString;
  v9 = TRAStringForBSDeviceOrientation([(TRAArbitrationDeviceOrientationInputs *)self->_rawOrientationInputs currentDeviceOrientation]);
  v10 = TRAStringForBSDeviceOrientation([(TRAArbitrationDeviceOrientationInputs *)self->_rawOrientationInputs nonFlatDeviceOrientation]);
  id v11 = [v8 stringWithFormat:@"current: %@, nonFlat: %@", v9, v10];

  id v12 = NSString;
  id v13 = TRAStringForBSInterfaceOrientation(self->_orientation);
  v14 = [v12 stringWithFormat:@"orientation: %@, deviceValidated: {%@}, deviceRaw: {%@}, mapResolver: {%@}", v13, v7, v11, self->_orientationMapResolver];

  return v14;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return 0;
}

- (id)succinctDescriptionBuilder
{
  return 0;
}

- (void)setOrientation:(int64_t)a3
{
  self->_int64_t orientation = a3;
}

- (void)setOrientationMapResolver:(id)a3
{
}

- (void)setValidatedOrientationInputs:(id)a3
{
}

- (void)setRawOrientationInputs:(id)a3
{
}

@end
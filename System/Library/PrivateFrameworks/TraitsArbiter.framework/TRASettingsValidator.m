@interface TRASettingsValidator
- (BOOL)didValidateOrientationSettings;
- (NSString)orientationSettingsValidatedReason;
- (TRASettingsOrientation)orientationSettings;
- (void)setOrientationSettings:(id)a3;
- (void)setOrientationSettingsValidated:(BOOL)a3;
- (void)setOrientationSettingsValidatedReason:(id)a3;
- (void)validateOrientationSettingsWithBlock:(id)a3;
@end

@implementation TRASettingsValidator

- (void)validateOrientationSettingsWithBlock:(id)a3
{
  v5 = (uint64_t (**)(id, TRASettingsOrientation *, id *))a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRASettings.m", 786, @"Invalid parameter not satisfying: %@", @"settingsValidationBlock" object file lineNumber description];
  }
  orientationSettings = self->_orientationSettings;
  id v12 = 0;
  char v7 = v5[2](v5, orientationSettings, &v12);
  id v8 = v12;
  self->_orientationSettingsValidated = v7;
  v9 = (NSString *)[v8 copy];
  orientationSettingsValidatedReason = self->_orientationSettingsValidatedReason;
  self->_orientationSettingsValidatedReason = v9;
}

- (void)setOrientationSettings:(id)a3
{
  self->_orientationSettingsValidated = 0;
  orientationSettingsValidatedReason = self->_orientationSettingsValidatedReason;
  self->_orientationSettingsValidatedReason = 0;
  id v5 = a3;

  v6 = (TRASettingsOrientation *)[v5 copy];
  orientationSettings = self->_orientationSettings;
  self->_orientationSettings = v6;
}

- (NSString)orientationSettingsValidatedReason
{
  return self->_orientationSettingsValidatedReason;
}

- (BOOL)didValidateOrientationSettings
{
  return self->_orientationSettingsValidated;
}

- (TRASettingsOrientation)orientationSettings
{
  return self->_orientationSettings;
}

- (void)setOrientationSettingsValidated:(BOOL)a3
{
  self->_orientationSettingsValidated = a3;
}

- (void)setOrientationSettingsValidatedReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationSettingsValidatedReason, 0);
  objc_storeStrong((id *)&self->_orientationSettings, 0);
}

@end
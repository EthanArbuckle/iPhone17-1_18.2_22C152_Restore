@interface SiriPresentationOptions
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)hideOtherWindowsDuringAppearance;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAllowBiometricAutoUnlock;
- (BOOL)shouldDeactivateScenesBelow;
- (BOOL)wakeScreen;
- (NSSet)launchActions;
- (SiriPresentationOptions)initWithBuilder:(id)a3;
- (SiriPresentationOptions)initWithCoder:(id)a3;
- (SiriPresentationOptions)initWithWakeScreen:(BOOL)a3 hideOtherWindowsDuringAppearance:(BOOL)a4 shouldAllowBiometricAutoUnlock:(BOOL)a5 shouldDeactivateScenesBelow:(BOOL)a6 rotationStyle:(int64_t)a7 requestSource:(int64_t)a8 inputType:(int64_t)a9 launchActions:(id)a10;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)inputType;
- (int64_t)requestSource;
- (int64_t)rotationStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriPresentationOptions

- (SiriPresentationOptions)initWithBuilder:(id)a3
{
  v4 = +[SiriPresentationOptions newWithBuilder:a3];

  return v4;
}

- (SiriPresentationOptions)initWithWakeScreen:(BOOL)a3 hideOtherWindowsDuringAppearance:(BOOL)a4 shouldAllowBiometricAutoUnlock:(BOOL)a5 shouldDeactivateScenesBelow:(BOOL)a6 rotationStyle:(int64_t)a7 requestSource:(int64_t)a8 inputType:(int64_t)a9 launchActions:(id)a10
{
  id v17 = a10;
  v23.receiver = self;
  v23.super_class = (Class)SiriPresentationOptions;
  v18 = [(SiriPresentationOptions *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_wakeScreen = a3;
    v18->_hideOtherWindowsDuringAppearance = a4;
    v18->_shouldAllowBiometricAutoUnlock = a5;
    v18->_shouldDeactivateScenesBelow = a6;
    v18->_rotationStyle = a7;
    v18->_requestSource = a8;
    v18->_inputType = a9;
    uint64_t v20 = [v17 copy];
    launchActions = v19->_launchActions;
    v19->_launchActions = (NSSet *)v20;
  }
  return v19;
}

- (id)description
{
  v35[8] = *MEMORY[0x1E4F143B8];
  id v31 = [NSString alloc];
  v34.receiver = self;
  v34.super_class = (Class)SiriPresentationOptions;
  v3 = [(SiriPresentationOptions *)&v34 description];
  id v4 = [NSString alloc];
  if (self->_wakeScreen) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v33 = (void *)[v4 initWithFormat:@"wakeScreen = %@", v5];
  v35[0] = v33;
  id v6 = [NSString alloc];
  if (self->_hideOtherWindowsDuringAppearance) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v32 = (void *)[v6 initWithFormat:@"hideOtherWindowsDuringAppearance = %@", v7];
  v35[1] = v32;
  id v8 = [NSString alloc];
  if (self->_shouldAllowBiometricAutoUnlock) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v30 = (void *)[v8 initWithFormat:@"shouldAllowBiometricAutoUnlock = %@", v9];
  v35[2] = v30;
  id v10 = [NSString alloc];
  if (self->_shouldDeactivateScenesBelow) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v29 = (void *)[v10 initWithFormat:@"shouldDeactivateScenesBelow = %@", v11];
  v35[3] = v29;
  id v12 = [NSString alloc];
  unint64_t rotationStyle = self->_rotationStyle;
  v28 = SiriPresentationRotationStyleGetName(rotationStyle);
  v27 = (void *)[v12 initWithFormat:@"unint64_t rotationStyle = %ld (%@)", rotationStyle, v28];
  v35[4] = v27;
  id v14 = [NSString alloc];
  v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_requestSource];
  v16 = (void *)[v14 initWithFormat:@"requestSource = %@", v15];
  v35[5] = v16;
  id v17 = [NSString alloc];
  v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_inputType];
  v19 = (void *)[v17 initWithFormat:@"inputType = %@", v18];
  v35[6] = v19;
  id v20 = [NSString alloc];
  v21 = [(NSSet *)self->_launchActions description];
  v22 = (void *)[v20 initWithFormat:@"launchActions = %@", v21];
  v35[7] = v22;
  objc_super v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:8];
  v24 = [v23 componentsJoinedByString:@", "];
  v25 = (void *)[v31 initWithFormat:@"%@ {%@}", v3, v24];

  return v25;
}

- (unint64_t)hash
{
  v18 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_wakeScreen];
  uint64_t v3 = [v18 hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hideOtherWindowsDuringAppearance];
  uint64_t v5 = [v4 hash] ^ v3;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_shouldAllowBiometricAutoUnlock];
  uint64_t v7 = [v6 hash];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_shouldDeactivateScenesBelow];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  id v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_rotationStyle];
  uint64_t v11 = [v10 hash];
  id v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_requestSource];
  uint64_t v13 = v11 ^ [v12 hash];
  id v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_inputType];
  uint64_t v15 = v9 ^ v13 ^ [v14 hash];
  unint64_t v16 = v15 ^ [(NSSet *)self->_launchActions hash];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SiriPresentationOptions *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL wakeScreen = self->_wakeScreen;
      if (wakeScreen == [(SiriPresentationOptions *)v5 wakeScreen]
        && (BOOL hideOtherWindowsDuringAppearance = self->_hideOtherWindowsDuringAppearance,
            hideOtherWindowsDuringAppearance == [(SiriPresentationOptions *)v5 hideOtherWindowsDuringAppearance])&& (shouldAllowBiometricAutoUnlock = self->_shouldAllowBiometricAutoUnlock, shouldAllowBiometricAutoUnlock == [(SiriPresentationOptions *)v5 shouldAllowBiometricAutoUnlock])&& (shouldDeactivateScenesBelow = self->_shouldDeactivateScenesBelow, shouldDeactivateScenesBelow == [(SiriPresentationOptions *)v5 shouldDeactivateScenesBelow])&& (int64_t rotationStyle = self->_rotationStyle, rotationStyle == [(SiriPresentationOptions *)v5 rotationStyle])&& (requestSource = self->_requestSource, requestSource == [(SiriPresentationOptions *)v5 requestSource])&& (inputType = self->_inputType, inputType == [(SiriPresentationOptions *)v5 inputType]))
      {
        uint64_t v13 = [(SiriPresentationOptions *)v5 launchActions];
        launchActions = self->_launchActions;
        BOOL v15 = launchActions == v13 || [(NSSet *)launchActions isEqual:v13];
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriPresentationOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SiriPresentationOptions::wakeScreen"];
  uint64_t v5 = [v4 BOOLValue];

  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SiriPresentationOptions::hideOtherWindowsDuringAppearance"];
  uint64_t v7 = [v6 BOOLValue];

  id v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SiriPresentationOptions::shouldAllowBiometricAutoUnlock"];
  uint64_t v9 = [v8 BOOLValue];

  id v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SiriPresentationOptions::shouldDeactivateScenesBelow"];
  uint64_t v11 = [v10 BOOLValue];

  id v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SiriPresentationOptions::rotationStyle"];
  uint64_t v13 = [v12 integerValue];

  id v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SiriPresentationOptions::requestSource"];
  uint64_t v15 = [v14 integerValue];

  unint64_t v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SiriPresentationOptions::inputType"];
  uint64_t v17 = [v16 integerValue];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  id v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v21 = [v3 decodeObjectOfClasses:v20 forKey:@"SiriPresentationOptions::launchActions"];

  v22 = [(SiriPresentationOptions *)self initWithWakeScreen:v5 hideOtherWindowsDuringAppearance:v7 shouldAllowBiometricAutoUnlock:v9 shouldDeactivateScenesBelow:v11 rotationStyle:v13 requestSource:v15 inputType:v17 launchActions:v21];
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL wakeScreen = self->_wakeScreen;
  id v13 = a3;
  id v6 = [v4 numberWithBool:wakeScreen];
  [v13 encodeObject:v6 forKey:@"SiriPresentationOptions::wakeScreen"];

  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hideOtherWindowsDuringAppearance];
  [v13 encodeObject:v7 forKey:@"SiriPresentationOptions::hideOtherWindowsDuringAppearance"];

  id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_shouldAllowBiometricAutoUnlock];
  [v13 encodeObject:v8 forKey:@"SiriPresentationOptions::shouldAllowBiometricAutoUnlock"];

  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_shouldDeactivateScenesBelow];
  [v13 encodeObject:v9 forKey:@"SiriPresentationOptions::shouldDeactivateScenesBelow"];

  id v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_rotationStyle];
  [v13 encodeObject:v10 forKey:@"SiriPresentationOptions::rotationStyle"];

  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_requestSource];
  [v13 encodeObject:v11 forKey:@"SiriPresentationOptions::requestSource"];

  id v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_inputType];
  [v13 encodeObject:v12 forKey:@"SiriPresentationOptions::inputType"];

  [v13 encodeObject:self->_launchActions forKey:@"SiriPresentationOptions::launchActions"];
}

- (BOOL)wakeScreen
{
  return self->_wakeScreen;
}

- (BOOL)hideOtherWindowsDuringAppearance
{
  return self->_hideOtherWindowsDuringAppearance;
}

- (BOOL)shouldAllowBiometricAutoUnlock
{
  return self->_shouldAllowBiometricAutoUnlock;
}

- (BOOL)shouldDeactivateScenesBelow
{
  return self->_shouldDeactivateScenesBelow;
}

- (int64_t)rotationStyle
{
  return self->_rotationStyle;
}

- (int64_t)requestSource
{
  return self->_requestSource;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (void).cxx_destruct
{
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = (void (**)(id, _SiriPresentationOptionsMutation *))a3;
  id v4 = objc_alloc_init(_SiriPresentationOptionsMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  uint64_t v5 = [(_SiriPresentationOptionsMutation *)v4 generate];

  return v5;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SiriPresentationOptionsMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_SiriPresentationOptionsMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    id v6 = [(_SiriPresentationOptionsMutation *)v5 generate];
  }
  else
  {
    id v6 = (void *)[(SiriPresentationOptions *)self copy];
  }

  return v6;
}

@end
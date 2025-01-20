@interface SBSSystemNotesPresentationConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSystemNotesPresentationConfiguration:(id)a3;
- (NSData)userActivityData;
- (NSString)description;
- (NSString)sceneBundleIdentifier;
- (NSUUID)identifier;
- (NSUserActivity)userActivity;
- (SBSSystemNotesPresentationConfiguration)initWithCoder:(id)a3;
- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3;
- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3 userActivity:(id)a4;
- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3 userActivity:(id)a4 preferredPresentationMode:(int64_t)a5;
- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3 userActivity:(id)a4 preferredPresentationMode:(int64_t)a5 identifier:(id)a6;
- (SBSSystemNotesPresentationConfiguration)presentationConfigurationWithPreferredPresentationMode:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)preferredPresentationMode;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForXPCCall:(id)a3;
@end

@implementation SBSSystemNotesPresentationConfiguration

- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3
{
  return [(SBSSystemNotesPresentationConfiguration *)self initWithSceneBundleIdentifier:a3 userActivity:0];
}

- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3 userActivity:(id)a4
{
  return [(SBSSystemNotesPresentationConfiguration *)self initWithSceneBundleIdentifier:a3 userActivity:a4 preferredPresentationMode:1];
}

- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3 userActivity:(id)a4 preferredPresentationMode:(int64_t)a5
{
  v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 UUID];
  v12 = [(SBSSystemNotesPresentationConfiguration *)self initWithSceneBundleIdentifier:v10 userActivity:v9 preferredPresentationMode:a5 identifier:v11];

  return v12;
}

- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3 userActivity:(id)a4 preferredPresentationMode:(int64_t)a5 identifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!SBSSystemNotesPresentationModeIsValid(a5))
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBSSystemNotesPresentationConfiguration.m", 60, @"Invalid parameter not satisfying: %@", @"SBSSystemNotesPresentationModeIsValid(preferredPresentationMode)" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)SBSSystemNotesPresentationConfiguration;
  v14 = [(SBSSystemNotesPresentationConfiguration *)&v19 init];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    sceneBundleIdentifier = v14->_sceneBundleIdentifier;
    v14->_sceneBundleIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v14->_userActivity, a4);
    v14->_preferredPresentationMode = a5;
    objc_storeStrong((id *)&v14->_identifier, a6);
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBSSystemNotesPresentationConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(SBSSystemNotesPresentationConfiguration *)self isEqualToSystemNotesPresentationConfiguration:v4];
  }

  return v5;
}

- (BOOL)isEqualToSystemNotesPresentationConfiguration:(id)a3
{
  return SBSDiffSystemNotesPresentationConfigurations(self, a3) == 0;
}

- (SBSSystemNotesPresentationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneBundleIdentifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivityData"];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:v6];
    v8 = (void *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      v14 = 0;
    }
    else
    {
      uint64_t v10 = [v4 decodeIntegerForKey:@"preferredPresentationMode"];
      id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      id v12 = [(SBSSystemNotesPresentationConfiguration *)self initWithSceneBundleIdentifier:v5 userActivity:v8 preferredPresentationMode:v10 identifier:v11];
      id v13 = v12;
      if (v12) {
        objc_storeStrong((id *)&v12->_userActivityData, v6);
      }
      self = v13;

      v14 = self;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  userActivityData = self->_userActivityData;
  id v8 = v5;
  if (self->_userActivity)
  {
    if (userActivityData) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (userActivityData)
  {
LABEL_3:
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBSSystemNotesPresentationConfiguration.m" lineNumber:112 description:@"attempting to encode an SBSSystemNotesPresentationConfiguration object with invalid NSUserActivity or its NSData representation. activity: %@; data: %@",
      self->_userActivity,
      self->_userActivityData);
  }
LABEL_5:
  [v8 encodeObject:self->_sceneBundleIdentifier forKey:@"sceneBundleIdentifier"];
  [v8 encodeInteger:self->_preferredPresentationMode forKey:@"preferredPresentationMode"];
  if (self->_userActivity) {
    [v8 encodeObject:self->_userActivityData forKey:@"userActivityData"];
  }
  [v8 encodeObject:self->_identifier forKey:@"identifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)[objc_alloc((Class)objc_opt_class()) initWithSceneBundleIdentifier:self->_sceneBundleIdentifier userActivity:self->_userActivity preferredPresentationMode:self->_preferredPresentationMode identifier:self->_identifier];
  objc_storeStrong(v4 + 1, self->_userActivityData);
  return v4;
}

- (NSString)description
{
  return (NSString *)[(SBSSystemNotesPresentationConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSSystemNotesPresentationConfiguration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(NSUUID *)self->_identifier UUIDString];
  [v3 appendString:v4 withName:@"identifier"];

  [v3 appendString:self->_sceneBundleIdentifier withName:@"sceneBundleIdentifier"];
  id v5 = SBSSystemNotesPresentationModeDescription(self->_preferredPresentationMode);
  [v3 appendString:v5 withName:@"preferredPresentationMode"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSSystemNotesPresentationConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSSystemNotesPresentationConfiguration *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_userActivity withName:@"userActivity" skipIfNil:1];
  return v4;
}

- (SBSSystemNotesPresentationConfiguration)presentationConfigurationWithPreferredPresentationMode:(int64_t)a3
{
  id v4 = (id *)[objc_alloc((Class)objc_opt_class()) initWithSceneBundleIdentifier:self->_sceneBundleIdentifier userActivity:self->_userActivity preferredPresentationMode:a3 identifier:self->_identifier];
  objc_storeStrong(v4 + 1, self->_userActivityData);
  return (SBSSystemNotesPresentationConfiguration *)v4;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)prepareForXPCCall:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  userActivity = self->_userActivity;
  if (userActivity && !self->_userActivityData)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__SBSSystemNotesPresentationConfiguration_prepareForXPCCall___block_invoke;
    v7[3] = &unk_1E566CC08;
    v7[4] = self;
    id v8 = v4;
    [(NSUserActivity *)userActivity _createUserActivityDataWithOptions:MEMORY[0x1E4F1CC08] completionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __61__SBSSystemNotesPresentationConfiguration_prepareForXPCCall___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
  id v6 = a2;
  id v7 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)sceneBundleIdentifier
{
  return self->_sceneBundleIdentifier;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (int64_t)preferredPresentationMode
{
  return self->_preferredPresentationMode;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_sceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

@end
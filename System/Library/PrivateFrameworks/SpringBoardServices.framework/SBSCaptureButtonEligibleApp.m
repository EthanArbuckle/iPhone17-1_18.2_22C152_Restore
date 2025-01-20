@interface SBSCaptureButtonEligibleApp
+ (BOOL)supportsSecureCoding;
- (BOOL)cameraTCCIsAuthorized;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (SBSCaptureButtonEligibleApp)initWithBundleIdentifier:(id)a3 cameraTCCIsAuthorized:(BOOL)a4;
- (SBSCaptureButtonEligibleApp)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSCaptureButtonEligibleApp

- (SBSCaptureButtonEligibleApp)initWithBundleIdentifier:(id)a3 cameraTCCIsAuthorized:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSCaptureButtonEligibleApp;
  v8 = [(SBSCaptureButtonEligibleApp *)&v13 init];
  if (v8)
  {
    if (!v7)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v8, @"SBSCaptureButtonEligibleApp.m", 20, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];
    }
    uint64_t v9 = [v7 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    v8->_cameraTCCIsAuthorized = a4;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v2 = [(NSString *)self->_bundleIdentifier hash] ^ ((unint64_t)self->_cameraTCCIsAuthorized << 16);
  return MEMORY[0x1F410C388](v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (unsigned __int8 *)v4;
    if (BSEqualObjects()) {
      BOOL v6 = v5[8] == self->_cameraTCCIsAuthorized;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (SBSCaptureButtonEligibleApp)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBSCaptureButtonEligibleApp;
  id v3 = a3;
  id v4 = [(SBSCaptureButtonEligibleApp *)&v9 init];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier" inDictionary:v9.receiver withSuperClass:v9.super_class];
  bundleIdentifier = v4->_bundleIdentifier;
  v4->_bundleIdentifier = (NSString *)v5;

  char v7 = [v3 decodeBoolForKey:@"cameraTCCIsAuthorized"];
  v4->_cameraTCCIsAuthorized = v7;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeBool:self->_cameraTCCIsAuthorized forKey:@"cameraTCCIsAuthorized"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)cameraTCCIsAuthorized
{
  return self->_cameraTCCIsAuthorized;
}

- (void).cxx_destruct
{
}

@end
@interface SBSFocusModesHomeScreenSettingsResponse
+ (BOOL)supportsBSXPCSecureCoding;
- (NSArray)snapshots;
- (SBSFocusModesHomeScreenSettingsResponse)initWithBSXPCCoder:(id)a3;
- (SBSFocusModesHomeScreenSettingsResponse)initWithSnapshots:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setSnapshots:(id)a3;
@end

@implementation SBSFocusModesHomeScreenSettingsResponse

- (SBSFocusModesHomeScreenSettingsResponse)initWithSnapshots:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSFocusModesHomeScreenSettingsResponse;
  v5 = [(SBSFocusModesHomeScreenSettingsResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    snapshots = v5->_snapshots;
    v5->_snapshots = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (SBSFocusModesHomeScreenSettingsResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 decodeCollectionOfClass:v5 containingClass:objc_opt_class() forKey:@"snapshots"];

  if (v6)
  {
    self = [(SBSFocusModesHomeScreenSettingsResponse *)self initWithSnapshots:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)snapshots
{
  return self->_snapshots;
}

- (void)setSnapshots:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
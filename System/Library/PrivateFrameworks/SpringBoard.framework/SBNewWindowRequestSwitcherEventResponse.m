@interface SBNewWindowRequestSwitcherEventResponse
- (NSString)bundleIdentifier;
- (SBNewWindowRequestSwitcherEventResponse)initWithBundleIdentifier:(id)a3;
- (int64_t)type;
@end

@implementation SBNewWindowRequestSwitcherEventResponse

- (SBNewWindowRequestSwitcherEventResponse)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBNewWindowRequestSwitcherEventResponse;
  v5 = [(SBChainableModifierEventResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }
  return v5;
}

- (int64_t)type
{
  return 21;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end
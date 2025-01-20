@interface SNAAssertionTarget
- (NSString)bundleIdentifier;
- (SNAAssertionTarget)initWithBundleIdentifier:(id)a3;
@end

@implementation SNAAssertionTarget

- (SNAAssertionTarget)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNAAssertionTarget;
  v6 = [(SNAAssertionTarget *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end
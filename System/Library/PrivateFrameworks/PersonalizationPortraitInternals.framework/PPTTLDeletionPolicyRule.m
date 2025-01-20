@interface PPTTLDeletionPolicyRule
- (NSNumber)maxAgeSeconds;
- (NSString)bundleIdentifier;
- (NSString)groupIdentifier;
- (PPTTLDeletionPolicyRule)initWithBundleIdentifier:(id)a3 groupIdentifier:(id)a4 maxAgeSeconds:(id)a5;
- (id)description;
@end

@implementation PPTTLDeletionPolicyRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxAgeSeconds, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSNumber)maxAgeSeconds
{
  return self->_maxAgeSeconds;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPTTLDeletionPolicyRule b:%@ g:%@ m:%@>", self->_bundleIdentifier, self->_groupIdentifier, self->_maxAgeSeconds];
  return v2;
}

- (PPTTLDeletionPolicyRule)initWithBundleIdentifier:(id)a3 groupIdentifier:(id)a4 maxAgeSeconds:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PPTTLDeletionPolicyRule;
  v12 = [(PPTTLDeletionPolicyRule *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v13->_groupIdentifier, a4);
    objc_storeStrong((id *)&v13->_maxAgeSeconds, a5);
  }

  return v13;
}

@end
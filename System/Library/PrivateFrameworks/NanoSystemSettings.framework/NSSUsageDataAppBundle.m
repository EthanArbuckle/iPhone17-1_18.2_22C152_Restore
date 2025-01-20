@interface NSSUsageDataAppBundle
- (BOOL)supportsManualPurge;
- (NSSSizeVector)size;
- (NSSUsageDataAppBundle)initWithName:(id)a3 bundleIdentifier:(id)a4 bundleVersion:(id)a5 vendor:(id)a6 size:(id)a7 supportsPurge:(BOOL)a8;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)name;
- (NSString)vendor;
- (id)mergeWith:(id)a3;
- (id)withSize:(id)a3 purge:(BOOL)a4;
@end

@implementation NSSUsageDataAppBundle

- (NSSUsageDataAppBundle)initWithName:(id)a3 bundleIdentifier:(id)a4 bundleVersion:(id)a5 vendor:(id)a6 size:(id)a7 supportsPurge:(BOOL)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)NSSUsageDataAppBundle;
  v18 = [(NSSUsageDataAppBundle *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v19->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v19->_bundleVersion, a5);
    objc_storeStrong((id *)&v19->_vendor, a6);
    objc_storeStrong((id *)&v19->_size, a7);
    v19->_supportsManualPurge = a8;
  }

  return v19;
}

- (id)withSize:(id)a3 purge:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [[NSSUsageDataAppBundle alloc] initWithName:self->_name bundleIdentifier:self->_bundleIdentifier bundleVersion:self->_bundleVersion vendor:self->_vendor size:v6 supportsPurge:v4];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)vendor
{
  return self->_vendor;
}

- (BOOL)supportsManualPurge
{
  return self->_supportsManualPurge;
}

- (NSSSizeVector)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)mergeWith:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSSUsageDataAppBundle *)self size];
    id v6 = [v4 size];
    v7 = [v5 plus:v6];
    if ([(NSSUsageDataAppBundle *)self supportsManualPurge]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = [v4 supportsManualPurge];
    }
    v9 = [(NSSUsageDataAppBundle *)self withSize:v7 purge:v8];
  }
  else
  {
    v9 = self;
  }

  return v9;
}

@end
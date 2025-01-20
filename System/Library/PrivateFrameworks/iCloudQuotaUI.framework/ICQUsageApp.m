@interface ICQUsageApp
- (BOOL)isSystemApp;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)name;
- (float)dataSize;
- (float)dynamicSize;
- (float)specialSize;
- (float)staticSize;
- (float)totalSize;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setDynamicSize:(float)a3;
- (void)setName:(id)a3;
- (void)setSpecialSize:(float)a3;
- (void)setStaticSize:(float)a3;
- (void)setSystemApp:(BOOL)a3;
@end

@implementation ICQUsageApp

- (float)dataSize
{
  [(ICQUsageApp *)self dynamicSize];
  float v4 = v3;
  [(ICQUsageApp *)self specialSize];
  return v4 + v5;
}

- (float)totalSize
{
  [(ICQUsageApp *)self staticSize];
  float v4 = v3;
  [(ICQUsageApp *)self dataSize];
  return v4 + v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (float)staticSize
{
  return self->_staticSize;
}

- (void)setStaticSize:(float)a3
{
  self->_staticSize = a3;
}

- (float)dynamicSize
{
  return self->_dynamicSize;
}

- (void)setDynamicSize:(float)a3
{
  self->_dynamicSize = a3;
}

- (float)specialSize
{
  return self->_specialSize;
}

- (void)setSpecialSize:(float)a3
{
  self->_specialSize = a3;
}

- (BOOL)isSystemApp
{
  return self->_systemApp;
}

- (void)setSystemApp:(BOOL)a3
{
  self->_systemApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
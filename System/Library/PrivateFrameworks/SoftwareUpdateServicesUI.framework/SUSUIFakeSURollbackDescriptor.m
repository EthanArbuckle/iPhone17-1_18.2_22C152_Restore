@interface SUSUIFakeSURollbackDescriptor
- (SUSUIFakeSURollbackDescriptor)init;
- (id)productBuildVersion;
- (id)productVersion;
- (id)releaseType;
- (id)restoreVersion;
@end

@implementation SUSUIFakeSURollbackDescriptor

- (SUSUIFakeSURollbackDescriptor)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUSUIFakeSURollbackDescriptor;
  v6 = [(SURollbackDescriptor *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)restoreVersion
{
  return @"99.1.100.0.0";
}

- (id)productVersion
{
  return @"99.1";
}

- (id)productBuildVersion
{
  return @"99A100";
}

- (id)releaseType
{
  return @"Internal";
}

@end
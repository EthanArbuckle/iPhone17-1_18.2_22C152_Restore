@interface MBDomainInfo
+ (BOOL)supportsSecureCoding;
+ (id)domainInfoWithName:(id)a3 systemApp:(BOOL)a4 remoteSize:(unint64_t)a5 localSize:(unint64_t)a6 enabled:(BOOL)a7 restricted:(BOOL)a8;
+ (id)domainNameForBundleID:(id)a3;
- (BOOL)isAppDomain;
- (BOOL)isCameraRollDomain;
- (BOOL)isEnabled;
- (BOOL)isRestricted;
- (BOOL)isSystemApp;
- (MBDomainInfo)initWithCoder:(id)a3;
- (MBDomainInfo)initWithDomainName:(id)a3 systemApp:(BOOL)a4 remoteSize:(unint64_t)a5 localSize:(unint64_t)a6 enabled:(BOOL)a7 restricted:(BOOL)a8;
- (NSString)bundleID;
- (NSString)domainName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)localSize;
- (unint64_t)remoteSize;
- (unint64_t)size;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLocalSize:(unint64_t)a3;
- (void)setRemoteSize:(unint64_t)a3;
- (void)setRestricted:(BOOL)a3;
- (void)setSystemApp:(BOOL)a3;
@end

@implementation MBDomainInfo

+ (id)domainNameForBundleID:(id)a3
{
  return +[MBDomain nameWithAppID:a3];
}

+ (id)domainInfoWithName:(id)a3 systemApp:(BOOL)a4 remoteSize:(unint64_t)a5 localSize:(unint64_t)a6 enabled:(BOOL)a7 restricted:(BOOL)a8
{
  v8 = [[MBDomainInfo alloc] initWithDomainName:a3 systemApp:a4 remoteSize:a5 localSize:a6 enabled:a7 restricted:a8];
  return v8;
}

- (MBDomainInfo)initWithDomainName:(id)a3 systemApp:(BOOL)a4 remoteSize:(unint64_t)a5 localSize:(unint64_t)a6 enabled:(BOOL)a7 restricted:(BOOL)a8
{
  v17.receiver = self;
  v17.super_class = (Class)MBDomainInfo;
  v14 = [(MBDomainInfo *)&v17 init];
  if (v14)
  {
    uint64_t v15 = [a3 copy];
    v14->_systemApp = a4;
    v14->_domainName = (NSString *)v15;
    v14->_remoteSize = a5;
    v14->_localSize = a6;
    v14->_enabled = a7;
    v14->_restricted = a8;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBDomainInfo)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBDomainInfo;
  v4 = [(MBDomainInfo *)&v6 init];
  if (v4)
  {
    v4->_domainName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"domainName"];
    v4->_systemApp = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"systemApp"), "BOOLValue");
    v4->_remoteSize = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"remoteSize"), "unsignedLongLongValue");
    v4->_localSize = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"localSize"), "unsignedLongLongValue");
    v4->_enabled = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"enabled"), "BOOLValue");
    v4->_restricted = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"restricted"), "BOOLValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_domainName forKey:@"domainName"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_systemApp), @"systemApp");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_remoteSize), @"remoteSize");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_localSize), @"localSize");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_enabled), @"enabled");
  uint64_t v5 = [NSNumber numberWithBool:self->_restricted];
  [a3 encodeObject:v5 forKey:@"restricted"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDomainInfo;
  [(MBDomainInfo *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL systemApp = self->_systemApp;
  domainName = self->_domainName;
  unint64_t remoteSize = self->_remoteSize;
  unint64_t localSize = self->_localSize;
  BOOL enabled = self->_enabled;
  BOOL restricted = self->_restricted;
  return (id)[v4 initWithDomainName:domainName systemApp:systemApp remoteSize:remoteSize localSize:localSize enabled:enabled restricted:restricted];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: domainName=%@, systemApp=%d, remoteSize=%llu, localSize=%llu, enabled=%d, restricted=%d>", objc_opt_class(), self->_domainName, self->_systemApp, self->_remoteSize, self->_localSize, self->_enabled, self->_restricted];
}

- (BOOL)isAppDomain
{
  BOOL v3 = +[MBDomain isAppName:self->_domainName];
  if (v3) {
    LOBYTE(v3) = !+[MBDomain isAppPlaceholderName:self->_domainName]
  }
              && !+[MBDomain isAppPluginName:self->_domainName]
              && !+[MBDomain isAppGroupName:self->_domainName]
              && !self->_systemApp;
  return v3;
}

- (BOOL)isCameraRollDomain
{
  return [(NSString *)self->_domainName isEqualToString:@"CameraRollDomain"];
}

- (NSString)bundleID
{
  return (NSString *)+[MBDomain containerIDWithName:self->_domainName];
}

- (unint64_t)size
{
  return self->_localSize + self->_remoteSize;
}

- (BOOL)isSystemApp
{
  return self->_systemApp;
}

- (void)setSystemApp:(BOOL)a3
{
  self->_BOOL systemApp = a3;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (unint64_t)remoteSize
{
  return self->_remoteSize;
}

- (void)setRemoteSize:(unint64_t)a3
{
  self->_unint64_t remoteSize = a3;
}

- (unint64_t)localSize
{
  return self->_localSize;
}

- (void)setLocalSize:(unint64_t)a3
{
  self->_unint64_t localSize = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_BOOL enabled = a3;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->_BOOL restricted = a3;
}

@end
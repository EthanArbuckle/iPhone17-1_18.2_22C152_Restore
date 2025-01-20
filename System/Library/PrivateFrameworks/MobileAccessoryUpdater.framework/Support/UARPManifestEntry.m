@interface UARPManifestEntry
- (BOOL)productionMode;
- (BOOL)securityMode;
- (BOOL)trusted;
- (NSData)digest;
- (NSDictionary)personalizationDictionary;
- (NSString)name;
- (UARPManifestEntry)initWithName:(id)a3 digest:(id)a4 trusted:(BOOL)a5 productionMode:(BOOL)a6 securityMode:(BOOL)a7;
- (id)description;
- (id)descriptionWithTabDepth:(unint64_t)a3;
@end

@implementation UARPManifestEntry

- (UARPManifestEntry)initWithName:(id)a3 digest:(id)a4 trusted:(BOOL)a5 productionMode:(BOOL)a6 securityMode:(BOOL)a7
{
  v14.receiver = self;
  v14.super_class = (Class)UARPManifestEntry;
  v12 = [(UARPManifestEntry *)&v14 init];
  if (v12)
  {
    v12->_name = (NSString *)[a3 copy];
    v12->_digest = (NSData *)[a4 copy];
    v12->_trusted = a5;
    v12->_productionMode = a6;
    v12->_securityMode = a7;
  }
  return v12;
}

- (NSDictionary)personalizationDictionary
{
  v5[0] = self->_digest;
  v4[0] = kAMAuthInstallTagImageDigest;
  v4[1] = kAMAuthInstallTagImageEffectiveProductionMode;
  v5[1] = +[NSNumber numberWithBool:self->_productionMode];
  v4[2] = kAMAuthInstallTagImageEffectiveSecurityMode;
  v5[2] = +[NSNumber numberWithBool:self->_securityMode];
  v4[3] = kAMAuthInstallTagImageTrusted;
  v5[3] = +[NSNumber numberWithBool:self->_trusted];
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
}

- (id)description
{
  return [(UARPManifestEntry *)self descriptionWithTabDepth:0];
}

- (id)descriptionWithTabDepth:(unint64_t)a3
{
  id v5 = sub_1000346B4(a3);
  id v6 = sub_1000346B4(a3 + 1);
  id v7 = +[NSMutableString string];
  v8 = (objc_class *)objc_opt_class();
  [v7 appendFormat:@"%@%@\n", v5, NSStringFromClass(v8)];
  [v7 appendFormat:@"%@{\n", v5];
  [v7 appendFormat:@"%@Name: %@\n", v6, self->_name];
  [v7 appendFormat:@"%@Digest: %@\n", v6, self->_digest];
  if (self->_trusted) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  [v7 appendFormat:@"%@Trusted: %s\n", v6, v9];
  if (self->_productionMode) {
    v10 = "YES";
  }
  else {
    v10 = "NO";
  }
  [v7 appendFormat:@"%@Production mode: %s\n", v6, v10];
  if (self->_securityMode) {
    v11 = "YES";
  }
  else {
    v11 = "NO";
  }
  [v7 appendFormat:@"%@Security mode: %s\n", v6, v11];
  [v7 appendFormat:@"%@}", v5];
  return +[NSString stringWithString:v7];
}

- (NSString)name
{
  return self->_name;
}

- (NSData)digest
{
  return self->_digest;
}

- (BOOL)trusted
{
  return self->_trusted;
}

- (BOOL)productionMode
{
  return self->_productionMode;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

@end
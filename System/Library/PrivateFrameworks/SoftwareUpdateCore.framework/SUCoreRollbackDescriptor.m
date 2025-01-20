@interface SUCoreRollbackDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)rollbackEligible;
- (NSString)productBuildVersion;
- (NSString)productVersion;
- (NSString)releaseType;
- (NSString)restoreVersion;
- (SUCoreRollbackDescriptor)init;
- (SUCoreRollbackDescriptor)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setRestoreVersion:(id)a3;
- (void)setRollbackEligible:(BOOL)a3;
@end

@implementation SUCoreRollbackDescriptor

- (SUCoreRollbackDescriptor)init
{
  v21.receiver = self;
  v21.super_class = (Class)SUCoreRollbackDescriptor;
  v2 = [(SUCoreRollbackDescriptor *)&v21 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v4 = [v3 splatCryptex1RestoreVersion];
    restoreVersion = v2->_restoreVersion;
    v2->_restoreVersion = (NSString *)v4;

    v6 = NSString;
    v7 = [MEMORY[0x263F77DA0] sharedDevice];
    v8 = [v7 splatCryptex1ProductVersion];
    v9 = [MEMORY[0x263F77DA0] sharedDevice];
    v10 = [v9 splatCryptex1ProductVersionExtra];
    uint64_t v11 = [v6 stringWithFormat:@"%@ %@", v8, v10];
    productVersion = v2->_productVersion;
    v2->_productVersion = (NSString *)v11;

    v13 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v14 = [v13 splatCryptex1BuildVersion];
    productBuildVersion = v2->_productBuildVersion;
    v2->_productBuildVersion = (NSString *)v14;

    v16 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v17 = [v16 splatCryptex1ReleaseType];
    releaseType = v2->_releaseType;
    v2->_releaseType = (NSString *)v17;

    v19 = [MEMORY[0x263F77DA0] sharedDevice];
    v2->_rollbackEligible = [v19 hasEligibleRollback];
  }
  return v2;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(SUCoreRollbackDescriptor *)self restoreVersion];
  v5 = [(SUCoreRollbackDescriptor *)self productVersion];
  v6 = [(SUCoreRollbackDescriptor *)self productBuildVersion];
  v7 = [(SUCoreRollbackDescriptor *)self releaseType];
  BOOL v8 = [(SUCoreRollbackDescriptor *)self rollbackEligible];
  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  v10 = (void *)[v3 initWithFormat:@"restoreVersion:%@ productVersion:%@ producBuildVersion:%@ releaseType:%@ rollbackEligible:%@", v4, v5, v6, v7, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreRollbackDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUCoreRollbackDescriptor;
  v5 = [(SUCoreRollbackDescriptor *)&v11 init];
  if (v5)
  {
    -[SUCoreRollbackDescriptor setRollbackEligible:](v5, "setRollbackEligible:", [v4 decodeBoolForKey:@"rollbackEligible"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restoreVersion"];
    [(SUCoreRollbackDescriptor *)v5 setRestoreVersion:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productVersion"];
    [(SUCoreRollbackDescriptor *)v5 setProductVersion:v7];

    BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productBuildVersion"];
    [(SUCoreRollbackDescriptor *)v5 setProductBuildVersion:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseType"];
    [(SUCoreRollbackDescriptor *)v5 setReleaseType:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreRollbackDescriptor rollbackEligible](self, "rollbackEligible"), @"rollbackEligible");
  v5 = [(SUCoreRollbackDescriptor *)self restoreVersion];
  [v4 encodeObject:v5 forKey:@"restoreVersion"];

  v6 = [(SUCoreRollbackDescriptor *)self productVersion];
  [v4 encodeObject:v6 forKey:@"productVersion"];

  v7 = [(SUCoreRollbackDescriptor *)self productBuildVersion];
  [v4 encodeObject:v7 forKey:@"productBuildVersion"];

  id v8 = [(SUCoreRollbackDescriptor *)self releaseType];
  [v4 encodeObject:v8 forKey:@"releaseType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[SUCoreRollbackDescriptor allocWithZone:](SUCoreRollbackDescriptor, "allocWithZone:") init];
  [(SUCoreRollbackDescriptor *)v5 setRollbackEligible:[(SUCoreRollbackDescriptor *)self rollbackEligible]];
  v6 = [(SUCoreRollbackDescriptor *)self restoreVersion];
  v7 = (void *)[v6 copyWithZone:a3];
  [(SUCoreRollbackDescriptor *)v5 setRestoreVersion:v7];

  id v8 = [(SUCoreRollbackDescriptor *)self productVersion];
  v9 = (void *)[v8 copyWithZone:a3];
  [(SUCoreRollbackDescriptor *)v5 setProductVersion:v9];

  v10 = [(SUCoreRollbackDescriptor *)self productBuildVersion];
  objc_super v11 = (void *)[v10 copyWithZone:a3];
  [(SUCoreRollbackDescriptor *)v5 setProductBuildVersion:v11];

  v12 = [(SUCoreRollbackDescriptor *)self releaseType];
  v13 = (void *)[v12 copyWithZone:a3];
  [(SUCoreRollbackDescriptor *)v5 setReleaseType:v13];

  return v5;
}

- (BOOL)rollbackEligible
{
  return self->_rollbackEligible;
}

- (void)setRollbackEligible:(BOOL)a3
{
  self->_rollbackEligible = a3;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)restoreVersion
{
  return self->_restoreVersion;
}

- (void)setRestoreVersion:(id)a3
{
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);

  objc_storeStrong((id *)&self->_restoreVersion, 0);
}

@end
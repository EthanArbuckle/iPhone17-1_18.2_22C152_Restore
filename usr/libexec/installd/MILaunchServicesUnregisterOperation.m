@interface MILaunchServicesUnregisterOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MILaunchServicesUnregisterOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 registrationUUID:(id)a5 serialNumber:(unint64_t)a6;
- (MILaunchServicesUnregisterOperation)initWithCoder:(id)a3;
- (NSString)bundleID;
- (id)description;
- (unint64_t)domain;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MILaunchServicesUnregisterOperation

- (MILaunchServicesUnregisterOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 registrationUUID:(id)a5 serialNumber:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MILaunchServicesUnregisterOperation;
  v12 = [(MILaunchServicesOperation *)&v15 initWithOperationUUID:a5 serialNumber:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleID, a3);
    v13->_domain = a4;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesUnregisterOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MILaunchServicesUnregisterOperation;
  v5 = [(MILaunchServicesOperation *)&v17 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  if (!v5->_bundleID)
  {
    id v11 = (void *)MIInstallerErrorDomain;
    v12 = @"Missing bundle ID when deserializing unregistration";
    uint64_t v13 = 42;
LABEL_7:
    v14 = sub_100014A08((uint64_t)"-[MILaunchServicesUnregisterOperation initWithCoder:]", v13, v11, 186, 0, 0, v12, v8, v16);
    [v4 failWithError:v14];

    v10 = 0;
    goto LABEL_8;
  }
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
  v5->_domain = (unint64_t)[v9 unsignedIntegerValue];

  if ((MIIsValidInstallationDomain() & 1) == 0)
  {
    id v11 = (void *)MIInstallerErrorDomain;
    uint64_t v16 = (uint64_t)v5->_bundleID;
    v12 = @"Invalid installation domain value when deserializing unregistration for %@: %lu";
    uint64_t v13 = 48;
    goto LABEL_7;
  }
LABEL_4:
  v10 = v5;
LABEL_8:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MILaunchServicesUnregisterOperation;
  id v4 = a3;
  [(MILaunchServicesOperation *)&v7 encodeWithCoder:v4];
  v5 = [(MILaunchServicesUnregisterOperation *)self bundleID];
  [v4 encodeObject:v5 forKey:@"bundleID"];

  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:[(MILaunchServicesUnregisterOperation *)self domain]];
  [v4 encodeObject:v6 forKey:@"domain"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MILaunchServicesUnregisterOperation;
  if ([(MILaunchServicesOperation *)&v12 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [(MILaunchServicesUnregisterOperation *)self bundleID];
    objc_super v7 = [v5 bundleID];
    BOOL v8 = sub_100015338(v6, v7);

    if (v8)
    {
      id v9 = [v5 domain];
      BOOL v10 = v9 == (id)[(MILaunchServicesUnregisterOperation *)self domain];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)MILaunchServicesUnregisterOperation;
  unint64_t v3 = [(MILaunchServicesOperation *)&v8 hash];
  id v4 = [(MILaunchServicesUnregisterOperation *)self bundleID];
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ [(MILaunchServicesUnregisterOperation *)self domain] ^ v3;

  return v6;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = [(MILaunchServicesOperation *)self operationUUID];
  unint64_t v6 = [(MILaunchServicesOperation *)self serialNumber];
  objc_super v7 = [(MILaunchServicesUnregisterOperation *)self bundleID];
  [(MILaunchServicesUnregisterOperation *)self domain];
  objc_super v8 = MIStringForInstallationDomain();
  id v9 = +[NSString stringWithFormat:@"<%@: %@:%lu %@/%@>", v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
}

@end
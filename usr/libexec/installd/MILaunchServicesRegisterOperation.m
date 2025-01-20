@interface MILaunchServicesRegisterOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MILaunchServicesRegisterOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 personas:(id)a5 mountPoint:(id)a6 operationUUID:(id)a7 serialNumber:(unint64_t)a8;
- (MILaunchServicesRegisterOperation)initWithCoder:(id)a3;
- (NSSet)personaUniqueStrings;
- (NSString)bundleID;
- (NSURL)mountPoint;
- (id)description;
- (unint64_t)domain;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)updatePersonaUniqueStrings:(id)a3;
@end

@implementation MILaunchServicesRegisterOperation

- (MILaunchServicesRegisterOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 personas:(id)a5 mountPoint:(id)a6 operationUUID:(id)a7 serialNumber:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MILaunchServicesRegisterOperation;
  v17 = [(MILaunchServicesOperation *)&v23 initWithOperationUUID:a7 serialNumber:a8];
  if (v17)
  {
    v18 = (NSString *)[v14 copy];
    bundleID = v17->_bundleID;
    v17->_bundleID = v18;

    v17->_domain = a4;
    v20 = (NSSet *)[v15 copy];
    personaUniqueStrings = v17->_personaUniqueStrings;
    v17->_personaUniqueStrings = v20;

    objc_storeStrong((id *)&v17->_mountPoint, a6);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesRegisterOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MILaunchServicesRegisterOperation;
  v5 = [(MILaunchServicesOperation *)&v27 initWithCoder:v4];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  if (!v5->_bundleID)
  {
    v17 = sub_100014A08((uint64_t)"-[MILaunchServicesRegisterOperation initWithCoder:]", 44, MIInstallerErrorDomain, 186, 0, 0, @"Missing bundle ID when deserializing registration", v8, v26);
LABEL_11:
    [v4 failWithError:v17];

    id v16 = 0;
    goto LABEL_12;
  }
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
  v5->_domain = (unint64_t)[v9 unsignedIntegerValue];

  if ((MIIsValidInstallationDomain() & 1) == 0)
  {
    v18 = (void *)MIInstallerErrorDomain;
    uint64_t v19 = (uint64_t)v5->_bundleID;
    v20 = MIStringForInstallationDomain();
    sub_100014A08((uint64_t)"-[MILaunchServicesRegisterOperation initWithCoder:]", 50, v18, 186, 0, 0, @"Invalid installation domain value when deserializing registration for %@/%@", v21, v19);
    v17 = LABEL_10:;

    goto LABEL_11;
  }
  uint64_t v10 = objc_opt_class();
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
  uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"personaUniqueStrings"];
  personaUniqueStrings = v5->_personaUniqueStrings;
  v5->_personaUniqueStrings = (NSSet *)v12;

  if (!v5->_personaUniqueStrings)
  {
    v22 = (void *)MIInstallerErrorDomain;
    uint64_t v23 = (uint64_t)v5->_bundleID;
    v20 = MIStringForInstallationDomain();
    sub_100014A08((uint64_t)"-[MILaunchServicesRegisterOperation initWithCoder:]", 56, v22, 186, 0, 0, @"Missing persona unique strings when deserializing registration for %@/%@", v24, v23);
    goto LABEL_10;
  }
  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mountPoint"];
  mountPoint = v5->_mountPoint;
  v5->_mountPoint = (NSURL *)v14;

LABEL_6:
  id v16 = v5;
LABEL_12:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MILaunchServicesRegisterOperation;
  id v4 = a3;
  [(MILaunchServicesOperation *)&v9 encodeWithCoder:v4];
  v5 = [(MILaunchServicesRegisterOperation *)self bundleID];
  [v4 encodeObject:v5 forKey:@"bundleID"];

  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:[(MILaunchServicesRegisterOperation *)self domain]];
  [v4 encodeObject:v6 forKey:@"domain"];

  v7 = [(MILaunchServicesRegisterOperation *)self personaUniqueStrings];
  [v4 encodeObject:v7 forKey:@"personaUniqueStrings"];

  uint64_t v8 = [(MILaunchServicesRegisterOperation *)self mountPoint];
  [v4 encodeObject:v8 forKey:@"mountPoint"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MILaunchServicesRegisterOperation;
  if ([(MILaunchServicesOperation *)&v17 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [(MILaunchServicesRegisterOperation *)self bundleID];
    v7 = [v5 bundleID];
    BOOL v8 = sub_100015338(v6, v7);

    if (!v8) {
      goto LABEL_8;
    }
    id v9 = [v5 domain];
    if (v9 != (id)[(MILaunchServicesRegisterOperation *)self domain]) {
      goto LABEL_8;
    }
    uint64_t v10 = [(MILaunchServicesRegisterOperation *)self personaUniqueStrings];
    v11 = [v5 personaUniqueStrings];
    BOOL v12 = sub_100015338(v10, v11);

    if (v12)
    {
      v13 = [(MILaunchServicesRegisterOperation *)self mountPoint];
      uint64_t v14 = [v5 mountPoint];
      BOOL v15 = sub_100015338(v13, v14);
    }
    else
    {
LABEL_8:
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)MILaunchServicesRegisterOperation;
  unint64_t v3 = [(MILaunchServicesOperation *)&v12 hash];
  id v4 = [(MILaunchServicesRegisterOperation *)self bundleID];
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ [(MILaunchServicesRegisterOperation *)self domain];
  v7 = [(MILaunchServicesRegisterOperation *)self personaUniqueStrings];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];
  id v9 = [(MILaunchServicesRegisterOperation *)self mountPoint];
  unint64_t v10 = v8 ^ (unint64_t)[v9 hash] ^ v3;

  return v10;
}

- (void)updatePersonaUniqueStrings:(id)a3
{
  id v4 = (NSSet *)[a3 copy];
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v4;

  _objc_release_x1(v4, personaUniqueStrings);
}

- (id)description
{
  unint64_t v3 = [(MILaunchServicesRegisterOperation *)self personaUniqueStrings];
  id v4 = [v3 allObjects];
  unint64_t v5 = [v4 componentsJoinedByString:@", "];

  unint64_t v6 = [(MILaunchServicesRegisterOperation *)self mountPoint];
  v7 = (objc_class *)objc_opt_class();
  unint64_t v8 = NSStringFromClass(v7);
  id v9 = [(MILaunchServicesOperation *)self operationUUID];
  unint64_t v10 = [(MILaunchServicesOperation *)self serialNumber];
  v11 = [(MILaunchServicesRegisterOperation *)self bundleID];
  [(MILaunchServicesRegisterOperation *)self domain];
  uint64_t v12 = MIStringForInstallationDomain();
  v13 = (void *)v12;
  if (v6)
  {
    uint64_t v14 = [v6 path];
    BOOL v15 = +[NSString stringWithFormat:@"<%@: %@:%lu %@/%@ personas:[%@] mount:%@>", v8, v9, v10, v11, v13, v5, v14];
  }
  else
  {
    BOOL v15 = +[NSString stringWithFormat:@"<%@: %@:%lu %@/%@ personas:[%@]>", v8, v9, v10, v11, v12, v5];
  }

  return v15;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (NSSet)personaUniqueStrings
{
  return self->_personaUniqueStrings;
}

- (NSURL)mountPoint
{
  return self->_mountPoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountPoint, 0);
  objc_storeStrong((id *)&self->_personaUniqueStrings, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
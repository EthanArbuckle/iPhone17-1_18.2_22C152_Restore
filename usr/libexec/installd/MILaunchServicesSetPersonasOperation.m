@interface MILaunchServicesSetPersonasOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MILaunchServicesSetPersonasOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 personas:(id)a5 registrationUUID:(id)a6 serialNumber:(unint64_t)a7;
- (MILaunchServicesSetPersonasOperation)initWithCoder:(id)a3;
- (NSSet)personaUniqueStrings;
- (NSString)bundleID;
- (id)description;
- (unint64_t)domain;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MILaunchServicesSetPersonasOperation

- (MILaunchServicesSetPersonasOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 personas:(id)a5 registrationUUID:(id)a6 serialNumber:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MILaunchServicesSetPersonasOperation;
  v14 = [(MILaunchServicesOperation *)&v20 initWithOperationUUID:a6 serialNumber:a7];
  if (v14)
  {
    v15 = (NSString *)[v12 copy];
    bundleID = v14->_bundleID;
    v14->_bundleID = v15;

    v14->_domain = a4;
    v17 = (NSSet *)[v13 copy];
    personaUniqueStrings = v14->_personaUniqueStrings;
    v14->_personaUniqueStrings = v17;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesSetPersonasOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MILaunchServicesSetPersonasOperation;
  id v5 = [(MILaunchServicesOperation *)&v22 initWithCoder:v4];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  v7 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v6;

  if (!*((void *)v5 + 3))
  {
    v16 = (void *)MIInstallerErrorDomain;
    v17 = @"Missing bundle ID when deserializing registration";
    uint64_t v18 = 43;
LABEL_9:
    sub_100014A08((uint64_t)"-[MILaunchServicesSetPersonasOperation initWithCoder:]", v18, v16, 186, 0, 0, v17, v8, v21);
    goto LABEL_10;
  }
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
  *((void *)v5 + 4) = [v9 unsignedIntegerValue];

  if ((MIIsValidInstallationDomain() & 1) == 0)
  {
    sub_100014A08((uint64_t)"-[MILaunchServicesSetPersonasOperation initWithCoder:]", 49, MIInstallerErrorDomain, 186, 0, 0, @"Invalid installation domain value when deserializing registration for %@: %lu", v10, *((void *)v5 + 3));
    v19 = LABEL_10:;
    [v4 failWithError:v19];

    v15 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  id v12 = +[NSSet setWithObjects:v11];
  uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"personaUniqueStrings"];
  v14 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v13;

  if (!*((void *)v5 + 5))
  {
    v16 = (void *)MIInstallerErrorDomain;
    v17 = @"Missing persona unique strings when deserializing registration";
    uint64_t v18 = 55;
    goto LABEL_9;
  }
LABEL_5:
  v15 = (MILaunchServicesSetPersonasOperation *)v5;
LABEL_11:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MILaunchServicesSetPersonasOperation;
  id v4 = a3;
  [(MILaunchServicesOperation *)&v8 encodeWithCoder:v4];
  id v5 = [(MILaunchServicesSetPersonasOperation *)self bundleID];
  [v4 encodeObject:v5 forKey:@"bundleID"];

  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:[(MILaunchServicesSetPersonasOperation *)self domain]];
  [v4 encodeObject:v6 forKey:@"domain"];

  v7 = [(MILaunchServicesSetPersonasOperation *)self personaUniqueStrings];
  [v4 encodeObject:v7 forKey:@"personaUniqueStrings"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MILaunchServicesSetPersonasOperation;
  if ([(MILaunchServicesOperation *)&v14 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [(MILaunchServicesSetPersonasOperation *)self bundleID];
    v7 = [v5 bundleID];
    BOOL v8 = sub_100015338(v6, v7);

    if (v8
      && (id v9 = [v5 domain], v9 == (id)-[MILaunchServicesSetPersonasOperation domain](self, "domain")))
    {
      uint64_t v10 = [(MILaunchServicesSetPersonasOperation *)self personaUniqueStrings];
      uint64_t v11 = [v5 personaUniqueStrings];
      BOOL v12 = sub_100015338(v10, v11);
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)MILaunchServicesSetPersonasOperation;
  unint64_t v3 = [(MILaunchServicesOperation *)&v10 hash];
  id v4 = [(MILaunchServicesSetPersonasOperation *)self bundleID];
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ [(MILaunchServicesSetPersonasOperation *)self domain];
  v7 = [(MILaunchServicesSetPersonasOperation *)self personaUniqueStrings];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash] ^ v3;

  return v8;
}

- (id)description
{
  unint64_t v3 = [(MILaunchServicesSetPersonasOperation *)self personaUniqueStrings];
  id v4 = [v3 allObjects];
  unint64_t v5 = [v4 componentsJoinedByString:@", "];

  unint64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  unint64_t v8 = [(MILaunchServicesOperation *)self operationUUID];
  unint64_t v9 = [(MILaunchServicesOperation *)self serialNumber];
  objc_super v10 = [(MILaunchServicesSetPersonasOperation *)self bundleID];
  [(MILaunchServicesSetPersonasOperation *)self domain];
  uint64_t v11 = MIStringForInstallationDomain();
  BOOL v12 = +[NSString stringWithFormat:@"<%@: %@:%lu %@/%@ personas:[%@]>", v7, v8, v9, v10, v11, v5];

  return v12;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueStrings, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
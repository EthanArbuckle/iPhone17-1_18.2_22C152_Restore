@interface MILaunchServicesUnregisterMountPointOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MILaunchServicesUnregisterMountPointOperation)initWithCoder:(id)a3;
- (MILaunchServicesUnregisterMountPointOperation)initWithMountPoint:(id)a3 operationUUID:(id)a4 serialNumber:(unint64_t)a5;
- (NSURL)mountPoint;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MILaunchServicesUnregisterMountPointOperation

- (MILaunchServicesUnregisterMountPointOperation)initWithMountPoint:(id)a3 operationUUID:(id)a4 serialNumber:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MILaunchServicesUnregisterMountPointOperation;
  v10 = [(MILaunchServicesOperation *)&v13 initWithOperationUUID:a4 serialNumber:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_mountPoint, a3);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesUnregisterMountPointOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MILaunchServicesUnregisterMountPointOperation;
  v5 = [(MILaunchServicesOperation *)&v12 initWithCoder:v4];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"mountPoint"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        mountPoint = v5->_mountPoint,
        v5->_mountPoint = (NSURL *)v6,
        mountPoint,
        !v5->_mountPoint))
  {
    v10 = sub_100014A08((uint64_t)"-[MILaunchServicesUnregisterMountPointOperation initWithCoder:]", 39, MIInstallerErrorDomain, 186, 0, 0, @"Missing mount point when deserializing LS operation", v8, (uint64_t)v12.receiver);
    [v4 failWithError:v10];

    id v9 = 0;
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MILaunchServicesUnregisterMountPointOperation;
  id v4 = a3;
  [(MILaunchServicesOperation *)&v6 encodeWithCoder:v4];
  v5 = [(MILaunchServicesUnregisterMountPointOperation *)self mountPoint];
  [v4 encodeObject:v5 forKey:@"mountPoint"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MILaunchServicesUnregisterMountPointOperation;
  if ([(MILaunchServicesOperation *)&v10 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    objc_super v6 = [(MILaunchServicesUnregisterMountPointOperation *)self mountPoint];
    v7 = [v5 mountPoint];

    BOOL v8 = sub_100015338(v6, v7);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)MILaunchServicesUnregisterMountPointOperation;
  unint64_t v3 = [(MILaunchServicesOperation *)&v7 hash];
  id v4 = [(MILaunchServicesUnregisterMountPointOperation *)self mountPoint];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = [(MILaunchServicesOperation *)self operationUUID];
  unint64_t v6 = [(MILaunchServicesOperation *)self serialNumber];
  objc_super v7 = [(MILaunchServicesUnregisterMountPointOperation *)self mountPoint];
  BOOL v8 = [v7 path];
  id v9 = +[NSString stringWithFormat:@"<%@: %@:%lu mount:%@>", v4, v5, v6, v8];

  return v9;
}

- (NSURL)mountPoint
{
  return self->_mountPoint;
}

- (void).cxx_destruct
{
}

@end
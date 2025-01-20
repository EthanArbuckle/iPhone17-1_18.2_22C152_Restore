@interface MILaunchServicesOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MILaunchServicesOperation)initWithCoder:(id)a3;
- (MILaunchServicesOperation)initWithOperationUUID:(id)a3 serialNumber:(unint64_t)a4;
- (NSUUID)operationUUID;
- (id)description;
- (unint64_t)hash;
- (unint64_t)serialNumber;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MILaunchServicesOperation

- (MILaunchServicesOperation)initWithOperationUUID:(id)a3 serialNumber:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MILaunchServicesOperation;
  v8 = [(MILaunchServicesOperation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_operationUUID, a3);
    v9->_serialNumber = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MILaunchServicesOperation;
  v5 = [(MILaunchServicesOperation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationUUID"];
    operationUUID = v5->_operationUUID;
    v5->_operationUUID = (NSUUID *)v6;

    if (!v5->_operationUUID)
    {
      objc_super v11 = sub_100014A08((uint64_t)"-[MILaunchServicesOperation initWithCoder:]", 40, MIInstallerErrorDomain, 186, 0, 0, @"Missing operation UUID when deserializing LS operation", v8, (uint64_t)v13.receiver);
      [v4 failWithError:v11];

      v10 = 0;
      goto LABEL_6;
    }
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    v5->_serialNumber = (unint64_t)[v9 unsignedIntegerValue];
  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MILaunchServicesOperation *)self operationUUID];
  [v4 encodeObject:v5 forKey:@"operationUUID"];

  id v6 = +[NSNumber numberWithUnsignedInteger:[(MILaunchServicesOperation *)self serialNumber]];
  [v4 encodeObject:v6 forKey:@"serialNumber"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MILaunchServicesOperation *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(MILaunchServicesOperation *)self operationUUID];
      id v7 = [(MILaunchServicesOperation *)v5 operationUUID];
      BOOL v8 = sub_100015338(v6, v7);

      if (v8)
      {
        id v9 = [(MILaunchServicesOperation *)v5 serialNumber];
        BOOL v10 = v9 == (id)[(MILaunchServicesOperation *)self serialNumber];
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
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(MILaunchServicesOperation *)self operationUUID];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(MILaunchServicesOperation *)self serialNumber] ^ v4;

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  unint64_t v5 = [(MILaunchServicesOperation *)self operationUUID];
  id v6 = +[NSString stringWithFormat:@"<%@: %@:%lu>", v4, v5, [(MILaunchServicesOperation *)self serialNumber]];

  return v6;
}

- (NSUUID)operationUUID
{
  return self->_operationUUID;
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (void).cxx_destruct
{
}

@end
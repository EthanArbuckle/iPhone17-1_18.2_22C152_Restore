@interface REMReplicaManagerSerializedData
+ (BOOL)supportsSecureCoding;
+ (id)serializedDataRepresentingDiscardedReplicaManager;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRepresentingDiscardedReplicaManager;
- (NSData)managerData;
- (REMReplicaManagerSerializedData)initWithCoder:(id)a3;
- (REMReplicaManagerSerializedData)initWithManagerData:(id)a3 version:(unint64_t)a4;
- (id)description;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMReplicaManagerSerializedData

- (REMReplicaManagerSerializedData)initWithManagerData:(id)a3 version:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMReplicaManagerSerializedData;
  v8 = [(REMReplicaManagerSerializedData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_managerData, a3);
    v9->_version = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(REMReplicaManagerSerializedData *)self managerData];
  [v5 encodeObject:v4 forKey:@"managerData"];

  objc_msgSend(v5, "encodeInt64:forKey:", -[REMReplicaManagerSerializedData version](self, "version"), @"version");
}

- (REMReplicaManagerSerializedData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managerData"];
  if (v5)
  {
    self = -[REMReplicaManagerSerializedData initWithManagerData:version:](self, "initWithManagerData:version:", v5, [v4 decodeInt64ForKey:@"version"]);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMReplicaManagerSerializedData *)a3;
  id v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(REMReplicaManagerSerializedData *)self managerData];
      v8 = [(REMReplicaManagerSerializedData *)v6 managerData];
      if (v7 == v8)
      {
      }
      else
      {
        v9 = [(REMReplicaManagerSerializedData *)self managerData];
        v10 = [(REMReplicaManagerSerializedData *)v6 managerData];
        char v11 = [v9 isEqual:v10];

        if ((v11 & 1) == 0) {
          goto LABEL_5;
        }
      }
      unint64_t v13 = [(REMReplicaManagerSerializedData *)self version];
      BOOL v12 = v13 == [(REMReplicaManagerSerializedData *)v6 version];
      goto LABEL_9;
    }
LABEL_5:
    BOOL v12 = 0;
LABEL_9:

    goto LABEL_10;
  }
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(REMReplicaManagerSerializedData *)self version];
  v6 = [(REMReplicaManagerSerializedData *)self managerData];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p>{version: %llu; %ld bytes}",
    v4,
    self,
    v5,
  id v7 = [v6 length]);

  return v7;
}

+ (id)serializedDataRepresentingDiscardedReplicaManager
{
  v2 = [REMReplicaManagerSerializedData alloc];
  v3 = [MEMORY[0x1E4F1C9B8] data];
  uint64_t v4 = [(REMReplicaManagerSerializedData *)v2 initWithManagerData:v3 version:0];

  return v4;
}

- (BOOL)isRepresentingDiscardedReplicaManager
{
  if ([(REMReplicaManagerSerializedData *)self version]) {
    return 0;
  }
  uint64_t v4 = [(REMReplicaManagerSerializedData *)self managerData];
  BOOL v3 = [v4 length] == 0;

  return v3;
}

- (NSData)managerData
{
  return self->_managerData;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

@end
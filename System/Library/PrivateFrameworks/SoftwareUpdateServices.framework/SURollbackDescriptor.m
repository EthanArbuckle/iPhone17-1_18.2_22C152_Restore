@interface SURollbackDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)productBuildVersion;
- (NSString)productVersion;
- (NSString)releaseType;
- (NSString)restoreVersion;
- (SURollbackDescriptor)init;
- (SURollbackDescriptor)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setRestoreVersion:(id)a3;
@end

@implementation SURollbackDescriptor

- (SURollbackDescriptor)init
{
  v9.receiver = self;
  v9.super_class = (Class)SURollbackDescriptor;
  v2 = [(SURollbackDescriptor *)&v9 init];
  v3 = v2;
  if (v2)
  {
    restoreVersion = v2->_restoreVersion;
    v2->_restoreVersion = 0;

    productVersion = v3->_productVersion;
    v3->_productVersion = 0;

    productBuildVersion = v3->_productBuildVersion;
    v3->_productBuildVersion = 0;

    releaseType = v3->_releaseType;
    v3->_releaseType = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SURollbackDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SURollbackDescriptor;
  v5 = [(SURollbackDescriptor *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restoreVersion"];
    [(SURollbackDescriptor *)v5 setRestoreVersion:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productVersion"];
    [(SURollbackDescriptor *)v5 setProductVersion:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productBuildVersion"];
    [(SURollbackDescriptor *)v5 setProductBuildVersion:v8];

    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseType"];
    [(SURollbackDescriptor *)v5 setReleaseType:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SURollbackDescriptor *)self restoreVersion];
  [v4 encodeObject:v5 forKey:@"restoreVersion"];

  v6 = [(SURollbackDescriptor *)self productVersion];
  [v4 encodeObject:v6 forKey:@"productVersion"];

  v7 = [(SURollbackDescriptor *)self productBuildVersion];
  [v4 encodeObject:v7 forKey:@"productBuildVersion"];

  id v8 = [(SURollbackDescriptor *)self releaseType];
  [v4 encodeObject:v8 forKey:@"releaseType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(SURollbackDescriptor *)self restoreVersion];
  [v4 setRestoreVersion:v5];

  v6 = [(SURollbackDescriptor *)self productVersion];
  [v4 setProductVersion:v6];

  v7 = [(SURollbackDescriptor *)self productBuildVersion];
  [v4 setProductBuildVersion:v7];

  id v8 = [(SURollbackDescriptor *)self releaseType];
  [v4 setReleaseType:v8];

  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SURollbackDescriptor *)self restoreVersion];
  v5 = [(SURollbackDescriptor *)self productVersion];
  v6 = [(SURollbackDescriptor *)self productBuildVersion];
  v7 = [(SURollbackDescriptor *)self releaseType];
  id v8 = [v3 stringWithFormat:@"SURollbackDescriptor:\n              RestoreVersion: %@\n              ProductVersion: %@\n              ProductBuildVersion: %@\n              ReleaseType: %@\n", v4, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 restoreVersion];
    if (v7
      || ([(SURollbackDescriptor *)self restoreVersion],
          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = [v6 restoreVersion];
      objc_super v9 = [(SURollbackDescriptor *)self restoreVersion];
      int v10 = [v8 isEqualToString:v9];

      if (v7)
      {

        if (!v10) {
          goto LABEL_24;
        }
      }
      else
      {

        if ((v10 & 1) == 0) {
          goto LABEL_24;
        }
      }
    }
    v12 = [v6 productVersion];
    if (v12
      || ([(SURollbackDescriptor *)self productVersion],
          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = [v6 productVersion];
      v14 = [(SURollbackDescriptor *)self productVersion];
      int v15 = [v13 isEqualToString:v14];

      if (v12)
      {

        if (!v15) {
          goto LABEL_24;
        }
      }
      else
      {

        if ((v15 & 1) == 0) {
          goto LABEL_24;
        }
      }
    }
    v16 = [v6 productBuildVersion];
    if (!v16)
    {
      v3 = [(SURollbackDescriptor *)self productBuildVersion];
      if (!v3)
      {
LABEL_19:
        v20 = [v6 releaseType];
        if (v20
          || ([(SURollbackDescriptor *)self releaseType],
              (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v21 = [v6 releaseType];
          v22 = [(SURollbackDescriptor *)self releaseType];
          int v23 = [v21 isEqualToString:v22] ^ 1;

          if (v20)
          {
LABEL_29:

            char v11 = v23 ^ 1;
            goto LABEL_25;
          }
        }
        else
        {
          LOBYTE(v23) = 0;
        }

        goto LABEL_29;
      }
    }
    v17 = [v6 productBuildVersion];
    v18 = [(SURollbackDescriptor *)self productBuildVersion];
    int v19 = [v17 isEqualToString:v18];

    if (v16)
    {

      if (v19) {
        goto LABEL_19;
      }
    }
    else
    {

      if (v19) {
        goto LABEL_19;
      }
    }
LABEL_24:
    char v11 = 0;
LABEL_25:

    goto LABEL_26;
  }
  char v11 = 0;
LABEL_26:

  return v11;
}

- (NSString)restoreVersion
{
  return self->_restoreVersion;
}

- (void)setRestoreVersion:(id)a3
{
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
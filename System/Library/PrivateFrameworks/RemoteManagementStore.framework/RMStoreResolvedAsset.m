@interface RMStoreResolvedAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResolvedAsset:(id)a3;
- (NSData)assetData;
- (NSData)assetKeychainReference;
- (NSString)assetKeychainUserName;
- (NSURL)assetFile;
- (RMStoreResolvedAsset)initWithCoder:(id)a3;
- (RMStoreResolvedAsset)initWithData:(id)a3;
- (RMStoreResolvedAsset)initWithFile:(id)a3;
- (RMStoreResolvedAsset)initWithKeychainReference:(id)a3;
- (RMStoreResolvedAsset)initWithKeychainReference:(id)a3 userName:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMStoreResolvedAsset

- (RMStoreResolvedAsset)initWithData:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RMStoreResolvedAsset;
  v6 = [(RMStoreResolvedAsset *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetData, a3);
    assetFile = v7->_assetFile;
    v7->_assetFile = 0;

    assetKeychainReference = v7->_assetKeychainReference;
    v7->_assetKeychainReference = 0;

    assetKeychainUserName = v7->_assetKeychainUserName;
    v7->_assetKeychainUserName = 0;
  }
  return v7;
}

- (RMStoreResolvedAsset)initWithFile:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RMStoreResolvedAsset;
  v6 = [(RMStoreResolvedAsset *)&v12 init];
  v7 = v6;
  if (v6)
  {
    assetData = v6->_assetData;
    v6->_assetData = 0;

    objc_storeStrong((id *)&v7->_assetFile, a3);
    assetKeychainReference = v7->_assetKeychainReference;
    v7->_assetKeychainReference = 0;

    assetKeychainUserName = v7->_assetKeychainUserName;
    v7->_assetKeychainUserName = 0;
  }
  return v7;
}

- (RMStoreResolvedAsset)initWithKeychainReference:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RMStoreResolvedAsset;
  v6 = [(RMStoreResolvedAsset *)&v12 init];
  v7 = v6;
  if (v6)
  {
    assetData = v6->_assetData;
    v6->_assetData = 0;

    assetFile = v7->_assetFile;
    v7->_assetFile = 0;

    objc_storeStrong((id *)&v7->_assetKeychainReference, a3);
    assetKeychainUserName = v7->_assetKeychainUserName;
    v7->_assetKeychainUserName = 0;
  }
  return v7;
}

- (RMStoreResolvedAsset)initWithKeychainReference:(id)a3 userName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RMStoreResolvedAsset;
  v9 = [(RMStoreResolvedAsset *)&v14 init];
  v10 = v9;
  if (v9)
  {
    assetData = v9->_assetData;
    v9->_assetData = 0;

    assetFile = v10->_assetFile;
    v10->_assetFile = 0;

    objc_storeStrong((id *)&v10->_assetKeychainReference, a3);
    objc_storeStrong((id *)&v10->_assetKeychainUserName, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMStoreResolvedAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asset-data"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asset-file"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asset-keychain-reference"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asset-keychain-username"];

  if (v5)
  {
    v9 = [(RMStoreResolvedAsset *)self initWithData:v5];
  }
  else if (v6)
  {
    v9 = [(RMStoreResolvedAsset *)self initWithFile:v6];
  }
  else
  {
    v9 = [(RMStoreResolvedAsset *)self initWithKeychainReference:v7 userName:v8];
  }
  v10 = v9;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RMStoreResolvedAsset *)self assetData];
  [v4 encodeObject:v5 forKey:@"asset-data"];

  v6 = [(RMStoreResolvedAsset *)self assetFile];
  [v4 encodeObject:v6 forKey:@"asset-file"];

  id v7 = [(RMStoreResolvedAsset *)self assetKeychainReference];
  [v4 encodeObject:v7 forKey:@"asset-keychain-reference"];

  id v8 = [(RMStoreResolvedAsset *)self assetKeychainUserName];
  [v4 encodeObject:v8 forKey:@"asset-keychain-username"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RMStoreResolvedAsset *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(RMStoreResolvedAsset *)self isEqualToResolvedAsset:v4];
  }

  return v5;
}

- (BOOL)isEqualToResolvedAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RMStoreResolvedAsset *)self assetData];
  v6 = [v4 assetData];
  id v7 = v5;
  id v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  char v10 = 0;
  v11 = v8;
  id v12 = v7;
  if (!v7 || !v8) {
    goto LABEL_29;
  }
  int v13 = [v7 isEqual:v8];

  if (v13)
  {
LABEL_7:
    objc_super v14 = [(RMStoreResolvedAsset *)self assetFile];
    v15 = [v4 assetFile];
    id v12 = v14;
    id v16 = v15;
    v11 = v16;
    if (v12 == v16)
    {
    }
    else
    {
      char v10 = 0;
      v17 = v16;
      id v18 = v12;
      if (!v12 || !v16) {
        goto LABEL_28;
      }
      int v19 = [v12 isEqual:v16];

      if (!v19)
      {
        char v10 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    v20 = [(RMStoreResolvedAsset *)self assetKeychainReference];
    v21 = [v4 assetKeychainReference];
    id v18 = v20;
    id v22 = v21;
    v30 = v22;
    if (v18 != v22)
    {
      char v10 = 0;
      if (v18)
      {
        v23 = v22;
        id v24 = v18;
        if (v22)
        {
          int v25 = [v18 isEqual:v22];

          if (!v25)
          {
            char v10 = 0;
LABEL_27:
            v17 = v30;
LABEL_28:

            goto LABEL_29;
          }
          goto LABEL_19;
        }
      }
      else
      {
        v23 = v22;
        id v24 = 0;
      }
LABEL_26:

      goto LABEL_27;
    }

LABEL_19:
    v26 = [(RMStoreResolvedAsset *)self assetKeychainUserName];
    v27 = [v4 assetKeychainUserName];
    id v24 = v26;
    id v28 = v27;
    v23 = v28;
    if (v24 == v28)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v24 && v28) {
        char v10 = [v24 isEqual:v28];
      }
    }

    goto LABEL_26;
  }
  char v10 = 0;
LABEL_30:

  return v10;
}

- (NSData)assetData
{
  return self->_assetData;
}

- (NSURL)assetFile
{
  return self->_assetFile;
}

- (NSData)assetKeychainReference
{
  return self->_assetKeychainReference;
}

- (NSString)assetKeychainUserName
{
  return self->_assetKeychainUserName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetKeychainUserName, 0);
  objc_storeStrong((id *)&self->_assetKeychainReference, 0);
  objc_storeStrong((id *)&self->_assetFile, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
}

@end
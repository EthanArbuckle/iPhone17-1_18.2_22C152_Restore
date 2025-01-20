@interface PLPrefetchResourceIdentifier
+ (id)resourceDescriptionWithAssetUuid:(id)a3 resourceVersion:(unsigned int)a4 cplType:(unint64_t)a5 recipeID:(unsigned int)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)assetUuid;
- (PLPrefetchResourceIdentifier)initWithAssetUuid:(id)a3 version:(unsigned int)a4 cplType:(unint64_t)a5 recipeID:(unsigned int)a6;
- (id)description;
- (unint64_t)cplType;
- (unint64_t)hash;
- (unsigned)recipeID;
- (unsigned)version;
@end

@implementation PLPrefetchResourceIdentifier

- (void).cxx_destruct
{
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (unint64_t)cplType
{
  return self->_cplType;
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)assetUuid
{
  return self->_assetUuid;
}

- (id)description
{
  v3 = objc_opt_class();
  assetUuid = self->_assetUuid;
  unint64_t cplType = self->_cplType;
  uint64_t version = self->_version;
  uint64_t recipeID = self->_recipeID;
  return (id)[v3 resourceDescriptionWithAssetUuid:assetUuid resourceVersion:version cplType:cplType recipeID:recipeID];
}

- (BOOL)isEqual:(id)a3
{
  v6 = (PLPrefetchResourceIdentifier *)a3;
  if (self == v6)
  {
    BOOL v8 = 1;
    goto LABEL_20;
  }
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    v9 = v6;
    v10 = [(PLPrefetchResourceIdentifier *)v9 assetUuid];
    if (v10 || self->_assetUuid)
    {
      uint64_t v11 = [(PLPrefetchResourceIdentifier *)v9 assetUuid];
      if (!v11)
      {
        BOOL v8 = 0;
        goto LABEL_19;
      }
      v3 = (void *)v11;
      assetUuid = self->_assetUuid;
      v4 = [(PLPrefetchResourceIdentifier *)v9 assetUuid];
      if (![(NSString *)assetUuid isEqual:v4])
      {
        BOOL v14 = 0;
        goto LABEL_18;
      }
      int v13 = 1;
    }
    else
    {
      int v13 = 0;
    }
    unsigned int version = self->_version;
    if (version == [(PLPrefetchResourceIdentifier *)v9 version])
    {
      unint64_t cplType = self->_cplType;
      if (cplType == [(PLPrefetchResourceIdentifier *)v9 cplType])
      {
        unsigned int recipeID = self->_recipeID;
        BOOL v14 = recipeID == [(PLPrefetchResourceIdentifier *)v9 recipeID];
        BOOL v8 = v14;
        if ((v13 & 1) == 0) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    BOOL v14 = 0;
    BOOL v8 = 0;
    if (v13)
    {
LABEL_18:

      BOOL v8 = v14;
    }
LABEL_19:

    goto LABEL_20;
  }
  BOOL v8 = 0;
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  return (self->_version | (16 * self->_cplType)) ^ [(NSString *)self->_assetUuid hash];
}

- (PLPrefetchResourceIdentifier)initWithAssetUuid:(id)a3 version:(unsigned int)a4 cplType:(unint64_t)a5 recipeID:(unsigned int)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLPrefetchResourceIdentifier;
  v12 = [(PLPrefetchResourceIdentifier *)&v15 init];
  int v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetUuid, a3);
    v13->_unint64_t cplType = a5;
    v13->_unsigned int version = a4;
    v13->_unsigned int recipeID = a6;
  }

  return v13;
}

+ (id)resourceDescriptionWithAssetUuid:(id)a3 resourceVersion:(unsigned int)a4 cplType:(unint64_t)a5 recipeID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  v9 = NSString;
  id v10 = a3;
  if (a4 > 2) {
    id v11 = @"cur";
  }
  else {
    id v11 = off_1E58642E0[a4];
  }
  v12 = v11;
  int v13 = [MEMORY[0x1E4F59940] shortDescriptionForResourceType:a5];
  BOOL v14 = [v9 stringWithFormat:@"%@-%@-%@(%u)", v10, v12, v13, v6];

  return v14;
}

@end
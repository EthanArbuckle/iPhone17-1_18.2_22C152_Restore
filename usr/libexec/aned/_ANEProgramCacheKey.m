@interface _ANEProgramCacheKey
+ (_ANEProgramCacheKey)new;
+ (_ANEProgramCacheKey)programCacheKeyWithModel:(id)a3 bundleID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCacheKey:(id)a3;
- (NSString)bundleID;
- (NSString)cacheURLIdentifier;
- (NSString)modelKey;
- (NSString)modelPath;
- (_ANEProgramCacheKey)init;
- (_ANEProgramCacheKey)initWithModelIdentifier:(id)a3 modelPerfStatsMask:(unsigned int)a4 bundleID:(id)a5;
- (_ANEProgramCacheKey)initWithModelPath:(id)a3 modelKey:(id)a4 modelPerfStatsMask:(unsigned int)a5 bundleID:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)modelPerfStatsMask;
@end

@implementation _ANEProgramCacheKey

+ (_ANEProgramCacheKey)new
{
  return 0;
}

- (_ANEProgramCacheKey)init
{
  return 0;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(_ANEProgramCacheKey *)self modelPath];
  v6 = [(_ANEProgramCacheKey *)self modelKey];
  v7 = [(_ANEProgramCacheKey *)self cacheURLIdentifier];
  uint64_t v8 = [(_ANEProgramCacheKey *)self modelPerfStatsMask];
  v9 = [(_ANEProgramCacheKey *)self bundleID];
  v10 = +[NSString stringWithFormat:@"%@: { modelPath=%@ : modelKey=%@ : cacheURLIdentifier=%@ : modelPerfStatsMask=%u : bundleID=%@ }", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (_ANEProgramCacheKey)initWithModelPath:(id)a3 modelKey:(id)a4 modelPerfStatsMask:(unsigned int)a5 bundleID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_ANEProgramCacheKey;
  v13 = [(_ANEProgramCacheKey *)&v22 init];
  if (v13)
  {
    v14 = (NSString *)[v10 copy];
    modelPath = v13->_modelPath;
    v13->_modelPath = v14;

    v16 = (NSString *)[v11 copy];
    modelKey = v13->_modelKey;
    v13->_modelKey = v16;

    v13->_modelPerfStatsMask = a5;
    v18 = (NSString *)[v12 copy];
    bundleID = v13->_bundleID;
    v13->_bundleID = v18;

    cacheURLIdentifier = v13->_cacheURLIdentifier;
    v13->_cacheURLIdentifier = 0;
  }
  return v13;
}

- (_ANEProgramCacheKey)initWithModelIdentifier:(id)a3 modelPerfStatsMask:(unsigned int)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_ANEProgramCacheKey;
  id v10 = [(_ANEProgramCacheKey *)&v18 init];
  if (v10)
  {
    id v11 = (NSString *)[v8 copy];
    cacheURLIdentifier = v10->_cacheURLIdentifier;
    v10->_cacheURLIdentifier = v11;

    v10->_modelPerfStatsMask = a4;
    v13 = (NSString *)[v9 copy];
    bundleID = v10->_bundleID;
    v10->_bundleID = v13;

    modelPath = v10->_modelPath;
    v10->_modelPath = 0;

    modelKey = v10->_modelKey;
    v10->_modelKey = 0;
  }
  return v10;
}

+ (_ANEProgramCacheKey)programCacheKeyWithModel:(id)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 getCacheURLIdentifier];

  id v9 = objc_alloc((Class)a1);
  if (v8)
  {
    id v10 = [v7 getCacheURLIdentifier];
    id v11 = [v7 perfStatsMask];

    id v12 = [v9 initWithModelIdentifier:v10 modelPerfStatsMask:v11 bundleID:v6];
  }
  else
  {
    id v10 = [v7 modelURL];
    uint64_t v13 = [v10 path];
    v14 = [v7 key];
    id v15 = [v7 perfStatsMask];

    id v12 = [v9 initWithModelPath:v13 modelKey:v14 modelPerfStatsMask:v15 bundleID:v6];
    id v6 = (id)v13;
  }

  return (_ANEProgramCacheKey *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(_ANEProgramCacheKey *)self cacheURLIdentifier];

  id v5 = objc_alloc((Class)objc_opt_class());
  if (v4)
  {
    id v6 = [(_ANEProgramCacheKey *)self cacheURLIdentifier];
    uint64_t v7 = [(_ANEProgramCacheKey *)self modelPerfStatsMask];
    id v8 = [(_ANEProgramCacheKey *)self bundleID];
    id v9 = [v5 initWithModelIdentifier:v6 modelPerfStatsMask:v7 bundleID:v8];
  }
  else
  {
    id v6 = [(_ANEProgramCacheKey *)self modelPath];
    id v8 = [(_ANEProgramCacheKey *)self modelKey];
    uint64_t v10 = [(_ANEProgramCacheKey *)self modelPerfStatsMask];
    id v11 = [(_ANEProgramCacheKey *)self bundleID];
    id v9 = [v5 initWithModelPath:v6 modelKey:v8 modelPerfStatsMask:v10 bundleID:v11];
  }
  return v9;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(_ANEProgramCacheKey *)self cacheURLIdentifier];

    if (v5)
    {
      id v6 = [(_ANEProgramCacheKey *)self cacheURLIdentifier];
      uint64_t v7 = [v4 cacheURLIdentifier];
      unsigned __int8 v8 = [v6 isEqualToString:v7];
    }
    else
    {
      uint64_t v10 = [(_ANEProgramCacheKey *)self modelPath];
      id v11 = [v4 modelPath];
      unsigned __int8 v12 = [v10 isEqualToString:v11];

      uint64_t v13 = [(_ANEProgramCacheKey *)self modelKey];
      v14 = [v4 modelKey];
      unsigned __int8 v15 = [v13 isEqualToString:v14];

      unsigned __int8 v8 = v12 & v15;
    }
    unsigned int v16 = [(_ANEProgramCacheKey *)self modelPerfStatsMask];
    unsigned int v17 = [v4 modelPerfStatsMask];
    objc_super v18 = [(_ANEProgramCacheKey *)self bundleID];
    v19 = [v4 bundleID];
    unsigned __int8 v20 = [v18 isEqualToString:v19];

    if (v16 == v17) {
      unsigned __int8 v21 = v8;
    }
    else {
      unsigned __int8 v21 = 0;
    }
    char v9 = v21 & v20;
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_ANEProgramCacheKey *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(_ANEProgramCacheKey *)self isEqualToCacheKey:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_ANEProgramCacheKey *)self modelPath];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(_ANEProgramCacheKey *)self modelKey];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  uint64_t v7 = [(_ANEProgramCacheKey *)self bundleID];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];
  uint64_t v9 = [(_ANEProgramCacheKey *)self modelPerfStatsMask];
  uint64_t v10 = [(_ANEProgramCacheKey *)self cacheURLIdentifier];
  unint64_t v11 = v8 ^ v9 ^ (unint64_t)[v10 hash];

  return v11;
}

- (NSString)modelPath
{
  return self->_modelPath;
}

- (NSString)modelKey
{
  return self->_modelKey;
}

- (NSString)cacheURLIdentifier
{
  return self->_cacheURLIdentifier;
}

- (unsigned)modelPerfStatsMask
{
  return self->_modelPerfStatsMask;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_cacheURLIdentifier, 0);
  objc_storeStrong((id *)&self->_modelKey, 0);

  objc_storeStrong((id *)&self->_modelPath, 0);
}

@end
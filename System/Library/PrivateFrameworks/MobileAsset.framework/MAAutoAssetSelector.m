@interface MAAutoAssetSelector
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MAAutoAssetSelector)initWithCoder:(id)a3;
- (NSData)downloadDecryptionKey;
- (NSString)assetSpecifier;
- (NSString)assetType;
- (NSString)assetVersion;
- (id)copy;
- (id)copyClearingWriteOnlyFields;
- (id)initForAssetType:(id)a3;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5 usingDecryptionKey:(id)a6;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5;
- (id)newSummaryDictionary;
- (id)persistedEntryID;
- (id)shortName;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetVersion:(id)a3;
@end

@implementation MAAutoAssetSelector

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadDecryptionKey, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetSpecifier, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5 usingDecryptionKey:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MAAutoAssetSelector;
  v15 = [(MAAutoAssetSelector *)&v18 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetType, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (id)summary
{
  v3 = [(MAAutoAssetSelector *)self assetVersion];
  if (v3)
  {
    id v4 = [NSString alloc];
    v5 = [(MAAutoAssetSelector *)self assetVersion];
    v6 = (__CFString *)[v4 initWithFormat:@"|version:%@", v5];
  }
  else
  {
    v6 = @"(any version)";
  }

  v7 = NSString;
  v8 = [(MAAutoAssetSelector *)self assetType];
  v9 = [(MAAutoAssetSelector *)self assetSpecifier];
  v10 = [(MAAutoAssetSelector *)self downloadDecryptionKey];
  id v11 = @"|decryption:Y";
  if (!v10) {
    id v11 = &stru_1F0A75970;
  }
  id v12 = [v7 stringWithFormat:@"type:%@|specifier:%@%@%@", v8, v9, v6, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (MAAutoAssetSelector *)a3;
  if (v5 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      uint64_t v7 = [(MAAutoAssetSelector *)v6 assetType];
      if (!v7) {
        goto LABEL_28;
      }
      v8 = (void *)v7;
      uint64_t v9 = [(MAAutoAssetSelector *)v6 assetSpecifier];
      if (!v9)
      {
        char v14 = 0;
LABEL_40:

        goto LABEL_41;
      }
      v10 = (void *)v9;
      id v11 = [(MAAutoAssetSelector *)v6 assetVersion];
      if (!v11)
      {
        uint64_t v15 = [(MAAutoAssetSelector *)self assetVersion];
        if (v15)
        {
          v16 = (void *)v15;
          char v14 = 0;
          goto LABEL_38;
        }
      }
      id v12 = [(MAAutoAssetSelector *)v6 assetVersion];
      if (v12)
      {
        v3 = [(MAAutoAssetSelector *)self assetVersion];
        if (!v3)
        {
          LOBYTE(v13) = 1;
          goto LABEL_26;
        }
      }
      v17 = [(MAAutoAssetSelector *)v6 downloadDecryptionKey];
      if (!v17)
      {
        v20 = [(MAAutoAssetSelector *)self downloadDecryptionKey];
        if (v20)
        {
          LOBYTE(v13) = 1;
          goto LABEL_25;
        }
      }
      uint64_t v13 = [(MAAutoAssetSelector *)v6 downloadDecryptionKey];
      if (v13)
      {
        v26 = v3;
        objc_super v18 = [(MAAutoAssetSelector *)self downloadDecryptionKey];
        BOOL v19 = v18 == 0;

        if (v17)
        {
          LOBYTE(v13) = v19;
          v3 = v26;
          goto LABEL_21;
        }
        v20 = 0;
        LOBYTE(v13) = v19;
        v3 = v26;
      }
      else
      {
        if (v17)
        {
LABEL_21:

          if (!v12)
          {
LABEL_27:

            if ((v13 & 1) == 0)
            {
              v8 = [(MAAutoAssetSelector *)v6 assetType];
              v10 = [(MAAutoAssetSelector *)self assetType];
              if (![v8 isEqualToString:v10])
              {
                char v14 = 0;
LABEL_39:

                goto LABEL_40;
              }
              v16 = [(MAAutoAssetSelector *)v6 assetSpecifier];
              v21 = [(MAAutoAssetSelector *)self assetSpecifier];
              if ([v16 isEqualToString:v21])
              {
                v22 = [(MAAutoAssetSelector *)v6 assetVersion];
                if (v22)
                {
                  v23 = [(MAAutoAssetSelector *)v6 assetVersion];
                  v24 = [(MAAutoAssetSelector *)self assetVersion];
                  char v14 = [v23 isEqualToString:v24];
                }
                else
                {
                  char v14 = 1;
                }
              }
              else
              {
                char v14 = 0;
              }

LABEL_38:
              goto LABEL_39;
            }
LABEL_28:
            char v14 = 0;
LABEL_41:

            goto LABEL_42;
          }
LABEL_26:

          goto LABEL_27;
        }
        v20 = 0;
      }
LABEL_25:

      if (!v12) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    char v14 = 0;
  }
LABEL_42:

  return v14;
}

- (id)persistedEntryID
{
  v3 = [(MAAutoAssetSelector *)self assetVersion];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28E78]);
    v5 = [(MAAutoAssetSelector *)self assetVersion];
    v6 = (void *)[v4 initWithString:v5];

    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @",", @"_", 2, 0, objc_msgSend(v6, "length"));
    id v7 = [NSString alloc];
    v8 = [(MAAutoAssetSelector *)self assetType];
    uint64_t v9 = [(MAAutoAssetSelector *)self assetSpecifier];
    v10 = (void *)[v7 initWithFormat:@"%@_%@_%@", v8, v9, v6];

LABEL_5:
    goto LABEL_6;
  }
  id v11 = [(MAAutoAssetSelector *)self assetSpecifier];

  id v12 = [NSString alloc];
  uint64_t v13 = [(MAAutoAssetSelector *)self assetType];
  v6 = (void *)v13;
  if (v11)
  {
    v8 = [(MAAutoAssetSelector *)self assetSpecifier];
    v10 = (void *)[v12 initWithFormat:@"%@_%@", v6, v8];
    goto LABEL_5;
  }
  v10 = (void *)[v12 initWithFormat:@"%@_ENTIRE_ASSET_TYPE", v13];
LABEL_6:

  return v10;
}

- (NSString)assetSpecifier
{
  return self->_assetSpecifier;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (NSData)downloadDecryptionKey
{
  return self->_downloadDecryptionKey;
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4
{
  return [(MAAutoAssetSelector *)self initForAssetType:a3 withAssetSpecifier:a4 matchingAssetVersion:0 usingDecryptionKey:0];
}

- (MAAutoAssetSelector)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAAutoAssetSelector;
  v5 = [(MAAutoAssetSelector *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSpecifier"];
    assetSpecifier = v5->_assetSpecifier;
    v5->_assetSpecifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetVersion"];
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadDecryptionKey"];
    downloadDecryptionKey = v5->_downloadDecryptionKey;
    v5->_downloadDecryptionKey = (NSData *)v12;
  }
  return v5;
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5
{
  return [(MAAutoAssetSelector *)self initForAssetType:a3 withAssetSpecifier:a4 matchingAssetVersion:0 usingDecryptionKey:a5];
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5
{
  return [(MAAutoAssetSelector *)self initForAssetType:a3 withAssetSpecifier:a4 matchingAssetVersion:a5 usingDecryptionKey:0];
}

- (id)initForAssetType:(id)a3
{
  return [(MAAutoAssetSelector *)self initForAssetType:a3 withAssetSpecifier:0 matchingAssetVersion:0 usingDecryptionKey:0];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetSelector *)self assetType];
  [v4 encodeObject:v5 forKey:@"assetType"];

  uint64_t v6 = [(MAAutoAssetSelector *)self assetSpecifier];
  [v4 encodeObject:v6 forKey:@"assetSpecifier"];

  id v7 = [(MAAutoAssetSelector *)self assetVersion];
  [v4 encodeObject:v7 forKey:@"assetVersion"];

  id v8 = [(MAAutoAssetSelector *)self downloadDecryptionKey];
  [v4 encodeObject:v8 forKey:@"downloadDecryptionKey"];
}

- (id)copy
{
  v3 = [MAAutoAssetSelector alloc];
  id v4 = [(MAAutoAssetSelector *)self assetType];
  v5 = [(MAAutoAssetSelector *)self assetSpecifier];
  uint64_t v6 = [(MAAutoAssetSelector *)self assetVersion];
  id v7 = [(MAAutoAssetSelector *)self downloadDecryptionKey];
  id v8 = [(MAAutoAssetSelector *)v3 initForAssetType:v4 withAssetSpecifier:v5 matchingAssetVersion:v6 usingDecryptionKey:v7];

  return v8;
}

- (id)copyClearingWriteOnlyFields
{
  v3 = [MAAutoAssetSelector alloc];
  id v4 = [(MAAutoAssetSelector *)self assetType];
  v5 = [(MAAutoAssetSelector *)self assetSpecifier];
  uint64_t v6 = [(MAAutoAssetSelector *)self assetVersion];
  id v7 = [(MAAutoAssetSelector *)v3 initForAssetType:v4 withAssetSpecifier:v5 matchingAssetVersion:v6];

  return v7;
}

- (id)shortName
{
  v3 = [(MAAutoAssetSelector *)self assetVersion];

  if (v3)
  {
    id v4 = [NSString alloc];
    v5 = [(MAAutoAssetSelector *)self assetSpecifier];
    uint64_t v6 = [(MAAutoAssetSelector *)self assetVersion];
    id v7 = (void *)[v4 initWithFormat:@"%@(%@)", v5, v6];
  }
  else
  {
    id v8 = [(MAAutoAssetSelector *)self assetSpecifier];

    if (v8) {
      [(MAAutoAssetSelector *)self assetSpecifier];
    }
    else {
    id v7 = [(MAAutoAssetSelector *)self assetType];
    }
  }
  return v7;
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MAAutoAssetSelector *)self assetType];
  [v3 setSafeObject:v4 forKey:@"assetType"];

  v5 = [(MAAutoAssetSelector *)self assetSpecifier];
  [v3 setSafeObject:v5 forKey:@"assetSpecifier"];

  uint64_t v6 = [(MAAutoAssetSelector *)self assetVersion];
  if (v6)
  {
    id v7 = [(MAAutoAssetSelector *)self assetVersion];
    [v3 setSafeObject:v7 forKey:@"assetVersion"];
  }
  else
  {
    [v3 setSafeObject:@"ANY-VERSION" forKey:@"assetVersion"];
  }

  id v8 = [(MAAutoAssetSelector *)self downloadDecryptionKey];
  if (v8) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  [v3 setSafeObject:v9 forKey:@"downloadDecryptionKey"];

  return v3;
}

- (void)setAssetVersion:(id)a3
{
}

@end
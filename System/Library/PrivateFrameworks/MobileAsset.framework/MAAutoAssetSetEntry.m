@interface MAAutoAssetSetEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)assetLockedInhibitsRemoval;
- (BOOL)isEqual:(id)a3;
- (MAAutoAssetSelector)assetSelector;
- (MAAutoAssetSetEntry)initWithCoder:(id)a3;
- (id)copy;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 assetLockedInhibitsRemoval:(BOOL)a5;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5 usingDecryptionKey:(id)a6 assetLockedInhibitsRemoval:(BOOL)a7;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5;
- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5 assetLockedInhibitsRemoval:(BOOL)a6;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetLockedInhibitsRemoval:(BOOL)a3;
- (void)setAssetSelector:(id)a3;
@end

@implementation MAAutoAssetSetEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MAAutoAssetSetEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAutoAssetSetEntry;
  v5 = [(MAAutoAssetSetEntry *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSelector"];
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v6;

    v5->_assetLockedInhibitsRemoval = [v4 decodeBoolForKey:@"assetLockedInhibitsRemoval"];
  }

  return v5;
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4
{
  return [(MAAutoAssetSetEntry *)self initForAssetType:a3 withAssetSpecifier:a4 matchingAssetVersion:0 usingDecryptionKey:0 assetLockedInhibitsRemoval:0];
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5
{
  return [(MAAutoAssetSetEntry *)self initForAssetType:a3 withAssetSpecifier:a4 matchingAssetVersion:a5 usingDecryptionKey:0 assetLockedInhibitsRemoval:0];
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 assetLockedInhibitsRemoval:(BOOL)a5
{
  return [(MAAutoAssetSetEntry *)self initForAssetType:a3 withAssetSpecifier:a4 matchingAssetVersion:0 usingDecryptionKey:0 assetLockedInhibitsRemoval:a5];
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5
{
  return [(MAAutoAssetSetEntry *)self initForAssetType:a3 withAssetSpecifier:a4 matchingAssetVersion:0 usingDecryptionKey:a5 assetLockedInhibitsRemoval:0];
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5 assetLockedInhibitsRemoval:(BOOL)a6
{
  return [(MAAutoAssetSetEntry *)self initForAssetType:a3 withAssetSpecifier:a4 matchingAssetVersion:0 usingDecryptionKey:a5 assetLockedInhibitsRemoval:a6];
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5 usingDecryptionKey:(id)a6 assetLockedInhibitsRemoval:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetSetEntry;
  v16 = [(MAAutoAssetSetEntry *)&v20 init];
  if (v16)
  {
    v17 = [[MAAutoAssetSelector alloc] initForAssetType:v12 withAssetSpecifier:v13 matchingAssetVersion:v14 usingDecryptionKey:v15];
    assetSelector = v16->_assetSelector;
    v16->_assetSelector = v17;

    v16->_assetLockedInhibitsRemoval = a7;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(MAAutoAssetSetEntry *)self assetSelector];
  [v5 encodeObject:v4 forKey:@"assetSelector"];

  objc_msgSend(v5, "encodeBool:forKey:", -[MAAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval"), @"assetLockedInhibitsRemoval");
}

- (id)copy
{
  v3 = [MAAutoAssetSetEntry alloc];
  id v4 = [(MAAutoAssetSetEntry *)self assetSelector];
  id v5 = [v4 assetType];
  uint64_t v6 = [(MAAutoAssetSetEntry *)self assetSelector];
  v7 = [v6 assetSpecifier];
  v8 = [(MAAutoAssetSetEntry *)self assetSelector];
  objc_super v9 = [v8 downloadDecryptionKey];
  id v10 = [(MAAutoAssetSetEntry *)v3 initForAssetType:v5 withAssetSpecifier:v7 usingDecryptionKey:v9 assetLockedInhibitsRemoval:[(MAAutoAssetSetEntry *)self assetLockedInhibitsRemoval]];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MAAutoAssetSetEntry *)a3;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(MAAutoAssetSetEntry *)v5 assetSelector];

      if (v6)
      {
        v7 = [(MAAutoAssetSetEntry *)v5 assetSelector];
        v8 = [(MAAutoAssetSetEntry *)self assetSelector];
        if ([v7 isEqual:v8])
        {
          BOOL v9 = [(MAAutoAssetSetEntry *)v5 assetLockedInhibitsRemoval];
          int v10 = v9 ^ [(MAAutoAssetSetEntry *)self assetLockedInhibitsRemoval] ^ 1;
        }
        else
        {
          LOBYTE(v10) = 0;
        }
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (id)summary
{
  v3 = NSString;
  id v4 = [(MAAutoAssetSetEntry *)self assetSelector];
  id v5 = [v4 summary];
  BOOL v6 = [(MAAutoAssetSetEntry *)self assetLockedInhibitsRemoval];
  v7 = @"N";
  if (v6) {
    v7 = @"Y";
  }
  v8 = [v3 stringWithFormat:@"assetSelector:%@|assetLockedInhibitsRemoval:%@", v5, v7];

  return v8;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void)setAssetSelector:(id)a3
{
}

- (BOOL)assetLockedInhibitsRemoval
{
  return self->_assetLockedInhibitsRemoval;
}

- (void)setAssetLockedInhibitsRemoval:(BOOL)a3
{
  self->_assetLockedInhibitsRemoval = a3;
}

- (void).cxx_destruct
{
}

@end
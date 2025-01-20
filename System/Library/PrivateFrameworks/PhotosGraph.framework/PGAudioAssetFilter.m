@interface PGAudioAssetFilter
+ (BOOL)supportsSecureCoding;
+ (NSString)name;
- (BOOL)isEqual:(id)a3;
- (BOOL)passesWithAsset:(id)a3;
- (NSIndexSet)audioClassifications;
- (NSString)description;
- (PGAudioAssetFilter)initWithAudioClassifications:(id)a3;
- (PGAudioAssetFilter)initWithCoder:(id)a3;
- (id)filteredAssetsFromAssets:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PGAudioAssetFilter

- (void).cxx_destruct
{
}

- (NSIndexSet)audioClassifications
{
  return self->_audioClassifications;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGAudioAssetFilter *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      audioClassifications = self->_audioClassifications;
      v6 = [(PGAudioAssetFilter *)v4 audioClassifications];
      char v7 = [(NSIndexSet *)audioClassifications isEqualToIndexSet:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)PGAudioAssetFilter;
  v4 = [(PGAudioAssetFilter *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@", v4];

  [v5 appendFormat:@" %@: %@", @"audioClassifications", self->_audioClassifications];
  return (NSString *)v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PGAudioAssetFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioClassifications"];

  v6 = [(PGAudioAssetFilter *)self initWithAudioClassifications:v5];
  return v6;
}

- (BOOL)passesWithAsset:(id)a3
{
  id v4 = a3;
  if ([(NSIndexSet *)self->_audioClassifications count])
  {
    int v5 = [v4 clsInterestingAudioClassifications];
    if (v5)
    {
      uint64_t v11 = 0;
      v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 0;
      audioClassifications = self->_audioClassifications;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __38__PGAudioAssetFilter_passesWithAsset___block_invoke;
      v9[3] = &unk_1E68E8300;
      __int16 v10 = v5;
      v9[4] = &v11;
      [(NSIndexSet *)audioClassifications enumerateIndexesUsingBlock:v9];
      BOOL v7 = *((unsigned char *)v12 + 24) != 0;
      _Block_object_dispose(&v11, 8);
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

uint64_t __38__PGAudioAssetFilter_passesWithAsset___block_invoke(uint64_t result, __int16 a2, unsigned char *a3)
{
  if ((a2 & *(__int16 *)(result + 40)) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)filteredAssetsFromAssets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[PGAudioAssetFilter passesWithAsset:](self, "passesWithAsset:", v11, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (PGAudioAssetFilter)initWithAudioClassifications:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGAudioAssetFilter;
  id v6 = [(PGAudioAssetFilter *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioClassifications, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"Audio";
}

@end
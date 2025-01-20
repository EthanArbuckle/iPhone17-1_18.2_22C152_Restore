@interface PUActivityAssetItem
+ (id)itemsForAssets:(id)a3;
- (BOOL)excludeAccessibilityDescription;
- (BOOL)excludeCaption;
- (BOOL)excludeLiveness;
- (BOOL)excludeLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActivityAssetItem:(id)a3;
- (PHAsset)asset;
- (PUActivityAssetItem)init;
- (PUActivityAssetItem)initWithAsset:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localIdentifier;
- (unint64_t)hash;
- (void)setExcludeAccessibilityDescription:(BOOL)a3;
- (void)setExcludeCaption:(BOOL)a3;
- (void)setExcludeLiveness:(BOOL)a3;
- (void)setExcludeLocation:(BOOL)a3;
@end

@implementation PUActivityAssetItem

- (void).cxx_destruct
{
}

- (void)setExcludeAccessibilityDescription:(BOOL)a3
{
  self->_excludeAccessibilityDescription = a3;
}

- (BOOL)excludeAccessibilityDescription
{
  return self->_excludeAccessibilityDescription;
}

- (void)setExcludeCaption:(BOOL)a3
{
  self->_excludeCaption = a3;
}

- (BOOL)excludeCaption
{
  return self->_excludeCaption;
}

- (void)setExcludeLocation:(BOOL)a3
{
  self->_excludeLocation = a3;
}

- (BOOL)excludeLocation
{
  return self->_excludeLocation;
}

- (void)setExcludeLiveness:(BOOL)a3
{
  self->_excludeLiveness = a3;
}

- (BOOL)excludeLiveness
{
  return self->_excludeLiveness;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (unint64_t)hash
{
  v2 = [(PUActivityAssetItem *)self asset];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PUActivityAssetItem *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PUActivityAssetItem *)self isEqualToActivityAssetItem:v5];

  return v6;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PHAsset *)self->_asset description];
  if (self->_excludeLiveness) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  v7 = v6;
  if (self->_excludeLocation) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = v8;
  if (self->_excludeCaption) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v11 = v10;
  if (self->_excludeAccessibilityDescription) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v13 = v12;
  v14 = [v3 stringWithFormat:@"<%@:%p, asset:%@, excludeLiveness:%@, excludeLocation:%@, excludeCaption:%@, excludeAccessibilityDescription:%@>", v4, self, v5, v7, v9, v11, v13];

  return v14;
}

- (BOOL)isEqualToActivityAssetItem:(id)a3
{
  uint64_t v4 = (PUActivityAssetItem *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v5 = [(PUActivityAssetItem *)self asset];
    BOOL v6 = [(PUActivityAssetItem *)v4 asset];
    int v7 = [v5 isEqual:v6];

    if (v7
      && (BOOL v8 = [(PUActivityAssetItem *)self excludeLiveness],
          v8 == [(PUActivityAssetItem *)v4 excludeLiveness])
      && (BOOL v9 = [(PUActivityAssetItem *)self excludeLocation],
          v9 == [(PUActivityAssetItem *)v4 excludeLocation])
      && (BOOL v10 = [(PUActivityAssetItem *)self excludeCaption],
          v10 == [(PUActivityAssetItem *)v4 excludeCaption]))
    {
      BOOL v13 = [(PUActivityAssetItem *)self excludeAccessibilityDescription];
      BOOL v11 = v13 ^ [(PUActivityAssetItem *)v4 excludeAccessibilityDescription] ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (id)localIdentifier
{
  v18[5] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PUActivityAssetItem *)self asset];
  uint64_t v4 = [v3 localIdentifier];
  v5 = (void *)v4;
  BOOL v6 = @"unknown";
  if (v4) {
    BOOL v6 = (__CFString *)v4;
  }
  BOOL v7 = [(PUActivityAssetItem *)self excludeLiveness];
  BOOL v8 = @"original";
  if (v7) {
    BOOL v8 = @"still";
  }
  v18[1] = v8;
  BOOL v9 = [(PUActivityAssetItem *)self excludeLocation];
  BOOL v10 = @"withLocation";
  if (v9) {
    BOOL v10 = @"noLocation";
  }
  v18[2] = v10;
  BOOL v11 = [(PUActivityAssetItem *)self excludeCaption];
  v12 = @"withCaption";
  if (v11) {
    v12 = @"noCaption";
  }
  v18[3] = v12;
  BOOL v13 = [(PUActivityAssetItem *)self excludeAccessibilityDescription];
  v14 = @"withAXDescription";
  if (v13) {
    v14 = @"noAXDescription";
  }
  v18[4] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];

  v16 = [v15 componentsJoinedByString:@"-"];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAsset:", self->_asset);
  *((unsigned char *)result + 8) = self->_excludeLiveness;
  *((unsigned char *)result + 9) = self->_excludeLocation;
  *((unsigned char *)result + 10) = self->_excludeCaption;
  *((unsigned char *)result + 11) = self->_excludeAccessibilityDescription;
  return result;
}

- (PUActivityAssetItem)initWithAsset:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUActivityAssetItem.m", 30, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PUActivityAssetItem;
  BOOL v7 = [(PUActivityAssetItem *)&v11 init];
  BOOL v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_asset, a3);
  }

  return v8;
}

- (PUActivityAssetItem)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUActivityAssetItem.m" lineNumber:25 description:@"Code which should be unreachable has been reached"];

  abort();
}

+ (id)itemsForAssets:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_super v11 = [PUActivityAssetItem alloc];
        v12 = -[PUActivityAssetItem initWithAsset:](v11, "initWithAsset:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end
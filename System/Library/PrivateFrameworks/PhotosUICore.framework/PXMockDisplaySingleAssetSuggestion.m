@interface PXMockDisplaySingleAssetSuggestion
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)actionProperties;
- (NSString)localIdentifier;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)title;
- (PHAsset)asset;
- (PXMockDisplaySingleAssetSuggestion)initWithAsset:(id)a3 type:(unsigned __int16)a4 subtype:(unsigned __int16)a5 title:(id)a6;
- (id)fetchKeyAssets;
- (unsigned)state;
- (unsigned)subtype;
- (unsigned)type;
@end

@implementation PXMockDisplaySingleAssetSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_actionProperties, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (unsigned)state
{
  return self->_state;
}

- (NSDictionary)actionProperties
{
  return self->_actionProperties;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)endDate
{
  v2 = [(PXMockDisplaySingleAssetSuggestion *)self asset];
  v3 = [v2 creationDate];

  return (NSDate *)v3;
}

- (NSDate)startDate
{
  v2 = [(PXMockDisplaySingleAssetSuggestion *)self asset];
  v3 = [v2 creationDate];

  return (NSDate *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(PXMockDisplaySingleAssetSuggestion *)self localIdentifier];
    v6 = [v4 localIdentifier];
    if ([v5 isEqualToString:v6])
    {
      v7 = [(PXMockDisplaySingleAssetSuggestion *)self title];
      v8 = [v4 title];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)fetchKeyAssets
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F38EB8];
  id v4 = [(PXMockDisplaySingleAssetSuggestion *)self asset];
  v5 = [v4 localIdentifier];
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v7 = [(PXMockDisplaySingleAssetSuggestion *)self asset];
  v8 = [v7 photoLibrary];
  char v9 = [v8 librarySpecificFetchOptions];
  v10 = [v3 fetchAssetsWithLocalIdentifiers:v6 options:v9];

  return v10;
}

- (NSString)localIdentifier
{
  v2 = [(PXMockDisplaySingleAssetSuggestion *)self asset];
  v3 = [v2 localIdentifier];

  return (NSString *)v3;
}

- (PXMockDisplaySingleAssetSuggestion)initWithAsset:(id)a3 type:(unsigned __int16)a4 subtype:(unsigned __int16)a5 title:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXMockDisplaySingleAssetSuggestion;
  v13 = [(PXMockDisplaySingleAssetSuggestion *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_type = a4;
    v13->_subtype = a5;
    objc_storeStrong((id *)&v13->_asset, a3);
    uint64_t v15 = [v12 copy];
    title = v14->_title;
    v14->_title = (NSString *)v15;
  }
  return v14;
}

@end
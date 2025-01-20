@interface PLNamedCombinedAssetSearchResult
- (BOOL)hasSpecialName;
- (NSString)name;
- (PLNamedCombinedAssetSearchResult)initWithName:(id)a3 assetSearchResults:(id)a4 canOverlap:(BOOL)a5;
- (id)contentStrings;
- (id)matchRanges;
- (unint64_t)matchCount;
- (void)setName:(id)a3;
@end

@implementation PLNamedCombinedAssetSearchResult

- (void).cxx_destruct
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)hasSpecialName
{
  v8.receiver = self;
  v8.super_class = (Class)PLNamedCombinedAssetSearchResult;
  v3 = [(PLSearchResult *)&v8 contentStrings];
  if ([v3 count] == 1)
  {
    name = self->_name;
    v5 = [v3 firstObject];
    BOOL v6 = ![(NSString *)name isEqualToString:v5];
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)matchRanges
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(PLNamedCombinedAssetSearchResult *)self hasSpecialName])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, -[NSString length](self->_name, "length"));
    objc_super v8 = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    v9[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PLNamedCombinedAssetSearchResult;
    v5 = [(PLSearchResult *)&v7 matchRanges];
  }
  return v5;
}

- (unint64_t)matchCount
{
  if ([(PLNamedCombinedAssetSearchResult *)self hasSpecialName]) {
    return 1;
  }
  v4 = [(PLNamedCombinedAssetSearchResult *)self matchRanges];
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)contentStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_name;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (PLNamedCombinedAssetSearchResult)initWithName:(id)a3 assetSearchResults:(id)a4 canOverlap:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLNamedCombinedAssetSearchResult;
  v9 = [(PLCombinedAssetSearchResult *)&v13 initWithAssetSearchResults:a4 canOverlap:v5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;
  }
  return v9;
}

@end
@interface PXSearchQueryOptions
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsCuratedAssetsFetchResult;
- (BOOL)wantsLibraryChanges;
- (BOOL)wantsWordEmbeddings;
- (PXSearchQueryOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)curatedAssetLimit;
- (unint64_t)filterOptions;
- (unint64_t)hash;
- (unint64_t)libraryScope;
- (unint64_t)suggestionLimit;
- (void)setCuratedAssetLimit:(unint64_t)a3;
- (void)setFilterOptions:(unint64_t)a3;
- (void)setLibraryScope:(unint64_t)a3;
- (void)setSuggestionLimit:(unint64_t)a3;
- (void)setWantsCuratedAssetsFetchResult:(BOOL)a3;
- (void)setWantsLibraryChanges:(BOOL)a3;
- (void)setWantsWordEmbeddings:(BOOL)a3;
@end

@implementation PXSearchQueryOptions

- (void)setLibraryScope:(unint64_t)a3
{
  self->_libraryScope = a3;
}

- (unint64_t)libraryScope
{
  return self->_libraryScope;
}

- (void)setWantsWordEmbeddings:(BOOL)a3
{
  self->_wantsWordEmbeddings = a3;
}

- (BOOL)wantsWordEmbeddings
{
  return self->_wantsWordEmbeddings;
}

- (void)setFilterOptions:(unint64_t)a3
{
  self->_filterOptions = a3;
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (void)setWantsLibraryChanges:(BOOL)a3
{
  self->_wantsLibraryChanges = a3;
}

- (void)setSuggestionLimit:(unint64_t)a3
{
  self->_suggestionLimit = a3;
}

- (unint64_t)suggestionLimit
{
  return self->_suggestionLimit;
}

- (void)setWantsCuratedAssetsFetchResult:(BOOL)a3
{
  self->_wantsCuratedAssetsFetchResult = a3;
}

- (void)setCuratedAssetLimit:(unint64_t)a3
{
  self->_curatedAssetLimit = a3;
}

- (unint64_t)curatedAssetLimit
{
  return self->_curatedAssetLimit;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"curatedAssetLimit: %li, ", self->_curatedAssetLimit];
  if (self->_wantsLibraryChanges) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  [v3 appendFormat:@"wantsLibraryChanges: %@ ", v4];
  [v3 appendFormat:@"suggestionLimit: %li, ", self->_suggestionLimit];
  if (self->_wantsCuratedAssetsFetchResult) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 appendFormat:@"wantsCuratedAssetsFetchResult: %@, ", v5];
  [v3 appendFormat:@"filterOptions: %li, ", self->_filterOptions];
  if (self->_wantsWordEmbeddings) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendFormat:@"wantsWordEmbeddings: %@, ", v6];
  [v3 appendFormat:@"libraryScope: %li, ", self->_libraryScope];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PXSearchQueryOptions *)self curatedAssetLimit];
  uint64_t v4 = [(PXSearchQueryOptions *)self wantsLibraryChanges];
  unint64_t v5 = v3 ^ [(PXSearchQueryOptions *)self suggestionLimit] ^ v4;
  uint64_t v6 = [(PXSearchQueryOptions *)self wantsCuratedAssetsFetchResult];
  unint64_t v7 = v5 ^ v6 ^ [(PXSearchQueryOptions *)self filterOptions];
  uint64_t v8 = [(PXSearchQueryOptions *)self wantsWordEmbeddings];
  return v7 ^ v8 ^ [(PXSearchQueryOptions *)self libraryScope];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXSearchQueryOptions *)a3;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      unint64_t v6 = [(PXSearchQueryOptions *)self curatedAssetLimit];
      BOOL v7 = v6 == [(PXSearchQueryOptions *)v5 curatedAssetLimit];
      LODWORD(v6) = [(PXSearchQueryOptions *)self wantsLibraryChanges];
      int v8 = v7 & ~(v6 ^ [(PXSearchQueryOptions *)v5 wantsLibraryChanges]);
      unint64_t v9 = [(PXSearchQueryOptions *)self suggestionLimit];
      if (v9 != [(PXSearchQueryOptions *)v5 suggestionLimit]) {
        int v8 = 0;
      }
      BOOL v10 = [(PXSearchQueryOptions *)self wantsCuratedAssetsFetchResult];
      int v11 = v8 & ~(v10 ^ [(PXSearchQueryOptions *)v5 wantsCuratedAssetsFetchResult]);
      unint64_t v12 = [(PXSearchQueryOptions *)self filterOptions];
      if (v12 != [(PXSearchQueryOptions *)v5 filterOptions]) {
        int v11 = 0;
      }
      BOOL v13 = [(PXSearchQueryOptions *)self wantsWordEmbeddings];
      int v14 = v11 & ~(v13 ^ [(PXSearchQueryOptions *)v5 wantsWordEmbeddings]);
      unint64_t v15 = [(PXSearchQueryOptions *)self libraryScope];
      uint64_t v16 = [(PXSearchQueryOptions *)v5 libraryScope];

      if (v15 == v16) {
        BOOL v17 = v14;
      }
      else {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(PXSearchQueryOptions);
  [(PXSearchQueryOptions *)v4 setCuratedAssetLimit:self->_curatedAssetLimit];
  [(PXSearchQueryOptions *)v4 setWantsLibraryChanges:self->_wantsLibraryChanges];
  [(PXSearchQueryOptions *)v4 setSuggestionLimit:self->_suggestionLimit];
  [(PXSearchQueryOptions *)v4 setWantsCuratedAssetsFetchResult:self->_wantsCuratedAssetsFetchResult];
  [(PXSearchQueryOptions *)v4 setFilterOptions:self->_filterOptions];
  [(PXSearchQueryOptions *)v4 setWantsWordEmbeddings:self->_wantsWordEmbeddings];
  [(PXSearchQueryOptions *)v4 setLibraryScope:self->_libraryScope];
  return v4;
}

- (BOOL)wantsLibraryChanges
{
  if (!self->_wantsLibraryChanges) {
    return 0;
  }
  if (!self->_wantsCuratedAssetsFetchResult) {
    PXAssertGetLog();
  }
  return 1;
}

- (BOOL)wantsCuratedAssetsFetchResult
{
  if (self->_wantsCuratedAssetsFetchResult) {
    return 1;
  }
  if (self->_wantsLibraryChanges) {
    PXAssertGetLog();
  }
  return 0;
}

- (PXSearchQueryOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXSearchQueryOptions;
  result = [(PXSearchQueryOptions *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_wantsCuratedAssetsFetchResult = 257;
    result->_wantsWordEmbeddings = 1;
    result->_libraryScope = 0;
  }
  return result;
}

@end
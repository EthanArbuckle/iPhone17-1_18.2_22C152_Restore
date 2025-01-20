@interface PGRelatedComputerOptions
- (BOOL)shouldIncludeContainingEventKey;
- (BOOL)useDiversity;
- (NSSet)filteringLocalIdentifiers;
- (NSString)referenceAssetIdentifier;
- (PGRelatedComputerOptions)init;
- (PGRelatedComputerOptions)initWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)fetchLimit;
- (void)setFetchLimit:(unint64_t)a3;
- (void)setFilteringLocalIdentifiers:(id)a3;
- (void)setReferenceAssetIdentifier:(id)a3;
- (void)setShouldIncludeContainingEventKey:(BOOL)a3;
- (void)setUseDiversity:(BOOL)a3;
@end

@implementation PGRelatedComputerOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_filteringLocalIdentifiers, 0);
}

- (void)setReferenceAssetIdentifier:(id)a3
{
}

- (NSString)referenceAssetIdentifier
{
  return self->_referenceAssetIdentifier;
}

- (void)setShouldIncludeContainingEventKey:(BOOL)a3
{
  self->_shouldIncludeContainingEventKey = a3;
}

- (BOOL)shouldIncludeContainingEventKey
{
  return self->_shouldIncludeContainingEventKey;
}

- (void)setUseDiversity:(BOOL)a3
{
  self->_useDiversity = a3;
}

- (BOOL)useDiversity
{
  return self->_useDiversity;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFilteringLocalIdentifiers:(id)a3
{
}

- (NSSet)filteringLocalIdentifiers
{
  return self->_filteringLocalIdentifiers;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PGRelatedComputerOptions);
  v5 = (void *)[(NSSet *)self->_filteringLocalIdentifiers copy];
  [(PGRelatedComputerOptions *)v4 setFilteringLocalIdentifiers:v5];

  [(PGRelatedComputerOptions *)v4 setFetchLimit:self->_fetchLimit];
  [(PGRelatedComputerOptions *)v4 setUseDiversity:self->_useDiversity];
  [(PGRelatedComputerOptions *)v4 setShouldIncludeContainingEventKey:self->_shouldIncludeContainingEventKey];
  v6 = (void *)[(NSString *)self->_referenceAssetIdentifier copy];
  [(PGRelatedComputerOptions *)v4 setReferenceAssetIdentifier:v6];

  return v4;
}

- (PGRelatedComputerOptions)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(PGRelatedComputerOptions *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"PHRelatedOptionIsDiversityEnabledKey"];
    v7 = v6;
    if (v6) {
      v5->_useDiversity = [v6 BOOLValue];
    }
    v8 = [v4 objectForKeyedSubscript:@"PHRelatedOptionFetchLimitKey"];
    v9 = v8;
    if (v8) {
      v5->_fetchLimit = [v8 unsignedIntegerValue];
    }
    v10 = [v4 objectForKeyedSubscript:@"PHRelatedOptionShouldIncludeContainingEventKey"];
    v11 = v10;
    if (v10) {
      v5->_shouldIncludeContainingEventKey = [v10 BOOLValue];
    }
    v12 = [v4 objectForKeyedSubscript:@"PHRelatedOptionFilteringLocalIdentifiers"];
    if (v12) {
      objc_storeStrong((id *)&v5->_filteringLocalIdentifiers, v12);
    }
    uint64_t v13 = [v4 objectForKeyedSubscript:@"PHRelatedOptionReferenceAssetIdentifier"];
    referenceAssetIdentifier = v5->_referenceAssetIdentifier;
    v5->_referenceAssetIdentifier = (NSString *)v13;
  }
  return v5;
}

- (PGRelatedComputerOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)PGRelatedComputerOptions;
  v2 = [(PGRelatedComputerOptions *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
    filteringLocalIdentifiers = v2->_filteringLocalIdentifiers;
    v2->_filteringLocalIdentifiers = (NSSet *)v3;

    *(_WORD *)&v2->_useDiversity = 1;
    referenceAssetIdentifier = v2->_referenceAssetIdentifier;
    v2->_fetchLimit = 64;
    v2->_referenceAssetIdentifier = 0;
  }
  return v2;
}

@end
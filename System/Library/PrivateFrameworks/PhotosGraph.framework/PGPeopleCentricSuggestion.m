@interface PGPeopleCentricSuggestion
- (PGPeopleCentricSuggestion)initWithPersonLocalIdentifier:(id)a3 asset:(id)a4;
- (PGPeopleCentricSuggestion)initWithPersonLocalIdentifiers:(id)a3 asset:(id)a4;
- (id)suggestedPersonLocalIdentifiers;
@end

@implementation PGPeopleCentricSuggestion

- (void).cxx_destruct
{
}

- (id)suggestedPersonLocalIdentifiers
{
  return self->_suggestedPersonLocalIdentifiers;
}

- (PGPeopleCentricSuggestion)initWithPersonLocalIdentifiers:(id)a3 asset:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGPeopleCentricSuggestion;
  v8 = [(PGSingleAssetSuggestion *)&v11 initWithType:3 subtype:305 asset:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_suggestedPersonLocalIdentifiers, a3);
  }

  return v9;
}

- (PGPeopleCentricSuggestion)initWithPersonLocalIdentifier:(id)a3 asset:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGPeopleCentricSuggestion;
  id v7 = [(PGSingleAssetSuggestion *)&v11 initWithType:3 subtype:304 asset:a4];
  if (v7)
  {
    v12[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    suggestedPersonLocalIdentifiers = v7->_suggestedPersonLocalIdentifiers;
    v7->_suggestedPersonLocalIdentifiers = (NSArray *)v8;
  }
  return v7;
}

@end
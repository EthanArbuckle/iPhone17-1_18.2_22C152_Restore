@interface PGPetWallpaperSuggestion
- (PGPetWallpaperSuggestion)initWithPetLocalIdentifier:(id)a3 type:(unsigned __int16)a4 subtype:(unsigned __int16)a5 asset:(id)a6;
- (id)suggestedPersonLocalIdentifiers;
@end

@implementation PGPetWallpaperSuggestion

- (void).cxx_destruct
{
}

- (id)suggestedPersonLocalIdentifiers
{
  return self->_suggestedPersonLocalIdentifiers;
}

- (PGPetWallpaperSuggestion)initWithPetLocalIdentifier:(id)a3 type:(unsigned __int16)a4 subtype:(unsigned __int16)a5 asset:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGPetWallpaperSuggestion;
  v11 = [(PGSingleAssetSuggestion *)&v15 initWithType:v8 subtype:v7 asset:a6];
  if (v11)
  {
    v16[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    suggestedPersonLocalIdentifiers = v11->_suggestedPersonLocalIdentifiers;
    v11->_suggestedPersonLocalIdentifiers = (NSArray *)v12;
  }
  return v11;
}

@end
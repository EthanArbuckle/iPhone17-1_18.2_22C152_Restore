@interface PGPeopleWallpaperSuggesterPersonInformation
- (NSSet)dupedPersonLocalIdentifiers;
- (NSString)personLocalIdentifier;
- (PGPeopleWallpaperSuggesterPersonInformation)initWithPersonLocalIdentifier:(id)a3 importance:(int64_t)a4 unverifiedMergeCandidateLocalIdentifiers:(id)a5;
- (int64_t)importance;
- (void)mergeImportance:(int64_t)a3;
@end

@implementation PGPeopleWallpaperSuggesterPersonInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dupedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

- (NSSet)dupedPersonLocalIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)importance
{
  return self->_importance;
}

- (NSString)personLocalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)mergeImportance:(int64_t)a3
{
  int64_t importance = self->_importance;
  int64_t v4 = importance | a3;
  if (importance >= a3) {
    int64_t v5 = a3;
  }
  else {
    int64_t v5 = self->_importance;
  }
  if (importance <= a3) {
    int64_t importance = a3;
  }
  if (v4 < 0) {
    int64_t importance = v5;
  }
  self->_int64_t importance = importance;
}

- (PGPeopleWallpaperSuggesterPersonInformation)initWithPersonLocalIdentifier:(id)a3 importance:(int64_t)a4 unverifiedMergeCandidateLocalIdentifiers:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PGPeopleWallpaperSuggesterPersonInformation;
  v11 = [(PGPeopleWallpaperSuggesterPersonInformation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_personLocalIdentifier, a3);
    v12->_int64_t importance = a4;
    if (v10) {
      v13 = (NSSet *)v10;
    }
    else {
      v13 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    dupedPersonLocalIdentifiers = v12->_dupedPersonLocalIdentifiers;
    v12->_dupedPersonLocalIdentifiers = v13;
  }
  return v12;
}

@end
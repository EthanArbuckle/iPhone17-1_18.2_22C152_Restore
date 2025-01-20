@interface PUWallpaperNightlySuggestionsPosterConfiguration
- (BOOL)includeCityscapes;
- (BOOL)includeLandscapes;
- (BOOL)includePets;
- (NSSet)personLocalIdentifiers;
- (NSString)name;
- (PUWallpaperNightlySuggestionsPosterConfiguration)initWithName:(id)a3 personLocalIdentifiers:(id)a4 includePets:(BOOL)a5 includeLandscapes:(BOOL)a6 includeCityscapes:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIncludeCityscapes:(BOOL)a3;
- (void)setIncludeLandscapes:(BOOL)a3;
- (void)setIncludePets:(BOOL)a3;
- (void)setPersonLocalIdentifiers:(id)a3;
@end

@implementation PUWallpaperNightlySuggestionsPosterConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setIncludeCityscapes:(BOOL)a3
{
  self->_includeCityscapes = a3;
}

- (BOOL)includeCityscapes
{
  return self->_includeCityscapes;
}

- (void)setIncludeLandscapes:(BOOL)a3
{
  self->_includeLandscapes = a3;
}

- (BOOL)includeLandscapes
{
  return self->_includeLandscapes;
}

- (void)setIncludePets:(BOOL)a3
{
  self->_includePets = a3;
}

- (BOOL)includePets
{
  return self->_includePets;
}

- (void)setPersonLocalIdentifiers:(id)a3
{
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (NSString)name
{
  return self->_name;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  name = self->_name;
  personLocalIdentifiers = self->_personLocalIdentifiers;
  BOOL includePets = self->_includePets;
  BOOL includeLandscapes = self->_includeLandscapes;
  BOOL includeCityscapes = self->_includeCityscapes;
  return (id)[v4 initWithName:name personLocalIdentifiers:personLocalIdentifiers includePets:includePets includeLandscapes:includeLandscapes includeCityscapes:includeCityscapes];
}

- (PUWallpaperNightlySuggestionsPosterConfiguration)initWithName:(id)a3 personLocalIdentifiers:(id)a4 includePets:(BOOL)a5 includeLandscapes:(BOOL)a6 includeCityscapes:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperNightlySuggestionsPosterConfiguration;
  v15 = [(PUWallpaperNightlySuggestionsPosterConfiguration *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_personLocalIdentifiers, a4);
    v16->_BOOL includePets = a5;
    v16->_BOOL includeLandscapes = a6;
    v16->_BOOL includeCityscapes = a7;
  }

  return v16;
}

@end
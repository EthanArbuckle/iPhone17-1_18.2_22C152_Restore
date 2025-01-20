@interface SXFontFamily
- (NSSet)fontFaces;
- (NSString)description;
- (NSString)familyName;
- (SXFontFamily)initWithFamilyName:(id)a3 faces:(id)a4;
- (id)fontFaceWithAttributes:(id)a3 size:(int64_t)a4;
@end

@implementation SXFontFamily

- (SXFontFamily)initWithFamilyName:(id)a3 faces:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXFontFamily;
  v9 = [(SXFontFamily *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_familyName, a3);
    objc_storeStrong((id *)&v10->_fontFaces, a4);
  }

  return v10;
}

- (id)fontFaceWithAttributes:(id)a3 size:(int64_t)a4
{
  return +[SXFontMatching matchFontFaceForAttributes:a3 fromFamily:self];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = [(SXFontFamily *)self familyName];
  [v3 appendFormat:@"; familyName: %@", v4];

  v5 = [(SXFontFamily *)self fontFaces];
  [v3 appendFormat:@"; fontFaces: %@", v5];

  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSSet)fontFaces
{
  return self->_fontFaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontFaces, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
}

@end
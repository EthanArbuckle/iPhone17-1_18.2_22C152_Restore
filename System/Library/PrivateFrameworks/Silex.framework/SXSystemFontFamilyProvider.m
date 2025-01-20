@interface SXSystemFontFamilyProvider
- (NSArray)fonts;
- (NSString)description;
- (SXSystemFontFamilyProvider)init;
- (SXSystemFontFamilyProvider)initWithFontMetaData:(id)a3;
- (id)fontsForMetadata:(id)a3;
@end

@implementation SXSystemFontFamilyProvider

- (SXSystemFontFamilyProvider)init
{
  return [(SXSystemFontFamilyProvider *)self initWithFontMetaData:&unk_26D593F68];
}

- (SXSystemFontFamilyProvider)initWithFontMetaData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXSystemFontFamilyProvider;
  v5 = [(SXSystemFontFamilyProvider *)&v10 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(SXSystemFontFamilyProvider *)v5 fontsForMetadata:v4];
    fonts = v6->_fonts;
    v6->_fonts = (NSArray *)v7;
  }
  return v6;
}

- (id)fontsForMetadata:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = [[SXSystemFontFace alloc] initWithMetadata:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        v11 = [(SXSystemFontFace *)v10 fontAttributes];
        v12 = [v11 familyName];
        v13 = [v4 objectForKey:v12];

        if (!v13)
        {
          v13 = [MEMORY[0x263EFF980] array];
          v14 = [(SXSystemFontFace *)v10 fontAttributes];
          v15 = [v14 familyName];
          [v4 setObject:v13 forKey:v15];
        }
        [v13 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }

  v16 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v4;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        v23 = [v17 objectForKey:v22];
        v24 = [SXFontFamily alloc];
        v25 = [MEMORY[0x263EFFA08] setWithArray:v23];
        v26 = [(SXFontFamily *)v24 initWithFamilyName:v22 faces:v25];

        [v16 addObject:v26];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v19);
  }

  return v16;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(SXSystemFontFamilyProvider *)self fonts];
  [v3 appendFormat:@"; fonts: %@", v4];

  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (NSArray)fonts
{
  return self->_fonts;
}

- (void).cxx_destruct
{
}

@end
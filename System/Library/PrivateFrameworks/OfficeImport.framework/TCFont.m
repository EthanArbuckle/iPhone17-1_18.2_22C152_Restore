@interface TCFont
+ (id)fontWithFont:(id)a3;
- (NSDictionary)namesByLanguage;
- (NSString)psName;
- (TCFont)initWithDictionary:(id)a3;
- (TCFont)initWithNamesByLanguage:(id)a3 psName:(id)a4 styling:(TCFontStyling)a5;
- (TCFontFamily)family;
- (TCFontStyling)styling;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)englishName;
- (id)equivalentDictionary;
- (id)localizedFontName;
- (int)preferredLanguage;
- (void)setFamily:(id)a3;
@end

@implementation TCFont

- (TCFont)initWithNamesByLanguage:(id)a3 psName:(id)a4 styling:(TCFontStyling)a5
{
  uint64_t v5 = *(void *)&a5.weight;
  uint64_t v6 = *(void *)&a5.fontClass;
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TCFont;
  v11 = [(TCFont *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    namesByLanguage = v11->_namesByLanguage;
    v11->_namesByLanguage = (NSDictionary *)v12;

    uint64_t v14 = [v10 copy];
    psName = v11->_psName;
    v11->_psName = (NSString *)v14;

    *(void *)&v11->_styling.fontClass = v6;
    *(void *)&v11->_styling.weight = v5;
  }

  return v11;
}

- (id)equivalentDictionary
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(TCFont *)self namesByLanguage];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v9 = [v4 objectForKeyedSubscript:v8];
        id v10 = TCFontMacLanguageIDToNSString([v8 unsignedShortValue]);
        v11 = [v9 equivalentDictionary];
        [v3 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  uint64_t v12 = NSDictionary;
  v13 = [(TCFont *)self psName];
  *(void *)&v18.fontClass = [(TCFont *)self styling];
  *(void *)&v18.weight = v14;
  v15 = TCFontStyling::equivalentDictionary(&v18);
  v16 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v3, @"font-names", v13, @"PostScript-name", v15, @"styling", 0);

  return v16;
}

- (TCFont)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v22 = a3;
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v22 objectForKeyedSubscript:@"font-names"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(NSString **)(*((void *)&v23 + 1) + 8 * i);
        unsigned __int16 v9 = TCFontMacLanguageIDFromNSString(v8);
        id v10 = [TCFontName alloc];
        v11 = [v4 objectForKeyedSubscript:v8];
        uint64_t v12 = [(TCFontName *)v10 initWithDictionary:v11];
        v13 = [NSNumber numberWithUnsignedShort:v9];
        [v3 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  uint64_t v14 = [v22 objectForKeyedSubscript:@"PostScript-name"];
  v15 = [v22 objectForKeyedSubscript:@"styling"];
  unint64_t v17 = TCFontStyling::createWithDictionary(v15, v16);
  long long v19 = -[TCFont initWithNamesByLanguage:psName:styling:](self, "initWithNamesByLanguage:psName:styling:", v3, v14, v17, v18, 0);

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(TCFont *)self equivalentDictionary];
  uint64_t v6 = (void *)[v4 initWithDictionary:v5];

  return v6;
}

+ (id)fontWithFont:(id)a3
{
  v3 = (void *)[a3 copy];
  return v3;
}

- (id)englishName
{
  v2 = [(TCFont *)self namesByLanguage];
  v3 = [v2 objectForKeyedSubscript:&unk_26EC80CF0];

  return v3;
}

- (id)description
{
  v2 = [(TCFont *)self equivalentDictionary];
  v3 = [v2 description];

  return v3;
}

- (int)preferredLanguage
{
  uint64_t v2 = [(TCFont *)self styling];
  if (HIDWORD(v2) == 25) {
    int v3 = 33;
  }
  else {
    int v3 = 0;
  }
  if (HIDWORD(v2) == 3) {
    int v4 = 23;
  }
  else {
    int v4 = v3;
  }
  if (HIDWORD(v2) == 2) {
    int v5 = 19;
  }
  else {
    int v5 = 0;
  }
  if (HIDWORD(v2) == 1) {
    int v6 = 11;
  }
  else {
    int v6 = v5;
  }
  if (SHIDWORD(v2) <= 2) {
    return v6;
  }
  else {
    return v4;
  }
}

- (id)localizedFontName
{
  int v3 = [(TCFont *)self namesByLanguage];
  int v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TCFont preferredLanguage](self, "preferredLanguage"));
  int v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    int v5 = [(TCFont *)self englishName];
  }
  return v5;
}

- (NSDictionary)namesByLanguage
{
  return self->_namesByLanguage;
}

- (NSString)psName
{
  return self->_psName;
}

- (TCFontStyling)styling
{
  uint64_t v2 = *(void *)&self->_styling.weight;
  uint64_t v3 = *(void *)&self->_styling.fontClass;
  result.weight = v2;
  result.italic = BYTE1(v2);
  result.width = HIDWORD(v2);
  result.fontClass = v3;
  result.stringEncoding = HIDWORD(v3);
  return result;
}

- (TCFontFamily)family
{
  return self->_family;
}

- (void)setFamily:(id)a3
{
  self->_family = (TCFontFamily *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psName, 0);
  objc_storeStrong((id *)&self->_namesByLanguage, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 11) = 0;
  *((void *)self + 4) = 0;
  *((_WORD *)self + 20) = 0;
  return self;
}

@end
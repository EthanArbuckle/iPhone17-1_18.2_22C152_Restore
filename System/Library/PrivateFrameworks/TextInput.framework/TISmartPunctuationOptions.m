@interface TISmartPunctuationOptions
+ (BOOL)supportsSecureCoding;
+ (id)smartPunctuationOptionsForLocale:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesDirectionalQuotes;
- (NSLocale)locale;
- (NSString)apostrophe;
- (NSString)leftDoubleQuote;
- (NSString)leftSingleQuote;
- (NSString)rightDoubleQuote;
- (NSString)rightSingleQuote;
- (TISmartPunctuationOptions)initWithCoder:(id)a3;
- (TISmartPunctuationOptions)initWithLocale:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)_generateDataFromLocale;
- (void)encodeWithCoder:(id)a3;
- (void)setApostrophe:(id)a3;
- (void)setLeftDoubleQuote:(id)a3;
- (void)setLeftSingleQuote:(id)a3;
- (void)setRightDoubleQuote:(id)a3;
- (void)setRightSingleQuote:(id)a3;
- (void)setUsesDirectionalQuotes:(BOOL)a3;
@end

@implementation TISmartPunctuationOptions

+ (id)smartPunctuationOptionsForLocale:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithLocale:v4];

  return v5;
}

- (TISmartPunctuationOptions)initWithLocale:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TISmartPunctuationOptions;
  v6 = [(TISmartPunctuationOptions *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    [(TISmartPunctuationOptions *)v7 _generateDataFromLocale];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightDoubleQuote, 0);
  objc_storeStrong((id *)&self->_leftDoubleQuote, 0);
  objc_storeStrong((id *)&self->_apostrophe, 0);
  objc_storeStrong((id *)&self->_rightSingleQuote, 0);
  objc_storeStrong((id *)&self->_leftSingleQuote, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)_generateDataFromLocale
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0x201C201920192018;
  __int16 v34 = 8221;
  uint64_t v31 = 0x201E20182019201ALL;
  __int16 v32 = 8220;
  uint64_t v29 = 0xAB201920192018;
  __int16 v30 = 187;
  uint64_t v27 = 0x201E20192019201ALL;
  __int16 v28 = 8221;
  __int16 v26 = 8221;
  uint64_t v25 = 0x201D201920192019;
  __int16 v24 = 34;
  uint64_t v23 = 0x22002700270027;
  __int16 v22 = 187;
  uint64_t v21 = 0xAB20182019201ALL;
  v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = [(NSLocale *)self->_locale objectForKey:*MEMORY[0x1E4F1C438]];
  id v5 = [v3 canonicalLanguageIdentifierFromString:v4];

  if ([v5 isEqualToString:@"de"])
  {
    v6 = &v31;
LABEL_3:
    v7 = (char *)((unint64_t)v6 | 6);
    v8 = (char *)((unint64_t)v6 | 2);
    objc_super v9 = (char *)((unint64_t)v6 | 4);
    goto LABEL_10;
  }
  v7 = (char *)&v29 + 6;
  v8 = (char *)&v29 + 2;
  objc_super v9 = (char *)&v29 + 4;
  if (([v5 isEqualToString:@"fr"] & 1) != 0
    || ([v5 isEqualToString:@"nb"] & 1) != 0
    || ([v5 isEqualToString:@"no"] & 1) != 0
    || ([v5 isEqualToString:@"ru"] & 1) != 0
    || ([v5 isEqualToString:@"el"] & 1) != 0)
  {
    v6 = &v29;
  }
  else if ([v5 isEqualToString:@"pl"])
  {
    v7 = (char *)&v27 + 6;
    v8 = (char *)&v27 + 2;
    objc_super v9 = (char *)&v27 + 4;
    v6 = &v27;
  }
  else
  {
    v7 = (char *)&v25 + 6;
    v8 = (char *)&v25 + 2;
    objc_super v9 = (char *)&v25 + 4;
    if (([v5 isEqualToString:@"sv"] & 1) != 0
      || ([v5 isEqualToString:@"fi"] & 1) != 0)
    {
      v6 = &v25;
    }
    else
    {
      v7 = (char *)&v23 + 6;
      v8 = (char *)&v23 + 2;
      objc_super v9 = (char *)&v23 + 4;
      if (([v5 isEqualToString:@"ar"] & 1) == 0
        && ([v5 isEqualToString:@"ars"] & 1) == 0)
      {
        if ([v5 isEqualToString:@"uk"]) {
          v6 = &v21;
        }
        else {
          v6 = &v33;
        }
        goto LABEL_3;
      }
      v6 = &v23;
    }
  }
LABEL_10:
  char v10 = [v5 isEqualToString:@"fr"];
  v11 = [NSString stringWithCharacters:v6 length:1];
  [(TISmartPunctuationOptions *)self setLeftSingleQuote:v11];

  v12 = [NSString stringWithCharacters:v9 length:1];
  [(TISmartPunctuationOptions *)self setRightSingleQuote:v12];

  v13 = [NSString stringWithCharacters:v8 length:1];
  [(TISmartPunctuationOptions *)self setApostrophe:v13];

  if (v10)
  {
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"%C%C", *((unsigned __int16 *)v6 + 3), 160);
    [(TISmartPunctuationOptions *)self setLeftDoubleQuote:v14];

    objc_msgSend(NSString, "stringWithFormat:", @"%C%C", 160, *((unsigned __int16 *)v6 + 4));
  }
  else
  {
    v15 = [NSString stringWithCharacters:v7 length:1];
    [(TISmartPunctuationOptions *)self setLeftDoubleQuote:v15];

    [NSString stringWithCharacters:v6 + 1 length:1];
  v16 = };
  [(TISmartPunctuationOptions *)self setRightDoubleQuote:v16];

  v17 = [(TISmartPunctuationOptions *)self leftSingleQuote];
  v18 = [(TISmartPunctuationOptions *)self rightSingleQuote];
  if ([v17 isEqualToString:v18])
  {
    v19 = [(TISmartPunctuationOptions *)self leftDoubleQuote];
    v20 = [(TISmartPunctuationOptions *)self rightDoubleQuote];
    -[TISmartPunctuationOptions setUsesDirectionalQuotes:](self, "setUsesDirectionalQuotes:", [v19 isEqualToString:v20] ^ 1);
  }
  else
  {
    [(TISmartPunctuationOptions *)self setUsesDirectionalQuotes:1];
  }
}

- (void)setUsesDirectionalQuotes:(BOOL)a3
{
  self->_usesDirectionalQuotes = a3;
}

- (void)setRightSingleQuote:(id)a3
{
}

- (void)setRightDoubleQuote:(id)a3
{
}

- (void)setLeftSingleQuote:(id)a3
{
}

- (void)setLeftDoubleQuote:(id)a3
{
}

- (void)setApostrophe:(id)a3
{
}

- (NSString)rightSingleQuote
{
  return self->_rightSingleQuote;
}

- (NSString)leftSingleQuote
{
  return self->_leftSingleQuote;
}

- (BOOL)usesDirectionalQuotes
{
  return self->_usesDirectionalQuotes;
}

- (NSString)rightDoubleQuote
{
  return self->_rightDoubleQuote;
}

- (NSString)leftDoubleQuote
{
  return self->_leftDoubleQuote;
}

- (NSString)apostrophe
{
  return self->_apostrophe;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (TISmartPunctuationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TISmartPunctuationOptions;
  id v5 = [(TISmartPunctuationOptions *)&v25 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocaleIdentifier"];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v6];
      locale = v5->_locale;
      v5->_locale = (NSLocale *)v7;
    }
    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LeftSingleQuote"];
    uint64_t v10 = [v9 copy];
    leftSingleQuote = v5->_leftSingleQuote;
    v5->_leftSingleQuote = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RightSingleQuote"];
    uint64_t v13 = [v12 copy];
    rightSingleQuote = v5->_rightSingleQuote;
    v5->_rightSingleQuote = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Apostrophe"];
    uint64_t v16 = [v15 copy];
    apostrophe = v5->_apostrophe;
    v5->_apostrophe = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LeftDoubleQuote"];
    uint64_t v19 = [v18 copy];
    leftDoubleQuote = v5->_leftDoubleQuote;
    v5->_leftDoubleQuote = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LeftDoubleQuote"];
    uint64_t v22 = [v21 copy];
    rightDoubleQuote = v5->_rightDoubleQuote;
    v5->_rightDoubleQuote = (NSString *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(TISmartPunctuationOptions *)self locale];

  if (v4)
  {
    id v5 = [(TISmartPunctuationOptions *)self locale];
    v6 = [v5 localeIdentifier];
    [v12 encodeObject:v6 forKey:@"LocaleIdentifier"];
  }
  uint64_t v7 = [(TISmartPunctuationOptions *)self leftSingleQuote];
  [v12 encodeObject:v7 forKey:@"LeftSingleQuote"];

  v8 = [(TISmartPunctuationOptions *)self rightSingleQuote];
  [v12 encodeObject:v8 forKey:@"RightSingleQuote"];

  objc_super v9 = [(TISmartPunctuationOptions *)self apostrophe];
  [v12 encodeObject:v9 forKey:@"Apostrophe"];

  uint64_t v10 = [(TISmartPunctuationOptions *)self leftDoubleQuote];
  [v12 encodeObject:v10 forKey:@"LeftDoubleQuote"];

  v11 = [(TISmartPunctuationOptions *)self rightDoubleQuote];
  [v12 encodeObject:v11 forKey:@"LeftDoubleQuote"];
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)TISmartPunctuationOptions;
  id v4 = [(TISmartPunctuationOptions *)&v12 description];
  id v5 = [(TISmartPunctuationOptions *)self leftSingleQuote];
  v6 = [(TISmartPunctuationOptions *)self rightSingleQuote];
  uint64_t v7 = [(TISmartPunctuationOptions *)self apostrophe];
  v8 = [(TISmartPunctuationOptions *)self leftDoubleQuote];
  objc_super v9 = [(TISmartPunctuationOptions *)self rightDoubleQuote];
  uint64_t v10 = [v3 stringWithFormat:@"%@{%@xy%@/x%@y/%@xy%@}", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_leftSingleQuote hash];
  NSUInteger v4 = [(NSString *)self->_rightSingleQuote hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_apostrophe hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_leftDoubleQuote hash];
  return v6 ^ [(NSString *)self->_rightDoubleQuote hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (TISmartPunctuationOptions *)a3;
  if (self == v4)
  {
    char v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    NSUInteger v5 = NSString;
    NSUInteger v6 = [(TISmartPunctuationOptions *)self leftSingleQuote];
    uint64_t v7 = [(TISmartPunctuationOptions *)v4 leftSingleQuote];
    LODWORD(v5) = [v5 _string:v6 matchesString:v7];

    if (!v5) {
      goto LABEL_8;
    }
    v8 = NSString;
    objc_super v9 = [(TISmartPunctuationOptions *)self rightSingleQuote];
    uint64_t v10 = [(TISmartPunctuationOptions *)v4 rightSingleQuote];
    LODWORD(v8) = [v8 _string:v9 matchesString:v10];

    if (!v8) {
      goto LABEL_8;
    }
    v11 = NSString;
    objc_super v12 = [(TISmartPunctuationOptions *)self apostrophe];
    uint64_t v13 = [(TISmartPunctuationOptions *)v4 apostrophe];
    LODWORD(v11) = [v11 _string:v12 matchesString:v13];

    if (!v11) {
      goto LABEL_8;
    }
    v14 = NSString;
    v15 = [(TISmartPunctuationOptions *)self leftDoubleQuote];
    uint64_t v16 = [(TISmartPunctuationOptions *)v4 leftDoubleQuote];
    LODWORD(v14) = [v14 _string:v15 matchesString:v16];

    if (v14)
    {
      v17 = NSString;
      v18 = [(TISmartPunctuationOptions *)self rightDoubleQuote];
      uint64_t v19 = [(TISmartPunctuationOptions *)v4 rightDoubleQuote];
      char v20 = [v17 _string:v18 matchesString:v19];
    }
    else
    {
LABEL_8:
      char v20 = 0;
    }
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
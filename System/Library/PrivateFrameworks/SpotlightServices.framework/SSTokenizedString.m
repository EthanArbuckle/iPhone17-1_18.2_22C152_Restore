@interface SSTokenizedString
- (BOOL)hasPrefixForMatchInfoToken:(id)a3;
- (NSArray)tokens;
- (NSString)locale;
- (NSString)original;
- (SSTokenizedString)initWithString:(id)a3 locale:(id)a4;
- (id)tokenMatchForMatchInfoToken:(id)a3;
- (id)tokenize;
- (void)setLocale:(id)a3;
- (void)setOriginal:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation SSTokenizedString

- (id)tokenize
{
  v18[1] = *MEMORY[0x1E4F143B8];
  tokens = self->_tokens;
  if (!tokens)
  {
    if (self->_shouldTokenize)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v5 = (void *)MEMORY[0x1E4F237B8];
      locale = self->_locale;
      original = self->_original;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __29__SSTokenizedString_tokenize__block_invoke;
      v16[3] = &unk_1E634C660;
      v8 = (NSArray *)v4;
      v17 = v8;
      [v5 enumerateTokensForString:original locale:locale options:2 withHandler:v16];
      v9 = self->_tokens;
      self->_tokens = v8;
      v10 = v8;

      v11 = v17;
    }
    else
    {
      v12 = self->_original;
      if (!v12)
      {
LABEL_7:
        tokens = self->_tokens;
        goto LABEL_8;
      }
      v10 = (NSArray *)[(NSString *)v12 copy];
      v18[0] = v10;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      v11 = self->_tokens;
      self->_tokens = v13;
    }

    goto LABEL_7;
  }
LABEL_8:
  v14 = tokens;
  return v14;
}

uint64_t __29__SSTokenizedString_tokenize__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (SSTokenizedString)initWithString:(id)a3 locale:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_original, a3);
  objc_storeStrong((id *)&self->_locale, a4);
  if ([(NSString *)self->_original length])
  {
    original = self->_original;
    v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    self->_shouldTokenize = [(NSString *)original rangeOfCharacterFromSet:v10] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    self->_shouldTokenize = 0;
  }

  return self;
}

- (id)tokenMatchForMatchInfoToken:(id)a3
{
  id v4 = a3;
  id v5 = (id)[v4 tokenize];
  v6 = objc_alloc_init(SSTokenMatch);
  [(SSTokenMatch *)v6 setType:0];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(SSTokenMatch *)v6 setIndexes:v7];

  id v8 = [(SSTokenizedString *)self tokenize];
  v9 = [(SSTokenizedString *)self tokens];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    do
    {
      v12 = [(SSTokenizedString *)self tokens];
      v13 = [v12 objectAtIndexedSubscript:v11];
      v14 = [v4 tokens];
      v15 = [v14 objectAtIndexedSubscript:0];
      uint64_t v16 = [v13 tokenMatch:v15];

      v17 = [v4 tokens];
      uint64_t v18 = [v17 count];

      if (v18 == 1)
      {
        if (v16)
        {
          v19 = [(SSTokenMatch *)v6 indexes];
          v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v11];
          [v19 addObject:v20];

          if ([(SSTokenMatch *)v6 type] != 2) {
            [(SSTokenMatch *)v6 setType:v16];
          }
        }
      }
      else if (v16 == 2)
      {
        v21 = [(SSTokenizedString *)self tokens];
        unint64_t v22 = [v21 count] - v11;
        v23 = [v4 tokens];
        unint64_t v24 = [v23 count];

        if (v22 < v24) {
          break;
        }
        v25 = [v4 tokens];
        unint64_t v26 = [v25 count];

        if (v26 >= 2)
        {
          unint64_t v27 = 1;
          do
          {
            v28 = [(SSTokenizedString *)self tokens];
            v29 = [v28 objectAtIndexedSubscript:v11 + v27];
            v30 = [v4 tokens];
            v31 = [v30 objectAtIndexedSubscript:v27];
            uint64_t v32 = [v29 tokenMatch:v31];

            v33 = [v4 tokens];
            uint64_t v34 = [v33 count] - 1;

            if (v27 == v34)
            {
              [(SSTokenMatch *)v6 setType:v32];
              if (v32)
              {
                v35 = [(SSTokenMatch *)v6 indexes];
                v36 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v11];
                [v35 addObject:v36];
              }
            }
            else if (v32 != 2)
            {
              break;
            }
            ++v27;
            v37 = [v4 tokens];
            unint64_t v38 = [v37 count];
          }
          while (v27 < v38);
        }
      }
      ++v11;
      v39 = [(SSTokenizedString *)self tokens];
      unint64_t v40 = [v39 count];
    }
    while (v11 < v40);
  }

  return v6;
}

- (BOOL)hasPrefixForMatchInfoToken:(id)a3
{
  v3 = [(SSTokenizedString *)self tokenMatchForMatchInfoToken:a3];
  if ([v3 type])
  {
    id v4 = [v3 indexes];
    if ([v4 count])
    {
      id v5 = [v3 indexes];
      v6 = [v5 objectAtIndexedSubscript:0];
      char v7 = [v6 isEqualToNumber:&unk_1F1860F50];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocale:(id)a3
{
}

- (NSString)original
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOriginal:(id)a3
{
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
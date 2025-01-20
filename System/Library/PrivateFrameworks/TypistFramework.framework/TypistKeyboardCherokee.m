@interface TypistKeyboardCherokee
- (NSDictionary)baseCharacters;
- (NSDictionary)vowelKeyMap;
- (TypistKeyboardCherokee)initWithCoder:(id)a3;
- (id)addAccentKeyAction:(id)a3;
- (id)generateBaseKeyMap:(id)a3;
- (id)generateKeyplaneSwitchTable:(id)a3;
- (id)getPostfixKey:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseCharacters:(id)a3;
- (void)setVowelKeyMap:(id)a3;
@end

@implementation TypistKeyboardCherokee

- (id)init:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardCherokee;
  return [(TypistKeyboard *)&v5 init:a3 options:a4 locale:@"chr"];
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TypistKeyboardCherokee;
  objc_super v5 = [(TypistKeyboard *)&v9 setupKeyboardInfo:a3 options:a4];
  if (!v5)
  {
    [(TypistKeyboardCherokee *)self setVowelKeyMap:&unk_270C6F9B8];
    v6 = [(TypistKeyboard *)self keyPlanes];
    v7 = [(TypistKeyboardCherokee *)self generateBaseKeyMap:v6];
    [(TypistKeyboardCherokee *)self setBaseCharacters:v7];
  }
  return v5;
}

- (id)generateKeyplaneSwitchTable:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardCherokee;
  v3 = [(TypistKeyboard *)&v15 generateKeyplaneSwitchTable:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 containsString:@"shift"]) {
          [v3 removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)getPostfixKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TypistKeyboardCherokee *)self baseCharacters];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [(TypistKeyboardCherokee *)self baseCharacters];
    id v8 = [v7 objectForKeyedSubscript:v4];
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (id)generateBaseKeyMap:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v22 = *(void *)v31;
    id v23 = v5;
    do
    {
      uint64_t v9 = 0;
      uint64_t v24 = v7;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v30 + 1) + 8 * v9), v22, v23);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v25 = v10;
          id v11 = v10;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
                uint64_t v17 = [v11 objectForKeyedSubscript:v16];
                v18 = [v17 objectForKeyedSubscript:@"basekey"];

                if (v18)
                {
                  v19 = [v11 objectForKeyedSubscript:v16];
                  v20 = [v19 objectForKeyedSubscript:@"basekey"];

                  [v4 setObject:v20 forKeyedSubscript:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v13);
          }

          uint64_t v8 = v22;
          id v5 = v23;
          uint64_t v7 = v24;
          v10 = v25;
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)addAccentKeyAction:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TypistKeyboardCherokee *)self vowelKeyMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [(TypistKeyboard *)self keyPlanes];
    uint64_t v8 = [(TypistKeyboard *)self defaultPlaneName];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];
    v10 = [(TypistKeyboardCherokee *)self vowelKeyMap];
    id v11 = [v10 objectForKeyedSubscript:v4];
    uint64_t v12 = [v9 objectForKeyedSubscript:v11];
    v15[0] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (TypistKeyboardCherokee)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKeyboardCherokee;
  id v5 = [(TypistKeyboard *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vowelKeyMap"];
    vowelKeyMap = v5->_vowelKeyMap;
    v5->_vowelKeyMap = (NSDictionary *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TypistKeyboardCherokee;
  [(TypistKeyboard *)&v6 encodeWithCoder:v4];
  vowelKeyMap = self->_vowelKeyMap;
  if (vowelKeyMap) {
    [v4 encodeObject:vowelKeyMap forKey:@"vowelKeyMap"];
  }
}

- (NSDictionary)vowelKeyMap
{
  return self->_vowelKeyMap;
}

- (void)setVowelKeyMap:(id)a3
{
}

- (NSDictionary)baseCharacters
{
  return self->_baseCharacters;
}

- (void)setBaseCharacters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseCharacters, 0);
  objc_storeStrong((id *)&self->_vowelKeyMap, 0);
}

@end
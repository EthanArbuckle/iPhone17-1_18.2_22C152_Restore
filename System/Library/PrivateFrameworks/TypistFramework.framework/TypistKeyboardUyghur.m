@interface TypistKeyboardUyghur
- (NSDictionary)capitalLettersInitialVowelMap;
- (NSDictionary)smallLettersInitialVowelMap;
- (TypistKeyboardUyghur)initWithCoder:(id)a3;
- (id)addKeyboardPopupKeys:(id)a3 inPlane:(id)a4 addTo:(id)a5 keyplaneKeycaps:(id)a6;
- (id)init:(id)a3 options:(id)a4;
- (void)_addDoubleVowelKeys:(id)a3 withMapping:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)preprocessing;
- (void)setCapitalLettersInitialVowelMap:(id)a3;
- (void)setSmallLettersInitialVowelMap:(id)a3;
@end

@implementation TypistKeyboardUyghur

- (id)init:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TypistKeyboardUyghur *)self setSmallLettersInitialVowelMap:&unk_270C6FA80];
  [(TypistKeyboardUyghur *)self setCapitalLettersInitialVowelMap:&unk_270C6FAA8];
  v10.receiver = self;
  v10.super_class = (Class)TypistKeyboardUyghur;
  id v8 = [(TypistKeyboard *)&v10 init:v7 options:v6 locale:@"ug"];

  return v8;
}

- (id)addKeyboardPopupKeys:(id)a3 inPlane:(id)a4 addTo:(id)a5 keyplaneKeycaps:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 containsString:@"letters"])
  {
    id v14 = v12;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)TypistKeyboardUyghur;
    id v14 = [(TypistKeyboard *)&v17 addKeyboardPopupKeys:v10 inPlane:v11 addTo:v12 keyplaneKeycaps:v13];
  }
  v15 = v14;

  return v15;
}

- (void)_addDoubleVowelKeys:(id)a3 withMapping:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v42 = a4;
  id obj = [v42 allKeys];
  uint64_t v43 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v43)
  {
    uint64_t v41 = *(void *)v45;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v45 != v41) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v44 + 1) + 8 * v7);
        v9 = [v42 objectForKeyedSubscript:v8];
        id v10 = [(TypistKeyboard *)self keyPlanes];
        id v11 = [v10 objectForKeyedSubscript:v6];
        id v12 = [v11 objectForKeyedSubscript:v8];

        id v13 = [(TypistKeyboard *)self keyPlanes];
        id v14 = [v13 objectForKeyedSubscript:v6];
        v15 = v14;
        if (v12)
        {
          v16 = [v14 objectForKeyedSubscript:v8];
          objc_super v17 = (void *)[v16 mutableCopy];
          v18 = [(TypistKeyboard *)self keyPlanes];
          v19 = [v18 objectForKeyedSubscript:v6];
          [v19 setObject:v17 forKeyedSubscript:v9];

          v20 = [(TypistKeyboard *)self keyPlanes];
          v21 = [v20 objectForKeyedSubscript:v6];
          v22 = [v21 objectForKeyedSubscript:v9];
          v23 = v22;
          v24 = v9;
LABEL_10:
          [v22 setObject:v24 forKeyedSubscript:@"key"];

          goto LABEL_11;
        }
        v25 = [v14 objectForKeyedSubscript:v9];

        if (v25)
        {
          v39 = [(TypistKeyboard *)self keyPlanes];
          v32 = [v39 objectForKeyedSubscript:v6];
          v33 = [v32 objectForKeyedSubscript:v9];
          v34 = (void *)[v33 mutableCopy];
          v35 = [(TypistKeyboard *)self keyPlanes];
          [v35 objectForKeyedSubscript:v6];
          v37 = id v36 = v6;
          [v37 setObject:v34 forKeyedSubscript:v8];

          id v6 = v36;
          v20 = [(TypistKeyboard *)self keyPlanes];
          v21 = [v20 objectForKeyedSubscript:v36];
          v22 = [v21 objectForKeyedSubscript:v8];
          v23 = v22;
          v24 = v8;
          goto LABEL_10;
        }
        TYLogl(OS_LOG_TYPE_ERROR, @"CRITICAL WARNING: Neither the '%@' nor the %@ key are found!!", v26, v27, v28, v29, v30, v31, (char)v8);
LABEL_11:

        ++v7;
      }
      while (v43 != v7);
      uint64_t v38 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      uint64_t v43 = v38;
    }
    while (v38);
  }
}

- (void)preprocessing
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardUyghur;
  [(TypistKeyboard *)&v5 preprocessing];
  v3 = [(TypistKeyboardUyghur *)self capitalLettersInitialVowelMap];
  [(TypistKeyboardUyghur *)self _addDoubleVowelKeys:@"capital-letters" withMapping:v3];

  v4 = [(TypistKeyboardUyghur *)self smallLettersInitialVowelMap];
  [(TypistKeyboardUyghur *)self _addDoubleVowelKeys:@"small-letters-small-display" withMapping:v4];
}

- (TypistKeyboardUyghur)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardUyghur;
  objc_super v5 = [(TypistKeyboard *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smallLettersInitialVowelMap"];
    smallLettersInitialVowelMap = v5->_smallLettersInitialVowelMap;
    v5->_smallLettersInitialVowelMap = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capitalLettersInitialVowelMap"];
    capitalLettersInitialVowelMap = v5->_capitalLettersInitialVowelMap;
    v5->_capitalLettersInitialVowelMap = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardUyghur;
  [(TypistKeyboard *)&v7 encodeWithCoder:v4];
  smallLettersInitialVowelMap = self->_smallLettersInitialVowelMap;
  if (smallLettersInitialVowelMap) {
    [v4 encodeObject:smallLettersInitialVowelMap forKey:@"smallLettersInitialVowelMap"];
  }
  capitalLettersInitialVowelMap = self->_capitalLettersInitialVowelMap;
  if (capitalLettersInitialVowelMap) {
    [v4 encodeObject:capitalLettersInitialVowelMap forKey:@"capitalLettersInitialVowelMap"];
  }
}

- (NSDictionary)smallLettersInitialVowelMap
{
  return self->_smallLettersInitialVowelMap;
}

- (void)setSmallLettersInitialVowelMap:(id)a3
{
}

- (NSDictionary)capitalLettersInitialVowelMap
{
  return self->_capitalLettersInitialVowelMap;
}

- (void)setCapitalLettersInitialVowelMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capitalLettersInitialVowelMap, 0);
  objc_storeStrong((id *)&self->_smallLettersInitialVowelMap, 0);
}

@end
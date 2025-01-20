@interface TypistKeyboardGreek
- (NSDictionary)acuteDiacriticKey;
- (NSDictionary)acuteKeys;
- (TypistKeyboardGreek)initWithCoder:(id)a3;
- (id)addAccentKeyAction:(id)a3;
- (id)getPostfixKey:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)preprocessing;
- (void)setAcuteDiacriticKey:(id)a3;
- (void)setAcuteKeys:(id)a3;
- (void)setupSentenceBoundryStrings;
@end

@implementation TypistKeyboardGreek

- (id)init:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardGreek;
  return [(TypistKeyboard *)&v5 init:a3 options:a4 locale:@"el_GR"];
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardGreek;
  objc_super v5 = [(TypistKeyboard *)&v7 setupKeyboardInfo:a3 options:a4];
  if (!v5) {
    [(TypistKeyboardGreek *)self setAcuteKeys:&unk_270C6FB20];
  }
  return v5;
}

- (void)setupSentenceBoundryStrings
{
  [(TypistKeyboard *)self setSentenceDelimitingCharacters:@"'\"’”;"];
  [(TypistKeyboard *)self setSentenceTrailingCharacters:@".?!»"];
  -[TypistKeyboard setSentencePrefixingCharacters:](self, "setSentencePrefixingCharacters:", @"¡¿'\"‘“(«");
}

- (void)preprocessing
{
  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardGreek;
  [(TypistKeyboard *)&v15 preprocessing];
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 _referenceBounds];
  if (CGRectGetHeight(v16) <= 1194.0)
  {

    goto LABEL_6;
  }
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 _referenceBounds];
  if (CGRectGetHeight(v17) <= 1194.0)
  {
LABEL_7:

    return;
  }
  BOOL v5 = [(TypistKeyboard *)self isFloating];

  if (v5)
  {
LABEL_6:
    v6 = [(TypistKeyboard *)self keyPlanes];
    objc_super v7 = [(TypistKeyboard *)self defaultPlaneName];
    v8 = [v6 objectForKeyedSubscript:v7];
    v9 = [v8 objectForKeyedSubscript:@"´"];
    [(TypistKeyboardGreek *)self setAcuteDiacriticKey:v9];

    v3 = [(TypistKeyboard *)self keyPlanes];
    v4 = [(TypistKeyboard *)self defaultPlaneName];
    v10 = [v3 objectForKeyedSubscript:v4];
    v11 = [v10 objectForKeyedSubscript:@"σ"];
    v12 = [(TypistKeyboard *)self keyPlanes];
    v13 = [(TypistKeyboard *)self defaultPlaneName];
    v14 = [v12 objectForKeyedSubscript:v13];
    [v14 setObject:v11 forKeyedSubscript:@"ς"];

    goto LABEL_7;
  }
}

- (id)getPostfixKey:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 _referenceBounds];
  double Height = CGRectGetHeight(v17);
  if (Height > 1194.0)
  {
    v3 = [MEMORY[0x263F1C920] mainScreen];
    [v3 _referenceBounds];
    if (CGRectGetHeight(v18) <= 1194.0 || ![(TypistKeyboard *)self isFloating])
    {
      id v14 = v5;
LABEL_12:

      goto LABEL_13;
    }
  }
  uint64_t v8 = [(TypistKeyboardGreek *)self acuteKeys];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(TypistKeyboardGreek *)self acuteKeys];
    uint64_t v11 = [v10 objectForKeyedSubscript:v5];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [(TypistKeyboardGreek *)self acuteKeys];
      id v14 = [v13 objectForKeyedSubscript:v5];
    }
    else
    {
      id v14 = v5;
    }
  }
  else
  {
    id v14 = v5;
  }
  if (Height > 1194.0) {
    goto LABEL_12;
  }
LABEL_13:

  return v14;
}

- (id)addAccentKeyAction:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 _referenceBounds];
  double Height = CGRectGetHeight(v19);
  if (Height <= 1194.0
    || ([MEMORY[0x263F1C920] mainScreen],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 _referenceBounds],
        CGRectGetHeight(v20) > 1194.0)
    && [(TypistKeyboard *)self isFloating])
  {
    uint64_t v8 = [(TypistKeyboardGreek *)self acuteKeys];
    if (v8)
    {
      v9 = (void *)v8;
      uint64_t v10 = [(TypistKeyboardGreek *)self acuteDiacriticKey];
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        v12 = [(TypistKeyboardGreek *)self acuteKeys];
        v13 = [v12 objectForKeyedSubscript:v5];
        if (v13)
        {
          id v14 = [(TypistKeyboardGreek *)self acuteDiacriticKey];
          v17[0] = v14;
          objc_super v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
        }
        else
        {
          objc_super v15 = 0;
        }

LABEL_13:
        if (Height <= 1194.0) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
    objc_super v15 = 0;
    goto LABEL_13;
  }
  objc_super v15 = 0;
LABEL_14:

LABEL_15:
  return v15;
}

- (TypistKeyboardGreek)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardGreek;
  id v5 = [(TypistKeyboard *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acuteKeys"];
    acuteKeys = v5->_acuteKeys;
    v5->_acuteKeys = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acuteDiacriticKey"];
    acuteDiacriticKey = v5->_acuteDiacriticKey;
    v5->_acuteDiacriticKey = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardGreek;
  [(TypistKeyboard *)&v7 encodeWithCoder:v4];
  acuteKeys = self->_acuteKeys;
  if (acuteKeys) {
    [v4 encodeObject:acuteKeys forKey:@"acuteKeys"];
  }
  acuteDiacriticKey = self->_acuteDiacriticKey;
  if (acuteDiacriticKey) {
    [v4 encodeObject:acuteDiacriticKey forKey:@"acuteDiacriticKey"];
  }
}

- (NSDictionary)acuteKeys
{
  return self->_acuteKeys;
}

- (void)setAcuteKeys:(id)a3
{
}

- (NSDictionary)acuteDiacriticKey
{
  return self->_acuteDiacriticKey;
}

- (void)setAcuteDiacriticKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acuteDiacriticKey, 0);
  objc_storeStrong((id *)&self->_acuteKeys, 0);
}

@end
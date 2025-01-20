@interface TypistKeyboardHawaiian
- (NSDictionary)kahakoDiacriticKey;
- (NSDictionary)kahakoKeys;
- (TypistKeyboardHawaiian)initWithCoder:(id)a3;
- (id)addAccentKeyAction:(id)a3;
- (id)getPostfixKey:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)preprocessing;
- (void)setKahakoDiacriticKey:(id)a3;
- (void)setKahakoKeys:(id)a3;
- (void)setupSentenceBoundryStrings;
@end

@implementation TypistKeyboardHawaiian

- (id)init:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardHawaiian;
  return [(TypistKeyboard *)&v5 init:a3 options:a4 locale:@"haw"];
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardHawaiian;
  objc_super v5 = [(TypistKeyboard *)&v7 setupKeyboardInfo:a3 options:a4];
  if (!v5) {
    [(TypistKeyboardHawaiian *)self setKahakoKeys:&unk_270C6FB48];
  }
  return v5;
}

- (void)setupSentenceBoundryStrings
{
  v3.receiver = self;
  v3.super_class = (Class)TypistKeyboardHawaiian;
  [(TypistKeyboard *)&v3 setupSentenceBoundryStrings];
  -[TypistKeyboard setSentencePrefixingCharacters:](self, "setSentencePrefixingCharacters:", @"¡¿'\"‘“(ʻ");
}

- (void)preprocessing
{
  v8.receiver = self;
  v8.super_class = (Class)TypistKeyboardHawaiian;
  [(TypistKeyboard *)&v8 preprocessing];
  objc_super v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 _referenceBounds];
  if (CGRectGetHeight(v9) <= 1194.0)
  {

    goto LABEL_6;
  }
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 _referenceBounds];
  if (CGRectGetHeight(v10) <= 1194.0)
  {
LABEL_7:

    return;
  }
  BOOL v5 = [(TypistKeyboard *)self isFloating];

  if (v5)
  {
LABEL_6:
    objc_super v3 = [(TypistKeyboard *)self keyPlanes];
    v4 = [(TypistKeyboard *)self defaultPlaneName];
    v6 = [v3 objectForKeyedSubscript:v4];
    objc_super v7 = [v6 objectForKeyedSubscript:@"¯"];
    [(TypistKeyboardHawaiian *)self setKahakoDiacriticKey:v7];

    goto LABEL_7;
  }
}

- (id)getPostfixKey:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 _referenceBounds];
  double Height = CGRectGetHeight(v15);
  if (Height <= 1194.0
    || ([MEMORY[0x263F1C920] mainScreen],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        [v3 _referenceBounds],
        CGRectGetHeight(v16) > 1194.0)
    && [(TypistKeyboard *)self isFloating])
  {
    objc_super v8 = [(TypistKeyboardHawaiian *)self kahakoKeys];
    uint64_t v9 = [v8 objectForKeyedSubscript:v5];
    if (v9)
    {
      CGRect v10 = (void *)v9;
      v11 = [(TypistKeyboardHawaiian *)self kahakoKeys];
      id v12 = [v11 objectForKeyedSubscript:v5];
    }
    else
    {
      id v12 = v5;
    }

    if (Height <= 1194.0) {
      goto LABEL_10;
    }
  }
  else
  {
    id v12 = v5;
  }

LABEL_10:
  return v12;
}

- (id)addAccentKeyAction:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 _referenceBounds];
  double Height = CGRectGetHeight(v18);
  if (Height <= 1194.0
    || ([MEMORY[0x263F1C920] mainScreen],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        [v3 _referenceBounds],
        CGRectGetHeight(v19) > 1194.0)
    && [(TypistKeyboard *)self isFloating])
  {
    objc_super v8 = [(TypistKeyboardHawaiian *)self kahakoKeys];
    uint64_t v9 = [v8 objectForKeyedSubscript:v5];
    if (v9)
    {
      CGRect v10 = (void *)v9;
      uint64_t v11 = [(TypistKeyboardHawaiian *)self kahakoDiacriticKey];
      if (v11)
      {
        id v12 = (void *)v11;
        v13 = [(TypistKeyboardHawaiian *)self kahakoDiacriticKey];
        v16[0] = v13;
        v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];

        goto LABEL_10;
      }
    }
    v14 = 0;
LABEL_10:
    if (Height <= 1194.0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v14 = 0;
LABEL_11:

LABEL_12:
  return v14;
}

- (TypistKeyboardHawaiian)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardHawaiian;
  id v5 = [(TypistKeyboard *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kahakoKeys"];
    kahakoKeys = v5->_kahakoKeys;
    v5->_kahakoKeys = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kahakoDiacriticKey"];
    kahakoDiacriticKey = v5->_kahakoDiacriticKey;
    v5->_kahakoDiacriticKey = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardHawaiian;
  [(TypistKeyboard *)&v7 encodeWithCoder:v4];
  kahakoKeys = self->_kahakoKeys;
  if (kahakoKeys) {
    [v4 encodeObject:kahakoKeys forKey:@"kahakoKeys"];
  }
  kahakoDiacriticKey = self->_kahakoDiacriticKey;
  if (kahakoDiacriticKey) {
    [v4 encodeObject:kahakoDiacriticKey forKey:@"kahakoDiacriticKey"];
  }
}

- (NSDictionary)kahakoKeys
{
  return self->_kahakoKeys;
}

- (void)setKahakoKeys:(id)a3
{
}

- (NSDictionary)kahakoDiacriticKey
{
  return self->_kahakoDiacriticKey;
}

- (void)setKahakoDiacriticKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kahakoDiacriticKey, 0);
  objc_storeStrong((id *)&self->_kahakoKeys, 0);
}

@end
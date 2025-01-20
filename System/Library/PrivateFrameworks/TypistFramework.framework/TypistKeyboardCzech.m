@interface TypistKeyboardCzech
- (NSDictionary)acuteDiacriticKey;
- (NSDictionary)acuteKeys;
- (NSDictionary)caronDiacriticKey;
- (NSDictionary)caronKeys;
- (TypistKeyboardCzech)initWithCoder:(id)a3;
- (id)addAccentKeyAction:(id)a3;
- (id)convertRepresentedStringsIfNecessary:(id)a3;
- (id)getPostfixKey:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)preprocessing;
- (void)setAcuteDiacriticKey:(id)a3;
- (void)setAcuteKeys:(id)a3;
- (void)setCaronDiacriticKey:(id)a3;
- (void)setCaronKeys:(id)a3;
@end

@implementation TypistKeyboardCzech

- (id)init:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardCzech;
  return [(TypistKeyboard *)&v5 init:a3 options:a4 locale:@"cs_CZ"];
}

- (id)convertRepresentedStringsIfNecessary:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"̌"]) {
    v4 = @"ˇ";
  }
  else {
    v4 = (__CFString *)v3;
  }

  return v4;
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardCzech;
  objc_super v5 = [(TypistKeyboard *)&v7 setupKeyboardInfo:a3 options:a4];
  if (!v5)
  {
    [(TypistKeyboardCzech *)self setAcuteKeys:&unk_270C6FA30];
    [(TypistKeyboardCzech *)self setCaronKeys:&unk_270C6FA58];
  }
  return v5;
}

- (id)getPostfixKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 _referenceBounds];
  if (CGRectGetHeight(v17) <= 1194.0)
  {
  }
  else
  {
    v6 = [MEMORY[0x263F1C920] mainScreen];
    [v6 _referenceBounds];
    if (CGRectGetHeight(v18) <= 1194.0)
    {

      goto LABEL_12;
    }
    BOOL v7 = [(TypistKeyboard *)self isFloating];

    if (!v7) {
      goto LABEL_12;
    }
  }
  v8 = [(TypistKeyboardCzech *)self acuteKeys];
  v9 = [v8 objectForKeyedSubscript:v4];

  if (v9)
  {
    v10 = [(TypistKeyboardCzech *)self acuteKeys];
LABEL_11:
    v13 = v10;
    id v14 = [v10 objectForKeyedSubscript:v4];

    goto LABEL_13;
  }
  v11 = [(TypistKeyboardCzech *)self caronKeys];
  v12 = [v11 objectForKeyedSubscript:v4];

  if (v12)
  {
    v10 = [(TypistKeyboardCzech *)self caronKeys];
    goto LABEL_11;
  }
LABEL_12:
  id v14 = v4;
LABEL_13:

  return v14;
}

- (void)preprocessing
{
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardCzech;
  [(TypistKeyboard *)&v7 preprocessing];
  id v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 _referenceBounds];
  if (CGRectGetHeight(v8) <= 1194.0)
  {

    goto LABEL_6;
  }
  id v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 _referenceBounds];
  if (CGRectGetHeight(v9) <= 1194.0)
  {

    goto LABEL_8;
  }
  BOOL v5 = [(TypistKeyboard *)self isFloating];

  if (v5)
  {
LABEL_6:
    v6 = [(TypistKeyboard *)self findKeyOnAnyPlane:@"´"];
    [(TypistKeyboardCzech *)self setAcuteDiacriticKey:v6];

    id v3 = [(TypistKeyboard *)self findKeyOnAnyPlane:@"ˇ"];
    [(TypistKeyboardCzech *)self setCaronDiacriticKey:v3];
LABEL_8:
  }
}

- (id)addAccentKeyAction:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 _referenceBounds];
  if (CGRectGetHeight(v23) <= 1194.0)
  {
  }
  else
  {
    v6 = [MEMORY[0x263F1C920] mainScreen];
    [v6 _referenceBounds];
    if (CGRectGetHeight(v24) <= 1194.0)
    {

LABEL_15:
      goto LABEL_16;
    }
    BOOL v7 = [(TypistKeyboard *)self isFloating];

    if (!v7) {
      goto LABEL_16;
    }
  }
  CGRect v8 = [(TypistKeyboardCzech *)self acuteKeys];
  uint64_t v9 = [v8 objectForKeyedSubscript:v4];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(TypistKeyboardCzech *)self acuteDiacriticKey];

    if (v11)
    {
      v12 = [(TypistKeyboardCzech *)self acuteDiacriticKey];
      v21[0] = v12;
      v13 = (void *)MEMORY[0x263EFF8C0];
      id v14 = (void **)v21;
LABEL_14:
      CGRect v18 = [v13 arrayWithObjects:v14 count:1];

      goto LABEL_17;
    }
  }
  else
  {
  }
  BOOL v5 = [(TypistKeyboardCzech *)self caronKeys];
  uint64_t v15 = [v5 objectForKeyedSubscript:v4];
  if (!v15) {
    goto LABEL_15;
  }
  v16 = (void *)v15;
  CGRect v17 = [(TypistKeyboardCzech *)self caronDiacriticKey];

  if (v17)
  {
    v12 = [(TypistKeyboardCzech *)self caronDiacriticKey];
    v20 = v12;
    v13 = (void *)MEMORY[0x263EFF8C0];
    id v14 = &v20;
    goto LABEL_14;
  }
LABEL_16:
  CGRect v18 = 0;
LABEL_17:

  return v18;
}

- (TypistKeyboardCzech)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardCzech;
  BOOL v5 = [(TypistKeyboard *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acuteKeys"];
    acuteKeys = v5->_acuteKeys;
    v5->_acuteKeys = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"caronKeys"];
    caronKeys = v5->_caronKeys;
    v5->_caronKeys = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acuteDiacriticKey"];
    acuteDiacriticKey = v5->_acuteDiacriticKey;
    v5->_acuteDiacriticKey = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"caronDiacriticKey"];
    caronDiacriticKey = v5->_caronDiacriticKey;
    v5->_caronDiacriticKey = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKeyboardCzech;
  [(TypistKeyboard *)&v9 encodeWithCoder:v4];
  acuteKeys = self->_acuteKeys;
  if (acuteKeys) {
    [v4 encodeObject:acuteKeys forKey:@"acuteKeys"];
  }
  caronKeys = self->_caronKeys;
  if (caronKeys) {
    [v4 encodeObject:caronKeys forKey:@"caronKeys"];
  }
  acuteDiacriticKey = self->_acuteDiacriticKey;
  if (acuteDiacriticKey) {
    [v4 encodeObject:acuteDiacriticKey forKey:@"acuteDiacriticKey"];
  }
  caronDiacriticKey = self->_caronDiacriticKey;
  if (caronDiacriticKey) {
    [v4 encodeObject:caronDiacriticKey forKey:@"caronDiacriticKey"];
  }
}

- (NSDictionary)acuteKeys
{
  return self->_acuteKeys;
}

- (void)setAcuteKeys:(id)a3
{
}

- (NSDictionary)caronKeys
{
  return self->_caronKeys;
}

- (void)setCaronKeys:(id)a3
{
}

- (NSDictionary)acuteDiacriticKey
{
  return self->_acuteDiacriticKey;
}

- (void)setAcuteDiacriticKey:(id)a3
{
}

- (NSDictionary)caronDiacriticKey
{
  return self->_caronDiacriticKey;
}

- (void)setCaronDiacriticKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caronDiacriticKey, 0);
  objc_storeStrong((id *)&self->_acuteDiacriticKey, 0);
  objc_storeStrong((id *)&self->_caronKeys, 0);
  objc_storeStrong((id *)&self->_acuteKeys, 0);
}

@end
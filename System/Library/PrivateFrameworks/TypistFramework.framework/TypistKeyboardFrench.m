@interface TypistKeyboardFrench
- (NSDictionary)accentKey;
- (NSDictionary)postfixedKeys;
- (TypistKeyboardFrench)initWithCoder:(id)a3;
- (id)addAccentKeyAction:(id)a3;
- (id)getPostfixKey:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)preprocessing;
- (void)setAccentKey:(id)a3;
- (void)setPostfixedKeys:(id)a3;
@end

@implementation TypistKeyboardFrench

- (id)init:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardFrench;
  return [(TypistKeyboard *)&v5 init:a3 options:a4 locale:@"fr"];
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardFrench;
  objc_super v5 = [(TypistKeyboard *)&v7 setupKeyboardInfo:a3 options:a4];
  if (!v5) {
    [(TypistKeyboardFrench *)self setPostfixedKeys:&unk_270C6FAF8];
  }
  return v5;
}

- (void)preprocessing
{
  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardFrench;
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
    [(TypistKeyboardFrench *)self setAccentKey:v9];

    v3 = [(TypistKeyboard *)self keyPlanes];
    v4 = [(TypistKeyboard *)self defaultPlaneName];
    v10 = [v3 objectForKeyedSubscript:v4];
    v11 = [v10 objectForKeyedSubscript:@"´"];
    v12 = [(TypistKeyboard *)self keyPlanes];
    v13 = [(TypistKeyboard *)self defaultPlaneName];
    v14 = [v12 objectForKeyedSubscript:v13];
    [v14 setObject:v11 forKeyedSubscript:@"ˋ"];

    goto LABEL_7;
  }
}

- (id)getPostfixKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TypistKeyboardFrench *)self accentKey];
  if (!v5) {
    goto LABEL_11;
  }
  v6 = (void *)v5;
  objc_super v7 = [(TypistKeyboardFrench *)self postfixedKeys];
  uint64_t v8 = [v7 objectForKeyedSubscript:v4];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [MEMORY[0x263F1C920] mainScreen];
    [v10 _referenceBounds];
    if (CGRectGetHeight(v17) <= 1194.0)
    {

      goto LABEL_8;
    }
    v11 = [MEMORY[0x263F1C920] mainScreen];
    [v11 _referenceBounds];
    if (CGRectGetHeight(v18) > 1194.0)
    {
      BOOL v12 = [(TypistKeyboard *)self isFloating];

      if (!v12) {
        goto LABEL_11;
      }
LABEL_8:
      v13 = [(TypistKeyboardFrench *)self postfixedKeys];
      id v14 = [v13 objectForKeyedSubscript:v4];

      goto LABEL_12;
    }
  }
LABEL_11:
  id v14 = v4;
LABEL_12:

  return v14;
}

- (id)addAccentKeyAction:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TypistKeyboardFrench *)self postfixedKeys];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [(TypistKeyboardFrench *)self accentKey];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      v9 = [MEMORY[0x263F1C920] mainScreen];
      [v9 _referenceBounds];
      if (CGRectGetHeight(v17) <= 1194.0)
      {

        goto LABEL_8;
      }
      v10 = [MEMORY[0x263F1C920] mainScreen];
      [v10 _referenceBounds];
      if (CGRectGetHeight(v18) > 1194.0)
      {
        BOOL v11 = [(TypistKeyboard *)self isFloating];

        if (!v11) {
          goto LABEL_12;
        }
LABEL_8:
        BOOL v12 = [(TypistKeyboardFrench *)self accentKey];
        v15[0] = v12;
        v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];

        goto LABEL_13;
      }
    }
  }

LABEL_12:
  v13 = 0;
LABEL_13:
  return v13;
}

- (TypistKeyboardFrench)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardFrench;
  uint64_t v5 = [(TypistKeyboard *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postfixedKeys"];
    postfixedKeys = v5->_postfixedKeys;
    v5->_postfixedKeys = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accentKey"];
    accentKey = v5->_accentKey;
    v5->_accentKey = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardFrench;
  [(TypistKeyboard *)&v7 encodeWithCoder:v4];
  postfixedKeys = self->_postfixedKeys;
  if (postfixedKeys) {
    [v4 encodeObject:postfixedKeys forKey:@"postfixedKeys"];
  }
  accentKey = self->_accentKey;
  if (accentKey) {
    [v4 encodeObject:accentKey forKey:@"accentKey"];
  }
}

- (NSDictionary)postfixedKeys
{
  return self->_postfixedKeys;
}

- (void)setPostfixedKeys:(id)a3
{
}

- (NSDictionary)accentKey
{
  return self->_accentKey;
}

- (void)setAccentKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accentKey, 0);
  objc_storeStrong((id *)&self->_postfixedKeys, 0);
}

@end
@interface TypistKeyboardTibetan
- (NSRegularExpression)subjoinedExpression;
- (TypistKeyboardTibetan)initWithCoder:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (id)tryAlternateVariationsOfKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSubjoinedExpression:(id)a3;
@end

@implementation TypistKeyboardTibetan

- (id)init:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardTibetan;
  return [(TypistKeyboard *)&v5 init:a3 options:a4 locale:@"bo"];
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TypistKeyboardTibetan;
  objc_super v5 = [(TypistKeyboard *)&v10 setupKeyboardInfo:a3 options:a4];
  if (!v5)
  {
    id v9 = 0;
    v6 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[\\u0F90-\\u0FBC|\\u0F71]" options:1 error:&v9];
    id v7 = v9;
    [(TypistKeyboardTibetan *)self setSubjoinedExpression:v6];
  }
  return v5;
}

- (id)tryAlternateVariationsOfKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if ([v4 characterAtIndex:0] == 3953)
  {
    v16.receiver = self;
    v16.super_class = (Class)TypistKeyboardTibetan;
    v6 = [(TypistKeyboard *)&v16 generateKeystrokeStream:@"྄འ"];
    goto LABEL_10;
  }
  id v7 = [(TypistKeyboardTibetan *)self subjoinedExpression];
  uint64_t v8 = objc_msgSend(v7, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));

  if (v8)
  {
    [v5 length];
    MEMORY[0x270FA5388]();
    objc_super v10 = (char *)&v14 - v9;
    *(_WORD *)((char *)&v14 - v9) = 3972;
    if ([v5 length])
    {
      unint64_t v11 = 0;
      do
      {
        *(_WORD *)&v10[2 * v11 + 2] = [v5 characterAtIndex:v11] - 80;
        ++v11;
      }
      while (v11 < [v5 length]);
    }
    v12 = objc_msgSend(NSString, "stringWithCharacters:length:", v10, objc_msgSend(v5, "length") + 1);
    v15.receiver = self;
    v15.super_class = (Class)TypistKeyboardTibetan;
    v6 = [(TypistKeyboard *)&v15 generateKeystrokeStream:v12];
  }
  else
  {
LABEL_9:
    v6 = 0;
  }
LABEL_10:

  return v6;
}

- (TypistKeyboardTibetan)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKeyboardTibetan;
  objc_super v5 = [(TypistKeyboard *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subjoinedExpression"];
    subjoinedExpression = v5->_subjoinedExpression;
    v5->_subjoinedExpression = (NSRegularExpression *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TypistKeyboardTibetan;
  [(TypistKeyboard *)&v6 encodeWithCoder:v4];
  subjoinedExpression = self->_subjoinedExpression;
  if (subjoinedExpression) {
    [v4 encodeObject:subjoinedExpression forKey:@"subjoinedExpression"];
  }
}

- (NSRegularExpression)subjoinedExpression
{
  return self->_subjoinedExpression;
}

- (void)setSubjoinedExpression:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
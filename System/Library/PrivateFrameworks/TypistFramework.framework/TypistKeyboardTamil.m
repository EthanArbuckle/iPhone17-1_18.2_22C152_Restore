@interface TypistKeyboardTamil
- (NSDictionary)joinedVowelForms;
- (TypistKeyboardTamil)initWithCoder:(id)a3;
- (id)getPostfixKey:(id)a3;
- (id)init:(id)a3 options:(id)a4;
- (id)setupKeyboardInfo:(id)a3 options:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setJoinedVowelForms:(id)a3;
@end

@implementation TypistKeyboardTamil

- (id)init:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardTamil;
  return [(TypistKeyboard *)&v5 init:a3 options:a4 locale:@"ta"];
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardTamil;
  objc_super v5 = [(TypistKeyboard *)&v7 setupKeyboardInfo:a3 options:a4];
  if (!v5) {
    [(TypistKeyboardTamil *)self setJoinedVowelForms:&unk_270C6FC10];
  }
  return v5;
}

- (id)getPostfixKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TypistKeyboardTamil *)self joinedVowelForms];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    objc_super v7 = [(TypistKeyboardTamil *)self joinedVowelForms];
    id v8 = [v7 objectForKeyedSubscript:v4];
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (TypistKeyboardTamil)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKeyboardTamil;
  objc_super v5 = [(TypistKeyboard *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"joinedVowelForms"];
    joinedVowelForms = v5->_joinedVowelForms;
    v5->_joinedVowelForms = (NSDictionary *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TypistKeyboardTamil;
  [(TypistKeyboard *)&v6 encodeWithCoder:v4];
  joinedVowelForms = self->_joinedVowelForms;
  if (joinedVowelForms) {
    [v4 encodeObject:joinedVowelForms forKey:@"joinedVowelForms"];
  }
}

- (NSDictionary)joinedVowelForms
{
  return self->_joinedVowelForms;
}

- (void)setJoinedVowelForms:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
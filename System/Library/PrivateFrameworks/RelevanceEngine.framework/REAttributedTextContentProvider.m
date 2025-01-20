@interface REAttributedTextContentProvider
+ (id)textContentProviderWithAttributedText:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)text;
- (REAttributedTextContentProvider)initWithAttributedText:(id)a3;
- (REAttributedTextContentProvider)initWithCoder:(id)a3;
- (id)attributedStringRepresentation;
- (id)clockKitTextProviderRepresentation;
- (id)contentEncodedString;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REAttributedTextContentProvider

+ (id)textContentProviderWithAttributedText:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAttributedText:v4];

  return v5;
}

- (REAttributedTextContentProvider)initWithAttributedText:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REAttributedTextContentProvider;
  v5 = [(REAttributedTextContentProvider *)&v9 init];
  if (v5)
  {
    v6 = (void *)[v4 copy];
    v7 = v6;
    if (!v6) {
      v7 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26CFA57D0];
    }
    objc_storeStrong((id *)&v5->_text, v7);
    if (!v6) {
  }
    }
  return v5;
}

- (id)attributedStringRepresentation
{
  return self->_text;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  text = self->_text;
  return (id)[v4 initWithAttributedText:text];
}

- (unint64_t)hash
{
  return [(NSAttributedString *)self->_text hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 text];
    if (v6 == self->_text)
    {
      char v8 = 1;
    }
    else
    {
      v7 = [v5 text];
      char v8 = [v7 isEqualToAttributedString:self->_text];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)clockKitTextProviderRepresentation
{
  v2 = [(NSAttributedString *)self->_text string];
  v3 = [getCLKSimpleTextProviderClass() textProviderWithText:v2];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
}

- (REAttributedTextContentProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];

  v6 = [(REAttributedTextContentProvider *)self initWithAttributedText:v5];
  return v6;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
}

- (id)contentEncodedString
{
  v2 = [(REAttributedTextContentProvider *)self text];
  v3 = [v2 contentEncodedString];

  return v3;
}

@end
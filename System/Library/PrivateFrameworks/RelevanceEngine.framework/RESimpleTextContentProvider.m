@interface RESimpleTextContentProvider
+ (id)textContentProviderWithText:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (RESimpleTextContentProvider)initWithCoder:(id)a3;
- (RESimpleTextContentProvider)initWithText:(id)a3;
- (id)attributedStringRepresentation;
- (id)clockKitTextProviderRepresentation;
- (id)contentEncodedString;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RESimpleTextContentProvider

+ (id)textContentProviderWithText:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithText:v4];

  return v5;
}

- (RESimpleTextContentProvider)initWithText:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RESimpleTextContentProvider;
  v5 = [(RESimpleTextContentProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    text = v5->_text;
    v5->_text = (NSString *)v6;
  }
  return v5;
}

- (id)attributedStringRepresentation
{
  id v3 = objc_alloc(MEMORY[0x263F086A0]);
  if (self->_text) {
    text = self->_text;
  }
  else {
    text = (NSString *)&stru_26CFA57D0;
  }
  v5 = (void *)[v3 initWithString:text];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  text = self->_text;
  return (id)[v4 initWithText:text];
}

- (unint64_t)hash
{
  return [(NSString *)self->_text hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 text];
    uint64_t v6 = v5;
    if (v5 == self->_text) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSString isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)clockKitTextProviderRepresentation
{
  id CLKSimpleTextProviderClass = getCLKSimpleTextProviderClass();
  text = self->_text;
  return (id)[CLKSimpleTextProviderClass textProviderWithText:text];
}

- (void)encodeWithCoder:(id)a3
{
}

- (RESimpleTextContentProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];

  uint64_t v6 = [(RESimpleTextContentProvider *)self initWithText:v5];
  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
}

- (id)contentEncodedString
{
  v2 = [(RESimpleTextContentProvider *)self text];
  id v3 = [v2 contentEncodedString];

  return v3;
}

@end
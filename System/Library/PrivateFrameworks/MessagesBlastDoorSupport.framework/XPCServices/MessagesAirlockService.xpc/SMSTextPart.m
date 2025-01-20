@interface SMSTextPart
- (NSString)contentLocation;
- (NSString)text;
- (SMSTextPart)initWithContentLocation:(id)a3;
- (void)appendText:(id)a3;
@end

@implementation SMSTextPart

- (SMSTextPart)initWithContentLocation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMSTextPart;
  v5 = [(SMSTextPart *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    contentLocation = v5->_contentLocation;
    v5->_contentLocation = v6;
  }
  return v5;
}

- (void)appendText:(id)a3
{
  text = self->_text;
  if (text)
  {
    [(NSMutableString *)text appendString:a3];
  }
  else
  {
    self->_text = (NSMutableString *)[a3 mutableCopy];
    _objc_release_x1();
  }
}

- (NSString)contentLocation
{
  return self->_contentLocation;
}

- (NSString)text
{
  return &self->_text->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_contentLocation, 0);
}

@end
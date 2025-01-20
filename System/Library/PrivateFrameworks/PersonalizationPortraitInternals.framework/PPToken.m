@interface PPToken
- (NSString)tag;
- (NSString)text;
- (PPToken)initWithText:(id)a3 tag:(id)a4;
@end

@implementation PPToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (NSString)tag
{
  return self->_tag;
}

- (NSString)text
{
  return self->_text;
}

- (PPToken)initWithText:(id)a3 tag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPToken;
  v9 = [(PPToken *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    objc_storeStrong((id *)&v10->_tag, a4);
  }

  return v10;
}

@end
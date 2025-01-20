@interface TMLParserToken
- (NSString)text;
- (TMLParserToken)initWithToken:(unint64_t)a3 text:(id)a4;
- (id)description;
- (unint64_t)token;
@end

@implementation TMLParserToken

- (TMLParserToken)initWithToken:(unint64_t)a3 text:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TMLParserToken;
  v7 = [(TMLParserToken *)&v14 init];
  v10 = v7;
  if (v7)
  {
    v7->_token = a3;
    if (v6)
    {
      uint64_t v11 = objc_msgSend_copy(v6, v8, v9);
      text = v10->_text;
      v10->_text = (NSString *)v11;
    }
    else
    {
      text = v7->_text;
      v7->_text = (NSString *)&stru_26ECF02A8;
    }
  }
  return v10;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, v2, @"<%u: %@>", self->_token, self->_text);
}

- (unint64_t)token
{
  return self->_token;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
}

@end
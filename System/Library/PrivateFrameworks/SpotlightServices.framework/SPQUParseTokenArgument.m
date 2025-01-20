@interface SPQUParseTokenArgument
- (NSString)token;
- (NSString)tokenLabel;
- (NSValue)tokenRange;
- (SPQUParseTokenArgument)initWithLabel:(id)a3 token:(id)a4 tokenRange:(id)a5;
- (id)getEncodedData;
- (void)setToken:(id)a3;
- (void)setTokenLabel:(id)a3;
- (void)setTokenRange:(id)a3;
@end

@implementation SPQUParseTokenArgument

- (SPQUParseTokenArgument)initWithLabel:(id)a3 token:(id)a4 tokenRange:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SPQUParseTokenArgument;
  v12 = [(SPQUParseTokenArgument *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_token, a4);
    objc_storeStrong((id *)&v13->_tokenLabel, a3);
    objc_storeStrong((id *)&v13->_tokenRange, a5);
  }

  return v13;
}

- (id)getEncodedData
{
  v3 = objc_opt_new();
  [v3 setValue:self->_token forKey:@"text"];
  [v3 setValue:self->_tokenLabel forKey:@"textLabel"];
  [v3 setValue:self->_tokenRange forKey:@"textRange"];
  return v3;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)tokenLabel
{
  return self->_tokenLabel;
}

- (void)setTokenLabel:(id)a3
{
}

- (NSValue)tokenRange
{
  return self->_tokenRange;
}

- (void)setTokenRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenRange, 0);
  objc_storeStrong((id *)&self->_tokenLabel, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
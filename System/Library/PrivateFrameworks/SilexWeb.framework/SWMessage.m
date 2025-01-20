@interface SWMessage
- (NSDictionary)body;
- (NSString)name;
- (SWMessage)initWithDictionary:(id)a3;
@end

@implementation SWMessage

- (SWMessage)initWithDictionary:(id)a3
{
  id v5 = a3;
  v6 = [v5 objectForKey:@"name"];
  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)SWMessage;
    v7 = [(SWMessage *)&v9 init];
    self = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_name, v6);
      objc_storeStrong((id *)&self->_body, a3);
    }
  }

  return self;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
@interface VSJSError
- (NSString)message;
- (VSJSError)init;
- (id)description;
- (id)error;
- (unint64_t)code;
- (void)setCode:(unint64_t)a3;
- (void)setMessage:(id)a3;
@end

@implementation VSJSError

- (VSJSError)init
{
  v3 = [MEMORY[0x263F4B3C8] currentAppContext];
  v6.receiver = self;
  v6.super_class = (Class)VSJSError;
  v4 = [(IKJSObject *)&v6 initWithAppContext:v3];

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v15.receiver = self;
  v15.super_class = (Class)VSJSError;
  v4 = [(VSJSError *)&v15 description];
  [v3 addObject:v4];

  v5 = NSString;
  objc_super v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VSJSError code](self, "code"));
  v7 = [v5 stringWithFormat:@"%@=%@", @"code", v6];
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [(VSJSError *)self message];
  v10 = [v8 stringWithFormat:@"%@=%@", @"message", v9];
  [v3 addObject:v10];

  v11 = NSString;
  v12 = [v3 componentsJoinedByString:@", "];
  v13 = [v11 stringWithFormat:@"<%@>", v12];

  return v13;
}

- (id)error
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [(VSJSError *)self message];
  v4 = v3;
  if (v3)
  {
    uint64_t v9 = *MEMORY[0x263F08320];
    v5 = (void *)[v3 copy];
    v10[0] = v5;
    objc_super v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    objc_super v6 = 0;
  }
  v7 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F1E438], -[VSJSError code](self, "code"), v6);

  return v7;
}

- (unint64_t)code
{
  return self->_code;
}

- (void)setCode:(unint64_t)a3
{
  self->_code = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
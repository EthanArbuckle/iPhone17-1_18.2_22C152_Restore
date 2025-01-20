@interface SUProtocolButton
- (NSDictionary)buttonDictionary;
- (NSString)buttonLocation;
- (NSString)buttonTarget;
- (NSString)buttonTitle;
- (NSURL)URL;
- (SUProtocolButton)init;
- (SUProtocolButton)initWithButtonDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation SUProtocolButton

- (SUProtocolButton)init
{
  return [(SUProtocolButton *)self initWithButtonDictionary:0];
}

- (SUProtocolButton)initWithButtonDictionary:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUProtocolButton.m", 37, @"Must provide button dictionary");
  }
  v7.receiver = self;
  v7.super_class = (Class)SUProtocolButton;
  v5 = [(SUProtocolButton *)&v7 init];
  if (v5)
  {
    v5->_buttonDictionary = (NSDictionary *)[a3 copy];
    if (![(SUProtocolButton *)v5 buttonTitle] || ![(SUProtocolButton *)v5 URL])
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUProtocolButton;
  [(SUProtocolButton *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [(NSDictionary *)self->_buttonDictionary copyWithZone:a3];
  return v5;
}

- (NSString)buttonLocation
{
  id v2 = [(NSDictionary *)self->_buttonDictionary objectForKey:@"location"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return (NSString *)@"left";
  }
  id v3 = v2;

  return (NSString *)v3;
}

- (NSString)buttonTarget
{
  id v2 = [(NSDictionary *)self->_buttonDictionary objectForKey:@"target"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return (NSString *)@"new";
  }
  id v3 = v2;

  return (NSString *)v3;
}

- (NSString)buttonTitle
{
  id v2 = [(NSDictionary *)self->_buttonDictionary objectForKey:@"title"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;

  return (NSString *)v3;
}

- (NSURL)URL
{
  id v2 = [(NSDictionary *)self->_buttonDictionary objectForKey:@"url"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = NSURL;

  return (NSURL *)[v3 URLWithString:v2];
}

- (NSDictionary)buttonDictionary
{
  return self->_buttonDictionary;
}

@end
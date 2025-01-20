@interface TCVegaCSSStyleDeclaration
- (NSString)cursor;
- (TCVegaCSSStyleDeclaration)init;
- (void)setCursor:(id)a3;
@end

@implementation TCVegaCSSStyleDeclaration

- (TCVegaCSSStyleDeclaration)init
{
  v5.receiver = self;
  v5.super_class = (Class)TCVegaCSSStyleDeclaration;
  v2 = [(TCVegaCSSStyleDeclaration *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(NSString);
    [(TCVegaCSSStyleDeclaration *)v2 setCursor:v3];
  }
  return v2;
}

- (NSString)cursor
{
  return self->cursor;
}

- (void)setCursor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
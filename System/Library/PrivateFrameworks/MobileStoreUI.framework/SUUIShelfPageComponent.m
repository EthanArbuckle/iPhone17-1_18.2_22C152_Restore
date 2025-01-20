@interface SUUIShelfPageComponent
- (SUUIShelfPageComponent)initWithViewElement:(id)a3;
- (int64_t)componentType;
@end

@implementation SUUIShelfPageComponent

- (SUUIShelfPageComponent)initWithViewElement:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIShelfPageComponent;
  return [(SUUIPageComponent *)&v4 initWithViewElement:a3];
}

- (int64_t)componentType
{
  return 22;
}

@end
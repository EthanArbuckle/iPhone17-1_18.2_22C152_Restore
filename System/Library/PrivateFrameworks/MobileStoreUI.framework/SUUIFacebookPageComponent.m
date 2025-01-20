@interface SUUIFacebookPageComponent
- (SUUIFacebookPageComponent)initWithViewElement:(id)a3;
- (int64_t)componentType;
@end

@implementation SUUIFacebookPageComponent

- (SUUIFacebookPageComponent)initWithViewElement:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIFacebookPageComponent;
  return [(SUUIPageComponent *)&v4 initWithViewElement:a3];
}

- (int64_t)componentType
{
  return 20;
}

@end
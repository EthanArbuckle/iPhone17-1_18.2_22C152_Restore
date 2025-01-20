@interface SUUICountdownComponent
- (SUUICountdown)countdown;
- (SUUICountdownComponent)initWithCustomPageContext:(id)a3;
- (int64_t)componentType;
- (void)setCountdown:(id)a3;
@end

@implementation SUUICountdownComponent

- (SUUICountdownComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUICountdownComponent;
  v5 = [(SUUIPageComponent *)&v11 initWithCustomPageContext:v4];
  if (v5)
  {
    v6 = [SUUICountdown alloc];
    v7 = [v4 componentDictionary];
    uint64_t v8 = [(SUUICountdown *)v6 initWithCountdownDictionary:v7];
    countdown = v5->_countdown;
    v5->_countdown = (SUUICountdown *)v8;
  }
  return v5;
}

- (int64_t)componentType
{
  return 2;
}

- (SUUICountdown)countdown
{
  return self->_countdown;
}

- (void)setCountdown:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
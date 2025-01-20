@interface SKUICountdownComponent
- (SKUICountdown)countdown;
- (SKUICountdownComponent)initWithCustomPageContext:(id)a3;
- (int64_t)componentType;
- (void)setCountdown:(id)a3;
@end

@implementation SKUICountdownComponent

- (SKUICountdownComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICountdownComponent initWithCustomPageContext:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUICountdownComponent;
  v5 = [(SKUIPageComponent *)&v11 initWithCustomPageContext:v4];
  if (v5)
  {
    v6 = [SKUICountdown alloc];
    v7 = [v4 componentDictionary];
    uint64_t v8 = [(SKUICountdown *)v6 initWithCountdownDictionary:v7];
    countdown = v5->_countdown;
    v5->_countdown = (SKUICountdown *)v8;
  }
  return v5;
}

- (int64_t)componentType
{
  return 2;
}

- (SKUICountdown)countdown
{
  return self->_countdown;
}

- (void)setCountdown:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithCustomPageContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICountdownComponent initWithCustomPageContext:]";
}

@end
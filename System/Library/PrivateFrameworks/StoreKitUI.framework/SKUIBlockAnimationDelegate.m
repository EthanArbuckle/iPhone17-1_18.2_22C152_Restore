@interface SKUIBlockAnimationDelegate
- (SKUIBlockAnimationDelegate)initWithCompletionHandler:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation SKUIBlockAnimationDelegate

- (SKUIBlockAnimationDelegate)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBlockAnimationDelegate initWithCompletionHandler:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIBlockAnimationDelegate;
  v5 = [(SKUIBlockAnimationDelegate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id block = (void (**)(id, id, BOOL))self->_block;
  if (block)
  {
    block[2](block, a3, a4);
    id v6 = self->_block;
    self->_id block = 0;
  }
}

- (void).cxx_destruct
{
}

- (void)initWithCompletionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBlockAnimationDelegate initWithCompletionHandler:]";
}

@end
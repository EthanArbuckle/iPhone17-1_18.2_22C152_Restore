@interface _UIRBSymbolAnimationConfiguration
- (NSDictionary)options;
- (unsigned)animation;
- (void)setAnimation:(unsigned int)a3;
- (void)setOptions:(id)a3;
@end

@implementation _UIRBSymbolAnimationConfiguration

- (unsigned)animation
{
  return self->_animation;
}

- (void)setAnimation:(unsigned int)a3
{
  self->_animation = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
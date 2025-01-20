@interface _SUIAShockwaveLayoutContext
- (BOOL)animated;
- (id)completion;
- (void)setAnimated:(BOOL)a3;
- (void)setCompletion:(id)a3;
@end

@implementation _SUIAShockwaveLayoutContext

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
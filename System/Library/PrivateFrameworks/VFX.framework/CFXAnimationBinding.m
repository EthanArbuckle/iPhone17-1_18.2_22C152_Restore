@interface CFXAnimationBinding
- (void)dealloc;
@end

@implementation CFXAnimationBinding

- (void)dealloc
{
  id valueTransformer = self->_valueTransformer;
  if (valueTransformer) {
    _Block_release(valueTransformer);
  }
  v4.receiver = self;
  v4.super_class = (Class)CFXAnimationBinding;
  [(CFXAnimationBinding *)&v4 dealloc];
}

@end
@interface _UIViewControllerKeyboardAnimationStyleInfo
- (BOOL)isAnimationCompleting;
- (id)previousCompleteHandler;
- (void)setIsAnimationCompleting:(BOOL)a3;
- (void)setPreviousCompleteHandler:(id)a3;
@end

@implementation _UIViewControllerKeyboardAnimationStyleInfo

- (void).cxx_destruct
{
}

- (void)setPreviousCompleteHandler:(id)a3
{
}

- (void)setIsAnimationCompleting:(BOOL)a3
{
  self->_isAnimationCompleting = a3;
}

- (id)previousCompleteHandler
{
  return self->_previousCompleteHandler;
}

- (BOOL)isAnimationCompleting
{
  return self->_isAnimationCompleting;
}

@end
@interface THTransitionView
- (THTransitionViewDelegate)delegate;
- (UIViewController)fromViewController;
- (UIViewController)toViewController;
- (void)beginTransition;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setFromViewController:(id)a3;
- (void)setToViewController:(id)a3;
- (void)transitionDidFinish;
- (void)transitionDidFinishShouldRemoveFromSuperview:(BOOL)a3;
@end

@implementation THTransitionView

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THTransitionView;
  [(THTransitionView *)&v3 dealloc];
}

- (void)beginTransition
{
  [(THTransitionViewDelegate *)[(THTransitionView *)self delegate] transitionWillBegin:self];
  id v3 = [(THTransitionView *)self window];

  [v3 setUserInteractionEnabled:0];
}

- (void)transitionDidFinish
{
}

- (void)transitionDidFinishShouldRemoveFromSuperview:(BOOL)a3
{
  BOOL v3 = a3;
  [self window].userInteractionEnabled = 1;
  if (v3) {
    [(THTransitionView *)self removeFromSuperview];
  }
  v5 = [(THTransitionView *)self delegate];

  [(THTransitionViewDelegate *)v5 transitionDidFinish:self];
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (void)setFromViewController:(id)a3
{
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
}

- (THTransitionViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THTransitionViewDelegate *)a3;
}

@end
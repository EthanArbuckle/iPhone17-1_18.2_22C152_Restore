@interface KeyboardProxyingView
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)isHeadingDirectional:(unint64_t)a3;
- (BOOL)shouldAppearFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGSize)intrinsicContentSize;
- (KeyboardProxyingView)initWithFrame:(CGRect)a3;
- (KeyboardProxyingViewDelegate)delegate;
- (id)focusEffect;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation KeyboardProxyingView

- (KeyboardProxyingView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KeyboardProxyingView;
  result = -[KeyboardProxyingView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_shouldAppearFocused = 1;
  }
  return result;
}

- (void)dealloc
{
  if (self->_shouldAppearFocused)
  {
    self->_shouldAppearFocused = 0;
    v3 = [(KeyboardProxyingView *)self delegate];
    [v3 keyboardProxyingView:self didUpdateFocusState:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)KeyboardProxyingView;
  [(KeyboardProxyingView *)&v4 dealloc];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 10.0;
  double v3 = 10.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)focusEffect
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5 = [a3 nextFocusedItem];
  BOOL v6 = v5 == self;

  if (self->_shouldAppearFocused != v6)
  {
    self->_shouldAppearFocused = v6;
    id v7 = [(KeyboardProxyingView *)self delegate];
    [v7 keyboardProxyingView:self didUpdateFocusState:v5 == self];
  }
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 previouslyFocusedItem];
  if (v5 != self)
  {

LABEL_5:
    BOOL v7 = 1;
    goto LABEL_6;
  }
  unsigned __int8 v6 = -[KeyboardProxyingView isHeadingDirectional:](self, "isHeadingDirectional:", [v4 focusHeading]);

  if ((v6 & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v7 = 0;
LABEL_6:

  return v7;
}

- (BOOL)isHeadingDirectional:(unint64_t)a3
{
  return (a3 & 0xF) != 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)KeyboardProxyingView;
  id v6 = a4;
  id v7 = a3;
  [(KeyboardProxyingView *)&v9 pressesBegan:v7 withEvent:v6];
  v8 = [(KeyboardProxyingView *)self delegate];
  [v8 keyboardProxyingView:self pressesBegan:v7 withEvent:v6];
}

- (KeyboardProxyingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (KeyboardProxyingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldAppearFocused
{
  return self->_shouldAppearFocused;
}

- (void).cxx_destruct
{
}

@end
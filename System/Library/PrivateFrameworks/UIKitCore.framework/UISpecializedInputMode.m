@interface UISpecializedInputMode
- (BOOL)includeBarHeight;
- (BOOL)isSpecializedInputMode;
- (BOOL)showSWLayoutWithHWKeyboard;
- (Class)viewControllerClass;
- (id)hardwareLayout;
- (void)clearViewControllerClass;
- (void)dealloc;
- (void)setViewControllerClass:(Class)a3;
@end

@implementation UISpecializedInputMode

- (void)clearViewControllerClass
{
  Class viewControllerClass = self->_viewControllerClass;
  self->_Class viewControllerClass = 0;
}

- (void)dealloc
{
  Class viewControllerClass = self->_viewControllerClass;
  self->_Class viewControllerClass = 0;

  v4.receiver = self;
  v4.super_class = (Class)UISpecializedInputMode;
  [(UIKeyboardInputMode *)&v4 dealloc];
}

- (BOOL)includeBarHeight
{
  return 1;
}

- (BOOL)showSWLayoutWithHWKeyboard
{
  return 1;
}

- (id)hardwareLayout
{
  v3 = [(UIKeyboardInputMode *)self identifier];
  char v4 = [v3 isEqualToString:@"autofillsignup"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UISpecializedInputMode;
    v5 = [(UIKeyboardInputMode *)&v7 hardwareLayout];
  }
  return v5;
}

- (BOOL)isSpecializedInputMode
{
  return 1;
}

- (Class)viewControllerClass
{
  return self->_viewControllerClass;
}

- (void)setViewControllerClass:(Class)a3
{
}

- (void).cxx_destruct
{
}

@end
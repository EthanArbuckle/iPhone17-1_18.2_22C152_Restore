@interface _UIRemoteInputViewController
+ (BOOL)__shouldHostRemoteTextEffectsWindow;
- (BOOL)_canShowWhileLocked;
- (CGSize)intrinsicContentSizeForServiceSize:(CGSize)result;
- (void)viewDidInvalidateIntrinsicContentSize;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _UIRemoteInputViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)__shouldHostRemoteTextEffectsWindow
{
  return 0;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIRemoteInputViewController;
  [(_UIRemoteViewController *)&v6 viewServiceDidTerminateWithError:a3];
  v4 = [(UIViewController *)self parentViewController];

  if (v4)
  {
    +[_UIKeyboardUsageTracking keyboardExtensionCrashed];
    v5 = +[UIKeyboardInputModeController sharedInputModeController];
    [v5 switchToCurrentSystemInputMode];
  }
}

- (CGSize)intrinsicContentSizeForServiceSize:(CGSize)result
{
  if (result.height == 0.0) {
    +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:", objc_msgSend((id)UIApp, "_frontMostAppOrientation", result.width));
  }
  double v3 = -1.0;
  result.width = v3;
  return result;
}

- (void)viewDidInvalidateIntrinsicContentSize
{
  double v3 = [(UIViewController *)self view];
  v4 = [v3 _rootInputWindowController];
  [v4 updateViewSizingConstraints];

  id v9 = [(UIViewController *)self view];
  v5 = [(UIViewController *)self view];
  [v5 bounds];
  v8 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v6, v7);
  [v9 _didChangeKeyplaneWithContext:v8];
}

@end
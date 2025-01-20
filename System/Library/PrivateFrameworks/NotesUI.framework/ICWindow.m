@interface ICWindow
- (BOOL)accessibilityElementsHidden;
- (ICViewControllerManager)viewControllerManager;
- (ICWindow)initWithWindowScene:(id)a3;
- (ICWindow)initWithWindowScene:(id)a3 behavior:(int64_t)a4;
- (NSString)toolPickerIdentifier;
- (NSString)windowIdentifier;
- (UIViewController)ic_topmostPresentedViewController;
- (int64_t)behavior;
- (void)setBehavior:(int64_t)a3;
- (void)setRootViewController:(id)a3;
- (void)setToolPickerIdentifier:(id)a3;
- (void)setViewControllerManager:(id)a3;
- (void)setWindowIdentifier:(id)a3;
@end

@implementation ICWindow

- (ICViewControllerManager)viewControllerManager
{
  return self->_viewControllerManager;
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (void)setViewControllerManager:(id)a3
{
}

- (void)setRootViewController:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ICWindow *)self rootViewController];
  v8.receiver = self;
  v8.super_class = (Class)ICWindow;
  [(ICWindow *)&v8 setRootViewController:v4];

  if (v5)
  {
    v9 = @"previousRootViewController";
    v10[0] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    v6 = 0;
  }
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"ICWindowRootViewControllerDidChange" object:self userInfo:v6];
}

- (void)setWindowIdentifier:(id)a3
{
}

- (void)setToolPickerIdentifier:(id)a3
{
}

- (ICWindow)initWithWindowScene:(id)a3 behavior:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ICWindow;
  v5 = [(ICWindow *)&v8 initWithWindowScene:a3];
  v6 = v5;
  if (v5) {
    [(ICWindow *)v5 setBehavior:a4];
  }
  return v6;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      id v4 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [(ICWindow *)self setTintColor:v4];

      v5 = [(ICWindow *)self traitOverrides];
      [v5 setUserInterfaceStyle:2];

      id v6 = [(ICWindow *)self traitOverrides];
      [v6 setNSIntegerValue:1 forTrait:objc_opt_class()];
      goto LABEL_6;
    }
    if (a3) {
      return;
    }
  }
  id v6 = [MEMORY[0x1E4FB1618] ICTintColor];
  -[ICWindow setTintColor:](self, "setTintColor:");
LABEL_6:
}

- (ICWindow)initWithWindowScene:(id)a3
{
  return [(ICWindow *)self initWithWindowScene:a3 behavior:0];
}

- (UIViewController)ic_topmostPresentedViewController
{
  v2 = [(ICWindow *)self rootViewController];
  v3 = [v2 presentedViewController];

  uint64_t v4 = [v3 presentedViewController];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      id v6 = v5;

      v5 = [v6 presentedViewController];

      v3 = v6;
    }
    while (v5);
  }
  else
  {
    id v6 = v3;
  }
  return (UIViewController *)v6;
}

- (BOOL)accessibilityElementsHidden
{
  v4.receiver = self;
  v4.super_class = (Class)ICWindow;
  unsigned int v2 = [(ICWindow *)&v4 accessibilityElementsHidden];
  if (([(id)objc_opt_class() _isSecure] & 1) == 0) {
    v2 |= objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isLocked");
  }
  return v2;
}

- (NSString)windowIdentifier
{
  return self->_windowIdentifier;
}

- (NSString)toolPickerIdentifier
{
  return self->_toolPickerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerManager, 0);
  objc_storeStrong((id *)&self->_toolPickerIdentifier, 0);
  objc_storeStrong((id *)&self->_windowIdentifier, 0);
}

@end
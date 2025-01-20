@interface COSRemoteUIBuddyController
- (COSBuddyControllerDelegate)delegate;
- (COSRemoteUIBuddyController)initWithRUIViewController:(id)a3;
- (NSString)description;
- (UIViewController)ruiViewController;
- (id)viewController;
- (void)setDelegate:(id)a3;
- (void)setRuiViewController:(id)a3;
@end

@implementation COSRemoteUIBuddyController

- (COSRemoteUIBuddyController)initWithRUIViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COSRemoteUIBuddyController;
  v6 = [(COSRemoteUIBuddyController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ruiViewController, a3);
  }

  return v7;
}

- (id)viewController
{
  return self->_ruiViewController;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%p %@ (viewController %@)>", self, v4, self->_ruiViewController];

  return (NSString *)v5;
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)ruiViewController
{
  return self->_ruiViewController;
}

- (void)setRuiViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruiViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
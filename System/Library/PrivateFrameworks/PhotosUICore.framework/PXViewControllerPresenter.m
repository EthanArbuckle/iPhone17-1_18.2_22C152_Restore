@interface PXViewControllerPresenter
+ (id)defaultPresenterWithViewController:(id)a3;
+ (id)popoverPresenterWithViewController:(id)a3 sourceItem:(id)a4;
+ (id)popoverPresenterWithViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (BOOL)canPresentPopovers;
- (BOOL)canPushViewController;
- (BOOL)popToViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)pushViewController:(id)a3 animated:(BOOL)a4;
- (CGRect)sourceRect;
- (NSString)description;
- (PXViewControllerPresenter)init;
- (PXViewControllerPresenter)initWithBaseViewController:(id)a3 sourceItem:(id)a4;
- (PXViewControllerPresenter)initWithBaseViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (UINavigationController)navigationController;
- (UIPopoverPresentationControllerSourceItem)sourceItem;
- (UIView)sourceView;
- (UIViewController)baseViewController;
- (UIViewController)presentingViewController;
- (id)presentAlertWithConfigurationHandler:(id)a3;
- (void)dismissAlertWithToken:(id)a3 completionHandler:(id)a4;
- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation PXViewControllerPresenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_baseViewController, 0);
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (UIPopoverPresentationControllerSourceItem)sourceItem
{
  return self->_sourceItem;
}

- (UIViewController)baseViewController
{
  return self->_baseViewController;
}

- (void)dismissAlertWithToken:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXViewControllerPresenter.m", 171, @"%@ should be an instance inheriting from %@, but it is %@", @"token", v14, v16 object file lineNumber description];
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXViewControllerPresenter.m", 171, @"%@ should be an instance inheriting from %@, but it is nil", @"token", v14 object file lineNumber description];
  }

LABEL_3:
  v10 = [v9 alertController];
  v11 = [v10 presentingViewController];

  if (!v11) {
    PXAssertGetLog();
  }
  [v11 dismissViewControllerAnimated:1 completion:v8];
}

- (id)presentAlertWithConfigurationHandler:(id)a3
{
  v4 = (void (**)(id, PXAlertConfiguration *))a3;
  v5 = objc_alloc_init(PXAlertConfiguration);
  v4[2](v4, v5);

  v6 = [[PXAlert alloc] initWithConfiguration:v5];
  id v7 = [(PXAlert *)v6 alertController];
  [(PXViewControllerPresenter *)self presentViewController:v7 animated:1 completionHandler:0];

  return v6;
}

- (BOOL)popToViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(PXViewControllerPresenter *)self navigationController];
  if (v7 && [(PXViewControllerPresenter *)self canPushViewController])
  {
    id v8 = v6;
    int v9 = objc_msgSend(v7, "px_preparePopToViewController:forced:", v8, 0);
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E4FB1EC0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __58__PXViewControllerPresenter_popToViewController_animated___block_invoke;
      v12[3] = &unk_1E5DD21E8;
      id v13 = v7;
      id v14 = v8;
      BOOL v15 = a4;
      [v10 _performWithoutDeferringTransitions:v12];
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

id __58__PXViewControllerPresenter_popToViewController_animated___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) popToViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (BOOL)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PXViewControllerPresenter *)self navigationController];
  if (v7
    && [(PXViewControllerPresenter *)self canPushViewController]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v10 = v6;
    [(PXViewControllerPresenter *)self willPushViewController:v10 inNavigationController:v7 animated:v4];
    [v7 pushViewController:v10 animated:v4];

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)canPushViewController
{
  v2 = [(PXViewControllerPresenter *)self navigationController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UIViewController)presentingViewController
{
  BOOL v3 = [(PXViewControllerPresenter *)self baseViewController];
  BOOL v4 = objc_msgSend(v3, "px_topmostPresentedViewController");
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(PXViewControllerPresenter *)self baseViewController];
  }
  id v7 = v6;

  return (UIViewController *)v7;
}

- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v7 = a5;
  uint64_t v8 = objc_opt_class();
  if (v8 != objc_opt_class())
  {
    int v9 = [v10 presentingViewController];
    [v9 dismissViewControllerAnimated:v6 completion:v7];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  id v24 = v9;
  v11 = [(PXViewControllerPresenter *)self sourceItem];
  v12 = [(PXViewControllerPresenter *)self sourceView];
  [(PXViewControllerPresenter *)self sourceRect];
  if (v11)
  {
    v17 = [v24 popoverPresentationController];
    [v17 setSourceItem:v11];
LABEL_3:

    goto LABEL_4;
  }
  if (v12)
  {
    double v19 = v13;
    double v20 = v14;
    double v21 = v15;
    double v22 = v16;
    if (!CGRectIsNull(*(CGRect *)&v13))
    {
      v26.origin.double x = v19;
      v26.origin.double y = v20;
      v26.size.double width = v21;
      v26.size.double height = v22;
      if (!CGRectIsEmpty(v26))
      {
        v17 = [v24 popoverPresentationController];
        [v17 setSourceView:v12];
        objc_msgSend(v17, "setSourceRect:", v19, v20, v21, v22);
        goto LABEL_3;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v24 modalPresentationStyle] == 7)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PXViewControllerPresenter.m", 105, @"%@ wasn't configured for a popover presentation but %@ requires to be presented as a popover", self, v24 object file lineNumber description];

    abort();
  }
LABEL_4:
  v18 = [(PXViewControllerPresenter *)self presentingViewController];
  [v18 presentViewController:v24 animated:v6 completion:v10];
}

- (NSString)description
{
  if (self->_sourceView)
  {
    id v3 = [NSString alloc];
    BOOL v4 = NSStringFromCGRect(self->_sourceRect);
    v5 = (__CFString *)[v3 initWithFormat:@"%@ in %@", v4, self->_sourceView];
  }
  else
  {
    sourceItem = self->_sourceItem;
    if (sourceItem)
    {
      v5 = [(UIPopoverPresentationControllerSourceItem *)sourceItem description];
    }
    else
    {
      v5 = @"None";
    }
  }
  id v7 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p, view controller: %@, popover source: %@>", objc_opt_class(), self, self->_baseViewController, v5];

  return (NSString *)v7;
}

- (BOOL)canPresentPopovers
{
  id v3 = [(UIViewController *)self->_baseViewController traitCollection];
  BOOL v4 = [v3 horizontalSizeClass] == 1
    || [v3 verticalSizeClass] == 1
    || self->_sourceView
    || self->_sourceItem != 0;

  return v4;
}

- (UINavigationController)navigationController
{
  v2 = [(PXViewControllerPresenter *)self baseViewController];
  id v3 = [v2 navigationController];

  return (UINavigationController *)v3;
}

- (PXViewControllerPresenter)initWithBaseViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v12 = a4;
  double v13 = [(PXViewControllerPresenter *)self initWithBaseViewController:a3 sourceItem:0];
  double v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sourceView, a4);
    v14->_sourceRect.origin.CGFloat x = x;
    v14->_sourceRect.origin.CGFloat y = y;
    v14->_sourceRect.size.CGFloat width = width;
    v14->_sourceRect.size.CGFloat height = height;
  }

  return v14;
}

- (PXViewControllerPresenter)initWithBaseViewController:(id)a3 sourceItem:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXViewControllerPresenter.m", 45, @"Invalid parameter not satisfying: %@", @"baseViewController" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PXViewControllerPresenter;
  id v10 = [(PXViewControllerPresenter *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_baseViewController, a3);
    objc_storeStrong((id *)&v11->_sourceItem, a4);
    sourceView = v11->_sourceView;
    v11->_sourceView = 0;

    CGSize v13 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v11->_sourceRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v11->_sourceRect.size = v13;
  }

  return v11;
}

- (PXViewControllerPresenter)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXViewControllerPresenter.m", 40, @"%s is not available as initializer", "-[PXViewControllerPresenter init]");

  abort();
}

+ (id)popoverPresenterWithViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  CGSize v13 = objc_msgSend(objc_alloc((Class)a1), "initWithBaseViewController:sourceView:sourceRect:", v12, v11, x, y, width, height);

  return v13;
}

+ (id)popoverPresenterWithViewController:(id)a3 sourceItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithBaseViewController:v7 sourceItem:v6];

  return v8;
}

+ (id)defaultPresenterWithViewController:(id)a3
{
  return (id)[a1 popoverPresenterWithViewController:a3 sourceItem:0];
}

@end
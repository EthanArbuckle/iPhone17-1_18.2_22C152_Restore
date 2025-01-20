@interface SXViewControllerPresentingManager
- (UIViewController)presentingViewController;
- (void)popOrDismissViewControllerAnimated:(BOOL)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6;
- (void)setPresentingViewController:(id)a3;
@end

@implementation SXViewControllerPresentingManager

- (void)setPresentingViewController:(id)a3
{
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SXViewControllerPresentingManager *)self presentingViewController];
  [v7 presentViewController:v6 animated:v4 completion:0];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v11 = a4;
  id v35 = a3;
  id v13 = a5;
  uint64_t v14 = [v35 popoverPresentationController];
  v15 = (void *)v14;
  if (v13 && v14)
  {
    [v35 setModalPresentationStyle:7];
    v16 = [(SXViewControllerPresentingManager *)self presentingViewController];
    v17 = [v16 view];
    objc_msgSend(v17, "convertRect:fromView:", v13, x, y, width, height);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    v26 = [(SXViewControllerPresentingManager *)self presentingViewController];
    v27 = [v26 view];
    [v27 bounds];
    v39.origin.double x = v19;
    v39.origin.double y = v21;
    v39.size.double width = v23;
    v39.size.double height = v25;
    CGRect v38 = CGRectIntersection(v37, v39);
    double v28 = v38.origin.x;
    double v29 = v38.origin.y;
    double v30 = v38.size.width;
    double v31 = v38.size.height;

    objc_msgSend(v15, "setSourceRect:", v28, v29, v30, v31);
    v32 = [(SXViewControllerPresentingManager *)self presentingViewController];
    v33 = [v32 view];
    [v15 setSourceView:v33];
  }
  v34 = [(SXViewControllerPresentingManager *)self presentingViewController];
  [v34 presentViewController:v35 animated:v11 completion:0];
}

- (void)popOrDismissViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(SXViewControllerPresentingManager *)self presentingViewController];
  BOOL v4 = [v10 presentingViewController];

  if (v4)
  {
    [v10 dismissViewControllerAnimated:v3 completion:0];
  }
  else
  {
    v5 = [v10 navigationController];

    if (v5)
    {
      uint64_t v6 = [v10 navigationController];
      if (v6)
      {
        id v7 = (void *)v6;
        do
        {
          v8 = [v7 popViewControllerAnimated:v3];

          if (v8) {
            break;
          }
          uint64_t v9 = [v7 navigationController];

          id v7 = (void *)v9;
        }
        while (v9);
      }
    }
  }
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
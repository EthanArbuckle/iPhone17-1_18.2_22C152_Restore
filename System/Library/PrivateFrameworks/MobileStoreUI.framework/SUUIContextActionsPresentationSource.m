@interface SUUIContextActionsPresentationSource
- (CGRect)sourceRect;
- (SUUIContextActionsPresentationSource)initWithViewController:(id)a3;
- (UIBarButtonItem)barButtonItem;
- (UIView)sourceView;
- (UIViewController)viewController;
- (void)presentViewController:(id)a3 permittedArrowDirections:(unint64_t)a4 animated:(BOOL)a5;
- (void)setBarButtonItem:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation SUUIContextActionsPresentationSource

- (SUUIContextActionsPresentationSource)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIContextActionsPresentationSource;
  v6 = [(SUUIContextActionsPresentationSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (void)presentViewController:(id)a3 permittedArrowDirections:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v35 = a3;
  v8 = [(SUUIContextActionsPresentationSource *)self viewController];
  objc_super v9 = [(SUUIContextActionsPresentationSource *)self sourceView];
  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    v11 = [(SUUIContextActionsPresentationSource *)self barButtonItem];
    BOOL v10 = v11 != 0;
  }
  v12 = [MEMORY[0x263F82670] currentDevice];
  if ([v12 userInterfaceIdiom] == 1)
  {
    v13 = [MEMORY[0x263F82438] sharedApplication];
    v14 = [v13 keyWindow];
    v15 = [v14 traitCollection];
    BOOL v16 = [v15 horizontalSizeClass] == 2 && v10;

    if (v16) {
      [v35 setModalPresentationStyle:7];
    }
  }
  else
  {
  }
  [v8 presentViewController:v35 animated:v5 completion:0];
  v17 = [v35 popoverPresentationController];
  if (v17) {
    BOOL v18 = v10;
  }
  else {
    BOOL v18 = 0;
  }

  if (v18)
  {
    if ([v35 conformsToProtocol:&unk_2705EF330])
    {
      v19 = [v35 presentationController];
      [v19 setDelegate:v35];
    }
    v20 = [v35 popoverPresentationController];
    [v20 setPermittedArrowDirections:a4];

    v21 = [(SUUIContextActionsPresentationSource *)self barButtonItem];

    if (v21)
    {
      v22 = [(SUUIContextActionsPresentationSource *)self barButtonItem];
      v23 = [v35 popoverPresentationController];
      [v23 setBarButtonItem:v22];
    }
    else
    {
      v24 = [(SUUIContextActionsPresentationSource *)self sourceView];

      if (!v24) {
        goto LABEL_22;
      }
      v25 = [(SUUIContextActionsPresentationSource *)self sourceView];
      v26 = [v35 popoverPresentationController];
      [v26 setSourceView:v25];

      [(SUUIContextActionsPresentationSource *)self sourceRect];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      v22 = [v35 popoverPresentationController];
      objc_msgSend(v22, "setSourceRect:", v28, v30, v32, v34);
    }
  }
LABEL_22:
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
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

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (void)setBarButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
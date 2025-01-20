@interface IMPopoverPresentationAction
- (id)presentingButton;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)setPresentingButton:(id)a3;
@end

@implementation IMPopoverPresentationAction

- (void)prepareForPopoverPresentation:(id)a3
{
  id v12 = a3;
  v4 = [(IMPopoverPresentationAction *)self presentingButton];
  NSClassFromString(@"MPUTransportButton");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v6 = [(IMPopoverPresentationAction *)self presentingButton];
  if (isKindOfClass)
  {
    [v12 setSourceView:v6];

    v7 = [(IMPopoverPresentationAction *)self presentingButton];
    v8 = [(IMPopoverPresentationAction *)self presentingButton];
    [v8 bounds];
    [v7 imageRectForContentRect:];
    [v12 setSourceRect:];
  }
  else
  {
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    v10 = [(IMPopoverPresentationAction *)self presentingButton];
    if (v9)
    {
      [v12 setSourceView:v10];

      v7 = [(IMPopoverPresentationAction *)self presentingButton];
      [v7 bounds];
      [v12 setSourceRect:];
    }
    else
    {
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();

      if ((v11 & 1) == 0) {
        goto LABEL_8;
      }
      v7 = [(IMPopoverPresentationAction *)self presentingButton];
      [v12 setBarButtonItem:v7];
    }
  }

LABEL_8:
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  v8 = [(IMPopoverPresentationAction *)self presentingButton];
  NSClassFromString(@"MPUTransportButton");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v10 = [(IMPopoverPresentationAction *)self presentingButton];
  if (isKindOfClass)
  {
    char v11 = [(IMPopoverPresentationAction *)self presentingButton];
    [v11 bounds];
    [v10 imageRectForContentRect:];
    a4->origin.x = v12;
    a4->origin.y = v13;
    a4->size.width = v14;
    a4->size.height = v15;

LABEL_5:
    *a5 = [(IMPopoverPresentationAction *)self presentingButton];
    return;
  }
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  v17 = [(IMPopoverPresentationAction *)self presentingButton];
  v10 = v17;
  if (v16)
  {
    [v17 bounds];
    a4->origin.x = v18;
    a4->origin.y = v19;
    a4->size.width = v20;
    a4->size.height = v21;
    goto LABEL_5;
  }
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  if (v22)
  {
    v23 = [(IMPopoverPresentationAction *)self presentingButton];
    id v28 = [v23 _toolbarButton];

    if (v28)
    {
      [v28 bounds];
      a4->origin.x = v24;
      a4->origin.y = v25;
      a4->size.width = v26;
      a4->size.height = v27;
      *a5 = v28;
    }
  }
}

- (id)presentingButton
{
  return self->_presentingButton;
}

- (void)setPresentingButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
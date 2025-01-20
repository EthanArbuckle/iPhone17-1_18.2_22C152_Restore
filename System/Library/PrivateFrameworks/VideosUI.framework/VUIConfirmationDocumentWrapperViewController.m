@interface VUIConfirmationDocumentWrapperViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (void)tapped;
- (void)vui_loadView;
- (void)vui_viewDidLayoutSubviews;
@end

@implementation VUIConfirmationDocumentWrapperViewController

- (void)vui_loadView
{
  v7.receiver = self;
  v7.super_class = (Class)VUIConfirmationDocumentWrapperViewController;
  [(VUIConfirmationDocumentWrapperViewController *)&v7 vui_loadView];
  v3 = [(VUIConfirmationDocumentWrapperViewController *)self vuiView];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setVuiBackgroundColor:v4];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapped];
  v6 = [(VUIConfirmationDocumentWrapperViewController *)self vuiView];
  [v6 addGestureRecognizer:v5];

  [v5 setDelegate:self];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  v5 = objc_msgSend(a4, "view", a3);
  v6 = [(VUIConfirmationDocumentWrapperViewController *)self view];
  LOBYTE(self) = v5 == v6;

  return (char)self;
}

- (void)tapped
{
}

- (void)vui_viewDidLayoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)VUIConfirmationDocumentWrapperViewController;
  [(VUIConfirmationDocumentWrapperViewController *)&v35 vui_viewDidLayoutSubviews];
  v3 = [(VUIConfirmationDocumentWrapperViewController *)self vuiChildViewControllers];
  v4 = [v3 lastObject];

  v5 = [v4 vuiView];
  v6 = [(VUIConfirmationDocumentWrapperViewController *)self vuiView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = self;
  [(VUIConfirmationDocumentWrapperViewController *)v15 preferredContentSize];
  double v18 = v17;
  double v19 = v16;
  double v20 = *MEMORY[0x1E4F1DB30];
  double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] != v17 || v21 != v16) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = [(VUIConfirmationDocumentWrapperViewController *)v15 topViewController];
    v23 = v24;
  }
  else
  {
    v25 = [(VUIConfirmationDocumentWrapperViewController *)v15 vuiChildViewControllers];
    uint64_t v26 = [v25 count];

    if (!v26)
    {
LABEL_5:
      v23 = 0;
      goto LABEL_11;
    }
    v27 = [(VUIConfirmationDocumentWrapperViewController *)v15 vuiChildViewControllers];
    v23 = [v27 lastObject];

    v24 = v23;
  }
  [v24 vuiPreferredContentSize];
  double v18 = v28;
  double v19 = v29;
LABEL_11:
  if (v20 == v18 && v21 == v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [v23 templateViewController];
      [v31 preferredContentSize];
      double v18 = v32;
      double v19 = v33;
    }
  }
  if (v20 == v18 && v21 == v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v19 = v14;
      double v18 = v12;
    }
  }
  -[VUIConfirmationDocumentWrapperViewController setVuiPreferredContentSize:](v15, "setVuiPreferredContentSize:", v18, v19);
  objc_msgSend(v5, "setFrame:", round(v8 + (v12 - v18) * 0.5), round(v10 + (v14 - v19) * 0.5), v18, v19);
}

@end
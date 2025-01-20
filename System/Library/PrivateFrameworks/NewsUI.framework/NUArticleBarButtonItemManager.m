@interface NUArticleBarButtonItemManager
- (CGRect)adjustedFrameForDoneBarButtonItemForTraitCollection:(id)a3;
- (CGRect)adjustedFrameForNextArticleButtonForTraitCollection:(id)a3;
- (CGRect)adjustedFrameForShareBarButtonItemForTraitCollection:(id)a3;
- (NUArticleBarButtonItemManager)initWithViewController:(id)a3;
- (NUArticleBarButtonItemManagerDelegate)delegate;
- (NUArticleNextButton)nextButton;
- (UIBarButtonItem)doneBarButtonItem;
- (UIBarButtonItem)nextBarButtonItem;
- (UIBarButtonItem)shareBarButtonItem;
- (UIViewController)viewController;
- (id)createDoneBarButtonItem;
- (id)createFlexibleSpacerBarButtonItem;
- (id)createShareBarButtonItem;
- (void)applyPageStyleToNextBarButtonItem:(id)a3;
- (void)doDone:(id)a3;
- (void)doNext:(id)a3;
- (void)doShare:(id)a3;
- (void)positionBarButtonItemsForTraitCollection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneBarButtonItem:(id)a3;
- (void)setShareBarButtonItem:(id)a3;
- (void)sizeBarButtonItemsForTraitCollection:(id)a3;
@end

@implementation NUArticleBarButtonItemManager

- (NUArticleBarButtonItemManager)initWithViewController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NUArticleBarButtonItemManager;
  v5 = [(NUArticleBarButtonItemManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewController, v4);
    v7 = [NUArticleNextButton alloc];
    uint64_t v8 = -[NUArticleNextButton initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    nextButton = v6->_nextButton;
    v6->_nextButton = (NUArticleNextButton *)v8;

    [(NUArticleNextButton *)v6->_nextButton setAutoresizingMask:18];
    [(NUArticleNextButton *)v6->_nextButton addTarget:v6 action:sel_doNext_ forControlEvents:64];
    uint64_t v10 = [objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v6->_nextButton];
    nextBarButtonItem = v6->_nextBarButtonItem;
    v6->_nextBarButtonItem = (UIBarButtonItem *)v10;
  }
  return v6;
}

- (void)sizeBarButtonItemsForTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [(NUArticleBarButtonItemManager *)self viewController];
  v6 = [v5 navigationController];
  v7 = [v6 view];
  [v7 setNeedsLayout];

  uint64_t v8 = [(NUArticleBarButtonItemManager *)self viewController];
  v9 = [v8 navigationController];
  uint64_t v10 = [v9 view];
  [v10 layoutIfNeeded];

  [(NUArticleBarButtonItemManager *)self adjustedFrameForNextArticleButtonForTraitCollection:v4];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(NUArticleBarButtonItemManager *)self nextButton];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  [(NUArticleBarButtonItemManager *)self adjustedFrameForDoneBarButtonItemForTraitCollection:v4];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [(NUArticleBarButtonItemManager *)self doneBarButtonItem];
  v29 = objc_msgSend(v28, "nu_view");
  objc_msgSend(v29, "setFrame:", v21, v23, v25, v27);

  [(NUArticleBarButtonItemManager *)self adjustedFrameForShareBarButtonItemForTraitCollection:v4];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  v38 = [(NUArticleBarButtonItemManager *)self shareBarButtonItem];
  v39 = objc_msgSend(v38, "nu_view");
  objc_msgSend(v39, "setFrame:", v31, v33, v35, v37);

  v40 = [(NUArticleBarButtonItemManager *)self viewController];
  v41 = [v40 navigationController];
  v42 = [v41 view];
  [v42 setNeedsLayout];

  v43 = [(NUArticleBarButtonItemManager *)self viewController];
  v44 = [v43 navigationController];
  v45 = [v44 view];
  [v45 layoutIfNeeded];

  v46 = [(NUArticleBarButtonItemManager *)self nextButton];
  [v46 setNeedsLayout];

  id v47 = [(NUArticleBarButtonItemManager *)self nextButton];
  [v47 layoutIfNeeded];
}

- (void)positionBarButtonItemsForTraitCollection:(id)a3
{
  v44[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NUArticleBarButtonItemManager *)self doneBarButtonItem];
  v6 = objc_msgSend(v5, "nu_view");
  [v6 removeFromSuperview];

  v7 = [(NUArticleBarButtonItemManager *)self shareBarButtonItem];
  uint64_t v8 = objc_msgSend(v7, "nu_view");
  [v8 removeFromSuperview];

  v9 = [(NUArticleBarButtonItemManager *)self createShareBarButtonItem];
  [(NUArticleBarButtonItemManager *)self setShareBarButtonItem:v9];

  uint64_t v10 = [(NUArticleBarButtonItemManager *)self createDoneBarButtonItem];
  [(NUArticleBarButtonItemManager *)self setDoneBarButtonItem:v10];

  uint64_t v11 = [v4 horizontalSizeClass];
  double v12 = [(NUArticleBarButtonItemManager *)self viewController];
  double v13 = v12;
  if (v11 == 1)
  {
    double v14 = [v12 navigationItem];
    double v15 = [(NUArticleBarButtonItemManager *)self doneBarButtonItem];
    v44[0] = v15;
    double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
    [v14 setRightBarButtonItems:v16];

    double v17 = [(NUArticleBarButtonItemManager *)self viewController];
    double v18 = [v17 navigationItem];
    [v18 setLeftBarButtonItems:MEMORY[0x263EFFA68]];

    v19 = [(NUArticleBarButtonItemManager *)self viewController];
    double v20 = [(NUArticleBarButtonItemManager *)self shareBarButtonItem];
    v43[0] = v20;
    double v21 = [(NUArticleBarButtonItemManager *)self createFlexibleSpacerBarButtonItem];
    v43[1] = v21;
    double v22 = [(NUArticleBarButtonItemManager *)self nextBarButtonItem];
    v43[2] = v22;
    double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
    [v19 setToolbarItems:v23];

    double v24 = [(NUArticleBarButtonItemManager *)self viewController];
    double v25 = [v24 navigationController];
    [v25 setToolbarHidden:0];
  }
  else
  {
    double v26 = [v12 navigationController];
    [v26 setToolbarHidden:1];

    double v27 = [(NUArticleBarButtonItemManager *)self viewController];
    [v27 setToolbarItems:MEMORY[0x263EFFA68]];

    v28 = [(NUArticleBarButtonItemManager *)self viewController];
    v29 = [v28 navigationItem];
    double v30 = [(NUArticleBarButtonItemManager *)self doneBarButtonItem];
    v42[0] = v30;
    double v31 = [(NUArticleBarButtonItemManager *)self shareBarButtonItem];
    v42[1] = v31;
    double v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
    [v29 setLeftBarButtonItems:v32];

    double v24 = [(NUArticleBarButtonItemManager *)self viewController];
    double v25 = [v24 navigationItem];
    double v33 = [(NUArticleBarButtonItemManager *)self nextBarButtonItem];
    v41 = v33;
    double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
    [v25 setRightBarButtonItems:v34];
  }
  double v35 = [(NUArticleBarButtonItemManager *)self doneBarButtonItem];
  double v36 = objc_msgSend(v35, "nu_view");
  objc_msgSend(v36, "nu_supportViewDebugging");

  double v37 = [(NUArticleBarButtonItemManager *)self shareBarButtonItem];
  uint64_t v38 = objc_msgSend(v37, "nu_view");
  objc_msgSend((id)v38, "nu_supportViewDebugging");

  v39 = [(NUArticleBarButtonItemManager *)self delegate];
  LOBYTE(v38) = objc_opt_respondsToSelector();

  if (v38)
  {
    v40 = [(NUArticleBarButtonItemManager *)self delegate];
    [v40 articleBarButtonItemManagerDidLayoutBarButtonItems:self];
  }
}

- (void)applyPageStyleToNextBarButtonItem:(id)a3
{
  id v4 = a3;
  id v6 = [(NUArticleBarButtonItemManager *)self nextButton];
  v5 = [v4 nextButtonTitle];

  [v6 setNextLabelTitle:v5 animated:1];
}

- (void)doShare:(id)a3
{
  id v4 = [(NUArticleBarButtonItemManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(NUArticleBarButtonItemManager *)self delegate];
    id v6 = [(NUArticleBarButtonItemManager *)self shareBarButtonItem];
    [v7 articleBarButtonItemManager:self performShareActionForBarButtonItem:v6];
  }
}

- (void)doDone:(id)a3
{
  id v4 = [(NUArticleBarButtonItemManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(NUArticleBarButtonItemManager *)self delegate];
    id v6 = [(NUArticleBarButtonItemManager *)self doneBarButtonItem];
    [v7 articleBarButtonItemManager:self performDoneActionForBarButtonItem:v6];
  }
}

- (void)doNext:(id)a3
{
  id v4 = [(NUArticleBarButtonItemManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(NUArticleBarButtonItemManager *)self delegate];
    id v6 = [(NUArticleBarButtonItemManager *)self nextBarButtonItem];
    [v7 articleBarButtonItemManager:self performNextActionForBarButtonItem:v6];
  }
}

- (id)createShareBarButtonItem
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:9 target:self action:sel_doShare_];

  return v2;
}

- (id)createDoneBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  id v4 = NUBundle();
  char v5 = [v4 localizedStringForKey:@"Done" value:&stru_26D495918 table:0];
  id v6 = (void *)[v3 initWithTitle:v5 style:2 target:self action:sel_doDone_];

  return v6;
}

- (id)createFlexibleSpacerBarButtonItem
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];

  return v2;
}

- (CGRect)adjustedFrameForDoneBarButtonItemForTraitCollection:(id)a3
{
  id v4 = a3;
  char v5 = [(NUArticleBarButtonItemManager *)self viewController];
  id v6 = [v5 navigationController];
  id v7 = [v6 navigationBar];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  double v16 = [(NUArticleBarButtonItemManager *)self doneBarButtonItem];
  double v17 = objc_msgSend(v16, "nu_view");
  [v17 frame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  uint64_t v24 = [v4 horizontalSizeClass];
  double v25 = 16.0;
  if (v24 == 1)
  {
    v33.origin.x = v9;
    v33.origin.y = v11;
    v33.size.width = v13;
    v33.size.height = v15;
    double MaxX = CGRectGetMaxX(v33);
    double v27 = [(NUArticleBarButtonItemManager *)self doneBarButtonItem];
    v28 = objc_msgSend(v27, "nu_view");
    [v28 frame];
    double v25 = MaxX - CGRectGetWidth(v34) + -16.0;
  }
  double v29 = v25;
  double v30 = v19;
  double v31 = v21;
  double v32 = v23;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)adjustedFrameForShareBarButtonItemForTraitCollection:(id)a3
{
  if ([a3 horizontalSizeClass] == 1)
  {
    id v4 = [(NUArticleBarButtonItemManager *)self shareBarButtonItem];
    char v5 = objc_msgSend(v4, "nu_view");
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    objc_opt_class();
    double v14 = [(NUArticleBarButtonItemManager *)self shareBarButtonItem];
    CGFloat v15 = objc_msgSend(v14, "nu_view");
    id v4 = FCDynamicCast();

    double v16 = [(NUArticleBarButtonItemManager *)self shareBarButtonItem];
    double v17 = objc_msgSend(v16, "nu_view");
    [v17 frame];
    double v9 = v18;
    double v11 = v19;
    double v13 = v20;

    char v5 = [(NUArticleBarButtonItemManager *)self doneBarButtonItem];
    double v21 = objc_msgSend(v5, "nu_view");
    [v21 frame];
    CGFloat v22 = CGRectGetMaxX(v28) + 16.0;
    double v23 = [v4 imageView];
    [v23 frame];
    double v7 = v22 - CGRectGetMinX(v29);
  }
  double v24 = v7;
  double v25 = v9;
  double v26 = v11;
  double v27 = v13;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)adjustedFrameForNextArticleButtonForTraitCollection:(id)a3
{
  if ([a3 horizontalSizeClass] == 1)
  {
    id v4 = [(NUArticleBarButtonItemManager *)self shareBarButtonItem];
    char v5 = objc_msgSend(v4, "nu_view");
    if (v5)
    {
      double v6 = [(NUArticleBarButtonItemManager *)self shareBarButtonItem];
      double v7 = objc_msgSend(v6, "nu_view");
      [v7 frame];
      double MaxX = CGRectGetMaxX(v24);
    }
    else
    {
      double MaxX = 0.0;
    }

    double v12 = [(NUArticleBarButtonItemManager *)self viewController];
    double v13 = [v12 navigationController];
    double v14 = [v13 toolbar];
  }
  else
  {
    double v9 = [(NUArticleBarButtonItemManager *)self viewController];
    double v10 = [v9 navigationItem];
    double v11 = [v10 titleView];
    [v11 frame];
    double MaxX = CGRectGetMaxX(v25);

    double v12 = [(NUArticleBarButtonItemManager *)self viewController];
    double v13 = [v12 navigationController];
    double v14 = [v13 navigationBar];
  }
  CGFloat v15 = v14;
  [v14 bounds];
  double v17 = v16;
  double v19 = v18;

  double v20 = MaxX + 30.0;
  double v21 = v17 - MaxX + -30.0 + -12.0;
  double v22 = 0.0;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v21;
  result.origin.y = v22;
  result.origin.x = v20;
  return result;
}

- (NUArticleBarButtonItemManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NUArticleBarButtonItemManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (NUArticleNextButton)nextButton
{
  return self->_nextButton;
}

- (UIBarButtonItem)shareBarButtonItem
{
  return self->_shareBarButtonItem;
}

- (void)setShareBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)doneBarButtonItem
{
  return self->_doneBarButtonItem;
}

- (void)setDoneBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)nextBarButtonItem
{
  return self->_nextBarButtonItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_destroyWeak((id *)&self->_viewController);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
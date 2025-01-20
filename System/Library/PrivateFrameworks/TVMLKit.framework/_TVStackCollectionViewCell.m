@interface _TVStackCollectionViewCell
- (BOOL)canBecomeFocused;
- (UIViewController)viewController;
- (id)preferredFocusEnvironments;
- (void)_pressesDidEnd;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setViewController:(id)a3;
@end

@implementation _TVStackCollectionViewCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_TVStackCollectionViewCell;
  [(_TVStackCollectionViewCell *)&v3 prepareForReuse];
  [(_TVStackCollectionViewCell *)self setViewController:0];
  [(_TVStackCollectionViewCell *)self setBackgroundColor:0];
}

- (void)setViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  v5 = obj;
  if (WeakRetained == obj) {
    goto LABEL_13;
  }
  id v6 = objc_storeWeak((id *)&self->_viewController, obj);

  v5 = obj;
  if (!obj) {
    goto LABEL_13;
  }
  id v7 = [obj view];
  p_cellContentView = &self->_cellContentView;
  id v9 = objc_loadWeakRetained((id *)&self->_cellContentView);

  if (v9 != v7)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_cellContentView);
    id v11 = objc_loadWeakRetained((id *)&self->_stowedContentView);

    id v12 = objc_loadWeakRetained((id *)&self->_cellContentView);
    id v13 = v12;
    if (v10 == v11)
    {
      [v12 setHidden:1];
    }
    else
    {
      v14 = [v12 superview];
      v15 = [(_TVStackCollectionViewCell *)self contentView];

      if (v14 != v15)
      {
LABEL_9:
        objc_storeWeak((id *)&self->_cellContentView, v7);
        goto LABEL_10;
      }
      id v13 = objc_loadWeakRetained((id *)&self->_cellContentView);
      [v13 removeFromSuperview];
    }

    goto LABEL_9;
  }
LABEL_10:
  id v16 = objc_loadWeakRetained((id *)&self->_cellContentView);
  v17 = [v16 superview];
  v18 = [(_TVStackCollectionViewCell *)self contentView];

  if (v17 != v18)
  {
    id v19 = objc_loadWeakRetained((id *)&self->_cellContentView);
    [v19 setHidden:0];

    v20 = [(_TVStackCollectionViewCell *)self contentView];
    id v21 = objc_loadWeakRetained((id *)p_cellContentView);
    [v20 addSubview:v21];
  }
  v5 = obj;
LABEL_13:
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)_TVStackCollectionViewCell;
  [(_TVStackCollectionViewCell *)&v9 layoutSubviews];
  [(_TVStackCollectionViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(_TVStackCollectionViewCell *)self viewController];
  v8 = [v7 view];
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v4, v6);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)preferredFocusEnvironments
{
  v7[1] = *MEMORY[0x263EF8340];
  double v3 = [(_TVStackCollectionViewCell *)self viewController];
  if (v3)
  {
    double v4 = [(_TVStackCollectionViewCell *)self viewController];
    v7[0] = v4;
    double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    double v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_TVStackCollectionViewCell;
  [(_TVStackCollectionViewCell *)&v7 pressesBegan:a3 withEvent:a4];
  int64_t pressesEventDepth = self->_pressesEventDepth;
  self->_int64_t pressesEventDepth = pressesEventDepth + 1;
  if (!pressesEventDepth)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cellContentView);
    objc_storeWeak((id *)&self->_stowedContentView, WeakRetained);
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_TVStackCollectionViewCell;
  [(_TVStackCollectionViewCell *)&v5 pressesCancelled:a3 withEvent:a4];
  [(_TVStackCollectionViewCell *)self _pressesDidEnd];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_TVStackCollectionViewCell;
  [(_TVStackCollectionViewCell *)&v5 pressesEnded:a3 withEvent:a4];
  [(_TVStackCollectionViewCell *)self _pressesDidEnd];
}

- (void)_pressesDidEnd
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230B4C000, log, OS_LOG_TYPE_ERROR, "presses ended at depth 0", v1, 2u);
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_stowedContentView);
  objc_destroyWeak((id *)&self->_cellContentView);
}

@end
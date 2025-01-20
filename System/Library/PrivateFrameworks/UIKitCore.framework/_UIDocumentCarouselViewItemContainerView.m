@interface _UIDocumentCarouselViewItemContainerView
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIEdgeInsets)_concreteDefaultLayoutMargins;
- (void)_configureView;
- (void)setContentConfiguration:(uint64_t)a1;
@end

@implementation _UIDocumentCarouselViewItemContainerView

- (void)setContentConfiguration:(uint64_t)a1
{
  id v4 = [*(id *)(a1 + 408) configuration];
  id v5 = a2;
  id v28 = v5;
  if (v4 == v5)
  {

LABEL_23:

    return;
  }
  if (v5 && v4)
  {
    char v6 = [v4 isEqual:v5];

    if (v6) {
      return;
    }
  }
  else
  {
  }
  *(_OWORD *)(a1 + 424) = *MEMORY[0x1E4F1DB30];
  v7 = *(void **)(a1 + 408);
  id v8 = v28;
  id v9 = v7;
  if (objc_opt_respondsToSelector())
  {
    int v10 = [v9 supportsConfiguration:v8];

    if (!v10)
    {
LABEL_10:
      v11 = [v8 makeContentView];
      id v28 = v11;
      if (objc_opt_respondsToSelector())
      {
        id v12 = [v28 _wrappedContentView];
      }
      else
      {
        id v12 = v28;
      }
      v15 = v12;
      if (!v12)
      {
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        v26 = [v28 configuration];
        [v25 handleFailureInMethod:sel_setContentConfiguration_, a1, @"_UIDocumentCarouselView.m", 805, @"Configuration returned a nil content view: %@", v26 object file lineNumber description];
      }
      if (([v15 translatesAutoresizingMaskIntoConstraints] & 1) == 0)
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:sel_setContentConfiguration_, a1, @"_UIDocumentCarouselView.m", 806, @"The content view returned from the content configuration must have translatesAutoresizingMaskIntoConstraints enabled: %@", v15 object file lineNumber description];
      }
      id v16 = *(id *)(a1 + 408);
      id v17 = *(id *)(a1 + 416);
      objc_storeStrong((id *)(a1 + 408), v11);
      objc_storeStrong((id *)(a1 + 416), v15);
      [v17 removeFromSuperview];
      if (v15)
      {
        [(id)a1 bounds];
        objc_msgSend(v15, "setFrame:");
        [v15 setAutoresizingMask:18];
        [(id)a1 addSubview:v15];
      }

      goto LABEL_23;
    }
  }
  else
  {
    v13 = [v9 configuration];

    id v14 = v13;
    if (v14)
    {
      if (objc_opt_respondsToSelector())
      {
        [v14 _wrappedConfigurationIdentifier];
      }
      else
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
      v18 = };
    }
    else
    {
      v18 = 0;
    }

    id v20 = v8;
    if (v20)
    {
      if (objc_opt_respondsToSelector())
      {
        [v20 _wrappedConfigurationIdentifier];
      }
      else
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
      v21 = };
    }
    else
    {
      v21 = 0;
    }

    char v23 = [v18 isEqualToString:v21];
    if ((v23 & 1) == 0) {
      goto LABEL_10;
    }
  }
  v24 = *(void **)(a1 + 408);
  [v24 setConfiguration:v8];
}

- (void)_configureView
{
  v3 = [(UIView *)self layer];
  objc_msgSend(v3, "setShadowOffset:", 0.0, 3.0);

  id v4 = [(UIView *)self layer];
  [v4 setShadowRadius:20.0];

  id v5 = +[UIColor blackColor];
  uint64_t v6 = [v5 CGColor];
  v7 = [(UIView *)self layer];
  [v7 setShadowColor:v6];

  id v8 = [(UIView *)self layer];
  [v8 setShouldRasterize:1];

  id v9 = [(UIView *)self traitCollection];
  [v9 displayScale];
  double v11 = v10;
  id v12 = [(UIView *)self layer];
  [v12 setRasterizationScale:v11];

  [(UIView *)self setPreservesSuperviewLayoutMargins:0];
  [(UIView *)self setInsetsLayoutMarginsFromSafeArea:0];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, 2777777.0);
  if (v8 >= height) {
    double v9 = v8;
  }
  else {
    double v9 = height;
  }
  if (v8 < 2777777.0) {
    double height = v9;
  }
  [(UIView *)self _currentScreenScale];
  double v11 = UISizeRoundToScale(width, height, v10);
  self->_cachedContentSize.double width = v11;
  self->_cachedContentSize.double height = v12;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  double v2 = 8.0;
  double v3 = 8.0;
  double v4 = 8.0;
  double v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_viewForConfiguration, 0);
}

@end
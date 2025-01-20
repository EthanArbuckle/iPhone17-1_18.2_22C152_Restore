@interface SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost
- (UIView)titleView;
- (void)layoutSubviews;
- (void)setTitleView:(id)a3;
@end

@implementation SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost

- (void)setTitleView:(id)a3
{
  id v5 = a3;
  p_titleView = &self->_titleView;
  titleView = self->_titleView;
  id v9 = v5;
  if (titleView)
  {
    [(UIView *)titleView removeFromSuperview];
    v8 = *p_titleView;
    *p_titleView = 0;

    id v5 = v9;
  }
  if (v5)
  {
    [(SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *)self addSubview:v9];
    objc_storeStrong((id *)&self->_titleView, a3);
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](titleView, v5);
}

- (void)layoutSubviews
{
  *(void *)&rect.origin.CGFloat y = self;
  *(void *)&rect.size.CGFloat width = SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost;
  [(CGFloat *)(objc_super *)&rect.origin.y layoutSubviews];
  [(SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIView *)self->_titleView frame];
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;
  rect.origin.x = v23.origin.x;
  double v14 = CGRectGetWidth(v23);
  v24.origin.x = v4;
  v24.origin.CGFloat y = v6;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v10;
  if (v14 >= CGRectGetWidth(v24))
  {
    v25.origin.x = v4;
    v25.origin.CGFloat y = v6;
    v25.size.CGFloat width = v8;
    v25.size.CGFloat height = v10;
    CGFloat width = CGRectGetWidth(v25);
  }
  v26.origin.x = rect.origin.x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v15 = CGRectGetHeight(v26);
  v27.origin.x = v4;
  v27.origin.CGFloat y = v6;
  v27.size.CGFloat width = v8;
  v27.size.CGFloat height = v10;
  double v16 = CGRectGetHeight(v27);
  if (v15 >= v16)
  {
    v28.origin.x = v4;
    v28.origin.CGFloat y = v6;
    v28.size.CGFloat width = v8;
    v28.size.CGFloat height = v10;
    double v16 = CGRectGetHeight(v28);
  }
  v17 = [(SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *)self traitCollection];
  [v17 displayScale];
  double v19 = v18;
  if (v18 < 0.00000011920929)
  {
    v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v20 scale];
    double v19 = v21;
  }
  UIRectCenteredXInRectScale();
  UIRectCenteredYInRectScale();
  [(UIView *)self->_titleView setFrame:*(void *)&v19];
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void).cxx_destruct
{
}

@end
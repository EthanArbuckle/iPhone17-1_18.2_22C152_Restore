@interface PUImportFloatingToolbarView
- (BOOL)shouldBlurBackground;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)items;
- (NSString)backdropViewGroupName;
- (PUImportFloatingToolbarView)init;
- (UIToolbar)toolbar;
- (UIView)shadowView;
- (UIVisualEffectView)visualEffectView;
- (void)_updateBackdropViewGroupName;
- (void)_updateBackground;
- (void)layoutSubviews;
- (void)setBackdropViewGroupName:(id)a3;
- (void)setItems:(id)a3;
- (void)setItems:(id)a3 animated:(BOOL)a4;
- (void)setShadowView:(id)a3;
- (void)setShouldBlurBackground:(BOOL)a3;
- (void)setToolbar:(id)a3;
- (void)setVisualEffectView:(id)a3;
- (void)sizeToFit;
@end

@implementation PUImportFloatingToolbarView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
}

- (void)setShadowView:(id)a3
{
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setToolbar:(id)a3
{
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setVisualEffectView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (BOOL)shouldBlurBackground
{
  return self->_shouldBlurBackground;
}

- (void)_updateBackdropViewGroupName
{
  if (self->_shouldBlurBackground)
  {
    uint64_t v3 = [(PUImportFloatingToolbarView *)self backdropViewGroupName];
    if (v3)
    {
      id v4 = (id)v3;
      [(UIVisualEffectView *)self->_visualEffectView _setGroupName:v3];
    }
  }
}

- (void)_updateBackground
{
  BOOL shouldBlurBackground = self->_shouldBlurBackground;
  visualEffectView = self->_visualEffectView;
  if (shouldBlurBackground)
  {
    v5 = [(UIVisualEffectView *)visualEffectView superview];

    if (v5 != self)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __48__PUImportFloatingToolbarView__updateBackground__block_invoke;
      v7[3] = &unk_1E5F2ED10;
      v7[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
    }
    visualEffectView = self->_visualEffectView;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }
  [(UIVisualEffectView *)visualEffectView setHidden:v6];
  [(PUImportFloatingToolbarView *)self _updateBackdropViewGroupName];
}

uint64_t __48__PUImportFloatingToolbarView__updateBackground__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 424)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[53];
  return [v2 sendSubviewToBack:v3];
}

- (void)setBackdropViewGroupName:(id)a3
{
  v8 = (NSString *)a3;
  id v4 = self->_backdropViewGroupName;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      backdropViewGroupName = self->_backdropViewGroupName;
      self->_backdropViewGroupName = v6;

      [(PUImportFloatingToolbarView *)self _updateBackdropViewGroupName];
    }
  }
}

- (void)setShouldBlurBackground:(BOOL)a3
{
  if (self->_shouldBlurBackground != a3)
  {
    self->_BOOL shouldBlurBackground = a3;
    [(PUImportFloatingToolbarView *)self _updateBackground];
  }
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PUImportFloatingToolbarView *)self toolbar];
  [v7 setItems:v6 animated:v4];
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportFloatingToolbarView *)self toolbar];
  [v5 setItems:v4];
}

- (NSArray)items
{
  v2 = [(PUImportFloatingToolbarView *)self toolbar];
  uint64_t v3 = [v2 items];

  return (NSArray *)v3;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PUImportFloatingToolbarView;
  [(PUImportFloatingToolbarView *)&v20 layoutSubviews];
  [(PUImportFloatingToolbarView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PUImportFloatingToolbarView *)self toolbar];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(PUImportFloatingToolbarView *)self visualEffectView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  double v15 = 1.0 / v14;

  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  double MinX = CGRectGetMinX(v21);
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  double MaxY = CGRectGetMaxY(v22);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  double Width = CGRectGetWidth(v23);
  v19 = [(PUImportFloatingToolbarView *)self shadowView];
  objc_msgSend(v19, "setFrame:", MinX, MaxY, Width, v15);
}

- (CGSize)intrinsicContentSize
{
  v2 = [(PUImportFloatingToolbarView *)self toolbar];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)sizeToFit
{
  double v3 = [(PUImportFloatingToolbarView *)self toolbar];
  [v3 sizeToFit];

  double v4 = [(PUImportFloatingToolbarView *)self toolbar];
  [v4 bounds];
  -[PUImportFloatingToolbarView setBounds:](self, "setBounds:");

  [(PUImportFloatingToolbarView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(PUImportFloatingToolbarView *)self visualEffectView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(PUImportFloatingToolbarView *)self toolbar];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (PUImportFloatingToolbarView)init
{
  v16.receiver = self;
  v16.super_class = (Class)PUImportFloatingToolbarView;
  v2 = [(PUImportFloatingToolbarView *)&v16 init];
  if (v2)
  {
    double v3 = [MEMORY[0x1E4FB1618] clearColor];
    [(PUImportFloatingToolbarView *)v2 setBackgroundColor:v3];

    [(PUImportFloatingToolbarView *)v2 setOpaque:0];
    double v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v4];
    visualEffectView = v2->_visualEffectView;
    v2->_visualEffectView = (UIVisualEffectView *)v5;

    [(PUImportFloatingToolbarView *)v2 addSubview:v2->_visualEffectView];
    [(PUImportFloatingToolbarView *)v2 _updateBackground];
    double v7 = (UIToolbar *)objc_alloc_init(MEMORY[0x1E4FB1DF0]);
    toolbar = v2->_toolbar;
    v2->_toolbar = v7;

    double v9 = v2->_toolbar;
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1818]);
    [(UIToolbar *)v9 setBackgroundImage:v10 forToolbarPosition:0 barMetrics:0];

    double v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIToolbar *)v2->_toolbar setBackgroundColor:v11];

    [(UIToolbar *)v2->_toolbar setPreservesSuperviewLayoutMargins:0];
    [(PUImportFloatingToolbarView *)v2 addSubview:v2->_toolbar];
    double v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    shadowView = v2->_shadowView;
    v2->_shadowView = v12;

    [(UIView *)v2->_shadowView setOpaque:1];
    [(UIView *)v2->_shadowView setUserInteractionEnabled:0];
    double v14 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
    [(UIView *)v2->_shadowView setBackgroundColor:v14];

    [(PUImportFloatingToolbarView *)v2 addSubview:v2->_shadowView];
  }
  return v2;
}

@end
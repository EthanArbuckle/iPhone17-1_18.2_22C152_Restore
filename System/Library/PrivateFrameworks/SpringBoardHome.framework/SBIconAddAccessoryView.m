@interface SBIconAddAccessoryView
- (BOOL)displayingAccessory;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGPoint)accessoryCenterForIconBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (SBIconAddAccessoryView)init;
- (SBIconListLayout)listLayout;
- (UIEdgeInsets)_hitTestPadding;
- (UITapGestureRecognizer)actionTapGestureRecognizer;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)layoutSubviews;
- (void)setActionTapGestureRecognizer:(id)a3;
- (void)setListLayout:(id)a3;
@end

@implementation SBIconAddAccessoryView

- (SBIconAddAccessoryView)init
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)SBIconAddAccessoryView;
  v2 = [(SBIconAddAccessoryView *)&v15 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1830] configurationWithScale:2];
    v4 = (void *)MEMORY[0x1E4FB1830];
    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    v16[0] = v5;
    v6 = [MEMORY[0x1E4FB1618] systemGreenColor];
    v16[1] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v8 = [v4 configurationWithPaletteColors:v7];

    v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.circle.fill" withConfiguration:v3];
    v10 = [v9 imageWithConfiguration:v8];

    v11 = [v10 imageWithRenderingMode:2];

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v11];
    addImageView = v2->_addImageView;
    v2->_addImageView = (UIImageView *)v12;

    [(UIImageView *)v2->_addImageView setContentMode:1];
    [(SBIconAddAccessoryView *)v2 addSubview:v2->_addImageView];
  }
  return v2;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBIconAddAccessoryView;
  [(SBIconAddAccessoryView *)&v4 layoutSubviews];
  addImageView = self->_addImageView;
  [(SBIconAddAccessoryView *)self bounds];
  UIRectInset();
  -[UIImageView setFrame:](addImageView, "setFrame:");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SBIconAddAccessoryView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(SBIconAddAccessoryView *)self _hitTestPadding];
  double v16 = v10 + v15;
  double v19 = v12 - (v17 + v18);
  double v21 = v14 - (v15 + v20);
  double v22 = v8 + v17;
  double v23 = v16;
  double v24 = v19;
  CGFloat v25 = x;
  CGFloat v26 = y;
  return CGRectContainsPoint(*(CGRect *)&v22, *(CGPoint *)&v25);
}

- (CGSize)intrinsicContentSize
{
  v2 = [(SBIconAddAccessoryView *)self listLayout];
  double v3 = SBHIconListLayoutIconAccessorySize(v2);
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGPoint)accessoryCenterForIconBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(SBIconAddAccessoryView *)self listLayout];
  double v9 = SBHIconListLayoutIconAccessoryOffset(v8);
  double v11 = v10;

  double v12 = [(SBIconAddAccessoryView *)self listLayout];
  double v13 = SBHIconListLayoutIconAccessorySize(v12);
  double v15 = v14;

  char v16 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1;
  double v17 = SBIconBadgeViewCalculateAccessoryCenter(v16, x, y, width, height, v13 + 2.0 + 2.0, v15 + 2.0 + 2.0, v9, v11);
  result.CGFloat y = v18;
  result.CGFloat x = v17;
  return result;
}

- (BOOL)displayingAccessory
{
  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  double v6 = (void *)MEMORY[0x1E4FB14C0];
  [(SBIconAddAccessoryView *)self bounds];
  CGRect v15 = CGRectInset(v14, 1.0, 1.0);
  double v7 = objc_msgSend(v6, "bezierPathWithOvalInRect:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  [v5 setShadowPath:v7];
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v5];
  double v9 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v8];
  double v10 = [MEMORY[0x1E4FB1AE0] shapeWithPath:v7];
  double v11 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v9 shape:v10];

  return v11;
}

- (UIEdgeInsets)_hitTestPadding
{
  double v2 = -9.0;
  double v3 = -9.0;
  double v4 = -9.0;
  double v5 = -9.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (void)setListLayout:(id)a3
{
}

- (UITapGestureRecognizer)actionTapGestureRecognizer
{
  return self->_actionTapGestureRecognizer;
}

- (void)setActionTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_addImageView, 0);
}

@end
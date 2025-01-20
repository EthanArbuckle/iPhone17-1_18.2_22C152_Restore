@interface BarButton
+ (id)sidebarButtonWithPrimaryAction:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldRespectContextMenuOrdering;
- (BarButton)initWithFrame:(CGRect)a3;
- (CGRect)_barButtonHitRect;
- (CGRect)_selectedIndicatorBounds;
- (CGRect)barButtonHitRect;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (void)setBarButtonHitRect:(CGRect)a3;
- (void)setShouldRespectContextMenuOrdering:(BOOL)a3;
@end

@implementation BarButton

+ (id)sidebarButtonWithPrimaryAction:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB14D8];
  id v5 = a3;
  v6 = [v4 plainButtonConfiguration];
  v7 = [MEMORY[0x1E4FB1618] clearColor];
  v8 = [v6 background];
  [v8 setBackgroundColor:v7];

  objc_msgSend(v6, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"sidebar.leading"];
  [v6 setImage:v9];
  v10 = [a1 buttonWithConfiguration:v6 primaryAction:v5];

  v11 = _WBSLocalizedString();
  objc_msgSend(v10, "sf_configureLargeContentViewerWithImage:title:", v9, v11);

  return v10;
}

- (BarButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BarButton;
  v3 = -[BarButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BarButton *)v3 setPointerStyleProvider:&__block_literal_global_51];
    id v5 = v4;
  }

  return v4;
}

id __27__BarButton_initWithFrame___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4FB1AE8];
  id v5 = (void *)MEMORY[0x1E4FB1AE0];
  id v6 = a3;
  objc_super v7 = objc_msgSend(v5, "sf_shapeForToolbarButton:", a2);
  v8 = [v4 styleWithEffect:v6 shape:v7];

  return v8;
}

- (CGRect)_barButtonHitRect
{
  p_barButtonHitRect = &self->_barButtonHitRect;
  [(BarButton *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  CGFloat x = p_barButtonHitRect->origin.x;
  CGFloat y = p_barButtonHitRect->origin.y;
  CGFloat width = p_barButtonHitRect->size.width;
  CGFloat height = p_barButtonHitRect->size.height;
  return CGRectUnion(*(CGRect *)&x, *(CGRect *)&v4);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(BarButton *)self _barButtonHitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  uint64_t v5 = (void *)MEMORY[0x1E4FB1AD8];
  [(BarButton *)self _barButtonHitRect];
  return (id)objc_msgSend(v5, "regionWithRect:identifier:", @"BarButton");
}

- (CGRect)_selectedIndicatorBounds
{
  uint64_t v3 = [(BarButton *)self titleForState:0];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [(BarButton *)self titleLabel];
    [v5 frame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v27.origin.CGFloat x = v7;
    v27.origin.CGFloat y = v9;
    v27.size.CGFloat width = v11;
    v27.size.CGFloat height = v13;
    CGRect v28 = CGRectInset(v27, 6.0, 0.0);
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
  }
  else
  {
    v18 = [(BarButton *)self imageView];
    [v18 frame];
    CGFloat x = v19;
    CGFloat y = v20;
    CGFloat width = v21;
    CGFloat height = v22;
  }
  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BarButton;
  uint64_t v5 = -[BarButton contextMenuInteraction:configurationForMenuAtLocation:](&v8, sel_contextMenuInteraction_configurationForMenuAtLocation_, a3, a4.x, a4.y);
  double v6 = v5;
  if (self->_shouldRespectContextMenuOrdering) {
    [v5 setPreferredMenuElementOrder:2];
  }
  return v6;
}

- (CGRect)barButtonHitRect
{
  double x = self->_barButtonHitRect.origin.x;
  double y = self->_barButtonHitRect.origin.y;
  double width = self->_barButtonHitRect.size.width;
  double height = self->_barButtonHitRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBarButtonHitRect:(CGRect)a3
{
  self->_barButtonHitRect = a3;
}

- (BOOL)shouldRespectContextMenuOrdering
{
  return self->_shouldRespectContextMenuOrdering;
}

- (void)setShouldRespectContextMenuOrdering:(BOOL)a3
{
  self->_shouldRespectContextMenuOrdering = a3;
}

@end
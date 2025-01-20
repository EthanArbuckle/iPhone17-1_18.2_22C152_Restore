@interface SKUIStackView
- (CGPoint)_centerInPerspectiveTargetViewCoordinates;
- (CGSize)_levelInsetSize;
- (CGSize)_normalizedDistanceFromVanishingPointForCenter:(CGPoint)a3 perspectiveTargetView:(id)a4;
- (CGSize)_sizeOfItemAtIndex:(double)a3;
- (SKUIStackView)initWithStackViewStyle:(int64_t)a3;
- (UIImage)image;
- (UIOffset)_relativeOffsetForMinimumRelativeOffset:(UIOffset)a3 maximumRelativeOffset:(UIOffset)a4 normalizedDistanceFromVanishingPoint:(CGSize)a5;
- (UIOffset)_relativeOffsetOfItemAtIndex:(int64_t)a3 withCenter:(CGPoint)a4;
- (id)_initSKUIStackView;
- (int64_t)_stackDepth;
- (int64_t)stackViewStyle;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)performCompressionAnimationWithCompletionHandler:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation SKUIStackView

- (id)_initSKUIStackView
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIStackView;
  v2 = [(SKUIStackView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SKUIStackView *)v2 setClipsToBounds:0];
  }
  return v3;
}

- (SKUIStackView)initWithStackViewStyle:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStackView initWithStackViewStyle:]();
  }
  objc_super v5 = [(SKUIStackView *)self _initSKUIStackView];
  v6 = v5;
  if (v5)
  {
    v5->_int64_t stackViewStyle = a3;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stackViews = v6->_stackViews;
    v6->_stackViews = v7;

    if ([(SKUIStackView *)v6 _stackDepth] >= 1)
    {
      uint64_t v9 = 0;
      do
      {
        v10 = objc_alloc_init(SKUIStackViewItemView);
        v11 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.8];
        [(SKUIStackViewItemView *)v10 setBorderColor:v11];

        int64_t stackViewStyle = v6->_stackViewStyle;
        if (stackViewStyle == 1)
        {
          [(SKUIStackViewItemView *)v10 setAlpha:initWithStackViewStyle__sShallowAlphas[v9]];
        }
        else if (!stackViewStyle)
        {
          [(SKUIStackViewItemView *)v10 setAlpha:initWithStackViewStyle__sDefaultAlphas[v9]];
          [(SKUIStackViewItemView *)v10 setShouldFlipImageHorizontal:(0x2AuLL >> v9) & 1];
          [(SKUIStackViewItemView *)v10 setShouldFlipImageVertical:(unint64_t)(v9 - 1) < 2];
        }
        [(SKUIStackView *)v6 insertSubview:v10 atIndex:0];
        [(NSMutableArray *)v6->_stackViews addObject:v10];

        ++v9;
      }
      while (v9 < [(SKUIStackView *)v6 _stackDepth]);
    }
  }
  return v6;
}

- (void)performCompressionAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SKUIStackView *)self superview];
  [(SKUIStackView *)self center];
  objc_msgSend(v5, "convertPoint:toView:", 0);
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  stackViews = self->_stackViews;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__SKUIStackView_performCompressionAnimationWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6429528;
  uint64_t v14 = v7;
  uint64_t v15 = v9;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [(NSMutableArray *)stackViews enumerateObjectsUsingBlock:v12];
}

void __66__SKUIStackView_performCompressionAnimationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v39 = (double)a3;
  [*(id *)(a1 + 32) _sizeOfItemAtIndex:(double)a3 + 0.75];
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "_relativeOffsetOfItemAtIndex:withCenter:", a3, *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v15 = v14;
  double v17 = v16;
  objc_msgSend(*(id *)(a1 + 32), "_relativeOffsetOfItemAtIndex:withCenter:", (uint64_t)((double)a3 + 0.75), *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v19 = v18;
  double v21 = v20;
  v22 = [v5 layer];

  memset(&v46, 0, sizeof(v46));
  CATransform3DMakeScale(&v46, v11 / v7, v13 / v9, 1.0);
  CATransform3D v44 = v46;
  CATransform3DTranslate(&v45, &v44, v19 - v15, v21 - v17, 0.0);
  CATransform3D v46 = v45;
  v23 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
  v24 = (void *)MEMORY[0x1E4F29238];
  v25 = [v22 presentationLayer];
  v26 = v25;
  if (!v25) {
    v25 = v22;
  }
  if (v25) {
    [v25 transform];
  }
  else {
    memset(v43, 0, sizeof(v43));
  }
  v27 = [v24 valueWithCATransform3D:v43];
  [v23 setFromValue:v27];

  CATransform3D v45 = v46;
  v28 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v45];
  [v23 setToValue:v28];

  [v23 setDamping:30.0];
  [v23 setStiffness:300.0];
  [v23 setDuration:1.0];
  [v23 setBeginTime:v39 * 0.075];
  v29 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
  v30 = (void *)MEMORY[0x1E4F29238];
  if (v22) {
    [v22 transform];
  }
  else {
    memset(v42, 0, sizeof(v42));
  }
  v31 = [v30 valueWithCATransform3D:v42];
  [v29 setToValue:v31];

  [v29 setDamping:30.0];
  [v29 setStiffness:300.0];
  [v29 setDuration:1.5];
  [v29 setBeginTime:v39 * 0.075 + 0.25];
  v32 = [MEMORY[0x1E4F39B38] animation];
  v47[0] = v23;
  v47[1] = v29;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  [v32 setAnimations:v33];

  [v23 duration];
  double v35 = v34;
  [v29 duration];
  [v32 setDuration:v35 + v36];
  if (*(void *)(a1 + 40) && [*(id *)(*(void *)(a1 + 32) + 416) count] - 1 == a3)
  {
    v37 = [SKUIBlockAnimationDelegate alloc];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __66__SKUIStackView_performCompressionAnimationWithCompletionHandler___block_invoke_2;
    v40[3] = &unk_1E6429500;
    id v41 = *(id *)(a1 + 40);
    v38 = [(SKUIBlockAnimationDelegate *)v37 initWithCompletionHandler:v40];
    [v32 setDelegate:v38];
  }
  [v22 addAnimation:v32 forKey:@"SKUIStackViewAnimationKey"];
}

uint64_t __66__SKUIStackView_performCompressionAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setImage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_stackViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setImage:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIStackView;
  [(SKUIStackView *)&v5 didMoveToWindow];
  v3 = [(SKUIStackView *)self window];
  window = self->_window;
  self->_window = v3;
}

- (void)layoutSubviews
{
  [(SKUIStackView *)self _centerInPerspectiveTargetViewCoordinates];
  stackViews = self->_stackViews;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__SKUIStackView_layoutSubviews__block_invoke;
  v6[3] = &unk_1E6429550;
  v6[4] = self;
  v6[5] = v4;
  v6[6] = v5;
  [(NSMutableArray *)stackViews enumerateObjectsUsingBlock:v6];
}

void __31__SKUIStackView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v26 = a2;
  [*(id *)(a1 + 32) bounds];
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  CGRectGetMidX(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGRectGetMidY(v29);
  [*(id *)(a1 + 32) _sizeOfItemAtIndex:(double)a3];
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "_relativeOffsetOfItemAtIndex:withCenter:", a3, *(double *)(a1 + 40), *(double *)(a1 + 48));
  UIRectCenteredAboutPointScale();
  CGFloat v13 = v30.origin.x;
  CGFloat v14 = v30.origin.y;
  CGFloat v15 = v30.size.width;
  CGFloat v16 = v30.size.height;
  double MidX = CGRectGetMidX(v30);
  v31.origin.CGFloat x = v13;
  v31.origin.CGFloat y = v14;
  v31.size.CGFloat width = v15;
  v31.size.CGFloat height = v16;
  double MidY = CGRectGetMidY(v31);
  [v26 center];
  if (MidX != v20 || MidY != v19) {
    objc_msgSend(v26, "setCenter:", MidX, MidY);
  }
  [v26 bounds];
  v33.origin.CGFloat x = v22;
  v33.origin.CGFloat y = v23;
  v33.size.CGFloat width = v24;
  v33.size.CGFloat height = v25;
  v32.origin.CGFloat x = 0.0;
  v32.origin.CGFloat y = 0.0;
  v32.size.CGFloat width = v10;
  v32.size.CGFloat height = v12;
  if (!CGRectEqualToRect(v32, v33)) {
    objc_msgSend(v26, "setBounds:", 0.0, 0.0, v10, v12);
  }
}

- (CGPoint)_centerInPerspectiveTargetViewCoordinates
{
  if (self->_window)
  {
    [(SKUIStackView *)self bounds];
    CGFloat x = v11.origin.x;
    CGFloat y = v11.origin.y;
    CGFloat width = v11.size.width;
    CGFloat height = v11.size.height;
    double MidX = CGRectGetMidX(v11);
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    -[SKUIStackView convertPoint:toView:](self, "convertPoint:toView:", self->_window, MidX, CGRectGetMidY(v12));
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGSize)_levelInsetSize
{
  double v2 = 3.0;
  double v3 = 3.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (CGSize)_normalizedDistanceFromVanishingPointForCenter:(CGPoint)a3 perspectiveTargetView:(id)a4
{
  if (a4)
  {
    double y = a3.y;
    double x = a3.x;
    [a4 bounds];
    CGFloat v6 = v15.origin.x;
    CGFloat v7 = v15.origin.y;
    CGFloat width = v15.size.width;
    CGFloat height = v15.size.height;
    double v10 = fmax(CGRectGetWidth(v15) - x, x);
    v16.origin.double x = v6;
    v16.origin.double y = v7;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    double v11 = fmax(CGRectGetHeight(v16) + 1000.0, -1000.0);
    double v12 = (x - x) / v10;
    double v13 = (-1000.0 - y) / v11;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (UIOffset)_relativeOffsetForMinimumRelativeOffset:(UIOffset)a3 maximumRelativeOffset:(UIOffset)a4 normalizedDistanceFromVanishingPoint:(CGSize)a5
{
  double v5 = a3.horizontal + (fabs(a3.horizontal) + fabs(a4.horizontal)) * (a5.width * 0.5 + 0.5);
  double v6 = a3.vertical + (fabs(a3.vertical) + fabs(a4.vertical)) * (a5.height * 0.5 + 0.5);
  result.vertical = v6;
  result.horizontal = v5;
  return result;
}

- (UIOffset)_relativeOffsetOfItemAtIndex:(int64_t)a3 withCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(SKUIStackView *)self _levelInsetSize];
  double v9 = (v8 + v8) * (double)a3;
  double v11 = (v10 + v10) * (double)a3;
  -[SKUIStackView _normalizedDistanceFromVanishingPointForCenter:perspectiveTargetView:](self, "_normalizedDistanceFromVanishingPointForCenter:perspectiveTargetView:", self->_window, x, y);

  -[SKUIStackView _relativeOffsetForMinimumRelativeOffset:maximumRelativeOffset:normalizedDistanceFromVanishingPoint:](self, "_relativeOffsetForMinimumRelativeOffset:maximumRelativeOffset:normalizedDistanceFromVanishingPoint:", -(double)(3 * a3) - v9 * 0.5, -(double)(3 * a3) - v11 * 0.5, v9 * 0.5 + (double)(3 * a3), v11 * 0.5 + (double)(3 * a3), v12, v13);
  result.vertical = v15;
  result.horizontal = v14;
  return result;
}

- (CGSize)_sizeOfItemAtIndex:(double)a3
{
  [(SKUIStackView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  [(SKUIStackView *)self _levelInsetSize];
  double v11 = v6 - (v9 + v9) * a3;
  double v12 = v8 - (v10 + v10) * a3;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (int64_t)_stackDepth
{
  if (self->_stackViewStyle) {
    return 3;
  }
  else {
    return 6;
  }
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)stackViewStyle
{
  return self->_stackViewStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_stackViews, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (void)initWithStackViewStyle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStackView initWithStackViewStyle:]";
}

@end
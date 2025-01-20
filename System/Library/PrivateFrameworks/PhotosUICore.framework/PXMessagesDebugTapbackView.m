@interface PXMessagesDebugTapbackView
- (BOOL)isAnimating;
- (BOOL)shouldReloadForUserData:(id)a3;
- (BOOL)shouldReuseWhenInvisible;
- (CGRect)clippingRect;
- (NSCopying)userData;
- (PXMessagesDebugTapbackView)initWithFrame:(CGRect)a3;
- (double)desiredAlpha;
- (int64_t)reuseCounter;
- (void)_bounce;
- (void)_updateFinalAlpha;
- (void)becomeReusable;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setDesiredAlpha:(double)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setReuseCounter:(int64_t)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXMessagesDebugTapbackView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_heartImageView, 0);
}

- (void)setReuseCounter:(int64_t)a3
{
  self->_reuseCounter = a3;
}

- (int64_t)reuseCounter
{
  return self->_reuseCounter;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setDesiredAlpha:(double)a3
{
  self->_desiredAlpha = a3;
}

- (double)desiredAlpha
{
  return self->_desiredAlpha;
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->clippingRect.origin.x;
  double y = self->clippingRect.origin.y;
  double width = self->clippingRect.size.width;
  double height = self->clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_updateFinalAlpha
{
  BOOL v3 = [(PXMessagesDebugTapbackView *)self isAnimating];
  double v4 = 1.0;
  if (!v3) {
    [(PXMessagesDebugTapbackView *)self desiredAlpha];
  }
  v5.receiver = self;
  v5.super_class = (Class)PXMessagesDebugTapbackView;
  [(PXMessagesDebugTapbackView *)&v5 setAlpha:v4];
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    [(PXMessagesDebugTapbackView *)self _updateFinalAlpha];
  }
}

- (void)setAlpha:(double)a3
{
  if (self->_desiredAlpha != a3)
  {
    self->_desiredAlpha = a3;
    [(PXMessagesDebugTapbackView *)self _updateFinalAlpha];
  }
}

- (void)_bounce
{
  if (![(PXMessagesDebugTapbackView *)self isAnimating])
  {
    int64_t reuseCounter = self->_reuseCounter;
    [(PXMessagesDebugTapbackView *)self setIsAnimating:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__PXMessagesDebugTapbackView__bounce__block_invoke;
    v6[3] = &unk_1E5DD36F8;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v6 usingSpringWithDamping:0 initialSpringVelocity:0.1 options:0.0 animations:1.0 completion:1.0];
    v4[5] = reuseCounter;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__PXMessagesDebugTapbackView__bounce__block_invoke_2;
    v5[3] = &unk_1E5DD36F8;
    v5[4] = self;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __37__PXMessagesDebugTapbackView__bounce__block_invoke_3;
    v4[3] = &unk_1E5DCEB50;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v5 usingSpringWithDamping:v4 initialSpringVelocity:0.5 options:0.09 animations:0.5 completion:1.0];
  }
}

uint64_t __37__PXMessagesDebugTapbackView__bounce__block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.2, 0.2);
  v2 = *(void **)(*(void *)(a1 + 32) + 408);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __37__PXMessagesDebugTapbackView__bounce__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 408);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __37__PXMessagesDebugTapbackView__bounce__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) reuseCounter];
  if (result == *(void *)(a1 + 40))
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 setIsAnimating:0];
  }
  return result;
}

- (void)setUserData:(id)a3
{
  v12 = (PXMessagesDebugTapbackUserData *)a3;
  CGAffineTransform v5 = self->_userData;
  if (v5 == v12)
  {
  }
  else
  {
    char v6 = [(PXMessagesDebugTapbackUserData *)v5 isEqual:v12];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_userData, a3);
      v7 = [(PXMessagesDebugTapbackUserData *)v12 asset];
      int v8 = [v7 isFavorite];

      if (v8)
      {
        v9 = [(PXMessagesDebugTapbackUserData *)v12 asset];
        int v10 = [v9 isFavorite];
        double v11 = 0.0;
        if (v10) {
          double v11 = 1.0;
        }
        [(UIImageView *)self->_heartImageView setAlpha:v11];

        if ([(PXMessagesDebugTapbackUserData *)v12 shouldAnimate])
        {
          [(PXMessagesDebugTapbackUserData *)v12 setShouldAnimate:0];
          [(PXMessagesDebugTapbackView *)self _bounce];
        }
      }
    }
  }
}

- (NSCopying)userData
{
  return (NSCopying *)self->_userData;
}

- (BOOL)shouldReuseWhenInvisible
{
  return 1;
}

- (BOOL)shouldReloadForUserData:(id)a3
{
  id v4 = a3;
  CGAffineTransform v5 = [v4 asset];
  int v6 = [v5 isFavorite];

  if (v6)
  {
    v7 = [(PXMessagesDebugTapbackUserData *)self->_userData asset];
    int v8 = [v7 isFavorite];
    v9 = [v4 asset];
    int v10 = v8 ^ [v9 isFavorite];
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)becomeReusable
{
  [(PXMessagesDebugTapbackView *)self setReuseCounter:[(PXMessagesDebugTapbackView *)self reuseCounter] + 1];
  [(UIImageView *)self->_heartImageView setAlpha:0.0];
  BOOL v3 = [(UIImageView *)self->_heartImageView layer];
  [v3 removeAllAnimations];

  [(PXMessagesDebugTapbackView *)self setIsAnimating:0];
  [(PXMessagesDebugTapbackView *)self setUserData:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesDebugTapbackView;
  [(PXMessagesDebugTapbackView *)&v3 layoutSubviews];
  [(PXMessagesDebugTapbackView *)self bounds];
  PXRectGetCenter();
}

- (PXMessagesDebugTapbackView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXMessagesDebugTapbackView;
  objc_super v3 = -[PXMessagesDebugTapbackView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"heart.circle.fill"];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
    heartImageView = v3->_heartImageView;
    v3->_heartImageView = (UIImageView *)v5;

    v7 = [MEMORY[0x1E4FB1618] orangeColor];
    [(UIImageView *)v3->_heartImageView setTintColor:v7];

    [(PXMessagesDebugTapbackView *)v3 addSubview:v3->_heartImageView];
  }
  return v3;
}

@end
@interface PURedEyeIndicatorView
- (PURedEyeIndicatorView)init;
- (unint64_t)animationType;
- (void)animateWithDelay:(double)a3 completion:(id)a4;
- (void)didMoveToSuperview;
- (void)drawRect:(CGRect)a3;
- (void)setAnimationType:(unint64_t)a3;
@end

@implementation PURedEyeIndicatorView

- (void)setAnimationType:(unint64_t)a3
{
  self->_animationType = a3;
}

- (unint64_t)animationType
{
  return self->_animationType;
}

- (void)animateWithDelay:(double)a3 completion:(id)a4
{
  id v6 = a4;
  if (self->_animationType == 1)
  {
    CGAffineTransformMakeTranslation(&v21, -10.0, 0.0);
    [(UIView *)self pu_addTransform:&v21];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke;
    v20[3] = &unk_1E5F2ED10;
    v20[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v20 usingSpringWithDamping:0 initialSpringVelocity:1.29999995 options:a3 animations:0.100000001 completion:0.0];
    v7 = (void *)MEMORY[0x1E4FB1EB0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_2;
    v19[3] = &unk_1E5F2ED10;
    v19[4] = self;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_3;
    v17[3] = &unk_1E5F2D990;
    id v18 = v6;
    id v8 = v6;
    [v7 animateWithDuration:0 delay:v19 options:v17 animations:0.3 completion:a3 + 0.7];
    v9 = v18;
  }
  else
  {
    memset(&v16, 0, sizeof(v16));
    [(PURedEyeIndicatorView *)self transform];
    CGAffineTransformScale(&v16, &v15, 3.0, 3.0);
    v10 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    CGAffineTransform v14 = v16;
    v13[2] = __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_4;
    v13[3] = &unk_1E5F2B218;
    v13[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_5;
    v11[3] = &unk_1E5F2D990;
    id v12 = v6;
    id v8 = v6;
    [v10 animateWithDuration:3 delay:v13 options:v11 animations:0.300000012 completion:a3];
    v9 = v12;
  }
}

uint64_t __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeTranslation(&v3, 10.0, 0.0);
  return objc_msgSend(v1, "pu_addTransform:", &v3);
}

uint64_t __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  [(PURedEyeIndicatorView *)self bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  CGFloat MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v15);
  CGContextSetLineWidth(CurrentContext, 2.0);
  id v11 = [MEMORY[0x1E4FB1618] whiteColor];
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v11 CGColor]);

  v13.CGFloat width = 0.0;
  v13.CGFloat height = 1.0;
  CGContextSetShadow(CurrentContext, v13, 0.5);
  CGContextAddArc(CurrentContext, MidX, MidY, 8.0, 0.0, 6.28318531, 1);
  CGContextStrokePath(CurrentContext);
}

- (void)didMoveToSuperview
{
  v11.receiver = self;
  v11.super_class = (Class)PURedEyeIndicatorView;
  [(PURedEyeIndicatorView *)&v11 didMoveToSuperview];
  long long v3 = [(PURedEyeIndicatorView *)self window];

  if (v3)
  {
    v4 = [(PURedEyeIndicatorView *)self window];
    -[PURedEyeIndicatorView convertRect:fromView:](self, "convertRect:fromView:", v4, 0.0, 0.0, 1.0, 1.0);
    CGFloat v6 = v5;
    CGFloat v8 = v7;

    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, v6, v8);
    CGAffineTransform v9 = v10;
    [(UIView *)self pu_addTransform:&v9];
  }
}

- (PURedEyeIndicatorView)init
{
  v5.receiver = self;
  v5.super_class = (Class)PURedEyeIndicatorView;
  v2 = [(PURedEyeIndicatorView *)&v5 init];
  long long v3 = v2;
  if (v2)
  {
    -[PURedEyeIndicatorView setBounds:](v2, "setBounds:", 0.0, 0.0, 22.0, 22.0);
    [(PURedEyeIndicatorView *)v3 setAnimationType:0];
    [(PURedEyeIndicatorView *)v3 setClearsContextBeforeDrawing:1];
    [(PURedEyeIndicatorView *)v3 setOpaque:0];
  }
  return v3;
}

@end
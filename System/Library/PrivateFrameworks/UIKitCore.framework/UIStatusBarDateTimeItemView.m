@interface UIStatusBarDateTimeItemView
+ (const)_cStringFromData:(id *)a3;
- (BOOL)shouldTintContentImage;
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (BOOL)useCustomFadeAnimation;
- (NSString)dateTimeString;
- (double)extraRightPadding;
- (id)accessibilityHUDRepresentation;
- (id)contentsImage;
- (int64_t)textStyle;
- (void)setDateTimeString:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setUseCustomFadeAnimation:(BOOL)a3;
- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5;
@end

@implementation UIStatusBarDateTimeItemView

+ (const)_cStringFromData:(id *)a3
{
  return 0;
}

- (BOOL)shouldTintContentImage
{
  return 1;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5 = [a3 rawData];
  v6 = objc_msgSend([NSString alloc], "initWithCString:encoding:", objc_msgSend((id)objc_opt_class(), "_cStringFromData:", v5), 4);
  p_dateTimeString = &self->_dateTimeString;
  char v8 = [v6 isEqualToString:*p_dateTimeString];
  if ((v8 & 1) == 0) {
    objc_storeStrong((id *)p_dateTimeString, v6);
  }

  return v8 ^ 1;
}

- (id)contentsImage
{
  return [(UIStatusBarItemView *)self imageWithText:self->_dateTimeString shouldCache:0];
}

- (int64_t)textStyle
{
  return 3;
}

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v10 = a3;
  if (self->_useCustomFadeAnimation)
  {
    if ([(UIStatusBarItemView *)self isVisible] != a3)
    {
      [(UIStatusBarItemView *)self setVisible:v10 settingAlpha:0];
      if (a5 <= 0.0)
      {
        BOOL v12 = [(UIStatusBarItemView *)self isVisible];
        double v13 = 0.0;
        if (v12) {
          double v13 = 1.0;
        }
        [(UIView *)self setAlpha:v13];
      }
      else
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke;
        v17[3] = &unk_1E52D9F70;
        v17[4] = self;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke_2;
        v15[3] = &unk_1E52FEEA8;
        BOOL v16 = v10;
        *(double *)&v15[5] = a5;
        v15[4] = self;
        +[UIView animateWithDuration:32 delay:v17 options:v15 animations:a5 * 0.2 completion:0.0];
      }
    }
    -[UIStatusBarDateTimeItemView setFrame:](self, "setFrame:", x, y, width, height);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIStatusBarDateTimeItemView;
    -[UIStatusBarItemView setVisible:frame:duration:](&v14, sel_setVisible_frame_duration_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
  }
}

uint64_t __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 48))
  {
    double v1 = *(double *)(result + 40) * 0.5;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke_3;
    v2[3] = &unk_1E52D9F70;
    v2[4] = *(void *)(result + 32);
    return +[UIView animateWithDuration:32 delay:v2 options:0 animations:v1 completion:0.0];
  }
  return result;
}

uint64_t __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v19.receiver = self;
  v19.super_class = (Class)UIStatusBarDateTimeItemView;
  -[UIView setFrame:](&v19, sel_setFrame_, x, y, width, height);
  [(UIView *)self frame];
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (!CGRectEqualToRect(v20, v21))
  {
    BOOL v16 = [(UIView *)self _screen];
    v17 = +[UIScreen mainScreen];

    if (v16 == v17)
    {
      v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v18 postNotificationName:@"UIStatusBarTimeItemViewDidMoveNotification" object:0];
    }
  }
}

- (double)extraRightPadding
{
  uint64_t v3 = _UIDeviceNativeUserInterfaceIdiom();
  double result = 4.0;
  if (v3 != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIStatusBarDateTimeItemView;
    [(UIStatusBarItemView *)&v5 extraRightPadding];
  }
  return result;
}

- (id)accessibilityHUDRepresentation
{
  v2 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", self->_dateTimeString, 0, 0.0, 0.0, 0.0, 0.0);
  return v2;
}

- (BOOL)useCustomFadeAnimation
{
  return self->_useCustomFadeAnimation;
}

- (void)setUseCustomFadeAnimation:(BOOL)a3
{
  self->_useCustomFadeAnimation = a3;
}

- (NSString)dateTimeString
{
  return self->_dateTimeString;
}

- (void)setDateTimeString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
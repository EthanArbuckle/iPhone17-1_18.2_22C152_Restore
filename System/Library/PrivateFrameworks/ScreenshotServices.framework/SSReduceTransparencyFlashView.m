@interface SSReduceTransparencyFlashView
+ (double)expectedAnimationDurationForStyle:(unint64_t)a3;
- (SSReduceTransparencyFlashView)initWithFrame:(CGRect)a3;
- (void)flashWithCompletion:(id)a3;
- (void)layoutSubviews;
@end

@implementation SSReduceTransparencyFlashView

- (SSReduceTransparencyFlashView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSReduceTransparencyFlashView;
  v3 = -[SSFlashView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  colorView = v3->_colorView;
  v3->_colorView = v4;

  [(SSReduceTransparencyFlashView *)v3 addSubview:v3->_colorView];
  return v3;
}

- (void)layoutSubviews
{
  colorView = self->_colorView;
  [(SSReduceTransparencyFlashView *)self bounds];
  -[UIView setFrame:](colorView, "setFrame:");
  if ([(SSFlashView *)self style]) {
    [MEMORY[0x263F1C550] blackColor];
  }
  else {
  id v4 = [MEMORY[0x263F1C550] whiteColor];
  }
  [(UIView *)self->_colorView setBackgroundColor:v4];
}

+ (double)expectedAnimationDurationForStyle:(unint64_t)a3
{
  return 1.0;
}

- (void)flashWithCompletion:(id)a3
{
  id v4 = a3;
  oldCompletionBlock = (void (**)(void))self->_oldCompletionBlock;
  if (oldCompletionBlock)
  {
    oldCompletionBlock[2]();
    id v6 = self->_oldCompletionBlock;
    self->_oldCompletionBlock = 0;
  }
  [(UIView *)self->_colorView setAlpha:1.0];
  objc_super v7 = (void *)MEMORY[0x263F1CB60];
  objc_msgSend((id)objc_opt_class(), "expectedAnimationDurationForStyle:", -[SSFlashView style](self, "style"));
  double v9 = v8;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__SSReduceTransparencyFlashView_flashWithCompletion___block_invoke;
  v13[3] = &unk_2644EDB30;
  v13[4] = self;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__SSReduceTransparencyFlashView_flashWithCompletion___block_invoke_2;
  v11[3] = &unk_2644EDC30;
  id v12 = v4;
  id v10 = v4;
  [v7 animateWithDuration:6 delay:v13 options:v11 animations:v9 completion:0.0];
}

uint64_t __53__SSReduceTransparencyFlashView_flashWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
}

uint64_t __53__SSReduceTransparencyFlashView_flashWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong(&self->_oldCompletionBlock, 0);
}

@end
@interface SKUIBarButtonItemSubmitWithAnimation
- (SKUIBarButtonItemSubmitWithAnimation)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)animateWithCompletion:(id)a3;
@end

@implementation SKUIBarButtonItemSubmitWithAnimation

- (SKUIBarButtonItemSubmitWithAnimation)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SKUIBarButtonItemSubmitWithAnimation;
  v10 = [(UIBarItem *)&v32 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    button = v10->_button;
    v10->_button = (UIButton *)v11;

    [(UIButton *)v10->_button setTitle:v8 forState:0];
    [(UIButton *)v10->_button setContentMode:4];
    [(UIButton *)v10->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v10->_button addTarget:v9 action:a5 forControlEvents:64];
    v13 = [(UIButton *)v10->_button heightAnchor];
    [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:36.0 newValue:40.0];
    v14 = objc_msgSend(v13, "constraintEqualToConstant:");
    [v14 setActive:1];

    v15 = [MEMORY[0x1E4FB14D8] borderedButtonConfiguration];
    v16 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [v15 setBaseBackgroundColor:v16];

    [(UIButton *)v10->_button setConfiguration:v15];
    v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v17];
    imageView = v10->_imageView;
    v10->_imageView = (UIImageView *)v18;

    v20 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIImageView *)v10->_imageView setTintColor:v20];

    [(UIImageView *)v10->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v10->_button addSubview:v10->_imageView];
    v21 = [(UIImageView *)v10->_imageView centerXAnchor];
    v22 = [(UIButton *)v10->_button centerXAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    v24 = [(UIImageView *)v10->_imageView centerYAnchor];
    v25 = [(UIButton *)v10->_button centerYAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [(UIImageView *)v10->_imageView layer];
    [v27 setOpacity:0.0];

    CGAffineTransformMakeScale(&v31, 0.0, 0.0);
    v28 = v10->_imageView;
    CGAffineTransform v30 = v31;
    [(UIImageView *)v28 setTransform:&v30];
    [(SKUIBarButtonItemSubmitWithAnimation *)v10 setCustomView:v10->_button];
  }
  return v10;
}

- (void)animateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke;
  v9[3] = &unk_1E6422020;
  v9[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6422510;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 animateWithDuration:v9 animations:v7 completion:0.1];
}

void __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 400) titleLabel];
  v1 = [v2 layer];
  [v1 setOpacity:0.0];
}

void __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1EB0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_3;
  v4[3] = &unk_1E6422020;
  v4[4] = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_4;
  v2[3] = &unk_1E64224E8;
  id v3 = *(id *)(a1 + 40);
  [v1 animateWithDuration:0 delay:v4 usingSpringWithDamping:v2 initialSpringVelocity:0.3 options:0.0 animations:10.0 completion:50.0];
}

uint64_t __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  LODWORD(v3) = 1.0;
  [v2 setOpacity:v3];

  CGAffineTransformMakeScale(&v7, 1.0, 1.0);
  id v4 = *(void **)(*(void *)(a1 + 32) + 408);
  CGAffineTransform v6 = v7;
  return [v4 setTransform:&v6];
}

uint64_t __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end
@interface _UIBackButtonMaskView
- (NSLayoutXAxisAnchor)maskExtensionLeadingAnchor;
- (UIImageView)maskImageView;
- (_UIBackButtonMaskView)initWithFrame:(CGRect)a3;
@end

@implementation _UIBackButtonMaskView

- (_UIBackButtonMaskView)initWithFrame:(CGRect)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)_UIBackButtonMaskView;
  v3 = -[UIView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    [(UIView *)v4 setCompositingMode:19];
    uint64_t v5 = objc_opt_new();
    maskImageView = v4->_maskImageView;
    v4->_maskImageView = (UIImageView *)v5;

    [(UIImageView *)v4->_maskImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = +[UIColor whiteColor];
    [(UIView *)v4->_maskImageView setTintColor:v7];

    [(UIView *)v4 addSubview:v4->_maskImageView];
    uint64_t v8 = objc_opt_new();
    maskExtensionView = v4->_maskExtensionView;
    v4->_maskExtensionView = (UIView *)v8;

    v10 = +[UIColor whiteColor];
    [(UIView *)v4->_maskExtensionView setBackgroundColor:v10];

    [(UIView *)v4->_maskExtensionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4 addSubview:v4->_maskExtensionView];
    v21 = (void *)MEMORY[0x1E4F5B268];
    v25 = [(UIView *)v4 leadingAnchor];
    v24 = [(UIView *)v4->_maskImageView leadingAnchor];
    v23 = [v25 constraintLessThanOrEqualToAnchor:v24];
    v27[0] = v23;
    v22 = [(UIView *)v4->_maskExtensionView trailingAnchor];
    v11 = [(UIView *)v4 trailingAnchor];
    v12 = [v22 constraintEqualToAnchor:v11];
    v27[1] = v12;
    v13 = [(UIView *)v4 topAnchor];
    v14 = [(UIView *)v4->_maskExtensionView topAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v27[2] = v15;
    v16 = [(UIView *)v4 bottomAnchor];
    v17 = [(UIView *)v4->_maskExtensionView bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v27[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    [v21 activateConstraints:v19];
  }
  return v4;
}

- (UIImageView)maskImageView
{
  return self->_maskImageView;
}

- (NSLayoutXAxisAnchor)maskExtensionLeadingAnchor
{
  return [(UIView *)self->_maskExtensionView leadingAnchor];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskImageView, 0);
  objc_storeStrong((id *)&self->_maskExtensionView, 0);
}

@end
@interface _TVSwipeUpMessageView
- (BOOL)isEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)message;
- (UILabel)messageView;
- (_TVImageView)chevronView;
- (_TVSwipeUpMessageView)initWithFrame:(CGRect)a3;
- (void)_processSwipeUpMessageEvent:(int)a3;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _TVSwipeUpMessageView

- (_TVSwipeUpMessageView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)_TVSwipeUpMessageView;
  v3 = -[_TVSwipeUpMessageView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    chevronView = v3->_chevronView;
    v3->_chevronView = (_TVImageView *)v4;

    [(_TVImageView *)v3->_chevronView setAlpha:0.0];
    v6 = v3->_chevronView;
    v7 = +[TVInterfaceFactory sharedInterfaceFactory];
    v8 = [v7 _resourceImageNamed:@"icon_chevron_up"];
    [(_TVImageView *)v6 setImage:v8];

    v9 = [(_TVImageView *)v3->_chevronView layer];
    v10 = [MEMORY[0x263F1C550] blackColor];
    id v11 = [v10 colorWithAlphaComponent:0.5];
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v11, "CGColor"));

    v12 = [(_TVImageView *)v3->_chevronView layer];
    objc_msgSend(v12, "setShadowOffset:", 0.0, 2.0);

    v13 = [(_TVImageView *)v3->_chevronView layer];
    [v13 setShadowRadius:4.0];

    v14 = [(_TVImageView *)v3->_chevronView layer];
    LODWORD(v15) = 1.0;
    [v14 setShadowOpacity:v15];

    [(_TVSwipeUpMessageView *)v3 addSubview:v3->_chevronView];
    uint64_t v16 = objc_opt_new();
    messageView = v3->_messageView;
    v3->_messageView = (UILabel *)v16;

    [(UILabel *)v3->_messageView setAlpha:0.0];
    [(UILabel *)v3->_messageView setNumberOfLines:2];
    [(UILabel *)v3->_messageView setTextAlignment:1];
    v18 = [(_TVSwipeUpMessageView *)v3 traitCollection];
    uint64_t v19 = [v18 userInterfaceStyle];
    v20 = (id *)MEMORY[0x263F15D58];
    if (v19 != 2) {
      v20 = (id *)MEMORY[0x263F15D50];
    }
    id v21 = *v20;

    v22 = [(UILabel *)v3->_messageView layer];
    [v22 setCompositingFilter:v21];

    [(_TVSwipeUpMessageView *)v3 addSubview:v3->_messageView];
  }
  return v3;
}

- (void)setMessage:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = (NSString *)a3;
  v5 = v4;
  if (self->_message != v4 || ![(NSString *)v4 isEqualToString:v4])
  {
    if (setMessage__onceToken != -1) {
      dispatch_once(&setMessage__onceToken, &__block_literal_global_22);
    }
    v6 = +[TVMLUtilities fontFromTextStyle:@"caption2" fontWeight:@"semibold" fontSize:0 symbolicTraits:0.0];
    uint64_t v7 = *MEMORY[0x263F1C280];
    v13[0] = *MEMORY[0x263F1C238];
    v13[1] = v7;
    v14[0] = v6;
    v14[1] = setMessage__textShadow;
    v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    messageView = self->_messageView;
    id v10 = objc_alloc(MEMORY[0x263F086A0]);
    id v11 = (void *)[(NSString *)v5 copy];
    v12 = (void *)[v10 initWithString:v11 attributes:v8];
    [(UILabel *)messageView setAttributedText:v12];

    [(_TVSwipeUpMessageView *)self setNeedsLayout];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (self->_swipeUpMessageState) {
      [(_TVSwipeUpMessageView *)self _processSwipeUpMessageEvent:!a3];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = [(_TVSwipeUpMessageView *)self chevronView];
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x263F001B0], v6);
  double v8 = v7;
  double v10 = v9;

  id v11 = [(_TVSwipeUpMessageView *)self messageView];
  objc_msgSend(v11, "sizeThatFits:", v5, v6);
  double v13 = v12;
  double v15 = v14;

  double v16 = fmax(v8, v13);
  double v17 = v10 + 6.0 + v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)_TVSwipeUpMessageView;
  [(_TVSwipeUpMessageView *)&v24 layoutSubviews];
  [(_TVSwipeUpMessageView *)self bounds];
  double v4 = v3;
  double v5 = [(_TVSwipeUpMessageView *)self chevronView];
  objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v7 = v6;
  double v9 = v8;

  double v10 = [(_TVSwipeUpMessageView *)self chevronView];
  double v11 = v4 * 0.5;
  objc_msgSend(v10, "setCenter:", v11, v9 * 0.5);

  double v12 = [(_TVSwipeUpMessageView *)self chevronView];
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v7, v9);

  double v13 = [(_TVSwipeUpMessageView *)self messageView];
  objc_msgSend(v13, "sizeThatFits:", 468.0, 0.0);
  double v15 = v14;
  double v17 = v16;

  v18 = [(_TVSwipeUpMessageView *)self messageView];
  objc_msgSend(v18, "setCenter:", v11, v9 + 6.0 + v17 * 0.5);

  uint64_t v19 = [(_TVSwipeUpMessageView *)self messageView];
  objc_msgSend(v19, "setBounds:", 0.0, 0.0, v15, v17);

  chevronView = self->_chevronView;
  id v21 = [(_TVSwipeUpMessageView *)self tintColor];
  [(_TVImageView *)chevronView _setTintColor:v21];

  messageView = self->_messageView;
  v23 = [(_TVSwipeUpMessageView *)self tintColor];
  [(UILabel *)messageView setTextColor:v23];

  if (!self->_swipeUpMessageState) {
    [(_TVSwipeUpMessageView *)self _processSwipeUpMessageEvent:2];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_TVSwipeUpMessageView;
  [(_TVSwipeUpMessageView *)&v13 traitCollectionDidChange:v4];
  double v5 = [(_TVSwipeUpMessageView *)self traitCollection];
  if (![v5 userInterfaceStyle])
  {
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v6 = [v4 userInterfaceStyle];
  double v7 = [(_TVSwipeUpMessageView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  if (v6 != v8)
  {
    double v9 = [(_TVSwipeUpMessageView *)self traitCollection];
    uint64_t v10 = [v9 userInterfaceStyle];
    double v11 = (id *)MEMORY[0x263F15D58];
    if (v10 != 2) {
      double v11 = (id *)MEMORY[0x263F15D50];
    }
    id v12 = *v11;

    double v5 = [(UILabel *)self->_messageView layer];
    [v5 setCompositingFilter:v12];

    goto LABEL_6;
  }
LABEL_7:
}

- (void)_processSwipeUpMessageEvent:(int)a3
{
  int swipeUpMessageState = self->_swipeUpMessageState;
  switch(swipeUpMessageState)
  {
    case 0:
      if (a3 == 2)
      {
        if ([(_TVSwipeUpMessageView *)self isEnabled]) {
          int v5 = 3;
        }
        else {
          int v5 = 1;
        }
        goto LABEL_23;
      }
      return;
    case 1:
      if (a3) {
        int v5 = 1;
      }
      else {
        int v5 = 3;
      }
      goto LABEL_23;
    case 2:
      BOOL v6 = a3 == 1;
      int v5 = 2;
      int v7 = 4;
      goto LABEL_17;
    case 3:
      if (a3 == 1) {
        int v5 = 4;
      }
      else {
        int v5 = 3;
      }
      if (a3 == 2) {
        int v5 = 2;
      }
      goto LABEL_23;
    case 4:
      if (a3 == 2) {
        int v5 = 1;
      }
      else {
        int v5 = 4;
      }
      BOOL v6 = a3 == 0;
      int v7 = 3;
LABEL_17:
      if (v6) {
        int v5 = v7;
      }
LABEL_23:
      if (swipeUpMessageState != v5)
      {
        self->_int swipeUpMessageState = v5;
        if (v5 == 4)
        {
          v10[0] = MEMORY[0x263EF8330];
          v10[1] = 3221225472;
          v10[2] = __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_4;
          v10[3] = &unk_264BA69A0;
          v10[4] = self;
          v9[0] = MEMORY[0x263EF8330];
          v9[1] = 3221225472;
          v9[2] = __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_5;
          v9[3] = &unk_264BA6D78;
          v9[4] = self;
          [MEMORY[0x263F1CB60] animateWithDuration:v10 animations:v9 completion:0.25];
        }
        else if (v5 == 3)
        {
          uint64_t v8 = [(_TVSwipeUpMessageView *)self messageView];
          CGAffineTransformMakeTranslation(&v13, 0.0, 20.0);
          [v8 setTransform:&v13];

          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke;
          v12[3] = &unk_264BA69A0;
          v12[4] = self;
          v11[0] = MEMORY[0x263EF8330];
          v11[1] = 3221225472;
          v11[2] = __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_3;
          v11[3] = &unk_264BA6D78;
          v11[4] = self;
          [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v12 options:v11 animations:0.25 completion:0.25];
        }
      }
      break;
    default:
      return;
  }
}

- (NSString)message
{
  return self->_message;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (_TVImageView)chevronView
{
  return self->_chevronView;
}

- (UILabel)messageView
{
  return self->_messageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
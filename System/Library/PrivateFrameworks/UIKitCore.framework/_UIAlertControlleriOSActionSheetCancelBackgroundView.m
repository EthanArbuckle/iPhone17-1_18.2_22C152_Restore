@interface _UIAlertControlleriOSActionSheetCancelBackgroundView
- (_UIAlertControlleriOSActionSheetCancelBackgroundView)initWithFrame:(CGRect)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRoundedCornerPosition:(unint64_t)a3;
@end

@implementation _UIAlertControlleriOSActionSheetCancelBackgroundView

- (_UIAlertControlleriOSActionSheetCancelBackgroundView)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)_UIAlertControlleriOSActionSheetCancelBackgroundView;
  v3 = -[UIView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    [(UIView *)v3 bounds];
    uint64_t v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    backgroundView = v3->backgroundView;
    v3->backgroundView = (UIView *)v5;

    v7 = v3->backgroundView;
    v8 = +[UIColor secondarySystemGroupedBackgroundColor];
    [(UIView *)v7 setBackgroundColor:v8];

    v9 = [UIView alloc];
    [(UIView *)v3 bounds];
    uint64_t v10 = -[UIView initWithFrame:](v9, "initWithFrame:");
    highlightBackgroundView = v3->highlightBackgroundView;
    v3->highlightBackgroundView = (UIView *)v10;

    v12 = v3->highlightBackgroundView;
    v13 = +[UIColor secondarySystemGroupedBackgroundColor];
    [(UIView *)v12 setBackgroundColor:v13];

    v14 = +[UIBlurEffect effectWithStyle:1200];
    v15 = +[UIVibrancyEffect _effectForBlurEffect:v14 vibrancyStyle:112];
    v16 = [[UIVisualEffectView alloc] initWithEffect:v15];
    v17 = +[UIColor whiteColor];
    v18 = [(UIVisualEffectView *)v16 contentView];
    [v18 setBackgroundColor:v17];

    highlightView = v3->highlightView;
    v3->highlightView = &v16->super;

    [(UIView *)v3 addSubview:v3->backgroundView];
    [(UIView *)v3 addSubview:v3->highlightBackgroundView];
    [(UIView *)v3 addSubview:v3->highlightView];
    [(_UIAlertControlleriOSActionSheetCancelBackgroundView *)v3 setHighlighted:0];
    [(UIView *)v3 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    -[UIView setFrame:](v3->backgroundView, "setFrame:");
    -[UIView setFrame:](v3->highlightBackgroundView, "setFrame:", v21, v23, v25, v27);
    -[UIView setFrame:](v3->highlightView, "setFrame:", v21, v23, v25, v27);
    [(UIView *)v3->backgroundView setAutoresizingMask:18];
    [(UIView *)v3->highlightBackgroundView setAutoresizingMask:18];
    [(UIView *)v3->highlightView setAutoresizingMask:18];
  }
  return v3;
}

- (void)setCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->backgroundView, "_setContinuousCornerRadius:");
  [(UIView *)self->highlightBackgroundView _setContinuousCornerRadius:a3];
  highlightView = self->highlightView;
  [(UIView *)highlightView _setContinuousCornerRadius:a3];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->backgroundView, "_setContinuousCornerRadius:");
  [(UIView *)self->highlightBackgroundView _setContinuousCornerRadius:a3];
  highlightView = self->highlightView;
  [(UIView *)highlightView _setContinuousCornerRadius:a3];
}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  uint64_t v5 = [(UIView *)self->backgroundView layer];
  [v5 setMaskedCorners:a3];

  v6 = [(UIView *)self->highlightBackgroundView layer];
  [v6 setMaskedCorners:a3];

  id v7 = [(UIView *)self->highlightView layer];
  [v7 setMaskedCorners:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIView setHidden:](self->backgroundView, "setHidden:");
  BOOL v5 = !v3;
  [(UIView *)self->highlightBackgroundView setHidden:v5];
  highlightView = self->highlightView;
  [(UIView *)highlightView setHidden:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->highlightView, 0);
  objc_storeStrong((id *)&self->highlightBackgroundView, 0);
  objc_storeStrong((id *)&self->backgroundView, 0);
}

@end
@interface _UIKeyboardPopoverAffordance
- (UIView)dragArea;
- (_UIKeyboardPopoverAffordance)initWithFrame:(CGRect)a3;
- (void)updateForBackdropStyle:(int64_t)a3;
@end

@implementation _UIKeyboardPopoverAffordance

- (_UIKeyboardPopoverAffordance)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)_UIKeyboardPopoverAffordance;
  v3 = -[UIView initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    pillView = v3->_pillView;
    v3->_pillView = (UIView *)v9;

    [(UIView *)v3->_pillView setUserInteractionEnabled:1];
    [(UIView *)v3->_pillView setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = +[UIKeyboardPopoverContainer pillColor];
    [(UIView *)v3->_pillView setBackgroundColor:v11];

    +[UIKeyboardPopoverContainer pillCornerRadius];
    double v13 = v12;
    v14 = [(UIView *)v3->_pillView layer];
    [v14 setCornerRadius:v13];

    +[UIKeyboardPopoverContainer pillSize];
    double v16 = v15;
    double v18 = v17;
    [(UIView *)v3 addSubview:v3->_pillView];
    v19 = [MEMORY[0x1E4F5B268] constraintWithItem:v3->_pillView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v16];
    [(UIView *)v3 addConstraint:v19];

    v20 = [MEMORY[0x1E4F5B268] constraintWithItem:v3->_pillView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v18];
    [(UIView *)v3 addConstraint:v20];

    v21 = [MEMORY[0x1E4F5B268] constraintWithItem:v3->_pillView attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
    [(UIView *)v3 addConstraint:v21];

    v22 = (void *)MEMORY[0x1E4F5B268];
    v23 = v3->_pillView;
    +[UIKeyboardPopoverContainer pillDistanceToEdge];
    v25 = [v22 constraintWithItem:v23 attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:-v24];
    [(UIView *)v3 addConstraint:v25];

    v26 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
    dragArea = v3->_dragArea;
    v3->_dragArea = v26;

    [(UIView *)v3->_dragArea setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = +[UIColor clearColor];
    [(UIView *)v3->_dragArea setBackgroundColor:v28];

    [(UIView *)v3 addSubview:v3->_dragArea];
    v29 = [MEMORY[0x1E4F5B268] constraintWithItem:v3->_dragArea attribute:1 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:0.0];
    [(UIView *)v3 addConstraint:v29];

    v30 = [MEMORY[0x1E4F5B268] constraintWithItem:v3->_dragArea attribute:2 relatedBy:0 toItem:v3 attribute:2 multiplier:1.0 constant:0.0];
    [(UIView *)v3 addConstraint:v30];

    v31 = [MEMORY[0x1E4F5B268] constraintWithItem:v3->_dragArea attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
    [(UIView *)v3 addConstraint:v31];

    v32 = [MEMORY[0x1E4F5B268] constraintWithItem:v3->_dragArea attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:0.0];
    [(UIView *)v3 addConstraint:v32];

    [(UIView *)v3->_dragArea setUserInteractionEnabled:1];
    [(UIView *)v3 setUserInteractionEnabled:1];
  }
  return v3;
}

- (void)updateForBackdropStyle:(int64_t)a3
{
  if (a3 == 3904)
  {
    v4 = [(UIView *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    if (v5 == 2)
    {
      double v6 = +[UIColor whiteColor];
      double v7 = 0.5;
    }
    else
    {
      double v6 = +[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.6451];
      double v7 = 0.8;
    }
    [(UIView *)self->_pillView setBackgroundColor:v6];

    [(UIView *)self->_pillView setAlpha:v7];
    v11 = (uint64_t *)MEMORY[0x1E4F3A2E8];
    if (v5 != 2) {
      v11 = (uint64_t *)MEMORY[0x1E4F3A2E0];
    }
    uint64_t v12 = *v11;
    uint64_t v9 = [(UIView *)self->_pillView layer];
    id v13 = v9;
    uint64_t v10 = v12;
  }
  else
  {
    double v8 = +[UIKeyboardPopoverContainer pillColor];
    [(UIView *)self->_pillView setBackgroundColor:v8];

    [(UIView *)self->_pillView setAlpha:1.0];
    uint64_t v9 = [(UIView *)self->_pillView layer];
    id v13 = v9;
    uint64_t v10 = 0;
  }
  [v9 setCompositingFilter:v10];
}

- (UIView)dragArea
{
  return self->_dragArea;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_dragArea, 0);
}

@end
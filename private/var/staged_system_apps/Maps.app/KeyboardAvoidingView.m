@interface KeyboardAvoidingView
+ (void)startObservingKeyboard;
- (KeyboardAvoidingView)init;
- (KeyboardAvoidingView)initWithCoder:(id)a3;
- (KeyboardAvoidingView)initWithContentView:(id)a3;
- (KeyboardAvoidingView)initWithContentView:(id)a3 frame:(CGRect)a4;
- (KeyboardAvoidingView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (UIView)contentView;
- (float)constraintPriority;
- (void)addConstraints;
- (void)keyboardWillOrDidChangeFrame:(id)a3;
- (void)layoutSubviews;
- (void)removeConstraints;
- (void)setBottomConstraint:(id)a3;
- (void)setConstraintPriority:(float)a3;
- (void)setContentView:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)updateConstraints;
- (void)updateForKeyboardFrame;
- (void)updateForKeyboardFrame:(CGRect)a3;
@end

@implementation KeyboardAvoidingView

+ (void)startObservingKeyboard
{
  id v2 = +[KeyboardObserver sharedInstance];
}

- (KeyboardAvoidingView)initWithContentView:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KeyboardAvoidingView;
  v10 = -[KeyboardAvoidingView initWithFrame:](&v15, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_constraintPrioritdouble y = 750.0;
    [(KeyboardAvoidingView *)v10 setContentView:v9];
    [(KeyboardAvoidingView *)v11 updateForKeyboardFrame];
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v11 selector:"keyboardWillOrDidChangeFrame:" name:UIKeyboardWillChangeFrameNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v11 selector:"keyboardWillOrDidChangeFrame:" name:UIKeyboardDidChangeFrameNotification object:0];
  }
  return v11;
}

- (KeyboardAvoidingView)initWithContentView:(id)a3
{
  return -[KeyboardAvoidingView initWithContentView:frame:](self, "initWithContentView:frame:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (KeyboardAvoidingView)initWithFrame:(CGRect)a3
{
  return -[KeyboardAvoidingView initWithContentView:frame:](self, "initWithContentView:frame:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (KeyboardAvoidingView)init
{
  return -[KeyboardAvoidingView initWithContentView:frame:](self, "initWithContentView:frame:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (KeyboardAvoidingView)initWithCoder:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"-[%@ %@] not implemeneted", v6, v7);

  return 0;
}

- (void)setConstraintPriority:(float)a3
{
  [(KeyboardAvoidingView *)self constraintPriority];
  if (v5 != a3)
  {
    if (a3 == 1000.0 || ([(KeyboardAvoidingView *)self constraintPriority], v6 == 1000.0))
    {
      [(KeyboardAvoidingView *)self removeConstraints];
      self->_constraintPrioritdouble y = a3;
      [(KeyboardAvoidingView *)self addConstraints];
    }
    else
    {
      v7 = [(KeyboardAvoidingView *)self leadingConstraint];
      *(float *)&double v8 = a3;
      [v7 setPriority:v8];

      id v9 = [(KeyboardAvoidingView *)self trailingConstraint];
      *(float *)&double v10 = a3;
      [v9 setPriority:v10];

      v11 = [(KeyboardAvoidingView *)self topConstraint];
      *(float *)&double v12 = a3;
      [v11 setPriority:v12];

      id v14 = [(KeyboardAvoidingView *)self bottomConstraint];
      *(float *)&double v13 = a3;
      [v14 setPriority:v13];
    }
  }
}

- (void)setContentView:(id)a3
{
  id v8 = a3;
  id v5 = [(KeyboardAvoidingView *)self contentView];

  float v6 = v8;
  if (v5 != v8)
  {
    [(KeyboardAvoidingView *)self removeConstraints];
    v7 = [(KeyboardAvoidingView *)self contentView];
    [v7 removeFromSuperview];

    objc_storeStrong((id *)&self->_contentView, a3);
    if (v8) {
      [(KeyboardAvoidingView *)self addSubview:v8];
    }
    [(KeyboardAvoidingView *)self addConstraints];
    float v6 = v8;
  }
}

- (void)updateForKeyboardFrame
{
  id v3 = +[KeyboardObserver sharedInstance];
  [v3 keyboardFrame];
  -[KeyboardAvoidingView updateForKeyboardFrame:](self, "updateForKeyboardFrame:");
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)KeyboardAvoidingView;
  [(KeyboardAvoidingView *)&v3 updateConstraints];
  [(KeyboardAvoidingView *)self updateForKeyboardFrame];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)KeyboardAvoidingView;
  [(KeyboardAvoidingView *)&v3 layoutSubviews];
  [(KeyboardAvoidingView *)self updateForKeyboardFrame];
}

- (void)addConstraints
{
  objc_super v3 = [(KeyboardAvoidingView *)self contentView];

  if (v3)
  {
    v4 = [(KeyboardAvoidingView *)self contentView];
    id v5 = [v4 leadingAnchor];
    float v6 = [(KeyboardAvoidingView *)self leadingAnchor];
    v7 = [v5 constraintEqualToAnchor:v6];
    [(KeyboardAvoidingView *)self setLeadingConstraint:v7];

    id v8 = [(KeyboardAvoidingView *)self contentView];
    id v9 = [v8 trailingAnchor];
    double v10 = [(KeyboardAvoidingView *)self trailingAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    [(KeyboardAvoidingView *)self setTrailingConstraint:v11];

    double v12 = [(KeyboardAvoidingView *)self contentView];
    double v13 = [v12 topAnchor];
    id v14 = [(KeyboardAvoidingView *)self topAnchor];
    objc_super v15 = [v13 constraintEqualToAnchor:v14];
    [(KeyboardAvoidingView *)self setTopConstraint:v15];

    v16 = [(KeyboardAvoidingView *)self contentView];
    v17 = [v16 bottomAnchor];
    v18 = [(KeyboardAvoidingView *)self bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [(KeyboardAvoidingView *)self setBottomConstraint:v19];

    v20 = [(KeyboardAvoidingView *)self leadingConstraint];
    v25[0] = v20;
    v21 = [(KeyboardAvoidingView *)self trailingConstraint];
    v25[1] = v21;
    v22 = [(KeyboardAvoidingView *)self topConstraint];
    v25[2] = v22;
    v23 = [(KeyboardAvoidingView *)self bottomConstraint];
    v25[3] = v23;
    v24 = +[NSArray arrayWithObjects:v25 count:4];
    +[NSLayoutConstraint activateConstraints:v24];
  }
}

- (void)removeConstraints
{
  objc_super v3 = [(KeyboardAvoidingView *)self leadingConstraint];

  if (v3)
  {
    v4 = [(KeyboardAvoidingView *)self leadingConstraint];
    v9[0] = v4;
    id v5 = [(KeyboardAvoidingView *)self trailingConstraint];
    v9[1] = v5;
    float v6 = [(KeyboardAvoidingView *)self topConstraint];
    v9[2] = v6;
    v7 = [(KeyboardAvoidingView *)self bottomConstraint];
    v9[3] = v7;
    id v8 = +[NSArray arrayWithObjects:v9 count:4];
    +[NSLayoutConstraint deactivateConstraints:v8];

    [(KeyboardAvoidingView *)self setLeadingConstraint:0];
    [(KeyboardAvoidingView *)self setTrailingConstraint:0];
    [(KeyboardAvoidingView *)self setTopConstraint:0];
    [(KeyboardAvoidingView *)self setBottomConstraint:0];
  }
}

- (void)keyboardWillOrDidChangeFrame:(id)a3
{
  v4 = [a3 userInfo];
  id v9 = [v4 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];

  if (v9)
  {
    [v9 CGRectValue];
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  -[KeyboardAvoidingView updateForKeyboardFrame:](self, "updateForKeyboardFrame:", x, y, width, height);
}

- (void)updateForKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL IsNull = CGRectIsNull(a3);
  double v9 = 0.0;
  double v10 = 0.0;
  if (!IsNull)
  {
    -[KeyboardAvoidingView convertRect:fromView:](self, "convertRect:fromView:", 0, x, y, width, height);
    CGFloat v11 = v22.origin.x;
    CGFloat v12 = v22.origin.y;
    CGFloat v13 = v22.size.width;
    CGFloat v14 = v22.size.height;
    double MidY = CGRectGetMidY(v22);
    [(KeyboardAvoidingView *)self bounds];
    if (MidY >= CGRectGetMidY(v23))
    {
      [(KeyboardAvoidingView *)self bounds];
      double MaxY = CGRectGetMaxY(v26);
      v27.origin.double x = v11;
      v27.origin.double y = v12;
      v27.size.double width = v13;
      v27.size.double height = v14;
      double v9 = MaxY - CGRectGetMinY(v27);
      double v10 = 0.0;
    }
    else
    {
      v24.origin.double x = v11;
      v24.origin.double y = v12;
      v24.size.double width = v13;
      v24.size.double height = v14;
      double v16 = CGRectGetMaxY(v24);
      [(KeyboardAvoidingView *)self bounds];
      double v10 = v16 - CGRectGetMinY(v25);
      double v9 = 0.0;
    }
  }
  double v18 = fmax(v10, 0.0);
  v19 = [(KeyboardAvoidingView *)self topConstraint];
  [v19 setConstant:v18];

  id v20 = [(KeyboardAvoidingView *)self bottomConstraint];
  [v20 setConstant:fmin(-v9, 0.0)];
}

- (float)constraintPriority
{
  return self->_constraintPriority;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
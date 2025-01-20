@interface IMButtonAndRadialProgress
- (BOOL)disableInteraction;
- (CGRect)_centeredProgressFrameWithBounds:(CGRect)a3;
- (IMButtonAndRadialProgress)initWithCoder:(id)a3;
- (IMButtonAndRadialProgress)initWithFrame:(CGRect)a3;
- (IMRadialProgressButton)radialProgress;
- (UIButton)button;
- (UIColor)progressColor;
- (UIEdgeInsets)contentEdgeInsets;
- (UILabel)titleLabel;
- (float)progress;
- (int)modeState;
- (void)_commonInitWithFrame:(CGRect)a3;
- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)removeTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setDisableInteraction:(BOOL)a3;
- (void)setModeState:(int)a3;
- (void)setProgress:(float)a3;
- (void)setProgressColor:(id)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
- (void)setTitleColor:(id)a3 forState:(unint64_t)a4;
- (void)sizeToFit;
- (void)tintColorDidChange;
@end

@implementation IMButtonAndRadialProgress

- (IMButtonAndRadialProgress)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMButtonAndRadialProgress;
  v3 = [(IMButtonAndRadialProgress *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(IMButtonAndRadialProgress *)v3 frame];
    -[IMButtonAndRadialProgress _commonInitWithFrame:](v4, "_commonInitWithFrame:");
  }
  return v4;
}

- (IMButtonAndRadialProgress)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)IMButtonAndRadialProgress;
  v7 = -[IMButtonAndRadialProgress initWithFrame:](&v10, "initWithFrame:");
  v8 = v7;
  if (v7) {
    -[IMButtonAndRadialProgress _commonInitWithFrame:](v7, "_commonInitWithFrame:", x, y, width, height);
  }
  return v8;
}

- (void)dealloc
{
  [(UIButton *)self->_button removeFromSuperview];
  [(IMRadialProgressButton *)self->_radialProgress removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)IMButtonAndRadialProgress;
  [(IMButtonAndRadialProgress *)&v3 dealloc];
}

- (void)layoutSubviews
{
  [(IMButtonAndRadialProgress *)self bounds];
  -[UIButton setFrame:](self->_button, "setFrame:");
  [(IMButtonAndRadialProgress *)self bounds];
  -[IMButtonAndRadialProgress _centeredProgressFrameWithBounds:](self, "_centeredProgressFrameWithBounds:");
  radialProgress = self->_radialProgress;

  -[IMRadialProgressButton setFrame:](radialProgress, "setFrame:");
}

- (UIEdgeInsets)contentEdgeInsets
{
  v2 = [(IMButtonAndRadialProgress *)self button];
  [v2 contentEdgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(IMButtonAndRadialProgress *)self button];
  [v7 setContentEdgeInsets:top, left, bottom, right];
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(IMButtonAndRadialProgress *)self button];
  [v7 setTitle:v6 forState:a4];
}

- (void)setTitleColor:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(IMButtonAndRadialProgress *)self button];
  [v7 setTitleColor:v6 forState:a4];
}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(IMButtonAndRadialProgress *)self button];
  [v7 setBackgroundImage:v6 forState:a4];
}

- (UILabel)titleLabel
{
  v2 = [(IMButtonAndRadialProgress *)self button];
  double v3 = [v2 titleLabel];

  return (UILabel *)v3;
}

- (void)sizeToFit
{
  double v3 = [(IMButtonAndRadialProgress *)self button];
  [v3 sizeToFit];

  double v4 = [(IMButtonAndRadialProgress *)self button];
  [v4 bounds];
  -[IMButtonAndRadialProgress setBounds:](self, "setBounds:");

  [(IMButtonAndRadialProgress *)self bounds];
  -[IMButtonAndRadialProgress _centeredProgressFrameWithBounds:](self, "_centeredProgressFrameWithBounds:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(IMButtonAndRadialProgress *)self radialProgress];
  [v13 setFrame:v6, v8, v10, v12];
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(IMButtonAndRadialProgress *)self button];
  [v9 addTarget:v8 action:a4 forControlEvents:a5];
}

- (void)removeTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(IMButtonAndRadialProgress *)self button];
  [v9 removeTarget:v8 action:a4 forControlEvents:a5];
}

- (float)progress
{
  v2 = [(IMButtonAndRadialProgress *)self radialProgress];
  [v2 progress];
  float v4 = v3;

  return v4;
}

- (void)setProgress:(float)a3
{
  id v5 = [(IMButtonAndRadialProgress *)self radialProgress];
  *(float *)&double v4 = a3;
  [v5 setProgress:v4];
}

- (void)setDisableInteraction:(BOOL)a3
{
  if (self->_disableInteraction != a3)
  {
    self->_disableInteraction = a3;
    BOOL v4 = !a3;
    id v5 = [(IMButtonAndRadialProgress *)self radialProgress];
    [v5 setShowImages:v4];

    BOOL v6 = !self->_disableInteraction;
    [(IMButtonAndRadialProgress *)self setUserInteractionEnabled:v6];
  }
}

- (void)setProgressColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressColor, a3);
  id v5 = a3;
  id v6 = [(IMButtonAndRadialProgress *)self radialProgress];
  [v6 setProgressColor:v5];
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)IMButtonAndRadialProgress;
  [(IMButtonAndRadialProgress *)&v5 tintColorDidChange];
  if (!self->_progressColor)
  {
    float v3 = [(IMButtonAndRadialProgress *)self tintColor];
    BOOL v4 = [(IMButtonAndRadialProgress *)self radialProgress];
    [v4 setProgressColor:v3];
  }
}

- (void)setModeState:(int)a3
{
  if (a3 == 1)
  {
    double v7 = [(IMButtonAndRadialProgress *)self button];
    [v7 setHidden:0];

    id v8 = [(IMButtonAndRadialProgress *)self button];
    id v9 = v8;
    uint64_t v10 = 1;
  }
  else
  {
    if (a3 == 2)
    {
      double v11 = [(IMButtonAndRadialProgress *)self button];
      [v11 setHidden:1];

      double v12 = [(IMButtonAndRadialProgress *)self button];
      [v12 setEnabled:0];

      id v13 = [(IMButtonAndRadialProgress *)self radialProgress];
      double v14 = v13;
      uint64_t v15 = 0;
      goto LABEL_10;
    }
    if (a3 == 3)
    {
      BOOL v4 = [(IMButtonAndRadialProgress *)self button];
      objc_super v5 = v4;
      uint64_t v6 = 0;
    }
    else
    {
      BOOL v4 = [(IMButtonAndRadialProgress *)self button];
      objc_super v5 = v4;
      uint64_t v6 = 1;
    }
    [v4 setHidden:v6];

    id v8 = [(IMButtonAndRadialProgress *)self button];
    id v9 = v8;
    uint64_t v10 = 0;
  }
  [v8 setEnabled:v10];

  id v13 = [(IMButtonAndRadialProgress *)self radialProgress];
  double v14 = v13;
  uint64_t v15 = 1;
LABEL_10:
  [v13 setHidden:v15];

  id v16 = [(IMButtonAndRadialProgress *)self radialProgress];
  [v16 setEnabled:0];
}

- (int)modeState
{
  float v3 = [(IMButtonAndRadialProgress *)self button];
  if ([v3 isHidden])
  {
    BOOL v4 = [(IMButtonAndRadialProgress *)self radialProgress];
    unsigned __int8 v5 = [v4 isHidden];

    if (v5) {
      return 0;
    }
  }
  else
  {
  }
  double v7 = [(IMButtonAndRadialProgress *)self button];
  unsigned __int8 v8 = [v7 isHidden];

  if (v8) {
    return 2;
  }
  id v9 = [(IMButtonAndRadialProgress *)self button];
  unsigned int v10 = [v9 isEnabled];

  if (v10) {
    return 1;
  }
  else {
    return 3;
  }
}

- (void)_commonInitWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc((Class)UIButton);
  [(IMButtonAndRadialProgress *)self frame];
  id v9 = [v8 initWithFrame:];
  button = self->_button;
  self->_button = v9;

  self->_disableInteraction = 0;
  double v11 = [IMRadialProgressButton alloc];
  -[IMButtonAndRadialProgress _centeredProgressFrameWithBounds:](self, "_centeredProgressFrameWithBounds:", x, y, width, height);
  double v12 = -[IMRadialProgressButton initWithFrame:](v11, "initWithFrame:");
  radialProgress = self->_radialProgress;
  self->_radialProgress = v12;

  [(IMRadialProgressButton *)self->_radialProgress setHidden:1];
  [(IMButtonAndRadialProgress *)self addSubview:self->_button];
  double v14 = self->_radialProgress;

  [(IMButtonAndRadialProgress *)self addSubview:v14];
}

- (CGRect)_centeredProgressFrameWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  +[IMRadialProgressButton minimumBoundingBox];
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGRectGetWidth(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGRectGetHeight(v13);

  CGRectMakeWithCenterAndSize();
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (UIColor)progressColor
{
  return self->_progressColor;
}

- (BOOL)disableInteraction
{
  return self->_disableInteraction;
}

- (UIButton)button
{
  return self->_button;
}

- (IMRadialProgressButton)radialProgress
{
  return self->_radialProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radialProgress, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_progressColor, 0);
}

@end
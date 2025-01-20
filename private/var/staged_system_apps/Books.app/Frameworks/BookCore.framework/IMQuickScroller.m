@interface IMQuickScroller
+ (id)backgroundForSize:(CGSize)a3;
+ (id)foregroundForSize:(CGSize)a3;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (IMQuickScroller)initWithFrame:(CGRect)a3;
- (float)value;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setValue:(float)a3;
- (void)updateValueForTouch:(id)a3;
@end

@implementation IMQuickScroller

+ (id)backgroundForSize:(CGSize)a3
{
  v3 = +[UIImage imageNamed:@"quickScroll-track.png", a3.width, a3.height];
  v4 = [v3 stretchableImageWithLeftCapWidth:0 topCapHeight:13];

  return v4;
}

+ (id)foregroundForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (!qword_3492A8)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)qword_3492A8;
    qword_3492A8 = (uint64_t)v5;
  }
  v7 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, height);
  v8 = [(id)qword_3492A8 objectForKey:v7];
  if (!v8)
  {
    if (width == CGSizeZero.width && height == CGSizeZero.height)
    {
      v8 = 0;
    }
    else
    {
      double v10 = 0.0;
      v27.double width = width;
      v27.double height = height;
      UIGraphicsBeginImageContextWithOptions(v27, 0, 0.0);
      v11 = +[UIImage imageNamed:@"quickScroll-dot-large.png"];
      v12 = +[UIImage imageNamed:@"quickScroll-dot-small.png"];
      [v11 size];
      double v14 = v13;
      double v16 = v15;
      [v12 size];
      double v18 = v17;
      double v20 = v19;
      [v11 drawInRect:CGRectMake(14.0, 15.0, v14, v16)];
      [v11 drawInRect:CGRectMake(14.0, height + -15.0 - v16, v14, v16)];
      double v21 = v16 + 15.0 + 12.0;
      double v22 = height + v21 * -2.0;
      int v23 = vcvtpd_s64_f64(v22 / (v20 + 12.0));
      if (v23 >= 1)
      {
        double v24 = v21 + round((v22 - (double)v23 * v20 - (double)(v23 - 1) * 12.0) * 0.5);
        do
        {
          [v12 drawInRect:CGRectMake(15.0, v24 + v10 * (v20 + 12.0), v18, v20)];
          double v10 = v10 + 1.0;
          --v23;
        }
        while (v23);
      }
      v8 = UIGraphicsGetImageFromCurrentImageContext();
      if (v8) {
        [(id)qword_3492A8 setObject:v8 forKey:v7];
      }
    }
  }

  return v8;
}

- (IMQuickScroller)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)IMQuickScroller;
  v3 = -[IMQuickScroller initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(IMQuickScroller *)v3 setBackgroundColor:v4];

    [(IMQuickScroller *)v3 setOpaque:0];
    [(IMQuickScroller *)v3 setAutoresizingMask:18];
    id v5 = objc_alloc((Class)UIImageView);
    v6 = [objc_opt_class() backgroundForSize:CGSizeZero.width, CGSizeZero.height];
    v7 = (UIImageView *)[v5 initWithImage:v6];
    background = v3->_background;
    v3->_background = v7;

    [(UIImageView *)v3->_background setHidden:1];
    [(IMQuickScroller *)v3 bounds];
    -[UIImageView setFrame:](v3->_background, "setFrame:");
    [(UIImageView *)v3->_background setContentMode:0];
    [(UIImageView *)v3->_background setAutoresizingMask:18];
    [(IMQuickScroller *)v3 addSubview:v3->_background];
    v9 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    foreground = v3->_foreground;
    v3->_foreground = v9;

    [(IMQuickScroller *)v3 bounds];
    -[UIImageView setFrame:](v3->_foreground, "setFrame:");
    [(UIImageView *)v3->_foreground setHidden:0];
    [(UIImageView *)v3->_foreground setContentMode:4];
    [(UIImageView *)v3->_foreground setAutoresizingMask:18];
    [(IMQuickScroller *)v3 addSubview:v3->_foreground];
  }
  return v3;
}

- (void)updateValueForTouch:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4 + -20.0;
  [(IMQuickScroller *)self frame];
  double v7 = v5 / (v6 + -40.0);
  *(float *)&double v7 = v7;
  *(float *)&double v7 = fminf(fmaxf(*(float *)&v7, 0.0), 1.0);
  [(IMQuickScroller *)self setValue:v7];

  [(IMQuickScroller *)self sendActionsForControlEvents:4096];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  background = self->_background;
  id v6 = a3;
  [(UIImageView *)background setHidden:0];
  [(IMQuickScroller *)self updateValueForTouch:v6];

  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  LODWORD(v4) = -1.0;
  -[IMQuickScroller setValue:](self, "setValue:", a3, a4, v4);
  background = self->_background;

  [(UIImageView *)background setHidden:1];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  LODWORD(v3) = -1.0;
  -[IMQuickScroller setValue:](self, "setValue:", a3, v3);
  background = self->_background;

  [(UIImageView *)background setHidden:1];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)IMQuickScroller;
  [(IMQuickScroller *)&v8 layoutSubviews];
  [(IMQuickScroller *)self bounds];
  double x = v9.origin.x;
  double y = v9.origin.y;
  double width = v9.size.width;
  double height = v9.size.height;
  -[UIImageView setFrame:](self->_background, "setFrame:", 5.0, 6.0, 23.0, CGRectGetHeight(v9) + -12.0);
  double v7 = [objc_opt_class() foregroundForSize:width height:height];
  [(UIImageView *)self->_foreground setImage:v7];

  -[UIImageView setFrame:](self->_foreground, "setFrame:", x, y, width, height);
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreground, 0);

  objc_storeStrong((id *)&self->_background, 0);
}

@end
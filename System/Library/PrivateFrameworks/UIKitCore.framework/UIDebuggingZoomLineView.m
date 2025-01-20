@interface UIDebuggingZoomLineView
- (CGPoint)end;
- (CGPoint)start;
- (CGRect)rect;
- (UIDebuggingZoomLineView)initWithFrame:(CGRect)a3;
- (UILabel)lineLabel;
- (unint64_t)direction;
- (void)drawRect:(CGRect)a3;
- (void)setDirection:(unint64_t)a3;
- (void)setEnd:(CGPoint)a3;
- (void)setLineLabel:(id)a3;
- (void)setRect:(CGRect)a3;
- (void)setStart:(CGPoint)a3;
- (void)updateLabelFrame;
@end

@implementation UIDebuggingZoomLineView

- (void)updateLabelFrame
{
  unint64_t v3 = [(UIDebuggingZoomLineView *)self direction];
  if (v3 == 1)
  {
    [(UIDebuggingZoomLineView *)self start];
    double v21 = v20;
    [(UIDebuggingZoomLineView *)self end];
    double v23 = v22;
    [(UIDebuggingZoomLineView *)self start];
    double v25 = v21 + (v23 - v24) * 0.5 + -25.0;
    [(UIDebuggingZoomLineView *)self start];
    double v27 = v26 + 2.0;
    if (v25 < 0.0) {
      double v25 = 2.0;
    }
    if (v27 >= 0.0) {
      double v28 = v27;
    }
    else {
      double v28 = 2.0;
    }
    v29 = [(UIDebuggingZoomLineView *)self lineLabel];
    objc_msgSend(v29, "setFrame:", v25, v28, 50.0, 20.0);

    v15 = NSString;
    [(UIDebuggingZoomLineView *)self end];
    double v31 = v30;
    [(UIDebuggingZoomLineView *)self start];
    double v19 = v31 - v32;
  }
  else
  {
    if (v3) {
      return;
    }
    [(UIDebuggingZoomLineView *)self start];
    double v5 = v4 + 2.0;
    [(UIDebuggingZoomLineView *)self start];
    double v7 = v6;
    [(UIDebuggingZoomLineView *)self end];
    double v9 = v8;
    [(UIDebuggingZoomLineView *)self start];
    double v11 = v7 + (v9 - v10) * 0.5 + -10.0;
    if (v5 >= 0.0) {
      double v12 = v5;
    }
    else {
      double v12 = 2.0;
    }
    if (v11 >= 0.0) {
      double v13 = v11;
    }
    else {
      double v13 = 2.0;
    }
    v14 = [(UIDebuggingZoomLineView *)self lineLabel];
    objc_msgSend(v14, "setFrame:", v12, v13, 50.0, 20.0);

    v15 = NSString;
    [(UIDebuggingZoomLineView *)self end];
    double v17 = v16;
    [(UIDebuggingZoomLineView *)self start];
    double v19 = v17 - v18;
  }
  objc_msgSend(v15, "stringWithFormat:", @"%.1f", *(void *)&v19);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  v33 = [(UIDebuggingZoomLineView *)self lineLabel];
  [v33 setText:v34];
}

- (void)setStart:(CGPoint)a3
{
  self->_start = a3;
  [(UIView *)self setNeedsDisplay];
}

- (void)setEnd:(CGPoint)a3
{
  self->_end = a3;
  [(UIView *)self setNeedsDisplay];
}

- (UIDebuggingZoomLineView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingZoomLineView;
  unint64_t v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v4];

    [(UIView *)v3 setOpaque:0];
    double v5 = objc_alloc_init(UILabel);
    [(UIDebuggingZoomLineView *)v3 setLineLabel:v5];

    double v6 = +[UIColor redColor];
    [(UILabel *)v3->_lineLabel setTextColor:v6];

    [(UILabel *)v3->_lineLabel setTextAlignment:0];
    lineLabel = v3->_lineLabel;
    double v8 = [off_1E52D39B8 systemFontOfSize:9.0];
    [(UILabel *)lineLabel setFont:v8];

    [(UIView *)v3 addSubview:v3->_lineLabel];
    -[UIDebuggingZoomLineView setRect:](v3, "setRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIDebuggingZoomLineView *)self updateLabelFrame];
  double v8 = +[UIColor redColor];
  [v8 set];

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    objc_super v10 = 0;
  }
  else {
    objc_super v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGContextClearRect(v10, v22);
  CGContextSetLineWidth(v10, 0.5);
  [(UIDebuggingZoomLineView *)self start];
  CGFloat v12 = v11;
  [(UIDebuggingZoomLineView *)self start];
  CGContextMoveToPoint(v10, v12, v13);
  [(UIDebuggingZoomLineView *)self end];
  CGFloat v15 = v14;
  [(UIDebuggingZoomLineView *)self end];
  CGContextAddLineToPoint(v10, v15, v16);
  CGContextStrokePath(v10);
  [(UIDebuggingZoomLineView *)self rect];
  CGContextStrokeRect(v10, *(CGRect *)&v17);
}

- (CGPoint)start
{
  double x = self->_start.x;
  double y = self->_start.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)end
{
  double x = self->_end.x;
  double y = self->_end.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (UILabel)lineLabel
{
  return self->_lineLabel;
}

- (void)setLineLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
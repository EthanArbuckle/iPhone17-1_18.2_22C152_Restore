@interface TPLCDTextViewScrollingView
- (TPLCDTextViewScrollingView)initWithFrame:(CGRect)a3 owner:(id)a4;
- (void)drawRect:(CGRect)a3;
- (void)setOwner:(id)a3;
@end

@implementation TPLCDTextViewScrollingView

- (TPLCDTextViewScrollingView)initWithFrame:(CGRect)a3 owner:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TPLCDTextViewScrollingView;
  v11 = -[TPLCDTextViewScrollingView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_owner, a4);
    [(TPLCDTextViewScrollingView *)v12 setOpaque:0];
  }

  return v12;
}

- (void)setOwner:(id)a3
{
}

- (void)drawRect:(CGRect)a3
{
  [(TPLCDTextViewScrollingView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(TPLCDTextView *)self->_owner bounds];
  double v13 = v12;
  double v14 = v9 - (v12 + 30.0);
  -[TPLCDTextView _drawTextInRect:verticallyOffset:](self->_owner, "_drawTextInRect:verticallyOffset:", 0, v5, v7, v14, v11);
  owner = self->_owner;
  -[TPLCDTextView _drawTextInRect:verticallyOffset:](owner, "_drawTextInRect:verticallyOffset:", 0, v5 + v14 + 30.0, v7, v13, v11);
}

- (void).cxx_destruct
{
}

@end
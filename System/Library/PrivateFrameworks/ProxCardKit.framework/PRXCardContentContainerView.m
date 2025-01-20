@interface PRXCardContentContainerView
- (CGRect)originalFrame;
- (PRXCardContentContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setOriginalFrame:(CGRect)a3;
@end

@implementation PRXCardContentContainerView

- (PRXCardContentContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)PRXCardContentContainerView;
  v7 = -[PRXCardContentContainerView initWithFrame:](&v9, sel_initWithFrame_);
  -[PRXCardContentContainerView setOriginalFrame:](v7, "setOriginalFrame:", x, y, width, height);
  return v7;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PRXCardContentContainerView;
  [(PRXCardContentContainerView *)&v18 layoutSubviews];
  v3 = [(PRXCardContentContainerView *)self subviews];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    [(PRXCardContentContainerView *)self frame];
    double v6 = v5;
    v7 = [(PRXCardContentContainerView *)self subviews];
    v8 = [v7 objectAtIndexedSubscript:0];

    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [(PRXCardContentContainerView *)self originalFrame];
    if (v6 < v17 || v16 < v6) {
      objc_msgSend(v8, "setFrame:", v10, v12, v14, v6);
    }
  }
}

- (CGRect)originalFrame
{
  double x = self->_originalFrame.origin.x;
  double y = self->_originalFrame.origin.y;
  double width = self->_originalFrame.size.width;
  double height = self->_originalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalFrame:(CGRect)a3
{
  self->_originalFrame = a3;
}

@end
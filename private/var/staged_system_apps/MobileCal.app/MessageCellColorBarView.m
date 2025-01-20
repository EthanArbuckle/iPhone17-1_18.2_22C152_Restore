@interface MessageCellColorBarView
- (MessageCellColorBarView)init;
- (UIColor)backgroundColor;
- (UIColor)color;
- (void)setColor:(id)a3;
@end

@implementation MessageCellColorBarView

- (MessageCellColorBarView)init
{
  v8.receiver = self;
  v8.super_class = (Class)MessageCellColorBarView;
  v2 = [(MessageCellColorBarView *)&v8 init];
  if (v2)
  {
    CalRoundToScreenScale();
    double v4 = v3 * 0.5;
    v5 = [(MessageCellColorBarView *)v2 layer];
    [v5 setCornerRadius:v4];

    v6 = [(MessageCellColorBarView *)v2 layer];
    [v6 setMasksToBounds:1];
  }
  return v2;
}

- (UIColor)backgroundColor
{
  return 0;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MessageCellColorBarView;
  [(MessageCellColorBarView *)&v6 setBackgroundColor:v5];
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end
@interface StocksListBoxView
- (StocksListBoxView)initWithBackgroundMask:(id)a3;
- (UIColor)imageMaskColor;
@end

@implementation StocksListBoxView

- (StocksListBoxView)initWithBackgroundMask:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)StocksListBoxView;
  v5 = [(StocksListBoxView *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(StocksListBoxView *)v5 setImage:v4];
    [(StocksListBoxView *)v6 setContentMode:3];
    v7 = [MEMORY[0x263F1C550] clearColor];
    [(StocksListBoxView *)v6 setTintColor:v7];

    v8 = [MEMORY[0x263F1C550] clearColor];
    [(StocksListBoxView *)v6 setBackgroundColor:v8];
  }
  return v6;
}

- (UIColor)imageMaskColor
{
  return self->_imageMaskColor;
}

- (void).cxx_destruct
{
}

@end
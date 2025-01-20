@interface HUDTouchInfo
- ($87A9BE3275E22128A73FF46D0B92144E)stockValue;
- (CGPoint)locationInHUD;
- (CGPoint)plottedLocation;
- (UIImageView)dot;
- (UITouch)touch;
- (UIView)bar;
- (id)description;
- (void)setBar:(id)a3;
- (void)setDot:(id)a3;
- (void)setLocationInHUD:(CGPoint)a3;
- (void)setPlottedLocation:(CGPoint)a3;
- (void)setStockValue:(id *)a3;
- (void)setTouch:(id)a3;
@end

@implementation HUDTouchInfo

- (id)description
{
  v3 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touch);
  v5 = [v3 stringWithFormat:@"HUDTouchInfo %p with touch = %@", self, WeakRetained];

  return v5;
}

- ($87A9BE3275E22128A73FF46D0B92144E)stockValue
{
  *($04C7558FCA835F866B126A859D92FCD9 *)retstr = *($04C7558FCA835F866B126A859D92FCD9 *)((char *)self + 64);
  return self;
}

- (void)setStockValue:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_stockValue.volume = a3->var2;
  *(_OWORD *)&self->_stockValue.unixTime = v3;
}

- (CGPoint)plottedLocation
{
  double x = self->_plottedLocation.x;
  double y = self->_plottedLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPlottedLocation:(CGPoint)a3
{
  self->_plottedLocation = a3;
}

- (CGPoint)locationInHUD
{
  double x = self->_locationInHUD.x;
  double y = self->_locationInHUD.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocationInHUD:(CGPoint)a3
{
  self->_locationInHUD = a3;
}

- (UITouch)touch
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touch);

  return (UITouch *)WeakRetained;
}

- (void)setTouch:(id)a3
{
}

- (UIImageView)dot
{
  return self->_dot;
}

- (void)setDot:(id)a3
{
}

- (UIView)bar
{
  return self->_bar;
}

- (void)setBar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bar, 0);
  objc_storeStrong((id *)&self->_dot, 0);

  objc_destroyWeak((id *)&self->_touch);
}

@end
@interface SVTouchForwardingView
- (double)lastTouchTimestamp;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)touchedBlock;
- (void)onTouch:(id)a3;
- (void)setLastTouchTimestamp:(double)a3;
@end

@implementation SVTouchForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SVTouchForwardingView;
  -[SVTouchForwardingView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SVTouchForwardingView *)objc_claimAutoreleasedReturnValue();
  if (v7 && ![v7 type] && v8 == self)
  {
    uint64_t v9 = [(SVTouchForwardingView *)self touchedBlock];
    if (v9)
    {
      v10 = (void *)v9;
      [(SVTouchForwardingView *)self lastTouchTimestamp];
      double v12 = v11;
      [v7 timestamp];
      double v14 = v13;

      if (v12 != v14)
      {
        v15 = [(SVTouchForwardingView *)self touchedBlock];
        v15[2]();

        [v7 timestamp];
        -[SVTouchForwardingView setLastTouchTimestamp:](self, "setLastTouchTimestamp:");
      }
    }

    v8 = 0;
  }

  return v8;
}

- (id)touchedBlock
{
  return self->_touchedBlock;
}

- (void)onTouch:(id)a3
{
}

- (double)lastTouchTimestamp
{
  return self->_lastTouchTimestamp;
}

- (void)setLastTouchTimestamp:(double)a3
{
  self->_lastTouchTimestamp = a3;
}

- (void).cxx_destruct
{
}

@end
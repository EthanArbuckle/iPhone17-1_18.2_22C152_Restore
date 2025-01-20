@interface PKUISpringAnimationFactory
- (double)maximumVendedDelay;
- (id)_springAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)animationDelayHandler;
- (id)highFrameRateSpringAnimationForView:(id)a3 withKeyPath:(id)a4 reason:(unsigned __int16)a5;
- (id)springAnimationForView:(id)a3 withKeyPath:(id)a4;
- (void)setAnimationDelayHandler:(id)a3;
@end

@implementation PKUISpringAnimationFactory

- (double)maximumVendedDelay
{
  return self->_maximumVendedDelay;
}

- (void).cxx_destruct
{
}

- (id)highFrameRateSpringAnimationForView:(id)a3 withKeyPath:(id)a4 reason:(unsigned __int16)a5
{
  int v5 = a5;
  v6 = [(PKUISpringAnimationFactory *)self springAnimationForView:a3 withKeyPath:a4];
  [v6 setHighFrameRateReason:v5 | 0x210000u];
  LODWORD(v7) = 1117782016;
  LODWORD(v8) = 1123024896;
  LODWORD(v9) = 1123024896;
  objc_msgSend(v6, "setPreferredFrameRateRange:", v7, v8, v9);

  return v6;
}

- (id)springAnimationForView:(id)a3 withKeyPath:(id)a4
{
  v4 = [(PKUISpringAnimationFactory *)self _springAnimationForView:a3 withKeyPath:a4];
  [v4 setAdditive:1];

  return v4;
}

- (id)_springAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKSpringAnimationFactory *)self _createSpringAnimationWithKeyPath:v7];
  animationDelayHandler = (double (**)(id, id, id))self->_animationDelayHandler;
  if (animationDelayHandler)
  {
    double v10 = animationDelayHandler[2](animationDelayHandler, v6, v7);
    if (v10 > 0.0)
    {
      double v11 = v10;
      objc_msgSend(v8, "setBeginTime:");
      self->_maximumVendedDelay = fmax(v11, self->_maximumVendedDelay);
    }
  }

  return v8;
}

- (void)setAnimationDelayHandler:(id)a3
{
  self->_animationDelayHandler = (id)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (id)animationDelayHandler
{
  return self->_animationDelayHandler;
}

@end
@interface TargetedSpringLoadedBlinkEffect
- (CALayer)blinkLayer;
- (TargetedSpringLoadedBlinkEffect)initWithTargetView:(id)a3;
- (UIView)targetView;
- (id)blinkAnimation;
- (void)_prepareLayer:(id)a3 forView:(id)a4;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)setBlinkLayer:(id)a3;
- (void)setTargetView:(id)a3;
@end

@implementation TargetedSpringLoadedBlinkEffect

- (TargetedSpringLoadedBlinkEffect)initWithTargetView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TargetedSpringLoadedBlinkEffect;
  v5 = [(TargetedSpringLoadedBlinkEffect *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_targetView, v4);
  }

  return v6;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v10 = a4;
  v5 = [(TargetedSpringLoadedBlinkEffect *)self blinkLayer];
  v6 = [(TargetedSpringLoadedBlinkEffect *)self targetView];
  if (v6)
  {
    switch((unint64_t)[v10 state])
    {
      case 0uLL:
      case 3uLL:
        goto LABEL_3;
      case 1uLL:
        [(TargetedSpringLoadedBlinkEffect *)self _prepareLayer:v5 forView:v6];
        blinkLayer = [v6 layer];
        [blinkLayer addSublayer:v5];
        goto LABEL_4;
      case 2uLL:
        objc_super v8 = [v5 superlayer];

        if (!v8)
        {
          [(TargetedSpringLoadedBlinkEffect *)self _prepareLayer:v5 forView:v6];
          v9 = [v6 layer];
          [v9 addSublayer:v5];
        }
        blinkLayer = [(TargetedSpringLoadedBlinkEffect *)self blinkAnimation];
        [v5 addAnimation:blinkLayer forKey:@"targetedBlinkAnimation"];
        goto LABEL_4;
      default:
        break;
    }
  }
  else
  {
LABEL_3:
    [v5 removeFromSuperlayer];
    blinkLayer = self->_blinkLayer;
    self->_blinkLayer = 0;
LABEL_4:
  }
}

- (void)_prepareLayer:(id)a3 forView:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  v6 = [v5 layer];
  [v5 bounds];
  [v8 setFrame:];
  v7 = [v6 cornerCurve];
  [v8 setCornerCurve:v7];

  [v6 cornerRadius];
  [v8 setCornerRadius:];
}

- (CALayer)blinkLayer
{
  blinkLayer = self->_blinkLayer;
  if (!blinkLayer)
  {
    id v4 = (CALayer *)objc_opt_new();
    id v5 = self->_blinkLayer;
    self->_blinkLayer = v4;

    id v6 = +[UIColor blackColor];
    -[CALayer setBackgroundColor:](self->_blinkLayer, "setBackgroundColor:", [v6 CGColor]);

    LODWORD(v7) = 1045220557;
    [(CALayer *)self->_blinkLayer setOpacity:v7];
    blinkLayer = self->_blinkLayer;
  }

  return blinkLayer;
}

- (id)blinkAnimation
{
  v2 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v2 setToValue:&off_10062B6A8];
  [v2 setDuration:0.1];
  [v2 setAutoreverses:1];
  LODWORD(v3) = 2.0;
  [v2 setRepeatCount:v3];

  return v2;
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);

  return (UIView *)WeakRetained;
}

- (void)setTargetView:(id)a3
{
}

- (void)setBlinkLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinkLayer, 0);

  objc_destroyWeak((id *)&self->_targetView);
}

@end
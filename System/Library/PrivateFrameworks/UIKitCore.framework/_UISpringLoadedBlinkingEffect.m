@interface _UISpringLoadedBlinkingEffect
- (CALayer)blinkLayer;
- (id)blinkAnimation;
- (void)_prepareLayer:(id)a3 forView:(id)a4;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)setBlinkLayer:(id)a3;
@end

@implementation _UISpringLoadedBlinkingEffect

- (void).cxx_destruct
{
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v10 = a4;
  v5 = [(_UISpringLoadedBlinkingEffect *)self blinkLayer];
  v6 = [v10 targetView];
  if (v6)
  {
    switch([v10 state])
    {
      case 0:
      case 3:
        goto LABEL_3;
      case 1:
        [(_UISpringLoadedBlinkingEffect *)self _prepareLayer:v5 forView:v6];
        blinkLayer = [v6 layer];
        [blinkLayer addSublayer:v5];
        goto LABEL_4;
      case 2:
        v8 = [v5 superlayer];

        if (!v8)
        {
          [(_UISpringLoadedBlinkingEffect *)self _prepareLayer:v5 forView:v6];
          v9 = [v6 layer];
          [v9 addSublayer:v5];
        }
        blinkLayer = [(_UISpringLoadedBlinkingEffect *)self blinkAnimation];
        [v5 addAnimation:blinkLayer forKey:@"blinkingAnimation"];
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
  id v5 = a4;
  id v6 = a3;
  id v16 = [v5 layer];
  [v5 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  objc_msgSend(v6, "setFrame:", v8, v10, v12, v14);
  v15 = [v16 cornerCurve];
  [v6 setCornerCurve:v15];

  [v16 cornerRadius];
  objc_msgSend(v6, "setCornerRadius:");
}

- (CALayer)blinkLayer
{
  blinkLayer = self->_blinkLayer;
  if (!blinkLayer)
  {
    v4 = (CALayer *)objc_opt_new();
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
  v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v2 setToValue:&unk_1ED3F1C48];
  [v2 setDuration:0.1];
  [v2 setAutoreverses:1];
  LODWORD(v3) = 2.0;
  [v2 setRepeatCount:v3];
  return v2;
}

- (void)setBlinkLayer:(id)a3
{
}

@end
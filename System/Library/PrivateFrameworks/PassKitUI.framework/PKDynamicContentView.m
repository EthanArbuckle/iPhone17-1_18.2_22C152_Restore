@interface PKDynamicContentView
- (BOOL)isPaused;
- (PKDynamicContentView)initWithImage:(id)a3 emitterImage:(id)a4 dynamicLayerEmitterConfiguration:(id)a5;
- (void)_configureEmitterLayerWithImage:(id)a3;
- (void)_pauseEmitters;
- (void)_startEmitters;
- (void)dealloc;
- (void)invalidate;
- (void)layoutSubviews;
- (void)setPaused:(BOOL)a3;
@end

@implementation PKDynamicContentView

- (PKDynamicContentView)initWithImage:(id)a3 emitterImage:(id)a4 dynamicLayerEmitterConfiguration:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  if (v8 | v9)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKDynamicContentView;
    v11 = [(PKDynamicContentView *)&v17 init];
    p_isa = (id *)&v11->super.super.super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_dynamicLayerEmitterConfiguration, a5);
      if (v8)
      {
        uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v8];
        id v14 = p_isa[51];
        p_isa[51] = (id)v13;

        [p_isa[51] setContentMode:1];
        [p_isa addSubview:p_isa[51]];
      }
      [p_isa _configureEmitterLayerWithImage:v9];
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  [(PKDynamicContentView *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKDynamicContentView;
  [(PKDynamicContentView *)&v3 dealloc];
}

- (void)invalidate
{
  [(UIImageView *)self->_imageView removeFromSuperview];
  [(CAEmitterLayer *)self->_emitterLayer removeAllAnimations];
  [(CAEmitterLayer *)self->_emitterLayer removeFromSuperlayer];
  imageView = self->_imageView;
  self->_imageView = 0;

  emitterLayer = self->_emitterLayer;
  self->_emitterLayer = 0;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKDynamicContentView;
  [(PKDynamicContentView *)&v14 layoutSubviews];
  [(PKDynamicContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UIImageView *)self->_imageView image];
  [v11 size];

  PKSizeAspectFit();
  imageView = self->_imageView;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](imageView, "setFrame:");
  emitterLayer = self->_emitterLayer;
  if (emitterLayer)
  {
    -[CAEmitterLayer setBounds:](emitterLayer, "setBounds:", v4, v6, v8, v10);
    -[CAEmitterLayer setPosition:](self->_emitterLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
    -[PKDynamicLayerEmitterConfiguration configureEmitterLayer:withBounds:](self->_dynamicLayerEmitterConfiguration, "configureEmitterLayer:withBounds:", self->_emitterLayer, v4, v6, v8, v10);
  }
}

- (void)_configureEmitterLayerWithImage:(id)a3
{
  if (a3 && self->_dynamicLayerEmitterConfiguration)
  {
    double v4 = (void *)MEMORY[0x1E4F39BB0];
    id v5 = a3;
    double v6 = [v4 layer];
    emitterLayer = self->_emitterLayer;
    self->_emitterLayer = v6;

    dynamicLayerEmitterConfiguration = self->_dynamicLayerEmitterConfiguration;
    double v9 = self->_emitterLayer;
    id v10 = v5;
    uint64_t v11 = [v10 CGImage];

    [(PKDynamicLayerEmitterConfiguration *)dynamicLayerEmitterConfiguration configureEmitterLayer:v9 withImage:v11];
    id v13 = [(PKDynamicContentView *)self layer];
    v12 = [(UIImageView *)self->_imageView layer];
    [v13 insertSublayer:self->_emitterLayer below:v12];
  }
}

- (void)setPaused:(BOOL)a3
{
  if (((!self->_paused ^ a3) & 1) == 0)
  {
    self->_paused = a3;
    if (a3) {
      [(PKDynamicContentView *)self _pauseEmitters];
    }
    else {
      [(PKDynamicContentView *)self _startEmitters];
    }
  }
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)_startEmitters
{
  dynamicLayerEmitterConfiguration = self->_dynamicLayerEmitterConfiguration;
  emitterLayer = self->_emitterLayer;
  if ((unint64_t)dynamicLayerEmitterConfiguration | (unint64_t)emitterLayer)
  {
    [(CAEmitterLayer *)emitterLayer timeOffset];
    double v6 = v5;
    LODWORD(v5) = 1.0;
    [(CAEmitterLayer *)self->_emitterLayer setSpeed:v5];
    [(CAEmitterLayer *)self->_emitterLayer setTimeOffset:0.0];
    [(CAEmitterLayer *)self->_emitterLayer setBeginTime:0.0];
    [(CAEmitterLayer *)self->_emitterLayer convertTime:0 fromLayer:CACurrentMediaTime()];
    double v8 = v7 - v6;
    double v9 = self->_emitterLayer;
    [(CAEmitterLayer *)v9 setBeginTime:v8];
  }
}

- (void)_pauseEmitters
{
  if (*(_OWORD *)&self->_dynamicLayerEmitterConfiguration != 0)
  {
    [(CAEmitterLayer *)self->_emitterLayer convertTime:0 fromLayer:CACurrentMediaTime()];
    double v4 = v3;
    [(CAEmitterLayer *)self->_emitterLayer setSpeed:0.0];
    emitterLayer = self->_emitterLayer;
    [(CAEmitterLayer *)emitterLayer setTimeOffset:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emitterLayer, 0);
  objc_storeStrong((id *)&self->_dynamicLayerEmitterConfiguration, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
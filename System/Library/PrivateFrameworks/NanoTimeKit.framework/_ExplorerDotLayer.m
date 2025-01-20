@interface _ExplorerDotLayer
- (CALayer)connectivityDotBackingLayer;
- (CALayer)connectivityDotLayer;
- (CALayer)noServicePillLayer;
- (_ExplorerDotLayer)init;
- (void)layoutSublayers;
@end

@implementation _ExplorerDotLayer

- (_ExplorerDotLayer)init
{
  v12.receiver = self;
  v12.super_class = (Class)_ExplorerDotLayer;
  v2 = [(_ExplorerDotLayer *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F39BE8] layer];
    noServicePillLayer = v2->_noServicePillLayer;
    v2->_noServicePillLayer = (CALayer *)v3;

    v5 = v2->_noServicePillLayer;
    CATransform3DMakeRotation(&v11, 1.57079633, 1.0, 0.0, 0.0);
    [(CALayer *)v5 setTransform:&v11];
    [(_ExplorerDotLayer *)v2 addSublayer:v2->_noServicePillLayer];
    uint64_t v6 = [MEMORY[0x1E4F39BE8] layer];
    connectivityDotBackingLayer = v2->_connectivityDotBackingLayer;
    v2->_connectivityDotBackingLayer = (CALayer *)v6;

    [(_ExplorerDotLayer *)v2 addSublayer:v2->_connectivityDotBackingLayer];
    uint64_t v8 = [MEMORY[0x1E4F39BE8] layer];
    connectivityDotLayer = v2->_connectivityDotLayer;
    v2->_connectivityDotLayer = (CALayer *)v8;

    [(_ExplorerDotLayer *)v2 addSublayer:v2->_connectivityDotLayer];
  }
  return v2;
}

- (void)layoutSublayers
{
  [(_ExplorerDotLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CALayer setBounds:](self->_connectivityDotBackingLayer, "setBounds:");
  -[CALayer setBounds:](self->_connectivityDotLayer, "setBounds:", v4, v6, v8, v10);
  -[CALayer setPosition:](self->_noServicePillLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
  -[CALayer setPosition:](self->_connectivityDotBackingLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
  connectivityDotLayer = self->_connectivityDotLayer;
  -[CALayer setPosition:](connectivityDotLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
}

- (CALayer)noServicePillLayer
{
  return self->_noServicePillLayer;
}

- (CALayer)connectivityDotBackingLayer
{
  return self->_connectivityDotBackingLayer;
}

- (CALayer)connectivityDotLayer
{
  return self->_connectivityDotLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectivityDotLayer, 0);
  objc_storeStrong((id *)&self->_connectivityDotBackingLayer, 0);
  objc_storeStrong((id *)&self->_noServicePillLayer, 0);
}

@end
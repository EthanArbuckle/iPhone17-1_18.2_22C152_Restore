@interface PBUIViewportLayer
- (CALayer)contentLayer;
- (PBUIViewportLayer)initWithCoder:(id)a3;
- (PBUIViewportLayer)initWithLayer:(id)a3;
- (PBUIViewportLayer)initWithScale:(double)a3;
- (double)scale;
- (id)animationForKey:(id)a3;
- (void)layoutSublayers;
- (void)setScale:(double)a3;
@end

@implementation PBUIViewportLayer

- (PBUIViewportLayer)initWithScale:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PBUIViewportLayer;
  v3 = [(PBUIViewportLayer *)&v7 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F39BE8] layer];
    contentLayer = v3->_contentLayer;
    v3->_contentLayer = (CALayer *)v4;

    [(PBUIViewportLayer *)v3 setName:@"Viewport Layer"];
    [(CALayer *)v3->_contentLayer setName:@"Scale Layer"];
    [(PBUIViewportLayer *)v3 addSublayer:v3->_contentLayer];
  }
  return v3;
}

- (id)animationForKey:(id)a3
{
  return 0;
}

- (PBUIViewportLayer)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIViewportLayer;
  return [(PBUIViewportLayer *)&v4 initWithCoder:a3];
}

- (PBUIViewportLayer)initWithLayer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIViewportLayer;
  v5 = [(PBUIViewportLayer *)&v9 initWithLayer:v4];
  if (v5)
  {
    v6 = [v4 valueForKey:@"scale"];
    [v6 doubleValue];
    v5->_scale = v7;
  }
  return v5;
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(PBUIViewportLayer *)self setNeedsLayout];
  }
}

- (void)layoutSublayers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PBUIViewportLayer;
  [(PBUIViewportLayer *)&v22 layoutSublayers];
  memset(&v21, 0, sizeof(v21));
  double scale = self->_scale;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v20.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v20.m33 = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v20.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v20.m43 = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v20.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v20.m13 = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v20.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v20.m23 = v7;
  CATransform3DScale(&v21, &v20, scale, scale, 1.0);
  contentLayer = self->_contentLayer;
  CATransform3D v20 = v21;
  [(CALayer *)contentLayer setTransform:&v20];
  objc_super v9 = self->_contentLayer;
  [(PBUIViewportLayer *)self bounds];
  -[CALayer setFrame:](v9, "setFrame:");
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = [(CALayer *)self->_contentLayer sublayers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        [(CALayer *)self->_contentLayer bounds];
        objc_msgSend(v15, "setFrame:");
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v12);
  }
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
}

@end
@interface _TUIDrawLayerConfig
- (BOOL)clipContainerForCrossfade;
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)reuseLayerForBoundsChange;
- (Class)layerClass;
- (Class)layerClassForSize:(CGSize)a3;
- (_TUIDrawLayerConfig)initWithDraw:(id)a3 contentsScale:(double)a4 renderMode:(unint64_t)a5;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)configureDelegate:(id)a3;
- (void)configureLayer:(id)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3;
@end

@implementation _TUIDrawLayerConfig

- (_TUIDrawLayerConfig)initWithDraw:(id)a3 contentsScale:(double)a4 renderMode:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_TUIDrawLayerConfig;
  v10 = [(_TUIDrawLayerConfig *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_draw, a3);
    v11->_contentsScale = a4;
    v11->_renderMode = a5;
  }

  return v11;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[_TUIAnimationState animationForLayer:a3 forKey:a4];
}

- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3
{
}

- (void)configureLayer:(id)a3
{
  id v18 = a3;
  [v18 setContentsScale:self->_contentsScale];
  [v18 setRasterizationScale:self->_contentsScale];
  if (self->_renderMode == 1) {
    [v18 setGeometryFlipped:1];
  }
  v4 = [v18 compositingFilter];
  v5 = [(TUIRenderModelDraw *)self->_draw compositingFilter];
  uint64_t v6 = [v5 type];
  if (v4 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    v8 = [v18 compositingFilter];
    id v9 = [(TUIRenderModelDraw *)self->_draw compositingFilter];
    v10 = [v9 type];
    unsigned __int8 v11 = [v8 isEqual:v10];

    if (v11) {
      goto LABEL_8;
    }
    v4 = [(TUIRenderModelDraw *)self->_draw compositingFilter];
    v5 = [v4 type];
    [v18 setCompositingFilter:v5];
  }

LABEL_8:
  if (objc_opt_respondsToSelector()) {
    id v12 = [(TUIRenderModelDraw *)self->_draw enableContext];
  }
  else {
    id v12 = 0;
  }
  objc_super v13 = +[NSNumber numberWithBool:v12];
  [v18 setValue:v13 forKeyPath:@"separatedOptions.enableContext"];

  v14 = [(TUIRenderModelDraw *)self->_draw shadingColor];
  v15 = [v14 colorWithAlphaComponent:1.0];

  v16 = (const CALayerContentsFormat *)&kCAContentsFormatA8;
  if (!v15) {
    v16 = &kCAContentsFormatRGBA8Uint;
  }
  [v18 setContentsFormat:*v16];
  id v17 = v15;
  [v18 setContentsMultiplyColor:[v17 CGColor]];
  [v18 setNeedsDisplay];
}

- (void)configureDelegate:(id)a3
{
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = v6;
  v8 = v7;
  if (v7 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else if (v7)
  {
    unsigned __int8 v9 = [(TUIRenderModelDraw *)self->_draw isEqualToDraw:v7->_draw];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (Class)layerClassForSize:(CGSize)a3
{
  if (a3.width <= 8192.0 && a3.height <= 8192.0) {
    [(_TUIDrawLayerConfig *)self layerClass];
  }
  else {
  id v4 = objc_opt_class();
  }

  return (Class)v4;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  [a3 bounds];
  CGContextTranslateCTM(a4, v6, v7);
  draw = self->_draw;

  [(TUIRenderModelDraw *)draw drawInContext:a4];
}

- (BOOL)reuseLayerForBoundsChange
{
  return 0;
}

- (BOOL)clipContainerForCrossfade
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  draw = self->_draw;

  return [(TUIRenderModelDraw *)draw clipContainerForCrossfade];
}

- (void).cxx_destruct
{
}

@end
@interface _UISceneLayerHostView
- (BOOL)inheritsSecurity;
- (BOOL)resizesHostedContext;
- (BOOL)stopsHitTestTransformAccumulation;
- (BOOL)stopsSecureSuperlayersValidation;
- (FBSceneLayer)sceneLayer;
- (UIScenePresentationContext)currentPresentationContext;
- (UITransformer)transformer;
- (_UISceneLayerHostView)initWithFrame:(CGRect)a3;
- (_UISceneLayerHostView)initWithSceneLayer:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setCurrentPresentationContext:(id)a3;
- (void)setInheritsSecurity:(BOOL)a3;
- (void)setResizesHostedContext:(BOOL)a3;
- (void)setStopsHitTestTransformAccumulation:(BOOL)a3;
- (void)setStopsSecureSuperlayersValidation:(BOOL)a3;
- (void)setTransformer:(id)a3;
@end

@implementation _UISceneLayerHostView

- (void)setStopsSecureSuperlayersValidation:(BOOL)a3
{
  self->_stopsSecureSuperlayersValidation = a3;
}

- (void)setStopsHitTestTransformAccumulation:(BOOL)a3
{
  self->_stopsHitTestTransformAccumulation = a3;
}

- (void)setTransformer:(id)a3
{
}

- (void)setResizesHostedContext:(BOOL)a3
{
  self->_resizesHostedContext = a3;
}

- (void)setInheritsSecurity:(BOOL)a3
{
  self->_inheritsSecurity = a3;
}

- (void)setCurrentPresentationContext:(id)a3
{
}

- (_UISceneLayerHostView)initWithSceneLayer:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UISceneLayerHostView.m", 36, @"Invalid parameter not satisfying: %@", @"sceneLayer" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)_UISceneLayerHostView;
  v7 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_sceneLayer, a3);
    [(UIView *)v8 setClipsToBounds:1];
    v9 = [(UIView *)v8 layer];
    [v9 setEdgeAntialiasingMask:0];
  }
  return v8;
}

- (FBSceneLayer)sceneLayer
{
  return self->_sceneLayer;
}

- (UITransformer)transformer
{
  return self->_transformer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPresentationContext, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_sceneLayer, 0);
}

- (_UISceneLayerHostView)initWithFrame:(CGRect)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v5 handleFailureInMethod:a2 object:self file:@"_UISceneLayerHostView.m" lineNumber:31 description:@"initWithFrame is unavailable."];

  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UISceneLayerHostView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UISceneLayerHostView *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  v7 = v5;

  return v7;
}

- (UIScenePresentationContext)currentPresentationContext
{
  return self->_currentPresentationContext;
}

- (BOOL)inheritsSecurity
{
  return self->_inheritsSecurity;
}

- (BOOL)resizesHostedContext
{
  return self->_resizesHostedContext;
}

- (BOOL)stopsHitTestTransformAccumulation
{
  return self->_stopsHitTestTransformAccumulation;
}

- (BOOL)stopsSecureSuperlayersValidation
{
  return self->_stopsSecureSuperlayersValidation;
}

@end
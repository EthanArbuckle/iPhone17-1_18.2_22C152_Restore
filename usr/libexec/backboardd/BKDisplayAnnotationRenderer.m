@interface BKDisplayAnnotationRenderer
- (BKDisplayAnnotation)annotation;
- (BOOL)shouldRenderWithSupernode;
- (CALayer)layer;
- (void)didRemoveAnnotation;
- (void)locationDidChange;
- (void)regenerateLayerTree;
- (void)setAnnotation:(id)a3;
- (void)setLayer:(id)a3;
- (void)sizeLayerToFitAtScale:(double)a3;
- (void)styleSheetDidChange;
@end

@implementation BKDisplayAnnotationRenderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layer, 0);

  objc_destroyWeak((id *)&self->_annotation);
}

- (void)setLayer:(id)a3
{
}

- (void)setAnnotation:(id)a3
{
}

- (BKDisplayAnnotation)annotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotation);

  return (BKDisplayAnnotation *)WeakRetained;
}

- (void)regenerateLayerTree
{
  id v17 = [(BKDisplayAnnotationRenderer *)self annotation];
  v3 = [v17 location];
  v4 = [v17 annotationController];
  v5 = [v4 rootLayer];
  v6 = [v4 transformLayer];
  v7 = [v4 referenceSpaceLayer];
  [v5 rasterizationScale];
  double v9 = v8;
  v10 = [(BKDisplayAnnotationRenderer *)self layer];
  id v11 = v6;
  unsigned __int8 v12 = [v3 definedInReferenceSpace];
  v13 = v7;
  if ((v12 & 1) != 0 || (unsigned int v14 = [v3 inhibitRotation], v13 = v5, v15 = v11, v14))
  {
    id v15 = v13;
  }
  id v16 = [v10 superlayer];

  if (v16 != v15)
  {
    [v10 removeFromSuperlayer];
    [v15 addSublayer:v10];
  }
  [(BKDisplayAnnotationRenderer *)self sizeLayerToFitAtScale:v9];
  [(BKDisplayAnnotationRenderer *)self locationDidChange];
}

- (void)sizeLayerToFitAtScale:(double)a3
{
  id v7 = [(BKDisplayAnnotationRenderer *)self layer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotation);
  v6 = [WeakRetained styleSheet];
  [v6 sizeLayer:v7 toFitAtScale:a3];
}

- (CALayer)layer
{
  p_layer = &self->_layer;
  v4 = self->_layer;
  id WeakRetained = objc_loadWeakRetained((id *)p_layer - 1);
  v6 = [WeakRetained annotationController];
  id v7 = v6;
  if (v4) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8)
  {
    double v9 = [v6 rootLayer];
    [v9 rasterizationScale];
    double v11 = v10;
    unsigned __int8 v12 = [WeakRetained styleSheet];
    v13 = [WeakRetained content];
    v4 = (CALayer *)[v12 newLayerForContent:v13 scale:v11];

    objc_storeStrong((id *)p_layer, v4);
    self->_shouldReapplyStyles = 1;
  }
  if (v4 && self->_shouldReapplyStyles)
  {
    unsigned int v14 = [WeakRetained styleSheet];
    id v15 = [WeakRetained content];
    [v14 applyToLayer:v4 forContent:v15];

    self->_shouldReapplyStyles = 0;
  }
  id v16 = *p_layer;

  return v16;
}

- (void)styleSheetDidChange
{
  id v6 = [(BKDisplayAnnotationRenderer *)self annotation];
  v3 = [v6 styleSheet];
  self->_shouldReapplyStyles = 1;
  if (self->_layer)
  {
    v4 = [(BKDisplayAnnotationRenderer *)self layer];
    v5 = [v6 content];
    [v3 applyToLayer:v4 forContent:v5];

    [(CALayer *)self->_layer setNeedsDisplay];
  }
}

- (void)didRemoveAnnotation
{
  [(CALayer *)self->_layer removeFromSuperlayer];
  layer = self->_layer;
  self->_layer = 0;

  self->_shouldReapplyStyles = 1;
}

- (void)locationDidChange
{
  id v34 = [(BKDisplayAnnotationRenderer *)self layer];
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v3 = [(BKDisplayAnnotationRenderer *)self annotation];
  v4 = [v3 location];
  if ([v4 definedInReferenceSpace])
  {
    [v4 superBias];
    [v34 setAnchorPoint:];
    [v4 point];
    [v34 setPosition:];
  }
  else
  {
    if ([v4 shouldAutoposition])
    {
      v5 = [v34 superlayer];
      [v5 bounds];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [v4 superBias];
      double v15 = v14;
      double v17 = v16;
      v36.origin.x = v7;
      v36.origin.y = v9;
      v36.size.width = v11;
      v36.size.height = v13;
      CGFloat v18 = CGRectGetMaxX(v36) * v15;
      v37.origin.x = v7;
      v37.origin.y = v9;
      v37.size.width = v11;
      v37.size.height = v13;
      double v19 = v17 * CGRectGetMaxY(v37);
      [v34 setAnchorPoint:v15, v17];
      [v34 setPosition:v18, v19];
    }
    else
    {
      [v4 point];
      v5 = [v3 annotationController];
      v20 = [v5 display];
      v21 = [v20 uniqueId];

      v22 = [v5 context];
      id v23 = [v22 contextId];

      sub_100010B54(v21);
      double v26 = sub_100010C48((uint64_t)v23, v21, v24, v25);
      double v28 = v27;
      v29 = [v34 superlayer];
      [v29 convertPoint:0 fromLayer:v26];
      double v31 = v30;
      double v33 = v32;

      [v4 superBias];
      [v34 setAnchorPoint:];
      [v34 setPosition:v31, v33];
    }
  }
  +[CATransaction commit];
}

- (BOOL)shouldRenderWithSupernode
{
  return 0;
}

@end
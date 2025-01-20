@interface TUILayerContainerView
+ (id)renderModelWithLayerModel:(id)a3 identifier:(id)a4;
- (TUILayerContainerView)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)applyLayoutAttributes:(id)a3;
- (void)configureWithModel:(id)a3;
- (void)prepareForReuse;
- (void)viewDidEndDisplay;
@end

@implementation TUILayerContainerView

- (TUILayerContainerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUILayerContainerView;
  v3 = -[TUILayerContainerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TUILayerContainerView *)v3 setUserInteractionEnabled:0];
    [(TUILayerContainerView *)v4 setClipsToBounds:0];
  }
  return v4;
}

+ (id)renderModelWithLayerModel:(id)a3 identifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[TUIRenderModelView alloc] initWithReuseIdentifier:@"TUIIdentifierLayerContainerView" identifier:v5 submodel:v6];

  return v7;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)TUILayerContainerView;
  [(TUILayerContainerView *)&v3 _dynamicUserInterfaceTraitDidChange];
  if (+[UIView areAnimationsEnabled])
  {
    [(TUIRenderModelLayerBuilder *)self->_builder dynamicUserInterfaceTraitDidChange];
  }
  else
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(TUIRenderModelLayerBuilder *)self->_builder dynamicUserInterfaceTraitDidChange];
    +[CATransaction commit];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TUILayerContainerView;
  id v4 = a3;
  [(TUIReusableBaseView *)&v7 applyLayoutAttributes:v4];
  id v5 = [v4 renderModel];

  id v6 = [v5 submodel];
  [(TUILayerContainerView *)self configureWithModel:v6];
}

- (void)configureWithModel:(id)a3
{
  id v4 = a3;
  if (!self->_builder)
  {
    id v5 = objc_alloc_init(TUIRenderModelLayerBuilder);
    builder = self->_builder;
    self->_builder = v5;
  }
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  objc_super v7 = +[_TUIAnimationState currentState];
  uint64_t v8 = [(TUIRenderModelLayerBuilder *)self->_builder model];
  v9 = (void *)v8;
  unsigned int v10 = 0;
  if (v4 && v8)
  {
    v11 = [(TUIRenderModelLayerBuilder *)self->_builder model];
    v12 = [v11 identifier];
    v13 = [v4 identifier];
    unsigned int v10 = [v12 isEqual:v13];
  }
  unsigned int v14 = [v7 shouldCaptureCALayerAnimations];
  v15 = [v4 config];
  if (objc_opt_respondsToSelector()) {
    unsigned int v16 = [v15 clipContainerForCrossfade];
  }
  else {
    unsigned int v16 = 0;
  }
  [v7 duration];
  double v18 = v17;
  v61 = v15;
  if (v10) {
    unsigned int v10 = [v7 shouldCaptureCALayerAnimations];
  }
  containerClipLayer = self->_containerClipLayer;
  if (containerClipLayer) {
    unsigned int v20 = 0;
  }
  else {
    unsigned int v20 = v16;
  }
  if (v20 == 1)
  {
    v21 = +[CALayer layer];
    v22 = self->_containerClipLayer;
    self->_containerClipLayer = v21;

    [(CALayer *)self->_containerClipLayer setDelegate:self->_builder];
    v23 = [(TUILayerContainerView *)self layer];
    [v23 addSublayer:self->_containerClipLayer];
LABEL_21:

    goto LABEL_22;
  }
  if (containerClipLayer) {
    char v24 = v16;
  }
  else {
    char v24 = 1;
  }
  if ((v24 & 1) == 0)
  {
    [(CALayer *)containerClipLayer removeFromSuperlayer];
    v23 = self->_containerClipLayer;
    self->_containerClipLayer = 0;
    goto LABEL_21;
  }
LABEL_22:
  if ((v16 & 1) == 0)
  {
    v25 = [(TUILayerContainerView *)self layer];
    v63 = 0;
    if (!v14) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  v25 = self->_containerClipLayer;
  v63 = [(TUILayerContainerView *)self layer];
  if (v14)
  {
LABEL_26:
    +[CATransaction begin];
    +[CATransaction setDisableActions:0];
  }
LABEL_27:
  [(TUIRenderModelLayerBuilder *)self->_builder setModel:v4];
  v26 = [(TUIRenderModelLayerBuilder *)self->_builder layer];
  [(TUILayerContainerView *)self bounds];
  -[CALayer setPosition:](v26, "setPosition:", v27 * 0.5, v28 * 0.5);
  if (self->_containerClipLayer)
  {
    [(CALayer *)v26 frame];
    double v30 = v29;
    double v32 = v31;
    -[CALayer setFrame:](self->_containerClipLayer, "setFrame:");
    CATransform3DMakeTranslation(&v65, -v30, -v32, 0.0);
    v33 = self->_containerClipLayer;
    CATransform3D v64 = v65;
    [(CALayer *)v33 setSublayerTransform:&v64];
  }
  v62 = v7;
  if (v14) {
    +[CATransaction commit];
  }
  p_contentLayer = &self->_contentLayer;
  if (self->_contentLayer == v26)
  {
    if (v26)
    {
      v40 = [(CALayer *)v26 superlayer];

      if (v40 != v25)
      {
        [(CALayer *)*p_contentLayer removeFromSuperlayer];
        [(CALayer *)v25 addSublayer:*p_contentLayer];
      }
    }
  }
  else
  {
    if (v10)
    {
      v35 = +[CATransition animation];
      [v35 setDuration:v18];
      v36 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
      [v35 setTimingFunction:v36];

      [v35 setRemovedOnCompletion:1];
      if (v16)
      {
        WeakRetained = (_TUILayerContainerClip *)objc_loadWeakRetained((id *)&self->_containerClip);
        if (!WeakRetained)
        {
          WeakRetained = [[_TUILayerContainerClip alloc] initWithLayer:v25];
          objc_storeWeak((id *)&self->_containerClip, WeakRetained);
        }
        [(_TUILayerContainerClip *)WeakRetained addAnimation:v35];
      }
      [(CALayer *)v25 addAnimation:v35 forKey:@"crossfade"];
    }
    if (objc_opt_respondsToSelector())
    {
      v38 = *p_contentLayer;
      if (v38)
      {
        v39 = [(TUIReusableBaseView *)self feedControllerHost];
        [(CALayer *)v38 willRemoveLayerWithFeedControllerHost:v39];
      }
    }
    else
    {
      v38 = 0;
    }
    [(CALayer *)*p_contentLayer removeFromSuperlayer];
    if (v26)
    {
      [(CALayer *)v25 addSublayer:v26];
      char v41 = objc_opt_respondsToSelector();
      if (v41) {
        v42 = v26;
      }
      else {
        v42 = 0;
      }
      v43 = v42;
      if (v41)
      {
        v44 = [(TUIReusableBaseView *)self feedControllerHost];
        [(CALayer *)v26 didAddLayerWithFeedControllerHost:v44];
      }
      [(CALayer *)v26 bounds];
      if (v46 > 8192.0 || v45 > 8192.0)
      {
        v47 = [(TUIReusableBaseView *)self feedControllerHost];
        [v47 reportLargeLayer:v26 renderModel:v4];
      }
    }
    objc_storeStrong((id *)&self->_contentLayer, v26);
  }
  v48 = [(CALayer *)*p_contentLayer compositingFilter];
  unsigned int v49 = TUILayerCompositingFilterNeedsBackdropLayer(v48);
  unsigned int v50 = v49;
  if (v48) {
    uint64_t v51 = v49;
  }
  else {
    uint64_t v51 = 1;
  }
  [(CALayer *)v25 setAllowsGroupBlending:v51];
  [v63 setAllowsGroupBlending:1];
  backdropLayer = self->_backdropLayer;
  if (v50)
  {
    if (backdropLayer)
    {
      v53 = [(CABackdropLayer *)backdropLayer superlayer];

      BOOL v54 = v53 == v25;
      v55 = v61;
      if (!v54)
      {
        [(CABackdropLayer *)self->_backdropLayer removeFromSuperlayer];
        [(CALayer *)v25 insertSublayer:self->_backdropLayer atIndex:0];
      }
    }
    else
    {
      v57 = +[CABackdropLayer layer];
      v58 = self->_backdropLayer;
      self->_backdropLayer = v57;

      [(CABackdropLayer *)self->_backdropLayer setDelegate:self->_builder];
      [(CALayer *)v25 insertSublayer:self->_backdropLayer atIndex:0];
      v55 = v61;
    }
  }
  else
  {
    v55 = v61;
    if (backdropLayer)
    {
      [(CABackdropLayer *)backdropLayer removeFromSuperlayer];
      v56 = self->_backdropLayer;
      self->_backdropLayer = 0;
    }
  }
  v59 = self->_backdropLayer;
  if (v59) {
    unsigned int v60 = v14;
  }
  else {
    unsigned int v60 = 0;
  }
  if (v60 == 1)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:0];
    [(CALayer *)*p_contentLayer frame];
    -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
    +[CATransaction commit];
  }
  else if (v59)
  {
    [(CALayer *)*p_contentLayer frame];
    -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
  }
  +[CATransaction commit];
}

- (void)viewDidEndDisplay
{
  v8.receiver = self;
  v8.super_class = (Class)TUILayerContainerView;
  [(TUIReusableBaseView *)&v8 viewDidEndDisplay];
  [(CALayer *)self->_contentLayer removeFromSuperlayer];
  contentLayer = self->_contentLayer;
  self->_contentLayer = 0;

  [(CABackdropLayer *)self->_backdropLayer removeFromSuperlayer];
  backdropLayer = self->_backdropLayer;
  self->_backdropLayer = 0;

  builder = self->_builder;
  self->_builder = 0;

  [(CALayer *)self->_containerClipLayer removeFromSuperlayer];
  containerClipLayer = self->_containerClipLayer;
  self->_containerClipLayer = 0;

  objc_super v7 = [(TUILayerContainerView *)self layer];
  [v7 setAllowsGroupBlending:1];
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)TUILayerContainerView;
  [(TUIReusableBaseView *)&v8 prepareForReuse];
  [(CALayer *)self->_contentLayer removeFromSuperlayer];
  contentLayer = self->_contentLayer;
  self->_contentLayer = 0;

  [(CABackdropLayer *)self->_backdropLayer removeFromSuperlayer];
  backdropLayer = self->_backdropLayer;
  self->_backdropLayer = 0;

  builder = self->_builder;
  self->_builder = 0;

  [(CALayer *)self->_containerClipLayer removeFromSuperlayer];
  containerClipLayer = self->_containerClipLayer;
  self->_containerClipLayer = 0;

  objc_super v7 = [(TUILayerContainerView *)self layer];
  [v7 setAllowsGroupBlending:1];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerClip);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_containerClipLayer, 0);

  objc_storeStrong((id *)&self->_builder, 0);
}

@end
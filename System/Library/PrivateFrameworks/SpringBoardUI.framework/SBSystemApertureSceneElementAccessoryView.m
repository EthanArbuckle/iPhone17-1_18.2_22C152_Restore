@interface SBSystemApertureSceneElementAccessoryView
- (BOOL)allowsReparentingByLayoutHost;
- (CGSize)preferredSize;
- (SBSystemApertureSceneElementAccessoryPortalView)portalView;
- (unint64_t)layerRenderingId;
- (unsigned)sourceContextId;
- (void)_configurePortalLayerWithSourceLayerRenderingId:(unint64_t)a3 contextId:(unsigned int)a4;
- (void)_configurePortalView;
- (void)layoutSubviews;
- (void)setLayerRenderingId:(unint64_t)a3;
- (void)setPreferredSize:(CGSize)a3;
- (void)setSourceContextId:(unsigned int)a3;
- (void)setSourceLayerRenderingId:(unint64_t)a3 contextId:(unsigned int)a4;
@end

@implementation SBSystemApertureSceneElementAccessoryView

- (void)setSourceLayerRenderingId:(unint64_t)a3 contextId:(unsigned int)a4
{
  if (self->_layerRenderingId != a3 || self->_sourceContextId != a4)
  {
    self->_layerRenderingId = a3;
    self->_sourceContextId = a4;
    [(SBSystemApertureSceneElementAccessoryView *)self _configurePortalView];
  }
}

- (void)_configurePortalView
{
  v3 = [(SBSystemApertureSceneElementAccessoryPortalView *)self->_portalView portalLayer];
  if ([v3 sourceLayerRenderId] == self->_layerRenderingId)
  {
    v4 = [(SBSystemApertureSceneElementAccessoryPortalView *)self->_portalView portalLayer];
    int v5 = [v4 sourceContextId];
    unsigned int sourceContextId = self->_sourceContextId;

    if (v5 == sourceContextId) {
      return;
    }
  }
  else
  {
  }
  if (!self->_portalView)
  {
    v7 = [SBSystemApertureSceneElementAccessoryPortalView alloc];
    [(SBSystemApertureSceneElementAccessoryView *)self bounds];
    v8 = -[SBSystemApertureSceneElementAccessoryPortalView initWithFrame:](v7, "initWithFrame:");
    portalView = self->_portalView;
    self->_portalView = v8;

    [(SBSystemApertureSceneElementAccessoryView *)self addSubview:self->_portalView];
    v10 = [(SBSystemApertureSceneElementAccessoryPortalView *)self->_portalView layer];
    [v10 setAllowsHitTesting:0];

    [(SBSystemApertureSceneElementAccessoryPortalView *)self->_portalView setUserInteractionEnabled:0];
  }
  unint64_t layerRenderingId = self->_layerRenderingId;
  uint64_t v12 = self->_sourceContextId;

  [(SBSystemApertureSceneElementAccessoryView *)self _configurePortalLayerWithSourceLayerRenderingId:layerRenderingId contextId:v12];
}

- (void)_configurePortalLayerWithSourceLayerRenderingId:(unint64_t)a3 contextId:(unsigned int)a4
{
  if (a3 && a4)
  {
    objc_initWeak(&location, self);
    v7 = [(SBSystemApertureSceneElementAccessoryPortalView *)self->_portalView portalLayer];
    objc_initWeak(&from, v7);

    v8 = (void *)*MEMORY[0x263F1D020];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __103__SBSystemApertureSceneElementAccessoryView__configurePortalLayerWithSourceLayerRenderingId_contextId___block_invoke;
    v11[3] = &unk_2645D41C8;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(v13, &from);
    unsigned int v14 = a4;
    v13[1] = (id)a3;
    objc_msgSend(v8, "sb_performBlockAfterCATransactionSynchronizedCommit:", v11);
    objc_destroyWeak(v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = [(SBSystemApertureSceneElementAccessoryPortalView *)self->_portalView portalLayer];
    [v9 setSourceLayerRenderId:0];

    id v10 = [(SBSystemApertureSceneElementAccessoryPortalView *)self->_portalView portalLayer];
    [v10 setSourceContextId:0];
  }
}

void __103__SBSystemApertureSceneElementAccessoryView__configurePortalLayerWithSourceLayerRenderingId_contextId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2)
  {
    int v3 = *(_DWORD *)(a1 + 56);
    if (v3 == [WeakRetained sourceContextId])
    {
      uint64_t v4 = *(void *)(a1 + 48);
      if (v4 == [WeakRetained layerRenderingId])
      {
        [v2 setSourceLayerRenderId:*(void *)(a1 + 48)];
        [v2 setSourceContextId:*(unsigned int *)(a1 + 56)];
      }
    }
  }
}

- (void)setPreferredSize:(CGSize)a3
{
  double v3 = fmax(a3.width, 0.0);
  double v4 = fmax(a3.height, 0.0);
  if (self->_preferredSize.width != v3 || self->_preferredSize.height != v4)
  {
    self->_preferredSize.width = v3;
    self->_preferredSize.height = v4;
    [(SBSystemApertureSceneElementAccessoryView *)self invalidateIntrinsicContentSize];
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBSystemApertureSceneElementAccessoryView;
  [(SBSystemApertureSceneElementAccessoryView *)&v5 layoutSubviews];
  double v3 = [(SBSystemApertureSceneElementAccessoryView *)self portalView];
  [(SBSystemApertureSceneElementAccessoryView *)self bounds];
  objc_msgSend(v3, "setFrame:");

  [(SBSystemApertureSceneElementAccessoryView *)self setUserInteractionEnabled:0];
  double v4 = [(SBSystemApertureSceneElementAccessoryView *)self layer];
  [v4 setAllowsHitTesting:0];
}

- (BOOL)allowsReparentingByLayoutHost
{
  return 1;
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (SBSystemApertureSceneElementAccessoryPortalView)portalView
{
  return self->_portalView;
}

- (unint64_t)layerRenderingId
{
  return self->_layerRenderingId;
}

- (void)setLayerRenderingId:(unint64_t)a3
{
  self->_unint64_t layerRenderingId = a3;
}

- (unsigned)sourceContextId
{
  return self->_sourceContextId;
}

- (void)setSourceContextId:(unsigned int)a3
{
  self->_unsigned int sourceContextId = a3;
}

- (void).cxx_destruct
{
}

@end
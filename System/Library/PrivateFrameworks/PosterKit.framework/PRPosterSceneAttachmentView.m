@interface PRPosterSceneAttachmentView
- (BOOL)isEmpty;
- (PUIPosterSceneAttachment)attachment;
- (id)contentLayer;
- (id)layerHost;
- (void)_teardownContentLayer;
- (void)invalidate;
- (void)layoutSubviews;
- (void)setAttachment:(id)a3;
@end

@implementation PRPosterSceneAttachmentView

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PRPosterSceneAttachmentView;
  [(PRPosterSceneAttachmentView *)&v6 layoutSubviews];
  v3 = [(PRPosterSceneAttachmentView *)self contentLayer];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 superlayer];
    [v5 bounds];
    objc_msgSend(v4, "setFrame:");
  }
}

- (void)setAttachment:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_attachment] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_attachment, a3);
    objc_super v6 = [(PRPosterSceneAttachmentView *)self layerHost];
    objc_msgSend(v6, "setContextId:", objc_msgSend(v5, "contextId"));
    v7.receiver = self;
    v7.super_class = (Class)PRPosterSceneAttachmentView;
    -[PRRenderingView setLevel:](&v7, sel_setLevel_, [v5 level]);
    [(PRPosterSceneAttachmentView *)self setNeedsLayout];
    [(PRPosterSceneAttachmentView *)self layoutIfNeeded];
  }
}

- (BOOL)isEmpty
{
  return self->_attachment == 0;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)PRPosterSceneAttachmentView;
  [(PRRenderingView *)&v3 invalidate];
  [(PRPosterSceneAttachmentView *)self setAttachment:0];
  [(PRPosterSceneAttachmentView *)self _teardownContentLayer];
}

- (void)_teardownContentLayer
{
  objc_super v3 = [(PRPosterSceneAttachmentView *)self contentLayer];
  [v3 removeFromSuperlayer];

  layerHost = self->_layerHost;
  self->_layerHost = 0;
}

- (id)contentLayer
{
  return self->_layerHost;
}

- (id)layerHost
{
  layerHost = self->_layerHost;
  if (!layerHost)
  {
    v4 = [MEMORY[0x1E4F39BF0] layer];
    id v5 = self->_layerHost;
    self->_layerHost = v4;

    objc_super v6 = self->_layerHost;
    objc_super v7 = [(PRPosterSceneAttachmentView *)self layer];
    [v7 bounds];
    -[CALayerHost setFrame:](v6, "setFrame:");

    v8 = [(PRPosterSceneAttachmentView *)self layer];
    [v8 addSublayer:self->_layerHost];

    layerHost = self->_layerHost;
  }
  v9 = layerHost;
  return v9;
}

- (PUIPosterSceneAttachment)attachment
{
  return self->_attachment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_layerHost, 0);
}

@end
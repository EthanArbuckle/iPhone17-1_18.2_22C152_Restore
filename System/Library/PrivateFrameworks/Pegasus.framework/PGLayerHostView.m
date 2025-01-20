@interface PGLayerHostView
- (PGHostedWindowHostingHandle)hostedWindowHostingHandle;
- (PGLayerHostView)initWithFrame:(CGRect)a3;
- (UIView)sceneView;
- (double)cornerRadiusScale;
- (void)_manageSharingOfTouchesBetweenClientAndHostContext;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCornerRadiusScale:(double)a3;
- (void)setHostedWindowHostingHandle:(id)a3;
- (void)setSceneView:(id)a3;
@end

@implementation PGLayerHostView

- (PGLayerHostView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureApplication initWithProcessIdentifier:](self);
  }

  v10.receiver = self;
  v10.super_class = (Class)PGLayerHostView;
  return -[PGLayerHostView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (void)dealloc
{
  v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PGPictureInPictureApplication initWithProcessIdentifier:](self);
  }

  v4.receiver = self;
  v4.super_class = (Class)PGLayerHostView;
  [(PGLayerHostView *)&v4 dealloc];
}

- (PGHostedWindowHostingHandle)hostedWindowHostingHandle
{
  return (PGHostedWindowHostingHandle *)[(_UIRemoteView *)self->_remoteView hostedWindowHostingHandle];
}

- (void)setHostedWindowHostingHandle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    remoteView = self->_remoteView;
    if (remoteView)
    {
      [(_UIRemoteView *)remoteView setHostedWindowHostingHandle:v4];
    }
    else
    {
      v6 = [MEMORY[0x1E4F432C0] viewWithHostedWindowHostingHandle:v4];
      v7 = self->_remoteView;
      self->_remoteView = v6;

      [(PGLayerHostView *)self addSubview:self->_remoteView];
    }
    [(PGLayerHostView *)self _manageSharingOfTouchesBetweenClientAndHostContext];
  }

  MEMORY[0x1F41817F8]();
}

- (void)setSceneView:(id)a3
{
  v5 = (UIView *)a3;
  sceneView = self->_sceneView;
  if (sceneView != v5)
  {
    v7 = v5;
    [(UIView *)sceneView removeFromSuperview];
    objc_storeStrong((id *)&self->_sceneView, a3);
    if (v7) {
      [(PGLayerHostView *)self addSubview:v7];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PGLayerHostView;
  [(PGLayerHostView *)&v4 layoutSubviews];
  sceneView = self->_sceneView;
  [(PGLayerHostView *)self bounds];
  -[UIView setFrame:](sceneView, "setFrame:");
}

- (void)_manageSharingOfTouchesBetweenClientAndHostContext
{
  p_touchDeliveryPolicyAssertion = &self->_touchDeliveryPolicyAssertion;
  touchDeliveryPolicyAssertion = self->_touchDeliveryPolicyAssertion;
  self->_touchDeliveryPolicyAssertion = 0;

  uint64_t v5 = [(PGLayerHostView *)self hostedWindowHostingHandle];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(PGLayerHostView *)self window];

    if (v7)
    {
      uint64_t v8 = [(_UIRemoteView *)self->_remoteView contextID];
      v9 = [(PGLayerHostView *)self window];
      uint64_t v10 = [v9 _contextId];

      id v11 = objc_alloc_init(MEMORY[0x1E4F4F3E8]);
      v12 = [MEMORY[0x1E4F4F3E0] policyRequiringSharingOfTouchesDeliveredToChildContextId:v8 withHostContextId:v10];
      v13 = [v11 endpoint];
      [v12 setAssertionEndpoint:v13];

      id v14 = v12;
      v15 = BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
      if (v15)
      {
        objc_storeStrong((id *)p_touchDeliveryPolicyAssertion, v11);
        objc_msgSend(v15, "ipc_addPolicy:", v14);
      }
    }
  }
}

void __69__PGLayerHostView__manageSharingOfTouchesBetweenClientAndHostContext__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __69__PGLayerHostView__manageSharingOfTouchesBetweenClientAndHostContext__block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
}

- (UIView)sceneView
{
  return self->_sceneView;
}

- (double)cornerRadiusScale
{
  return self->_cornerRadiusScale;
}

- (void)setCornerRadiusScale:(double)a3
{
  self->_cornerRadiusScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertion, 0);

  objc_storeStrong((id *)&self->_remoteView, 0);
}

void __69__PGLayerHostView__manageSharingOfTouchesBetweenClientAndHostContext__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = _PGLogMethodProem(*(void **)(a1 + 32), 0);
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = 138412802;
  v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_1B5645000, a3, OS_LOG_TYPE_DEBUG, "%@ - Sending touch delivery policy %@ failed with error: %@", (uint8_t *)&v8, 0x20u);
}

@end
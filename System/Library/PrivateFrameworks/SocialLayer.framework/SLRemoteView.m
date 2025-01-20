@interface SLRemoteView
- (BOOL)remoteContentIsLoaded;
- (BOOL)remoteRenderingEnabled;
- (BOOL)shouldInvalidatePreviousPlaceHolderSlotContent:(id)a3 forStyle:(id)a4;
- (OS_dispatch_queue)remoteRenderingQueue;
- (SLDServiceProxy)serviceProxy;
- (SLRemoteView)initWithServiceProxyClass:(Class)a3 maxWidth:(double)a4;
- (UISSlotAnyContent)placeholderSlotContent;
- (UISSlotStyle)lastRenderedSlotStyle;
- (_UISlotView)slotView;
- (double)maxWidth;
- (id)_contentProviderForCurrentConfiguration;
- (id)_finalSlotStyleForStyle:(id)a3;
- (id)makePlaceholderSlotContentForStyle:(id)a3;
- (void)_provideContentForLayerContextID:(unint64_t)a3 style:(id)a4 yield:(id)a5;
- (void)serviceProxyDidConnect:(id)a3;
- (void)serviceProxyDidDisconnect:(id)a3;
- (void)setLastRenderedSlotStyle:(id)a3;
- (void)setMaxWidth:(double)a3;
- (void)setPlaceholderSlotContent:(id)a3;
- (void)setRemoteContentIsLoaded:(BOOL)a3;
- (void)setRemoteRenderingEnabled:(BOOL)a3;
@end

@implementation SLRemoteView

- (SLRemoteView)initWithServiceProxyClass:(Class)a3 maxWidth:(double)a4
{
  v42[4] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)SLRemoteView;
  v5 = -[SLRemoteView initWithFrame:](&v41, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_maxWidth = a4;
    v5->_remoteRenderingEnabled = 0;
    v7 = (_UISlotView *)objc_alloc_init(MEMORY[0x1E4FB22D0]);
    slotView = v6->_slotView;
    v6->_slotView = v7;

    v9 = [(SLRemoteView *)v6 _contentProviderForCurrentConfiguration];
    [(_UISlotView *)v6->_slotView _setSlotAnyContentProvider:v9];

    [(_UISlotView *)v6->_slotView setUserInteractionEnabled:0];
    [(_UISlotView *)v6->_slotView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SLRemoteView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(SLRemoteView *)v6 slotView];
    [(SLRemoteView *)v6 addSubview:v10];

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v37 = [(SLRemoteView *)v6 slotView];
    v36 = [v37 centerXAnchor];
    v35 = [(SLRemoteView *)v6 centerXAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v42[0] = v34;
    v33 = [(SLRemoteView *)v6 slotView];
    v32 = [v33 centerYAnchor];
    v31 = [(SLRemoteView *)v6 centerYAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v42[1] = v30;
    v11 = [(SLRemoteView *)v6 heightAnchor];
    v12 = [(SLRemoteView *)v6 slotView];
    v13 = [v12 heightAnchor];
    v14 = [v11 constraintEqualToAnchor:v13];
    v42[2] = v14;
    v15 = [(SLRemoteView *)v6 widthAnchor];
    v16 = [(SLRemoteView *)v6 slotView];
    v17 = [v16 widthAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];
    v42[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
    [v28 activateConstraints:v19];

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.SocialLayer.SLRemoteView.RemoteRendering", v21);
    remoteRenderingQueue = v6->_remoteRenderingQueue;
    v6->_remoteRenderingQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = +[SLDServiceProxy proxyForServiceClass:a3 targetSerialQueue:v6->_remoteRenderingQueue delegate:v6];
    serviceProxy = v6->_serviceProxy;
    v6->_serviceProxy = (SLDServiceProxy *)v24;

    objc_initWeak(&location, v6);
    v26 = [(SLRemoteView *)v6 remoteRenderingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SLRemoteView_initWithServiceProxyClass_maxWidth___block_invoke;
    block[3] = &unk_1E58A85E0;
    objc_copyWeak(&v39, &location);
    dispatch_async(v26, block);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __51__SLRemoteView_initWithServiceProxyClass_maxWidth___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained serviceProxy];
  [v1 connect];
}

- (void)setMaxWidth:(double)a3
{
  if (!SL_CGFloatApproximatelyEqualToFloat(a3, self->_maxWidth))
  {
    v5 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(SLRemoteView *)(uint64_t)self setMaxWidth:a3];
    }

    self->_maxWidth = a3;
    v6 = [(SLRemoteView *)self slotView];
    [v6 _updateContent];

    [(SLRemoteView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setRemoteContentIsLoaded:(BOOL)a3
{
  if (self->_remoteContentIsLoaded != a3)
  {
    self->_remoteContentIsLoaded = a3;
    [(SLRemoteView *)self remoteContentIsLoadedValueChanged];
  }
}

- (void)setRemoteRenderingEnabled:(BOOL)a3
{
  if (self->_remoteRenderingEnabled != a3)
  {
    self->_remoteRenderingEnabled = a3;
    if (a3)
    {
      v4 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        -[SLRemoteView setRemoteRenderingEnabled:](self, v4);
      }

      v5 = [(SLRemoteView *)self slotView];
      [v5 _updateContent];
    }
  }
}

- (BOOL)shouldInvalidatePreviousPlaceHolderSlotContent:(id)a3 forStyle:(id)a4
{
  return 1;
}

- (id)makePlaceholderSlotContentForStyle:(id)a3
{
  return 0;
}

- (id)_finalSlotStyleForStyle:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)_contentProviderForCurrentConfiguration
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SLRemoteView__contentProviderForCurrentConfiguration__block_invoke;
  v4[3] = &unk_1E58A8EA0;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __55__SLRemoteView__contentProviderForCurrentConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _provideContentForLayerContextID:a2 style:v8 yield:v7];
}

- (void)_provideContentForLayerContextID:(unint64_t)a3 style:(id)a4 yield:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  BOOL v10 = [(SLRemoteView *)self remoteContentIsLoaded];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5;
  v36 = __Block_byref_object_dispose__5;
  id v37 = [(SLRemoteView *)self _finalSlotStyleForStyle:v8];
  v11 = [(SLRemoteView *)self placeholderSlotContent];
  if ([(SLRemoteView *)self shouldInvalidatePreviousPlaceHolderSlotContent:v11 forStyle:v33[5]])
  {
    v12 = [(SLRemoteView *)self makePlaceholderSlotContentForStyle:v33[5]];
    [(SLRemoteView *)self setPlaceholderSlotContent:v12];
  }
  if (!v10) {
    goto LABEL_6;
  }
  [v11 contentSize];
  double v14 = v13;
  double v16 = v15;
  v17 = [(SLRemoteView *)self placeholderSlotContent];
  [v17 contentSize];
  double v19 = v18;
  double v21 = v20;

  if (v14 != v19 || v16 != v21)
  {
LABEL_6:
    dispatch_queue_t v22 = [(SLRemoteView *)self placeholderSlotContent];
    v9[2](v9, v22);
  }
  if ([(SLRemoteView *)self remoteRenderingEnabled]
    && ([(SLRemoteView *)self maxWidth], v23 <= 0.0))
  {
    v27 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[SLRemoteView _provideContentForLayerContextID:style:yield:]((uint64_t)self, v27);
    }
  }
  else if ([(SLRemoteView *)self remoteRenderingEnabled])
  {
    uint64_t v24 = [(SLRemoteView *)self serviceProxy];
    int v25 = [v24 connectionActive];

    if (v25)
    {
      v26 = [(SLRemoteView *)self remoteRenderingQueue];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __61__SLRemoteView__provideContentForLayerContextID_style_yield___block_invoke;
      v28[3] = &unk_1E58A8EC8;
      v28[4] = self;
      v30 = &v32;
      unint64_t v31 = a3;
      v29 = v9;
      dispatch_async(v26, v28);
    }
  }

  _Block_object_dispose(&v32, 8);
}

uint64_t __61__SLRemoteView__provideContentForLayerContextID_style_yield___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) renderRemoteContentForLayerContextID:*(void *)(a1 + 56) style:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) yield:*(void *)(a1 + 40)];
}

- (void)serviceProxyDidConnect:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SLRemoteView_serviceProxyDidConnect___block_invoke;
  block[3] = &unk_1E58A8720;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __39__SLRemoteView_serviceProxyDidConnect___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) slotView];
  [v1 _updateContent];
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  [(SLRemoteView *)self setLastRenderedSlotStyle:0];
  [(SLRemoteView *)self setRemoteContentIsLoaded:0];
}

- (BOOL)remoteContentIsLoaded
{
  return self->_remoteContentIsLoaded;
}

- (BOOL)remoteRenderingEnabled
{
  return self->_remoteRenderingEnabled;
}

- (OS_dispatch_queue)remoteRenderingQueue
{
  return self->_remoteRenderingQueue;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (UISSlotAnyContent)placeholderSlotContent
{
  return self->_placeholderSlotContent;
}

- (void)setPlaceholderSlotContent:(id)a3
{
}

- (UISSlotStyle)lastRenderedSlotStyle
{
  return self->_lastRenderedSlotStyle;
}

- (void)setLastRenderedSlotStyle:(id)a3
{
}

- (SLDServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (_UISlotView)slotView
{
  return self->_slotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotView, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_lastRenderedSlotStyle, 0);
  objc_storeStrong((id *)&self->_placeholderSlotContent, 0);
  objc_storeStrong((id *)&self->_remoteRenderingQueue, 0);
}

- (void)setMaxWidth:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_19BE17000, a2, OS_LOG_TYPE_DEBUG, "[SLRemoteView: %p] Updating remote content with NEW max width: [%f]", (uint8_t *)&v3, 0x16u);
}

- (void)setRemoteRenderingEnabled:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [a1 maxWidth];
  int v5 = 134218240;
  double v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_19BE17000, a2, OS_LOG_TYPE_DEBUG, "[SLRemoteView: %p] Remote rendering is now enabled. Updating remote content with max width: [%f]", (uint8_t *)&v5, 0x16u);
}

- (void)_provideContentForLayerContextID:(uint64_t)a1 style:(NSObject *)a2 yield:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[SLRemoteView %p] Remote rendering was enabled, but maxWidth is still zero; this is a bug! We will not render remote"
    " content to avoid unexpected behavior.",
    (uint8_t *)&v2,
    0xCu);
}

@end
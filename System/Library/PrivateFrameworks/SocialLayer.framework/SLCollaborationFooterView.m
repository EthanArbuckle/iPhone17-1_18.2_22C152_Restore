@interface SLCollaborationFooterView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SLCollaborationFooterView)initWithModel:(id)a3 maxWidth:(double)a4;
- (SLCollaborationFooterViewDelegate)delegate;
- (SLCollaborationFooterViewModel)model;
- (double)expectedHeightForWidth:(double)a3;
- (id)makePlaceholderSlotContentForStyle:(id)a3;
- (void)renderRemoteContentForLayerContextID:(unint64_t)a3 style:(id)a4 yield:(id)a5;
- (void)setDelegate:(id)a3;
- (void)updateRemoteRenderingEnabled;
- (void)updateWithNewModel:(id)a3;
@end

@implementation SLCollaborationFooterView

- (SLCollaborationFooterView)initWithModel:(id)a3 maxWidth:(double)a4
{
  v6 = (SLCollaborationFooterViewModel *)a3;
  uint64_t v7 = objc_opt_class();
  v11.receiver = self;
  v11.super_class = (Class)SLCollaborationFooterView;
  v8 = [(SLRemoteView *)&v11 initWithServiceProxyClass:v7 maxWidth:a4];
  model = v8->_model;
  v8->_model = v6;

  [(SLCollaborationFooterView *)v8 updateRemoteRenderingEnabled];
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[SLCollaborationFooterView expectedHeightForWidth:](self, "expectedHeightForWidth:", a3.width, a3.height);
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(SLRemoteView *)self maxWidth];
  double v4 = v3;
  [(SLRemoteView *)self maxWidth];
  -[SLCollaborationFooterView expectedHeightForWidth:](self, "expectedHeightForWidth:");
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (double)expectedHeightForWidth:(double)a3
{
  [(SLRemoteView *)self maxWidth];
  BOOL v6 = SL_CGFloatApproximatelyEqualToFloat(a3, v5);
  double v7 = 0.0;
  if (v6)
  {
    v8 = [(SLRemoteView *)self slotView];
    [v8 intrinsicContentSize];
    double v7 = v9;
  }
  return v7;
}

- (void)updateWithNewModel:(id)a3
{
  id v8 = a3;
  double v5 = [(SLCollaborationFooterView *)self model];
  char v6 = [v8 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_model, a3);
    [(SLCollaborationFooterView *)self updateRemoteRenderingEnabled];
    double v7 = [(SLRemoteView *)self slotView];
    [v7 _updateContent];
  }
}

- (void)updateRemoteRenderingEnabled
{
}

- (id)makePlaceholderSlotContentForStyle:(id)a3
{
  id v4 = a3;
  double v5 = [SLDFooterViewEmptySlotContent alloc];
  [(SLRemoteView *)self maxWidth];
  char v6 = -[SLDFooterViewEmptySlotContent initWithStyle:maxWidth:forRemote:](v5, "initWithStyle:maxWidth:forRemote:", v4, 0);

  return v6;
}

- (void)renderRemoteContentForLayerContextID:(unint64_t)a3 style:(id)a4 yield:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(SLRemoteView *)self serviceProxy];
  objc_super v11 = [v10 synchronousRemoteService];

  v12 = [(SLCollaborationFooterView *)self model];
  [(SLRemoteView *)self maxWidth];
  double v14 = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke;
  v17[3] = &unk_1E58A9A80;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  [v11 footerViewForModel:v12 style:v16 maxWidth:a3 layerContextID:v17 reply:v14];
}

void __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2;
  v6[3] = &unk_1E58A9940;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) lastRenderedSlotStyle];
  char v4 = [v3 isEqual:*(void *)(v2 + 8)];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) setLastRenderedSlotStyle:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) setRemoteContentIsLoaded:*(void *)(a1 + 48) != 0];
  if (*(void *)(a1 + 48))
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) invalidateIntrinsicContentSize];
    [*(id *)(a1 + 32) setNeedsLayout];
    [*(id *)(a1 + 32) layoutIfNeeded];
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 footerViewContentsDidChange:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2_cold_1((id *)v2, v5);
    }
  }
}

- (SLCollaborationFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SLCollaborationFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SLCollaborationFooterViewModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __78__SLCollaborationFooterView_renderRemoteContentForLayerContextID_style_yield___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = *a1;
  id v5 = [*a1 model];
  [*a1 maxWidth];
  int v7 = 134218498;
  id v8 = v4;
  __int16 v9 = 2112;
  v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[SLCollaborationFooterView: %p] sociallayerd returned nil remote content for model: [%@], maxWidth: [%f]", (uint8_t *)&v7, 0x20u);
}

@end
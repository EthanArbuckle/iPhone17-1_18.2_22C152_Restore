@interface _UITextLayoutCanvasView
- (BOOL)layoutFragmentViewsNeedDisplay;
- (BOOL)textViewportLayoutController:(id)a3 addRenderingSurface:(id)a4 group:(int64_t)a5 placement:(int64_t)a6;
- (CGRect)textViewportLayoutController:(id)a3 presentationLayoutFragmentFrameForTextLayoutFragment:(id)a4 proposedOrigin:(CGPoint)a5;
- (CGRect)viewportBoundsForTextViewportLayoutController:(id)a3;
- (NSCustomTextRendering)customRenderController;
- (NSTextContainer)textContainer;
- (NSTextLayoutManager)textLayoutManager;
- (UIView)selectionContainerView;
- (_UIAnimatedTextLayoutInfo)uniqueWritingToolsAnimatedLayoutInfo;
- (_UITextCanvasContext)context;
- (_UITextEmphasisBackgroundView)textEmphasisBackgroundView;
- (_UITextLayoutCanvasView)initWithTextLayoutManager:(id)a3 textContainer:(id)a4;
- (id)_internalTextLayoutController;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)textRangeAtPoint:(CGPoint)a3;
- (id)textRangeForBounds:(CGRect)a3 layoutIfNeeded:(BOOL)a4;
- (id)textViewportLayoutController:(id)a3 renderingSurfaceForTextLayoutFragment:(id)a4;
- (void)_performViewportLayout:(BOOL)a3;
- (void)_removeUnusedFragmentViews;
- (void)_traitsChanged;
- (void)_updateContentsScaleForCustomRenderController:(double)a3;
- (void)_updateTextEmphasisBackgroundViewForTextRange:(id)a3 inTextView:(id)a4 bounds:(CGRect)a5;
- (void)_updateTraitsForCustomTextRenderer:(id)a3;
- (void)_viewportDidLayout;
- (void)_viewportWillLayout;
- (void)configureCustomTextRenderer;
- (void)drawTextInRect:(CGRect)a3;
- (void)flushFragmentViews;
- (void)invalidateTemporaryAttributesInRange:(id)a3;
- (void)isEditingDidChange;
- (void)layoutSubviews;
- (void)setContext:(id)a3;
- (void)setLayoutFragmentViewsNeedDisplay:(BOOL)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNeedsLayout;
- (void)setSelectionContainerView:(id)a3;
- (void)setTextEmphasisBackgroundView:(id)a3 withTextView:(id)a4;
- (void)setUniqueWritingToolsAnimatedLayoutInfo:(id)a3;
- (void)textViewportLayoutController:(id)a3 configureRenderingSurfaceForTextLayoutFragment:(id)a4;
- (void)textViewportLayoutControllerDidLayout:(id)a3;
- (void)textViewportLayoutControllerWillLayout:(id)a3;
- (void)updateContentSizeIfNeeded;
@end

@implementation _UITextLayoutCanvasView

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)_UITextLayoutCanvasView;
  -[UIView setNeedsDisplayInRect:](&v18, sel_setNeedsDisplayInRect_);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = [(NSMapTable *)self->_viewportElementViews objectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v13 frame];
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        if (CGRectIntersectsRect(v21, v22)) {
          [v13 setNeedsDisplay];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (void)layoutSubviews
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(_UITextLayoutCanvasView *)self _performViewportLayout:1];
  if (self->_hoverEffectsLayer)
  {
    v3 = [(UIView *)self layer];
    [v3 bounds];
    -[_UITextLayoutCanvasViewHoverEffectContainerLayer setFrame:](self->_hoverEffectsLayer, "setFrame:");
  }
  v4 = [(_UITextLayoutCanvasView *)self customRenderController];
  v5 = v4;
  if (v4)
  {
    [v4 contentsScale];
    double v7 = v6;
    v8 = [(UIView *)self traitCollection];
    [v8 displayScale];
    double v10 = v9;

    if (v7 != v10)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Text", &layoutSubviews___s_category_0) + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = v12;
          [v5 contentsScale];
          uint64_t v15 = v14;
          long long v16 = [(UIView *)self traitCollection];
          [v16 displayScale];
          int v18 = 134349570;
          uint64_t v19 = v15;
          __int16 v20 = 2050;
          uint64_t v21 = v17;
          __int16 v22 = 2082;
          v23 = "-[_UITextLayoutCanvasView layoutSubviews]";
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Updating customRenderController.contentsScale ”%{public}.0f” with traitCollection.displayScale ”%{public}.0f” from %{public}s", (uint8_t *)&v18, 0x20u);
        }
      }
      uint64_t v11 = [(UIView *)self traitCollection];
      [v11 displayScale];
      -[_UITextLayoutCanvasView _updateContentsScaleForCustomRenderController:](self, "_updateContentsScaleForCustomRenderController:");
    }
  }
}

- (void)_performViewportLayout:(BOOL)a3
{
  if (!self->_inLayout)
  {
    BOOL v3 = a3;
    v5 = [(_UITextLayoutCanvasView *)self customRenderController];
    double v6 = v5;
    if (v3 && (*(unsigned char *)&self->_canvasViewFlags & 8) != 0) {
      [v5 preLayoutNotify];
    }
    self->_inLayout = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50___UITextLayoutCanvasView__performViewportLayout___block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    +[UIView performWithoutAnimation:v9];
    if (v3) {
      [(_UITextLayoutCanvasView *)self _viewportWillLayout];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50___UITextLayoutCanvasView__performViewportLayout___block_invoke_2;
    v8[3] = &unk_1E52D9F70;
    v8[4] = self;
    +[UIView performWithoutAnimation:v8];
    if (v3) {
      [(_UITextLayoutCanvasView *)self _viewportDidLayout];
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50___UITextLayoutCanvasView__performViewportLayout___block_invoke_3;
    v7[3] = &unk_1E52D9F70;
    v7[4] = self;
    +[UIView performWithoutAnimation:v7];
    self->_inLayout = 0;
    if (v3 && (*(unsigned char *)&self->_canvasViewFlags & 8) != 0) {
      [v6 postLayoutNotify];
    }
  }
}

- (void)_viewportWillLayout
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_selectionContainerView)
  {
    BOOL v3 = (NSMutableSet *)[(NSMutableSet *)self->_currentClientAuxiliaryViews mutableCopy];
    oldClientAuxiliaryViews = self->_oldClientAuxiliaryViews;
    self->_oldClientAuxiliaryViews = v3;

    [(NSMutableSet *)self->_oldClientAuxiliaryViews makeObjectsPerformSelector:sel_removeFromSuperview];
    [(NSMutableSet *)self->_currentClientAuxiliaryViews removeAllObjects];
    [(UIView *)self insertSubview:self->_selectionContainerView atIndex:0];
    [(UIView *)self bounds];
    -[UIView setFrame:](self->_selectionContainerView, "setFrame:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(NSMapTable *)self->_viewportElementViews keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NSMutableSet *)self->_viewportElementsToRemove addObject:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(_UITextLayoutCanvasView *)self configureCustomTextRenderer];
  double v10 = [(_UITextLayoutCanvasView *)self customRenderController];
  [v10 beginLayout];
}

- (void)configureCustomTextRenderer
{
  v15[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UITextLayoutCanvasView *)self customRenderController];
  v4 = v3;
  if (self->_lastCustomRenderController != v3)
  {
    self->_lastCustomRenderController = v3;
    *(unsigned char *)&self->_canvasViewFlags = *(unsigned char *)&self->_canvasViewFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_canvasViewFlags = *(unsigned char *)&self->_canvasViewFlags & 0xFD | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_canvasViewFlags = *(unsigned char *)&self->_canvasViewFlags & 0xFB | v6;
    char v7 = objc_opt_respondsToSelector();
    char v8 = 0;
    if (v7)
    {
      if (objc_opt_respondsToSelector()) {
        char v8 = 8;
      }
      else {
        char v8 = 0;
      }
    }
    *(unsigned char *)&self->_canvasViewFlags = *(unsigned char *)&self->_canvasViewFlags & 0xF7 | v8;
    uint64_t v9 = [(UIView *)self traitCollection];
    [(_UITextLayoutCanvasView *)self _updateTraitsForCustomTextRenderer:v9];

    [(_UITextLayoutCanvasView *)self _removeUnusedFragmentViews];
    traitChangeToken = self->_traitChangeToken;
    if (self->_lastCustomRenderController)
    {
      if (!traitChangeToken)
      {
        v15[0] = objc_opt_class();
        v15[1] = objc_opt_class();
        long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
        long long v12 = [(UIView *)self registerForTraitChanges:v11 withTarget:self action:sel__traitsChanged];
        long long v13 = self->_traitChangeToken;
        self->_traitChangeToken = v12;
      }
    }
    else if (traitChangeToken)
    {
      -[UIView unregisterForTraitChanges:](self, "unregisterForTraitChanges:");
      long long v14 = self->_traitChangeToken;
      self->_traitChangeToken = 0;
    }
  }
}

- (void)_viewportDidLayout
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(NSMutableSet *)self->_oldClientAuxiliaryViews removeAllObjects];
  oldClientAuxiliaryViews = self->_oldClientAuxiliaryViews;
  self->_oldClientAuxiliaryViews = 0;

  [(_UITextLayoutCanvasView *)self _removeUnusedFragmentViews];
  v4 = [(_UITextLayoutCanvasView *)self customRenderController];
  char v5 = v4;
  if (v4)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke;
    v27[3] = &unk_1E52D9F98;
    id v6 = v4;
    id v28 = v6;
    v29 = self;
    +[UIView performWithoutAnimation:v27];

    p_layoutFragmentViewsNeedDisplaCGFloat y = &self->_layoutFragmentViewsNeedDisplay;
    if (self->_layoutFragmentViewsNeedDisplay && (*(unsigned char *)&self->_canvasViewFlags & 2) != 0) {
      [v6 setNeedsDisplay];
    }
  }
  else
  {
    p_layoutFragmentViewsNeedDisplaCGFloat y = &self->_layoutFragmentViewsNeedDisplay;
    if (self->_layoutFragmentViewsNeedDisplay)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      char v8 = self->_viewportElementViews;
      uint64_t v9 = [(NSMapTable *)v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v24 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = [(NSMapTable *)self->_viewportElementViews objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * i)];
            [v13 setNeedsDisplay];
          }
          uint64_t v10 = [(NSMapTable *)v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
        }
        while (v10);
      }
    }
  }
  long long v14 = [(NSTextViewportLayoutController *)self->_viewportLayoutController viewportRange];
  if (v14) {
    [(NSTextLayoutManager *)self->_textLayoutManager ensureLayoutForRange:v14];
  }
  [(_UITextLayoutCanvasView *)self updateContentSizeIfNeeded];
  uint64_t v15 = [(_UITextLayoutCanvasView *)self context];
  uint64_t v16 = (void *)[(NSMutableSet *)self->_textAttachmentViews mutableCopy];
  [v16 minusSet:self->_newTextAttachmentViews];
  if ([v16 count]) {
    [v15 didRemoveTextAttachmentViews:v16];
  }
  uint64_t v17 = (void *)[(NSMutableSet *)self->_newTextAttachmentViews mutableCopy];
  [v17 minusSet:self->_textAttachmentViews];
  if ([v17 count]) {
    [v15 didAddTextAttachmentViews:v17];
  }
  [(NSMutableSet *)self->_textAttachmentViews setSet:self->_newTextAttachmentViews];
  [(NSMutableSet *)self->_newTextAttachmentViews removeAllObjects];
  *p_layoutFragmentViewsNeedDisplaCGFloat y = 0;
  int v18 = [(_UITextLayoutCanvasView *)self _internalTextLayoutController];
  uint64_t v19 = [v18 searchableObject];
  __int16 v20 = v19;
  if (v19)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_4;
    v21[3] = &unk_1E52D9F70;
    id v22 = v19;
    +[UIView performWithoutAnimation:v21];
  }
}

- (void)updateContentSizeIfNeeded
{
  [(NSTextLayoutManager *)self->_textLayoutManager ui_contentSizeForLastContainerView];
  if (self->_contentSize.width != v3 || self->_contentSize.height != v4)
  {
    self->_contentSize.CGFloat width = v3;
    self->_contentSize.CGFloat height = v4;
    id v6 = [(NSTextLayoutManager *)self->_textLayoutManager textSelectionNavigation];
    [v6 flushLayoutCache];

    id v7 = [(_UITextLayoutCanvasView *)self context];
    objc_msgSend(v7, "textContainerUsageDidChangeToSize:", self->_contentSize.width, self->_contentSize.height);
  }
}

- (void)_removeUnusedFragmentViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = self->_viewportElementsToRemove;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = -[NSMapTable objectForKey:](self->_viewportElementViews, "objectForKey:", v8, (void)v11);
        [v9 teardown];

        uint64_t v10 = [(NSMapTable *)self->_viewportElementViews objectForKey:v8];
        [v10 removeFromSuperview];

        [(NSMapTable *)self->_viewportElementViews removeObjectForKey:v8];
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_viewportElementsToRemove removeAllObjects];
}

- (id)_internalTextLayoutController
{
  v2 = [(_UITextLayoutCanvasView *)self context];
  double v3 = [v2 textLayoutController];
  if (objc_opt_respondsToSelector()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)textViewportLayoutController:(id)a3 renderingSurfaceForTextLayoutFragment:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_UITextLayoutCanvasView *)self context];
  [v6 textContainerOrigin];
  double v8 = v7;
  double v10 = v9;
  long long v11 = [v6 textContainer];
  [v11 size];
  double v13 = v12;
  double v15 = v14;

  uint64_t v16 = [(_UITextLayoutCanvasView *)self customRenderController];
  [v6 _clipRectForFadedEdges];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  long long v25 = [(NSMapTable *)self->_viewportElementViews objectForKey:v5];
  if (v25)
  {
    long long v26 = v25;
    [v25 _setNeedsDisplayForWritingTools];
  }
  else
  {
    v27 = off_1E52D62A8;
    if (v16) {
      v27 = off_1E52D62A0;
    }
    long long v26 = objc_msgSend(objc_alloc(*v27), "initWithLayoutFragment:containerOrigin:containerSize:clipRect:", v5, v8, v10, v13, v15, v18, v20, v22, v24);
    [(NSMapTable *)self->_viewportElementViews setObject:v26 forKey:v5];
  }

  return v26;
}

- (void)textViewportLayoutController:(id)a3 configureRenderingSurfaceForTextLayoutFragment:(id)a4
{
  id v6 = a4;
  double v7 = [(_UITextLayoutCanvasView *)self context];
  [v7 textContainerOrigin];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [v7 textContainer];
  [v12 size];
  double v14 = v13;
  uint64_t v16 = v15;

  [v6 layoutFragmentFrame];
  if (CGRectGetWidth(v46) <= v14)
  {
    [v7 _clipRectForFadedEdges];
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    long long v25 = [(NSMapTable *)self->_viewportElementViews objectForKey:v6];
    if (!v25)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
    }
    [(UIView *)self addSubview:v25];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __103___UITextLayoutCanvasView_textViewportLayoutController_configureRenderingSurfaceForTextLayoutFragment___block_invoke;
    v45[3] = &__block_descriptor_96_e44_v16__0____UIMutableTextLayoutFragmentView__8l;
    *(CGFloat *)&v45[4] = v9;
    *(CGFloat *)&v45[5] = v11;
    *(double *)&v45[6] = v14;
    v45[7] = v16;
    v45[8] = v18;
    v45[9] = v20;
    v45[10] = v22;
    v45[11] = v24;
    [v25 performChanges:v45];
    [(NSMutableSet *)self->_viewportElementsToRemove removeObject:v6];
    long long v26 = [(_UITextLayoutCanvasView *)self customRenderController];
    [v26 didLayoutFragment:v6];

    [v6 layoutFragmentFrame];
    CGRect v48 = CGRectOffset(v47, v9, v11);
    CGFloat x = v48.origin.x;
    CGFloat y = v48.origin.y;
    CGFloat width = v48.size.width;
    CGFloat height = v48.size.height;
    uint64_t v31 = [v6 textLineFragments];
    if ([v31 count] == 1)
    {
      v32 = [v31 firstObject];
      [v32 typographicBounds];
      CGFloat v34 = v33;
      CGFloat v36 = v35;

      v49.origin.CGFloat x = x;
      v49.origin.CGFloat y = y;
      v49.size.CGFloat width = width;
      v49.size.CGFloat height = height;
      CGRect v50 = CGRectOffset(v49, v34, v36);
      CGFloat x = v50.origin.x;
      CGFloat y = v50.origin.y;
      CGFloat width = v50.size.width;
      CGFloat height = v50.size.height;
    }
    [v25 layoutIfNeeded];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __103___UITextLayoutCanvasView_textViewportLayoutController_configureRenderingSurfaceForTextLayoutFragment___block_invoke_2;
    v38[3] = &unk_1E52EF530;
    CGFloat v41 = x;
    CGFloat v42 = y;
    CGFloat v43 = width;
    CGFloat v44 = height;
    id v39 = v7;
    v40 = self;
    [v25 enumerateTextAttachmentViewsUsingBlock:v38];
    if (self->_hoverEffectsLayer) {
  }
    }
}

- (NSCustomTextRendering)customRenderController
{
  p_context = &self->_context;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if (objc_opt_respondsToSelector())
  {
    id v4 = objc_loadWeakRetained((id *)p_context);
    id v5 = [v4 customRenderController];
  }
  else
  {
    id v5 = 0;
  }

  return (NSCustomTextRendering *)v5;
}

- (_UITextCanvasContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (_UITextCanvasContext *)WeakRetained;
}

- (CGRect)viewportBoundsForTextViewportLayoutController:(id)a3
{
  [(UIView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [(_UITextLayoutCanvasView *)self context];
  [v12 textContainerOrigin];
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [v12 enclosingScrollView];
  uint64_t v18 = v17;
  if (v17)
  {
    [v17 bounds];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v18);
    CGFloat v5 = v19;
    CGFloat v7 = v20;
    CGFloat v9 = v21;
    CGFloat v11 = v22;
  }
  v31.origin.CGFloat x = v5;
  v31.origin.CGFloat y = v7;
  v31.size.CGFloat width = v9;
  v31.size.CGFloat height = v11;
  CGRect v32 = CGRectOffset(v31, -v14, -v16);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;

  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)_UITextLayoutCanvasView;
  [(UIView *)&v3 setNeedsDisplay];
  [(_UITextLayoutCanvasView *)self setNeedsLayout];
}

- (void)setNeedsLayout
{
  v5.receiver = self;
  v5.super_class = (Class)_UITextLayoutCanvasView;
  [(UIView *)&v5 setNeedsLayout];
  objc_super v3 = [(UIView *)self->_textEmphasisBackgroundView superview];
  if (v3 == self)
  {
    BOOL v4 = [(UIView *)self->_textEmphasisBackgroundView isHidden];

    if (!v4) {
      [(UIView *)self->_textEmphasisBackgroundView setNeedsDisplay];
    }
  }
  else
  {
  }
}

- (CGRect)textViewportLayoutController:(id)a3 presentationLayoutFragmentFrameForTextLayoutFragment:(id)a4 proposedOrigin:(CGPoint)a5
{
  id v6 = a4;
  CGFloat v7 = [v6 textParagraph];
  [v6 layoutFragmentFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if (v7)
  {
    double v16 = [(_UITextLayoutCanvasView *)self uniqueWritingToolsAnimatedLayoutInfo];
    uint64_t v17 = v16;
    if (!v16)
    {
      double v19 = [v7 attributedString];
      if (![v19 length]) {
        goto LABEL_12;
      }
      CGFloat v34 = [MEMORY[0x1E4F28B18] _animatedTextSpacerAttributeKey];
      double v20 = [v19 attribute:v34 atIndex:0 effectiveRange:0];

      if (!v20) {
        goto LABEL_12;
      }
      objc_msgSend(v20, "presentationFrameForTextLayoutFragmentFrame:", v9, v11, v13, v15);
      double v9 = v35;
      double v11 = v36;
      double v13 = v37;
      double v15 = v38;
LABEL_11:

LABEL_12:
      goto LABEL_13;
    }
    uint64_t v18 = [v16 animatingTextRange];
    double v19 = [v18 location];

    double v20 = [v6 rangeInElement];
    double v21 = [v17 animatingTextRange];
    double v22 = [v21 textRangeByIntersectingWithTextRange:v20];
    int v23 = [v22 isNotEmpty];

    if (!v23)
    {
LABEL_10:

      goto LABEL_11;
    }
    uint64_t v24 = [v17 animatedTextSpacer];
    long long v25 = [v21 endLocation];
    if (([v20 containsLocation:v25] & 1) == 0)
    {
      long long v26 = [v20 endLocation];
      double v27 = [v21 endLocation];
      if (![v26 isEqual:v27])
      {
        char v39 = [v20 isEqualToTextRange:v21];

        if ((v39 & 1) == 0) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
LABEL_8:
    [v24 verticalOffsetForSucceedingLayout];
    double v29 = v28;
    v40.origin.CGFloat x = v9;
    v40.origin.CGFloat y = v11;
    v40.size.CGFloat width = v13;
    v40.size.CGFloat height = v15;
    double v15 = v29 + CGRectGetHeight(v40);
LABEL_9:

    goto LABEL_10;
  }
LABEL_13:

  double v30 = v9;
  double v31 = v11;
  double v32 = v13;
  double v33 = v15;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (_UIAnimatedTextLayoutInfo)uniqueWritingToolsAnimatedLayoutInfo
{
  return self->_uniqueWritingToolsAnimatedLayoutInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueWritingToolsAnimatedLayoutInfo, 0);
  objc_storeStrong((id *)&self->_textEmphasisBackgroundView, 0);
  objc_storeStrong((id *)&self->_selectionContainerView, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_traitChangeToken, 0);
  objc_storeStrong((id *)&self->_hoverEffectsLayer, 0);
  objc_storeStrong((id *)&self->_oldClientAuxiliaryViews, 0);
  objc_storeStrong((id *)&self->_currentClientAuxiliaryViews, 0);
  objc_storeStrong((id *)&self->_newTextAttachmentViews, 0);
  objc_storeStrong((id *)&self->_textAttachmentViews, 0);
  objc_storeStrong((id *)&self->_viewportElementViews, 0);
  objc_storeStrong((id *)&self->_viewportElementsToRemove, 0);
  objc_storeStrong((id *)&self->_viewportLayoutController, 0);
}

- (void)textViewportLayoutControllerDidLayout:(id)a3
{
  if (!self->_inLayout)
  {
    id v4 = a3;
    [(_UITextLayoutCanvasView *)self _viewportDidLayout];
    id v6 = [(_UITextLayoutCanvasView *)self customRenderController];
    if (v6 && (*(unsigned char *)&self->_canvasViewFlags & 8) != 0) {
      [v6 postLayoutNotify];
    }
    objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"_UITextViewportLayoutControllerDidLayout" object:v4];
  }
}

- (void)setTextEmphasisBackgroundView:(id)a3 withTextView:(id)a4
{
  double v8 = (_UITextEmphasisBackgroundView *)a3;
  id v9 = a4;
  p_textEmphasisBackgroundView = &self->_textEmphasisBackgroundView;
  textEmphasisBackgroundView = self->_textEmphasisBackgroundView;
  if (textEmphasisBackgroundView != v8)
  {
    if (!v9)
    {
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"_UITextLayoutCanvasView.m" lineNumber:143 description:@"Improper text highlighting setup"];

      textEmphasisBackgroundView = *p_textEmphasisBackgroundView;
    }
    [(UIView *)textEmphasisBackgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_textEmphasisBackgroundView, a3);
    if (*p_textEmphasisBackgroundView)
    {
      objc_initWeak(&location, self);
      objc_initWeak(&from, v9);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      double v15 = __70___UITextLayoutCanvasView_setTextEmphasisBackgroundView_withTextView___block_invoke;
      double v16 = &unk_1E52EF470;
      objc_copyWeak(&v17, &from);
      objc_copyWeak(&v18, &location);
      [(NSTextViewportLayoutController *)self->_viewportLayoutController set_platformRenderingSurfaceUpdater:&v13];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      [(NSTextViewportLayoutController *)self->_viewportLayoutController set_platformRenderingSurfaceUpdater:0];
    }
    [(_UITextLayoutCanvasView *)self setNeedsLayout];
  }
}

- (UIView)selectionContainerView
{
  return self->_selectionContainerView;
}

- (void)setSelectionContainerView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  p_selectionContainerView = &self->_selectionContainerView;
  selectionContainerView = self->_selectionContainerView;
  if (selectionContainerView != v5)
  {
    double v8 = v5;
    [(UIView *)selectionContainerView removeFromSuperview];
    objc_storeStrong((id *)&self->_selectionContainerView, a3);
    if (*p_selectionContainerView) {
      [(UIView *)self insertSubview:*p_selectionContainerView atIndex:0];
    }
    [(_UITextLayoutCanvasView *)self setNeedsLayout];
    objc_super v5 = v8;
  }
}

- (void)textViewportLayoutControllerWillLayout:(id)a3
{
  if (!self->_inLayout)
  {
    id v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 postNotificationName:@"_UITextViewportLayoutControllerWillLayout" object:v5];

    id v9 = [(_UITextLayoutCanvasView *)self customRenderController];
    if (v9)
    {
      CGFloat v7 = [(_UITextLayoutCanvasView *)self customRenderController];
      double v8 = v7;
      if ((*(unsigned char *)&self->_canvasViewFlags & 8) != 0) {
        [v7 preLayoutNotify];
      }
    }
    [(_UITextLayoutCanvasView *)self _viewportWillLayout];
  }
}

- (void)setContext:(id)a3
{
}

- (_UITextLayoutCanvasView)initWithTextLayoutManager:(id)a3 textContainer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_UITextLayoutCanvasView;
  id v9 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textLayoutManager, a3);
    objc_storeStrong((id *)&v10->_textContainer, a4);
    double v11 = [v7 textContainers];
    v10->_textContainerIndeCGFloat x = [v11 indexOfObject:v8];

    double v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    textAttachmentViews = v10->_textAttachmentViews;
    v10->_textAttachmentViews = v12;

    uint64_t v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    newTextAttachmentViews = v10->_newTextAttachmentViews;
    v10->_newTextAttachmentViews = v14;

    double v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    viewportElementsToRemove = v10->_viewportElementsToRemove;
    v10->_viewportElementsToRemove = v16;

    uint64_t v18 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    viewportElementViews = v10->_viewportElementViews;
    v10->_viewportElementViews = (NSMapTable *)v18;

    uint64_t v20 = [v7 textViewportLayoutController];
    viewportLayoutController = v10->_viewportLayoutController;
    v10->_viewportLayoutController = (NSTextViewportLayoutController *)v20;

    [(NSTextViewportLayoutController *)v10->_viewportLayoutController setDelegate:v10];
    v10->_contentSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v10->_lastCustomRenderController = 0;
    traitChangeToken = v10->_traitChangeToken;
    v10->_traitChangeToken = 0;

    if (dyld_program_sdk_at_least()) {
      [(UIView *)v10 _setHostsLayoutEngine:1];
    }
    self;
    objc_storeStrong((id *)&v10->_hoverEffectsLayer, 0);
    if (v10->_hoverEffectsLayer)
    {
      [(_UITextLayoutCanvasViewHoverEffectContainerLayer *)v10->_hoverEffectsLayer setZPosition:10000.0];
      int v23 = [(UIView *)v10 layer];
      [v23 addSublayer:v10->_hoverEffectsLayer];
    }
  }

  return v10;
}

- (void)_updateTextEmphasisBackgroundViewForTextRange:(id)a3 inTextView:(id)a4 bounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = self->_textLayoutManager;
  uint64_t v14 = self->_viewportLayoutController;
  uint64_t v34 = 0;
  double v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  if (([v11 isEmpty] & 1) == 0)
  {
    v38[0] = v11;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    uint64_t v16 = [v12 _nsRangeForTextKitRanges:v15];
    uint64_t v18 = v17;

    double v19 = [v12 textStorage];
    if (v16 + v18 <= (unint64_t)[v19 length])
    {
      uint64_t v20 = *(void *)off_1E52D2318;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __91___UITextLayoutCanvasView__updateTextEmphasisBackgroundViewForTextRange_inTextView_bounds___block_invoke;
      v33[3] = &unk_1E52DE5D8;
      v33[4] = &v34;
      objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v20, v16, v18, 0, v33);
    }
  }
  if (*((unsigned char *)v35 + 24))
  {
    [(NSTextViewportLayoutController *)v14 addRenderingSurface:self->_textEmphasisBackgroundView key:@"_UITextViewHighlightBackgroundView" group:1 placement:1];
    double v21 = [(_UITextLayoutCanvasView *)self context];
    [(_UITextLayoutCanvasView *)v21 textContainerOrigin];
    double v23 = v22;
    double v25 = v24;
    [(UIView *)self->_textEmphasisBackgroundView frame];
    v41.origin.double x = v26;
    v41.origin.double y = v27;
    v41.size.double width = v28;
    v41.size.double height = v29;
    double v30 = y + v25;
    double v31 = x + v23;
    v39.origin.double x = v31;
    v39.origin.double y = v30;
    v39.size.double width = width;
    v39.size.double height = height;
    if (!NSEqualRects(v39, v41)) {
      -[UIView setFrame:](self->_textEmphasisBackgroundView, "setFrame:", v31, v30, width, height);
    }
    [(UIView *)self->_textEmphasisBackgroundView setHidden:0];
    [(_UITextEmphasisBackgroundView *)self->_textEmphasisBackgroundView setTextRange:v11];
    -[_UITextEmphasisBackgroundView setOrigin:](self->_textEmphasisBackgroundView, "setOrigin:", -x, -y);
    goto LABEL_10;
  }
  double v21 = [(UIView *)self->_textEmphasisBackgroundView superview];
  if (v21 != self)
  {
LABEL_10:

    goto LABEL_11;
  }
  [(UIView *)self->_textEmphasisBackgroundView frame];
  IsEmptdouble y = CGRectIsEmpty(v40);

  if (!IsEmpty) {
    [(UIView *)self->_textEmphasisBackgroundView setHidden:1];
  }
LABEL_11:
  _Block_object_dispose(&v34, 8);
}

- (id)textRangeForBounds:(CGRect)a3 layoutIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  CGFloat v26 = __Block_byref_object_copy__96;
  CGFloat v27 = __Block_byref_object_dispose__96;
  id v28 = 0;
  if (a4) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 0;
  }
  viewportLayoutController = self->_viewportLayoutController;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __61___UITextLayoutCanvasView_textRangeForBounds_layoutIfNeeded___block_invoke;
  v22[3] = &unk_1E52EF4E8;
  v22[4] = &v23;
  [(NSTextViewportLayoutController *)viewportLayoutController enumerateTextViewportElementsInRect:v10 options:v22 usingBlock:a3.origin.x];
  id v12 = (void *)v24[5];
  if (!v12)
  {
    if (v4)
    {
      [(UIView *)self frame];
      if (!CGRectIsEmpty(v30)) {
        [(_UITextLayoutCanvasView *)self _performViewportLayout:0];
      }
    }
    uint64_t v13 = self->_viewportLayoutController;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61___UITextLayoutCanvasView_textRangeForBounds_layoutIfNeeded___block_invoke_2;
    v21[3] = &unk_1E52EF4E8;
    void v21[4] = &v23;
    -[NSTextViewportLayoutController enumerateTextViewportElementsInRect:options:usingBlock:](v13, "enumerateTextViewportElementsInRect:options:usingBlock:", v10, v21, x, y, width, height);
    id v12 = (void *)v24[5];
    if (!v12)
    {
      id v14 = objc_alloc((Class)off_1E52D2EF8);
      double v15 = [(NSTextLayoutManager *)self->_textLayoutManager documentRange];
      uint64_t v16 = [v15 location];
      uint64_t v17 = [v14 initWithLocation:v16];
      uint64_t v18 = (void *)v24[5];
      v24[5] = v17;

      id v12 = (void *)v24[5];
    }
  }
  id v19 = v12;
  _Block_object_dispose(&v23, 8);

  return v19;
}

- (BOOL)textViewportLayoutController:(id)a3 addRenderingSurface:(id)a4 group:(int64_t)a5 placement:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  if (!v12)
  {
    if (os_variant_has_internal_diagnostics())
    {
      CGFloat v26 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v28 = 0;
        _os_log_fault_impl(&dword_1853B0000, v26, OS_LOG_TYPE_FAULT, "Received nil value in non-null parameter. Ignoring.", v28, 2u);
      }
    }
    else
    {
      uint64_t v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &textViewportLayoutController_addRenderingSurface_group_placement____s_category)+ 8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "Received nil value in non-null parameter. Ignoring.", buf, 2u);
      }
    }
  }
  selectionContainerView = self->_selectionContainerView;
  if (selectionContainerView)
  {
    id v14 = [(UIView *)selectionContainerView superview];

    if (v14 != self)
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"_UITextLayoutCanvasView.m" lineNumber:772 description:@"Non-nil _selectionContainerView is not in the subtree. UIKit to fix."];
    }
  }
  uint64_t v16 = [(UIView *)self->_selectionContainerView superview];
  if (v12) {
    BOOL v17 = v16 == self;
  }
  else {
    BOOL v17 = 0;
  }
  BOOL v18 = v17;

  if (v18)
  {
    id v19 = v12;
    if (a5)
    {
      if (a5 == 1)
      {
        if (a6) {
          [(UIView *)self insertSubview:v19 atIndex:0];
        }
        else {
          [(UIView *)self insertSubview:v19 belowSubview:self->_selectionContainerView];
        }
      }
      else
      {
        uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"_UITextLayoutCanvasView.m", 798, @"Unsupported rendering group value, not Background or Contents. %ld", a5 object file lineNumber description];
      }
    }
    else if (a6)
    {
      [(UIView *)self insertSubview:v19 aboveSubview:self->_selectionContainerView];
    }
    else
    {
      [(UIView *)self addSubview:v19];
    }
    if ([v19 translatesAutoresizingMaskIntoConstraints])
    {
      [v19 frame];
      if (CGRectEqualToRect(v29, *MEMORY[0x1E4F1DB28]))
      {
        [(UIView *)self bounds];
        objc_msgSend(v19, "setFrame:");
        [v19 setAutoresizingMask:18];
      }
      [v19 _setHostsLayoutEngine:1];
    }
    currentClientAuxiliaryViews = self->_currentClientAuxiliaryViews;
    if (!currentClientAuxiliaryViews)
    {
      double v22 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v23 = self->_currentClientAuxiliaryViews;
      self->_currentClientAuxiliaryViews = v22;

      currentClientAuxiliaryViews = self->_currentClientAuxiliaryViews;
    }
    [(NSMutableSet *)currentClientAuxiliaryViews addObject:v19];
    [(NSMutableSet *)self->_oldClientAuxiliaryViews removeObject:v19];
  }
  return v18;
}

- (void)setLayoutFragmentViewsNeedDisplay:(BOOL)a3
{
  self->_layoutFragmentViewsNeedDispladouble y = a3;
}

- (void)flushFragmentViews
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(NSMapTable *)self->_viewportElementViews keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NSMutableSet *)self->_viewportElementsToRemove addObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(_UITextLayoutCanvasView *)self _removeUnusedFragmentViews];
  [(NSMapTable *)self->_viewportElementViews removeAllObjects];
}

- (void)_traitsChanged
{
  id v3 = [(UIView *)self traitCollection];
  [(_UITextLayoutCanvasView *)self _updateTraitsForCustomTextRenderer:v3];
}

- (void)_updateTraitsForCustomTextRenderer:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_UITextLayoutCanvasView *)self customRenderController];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 contentsScale];
    double v8 = v7;
    [v4 displayScale];
    if (v8 != v9)
    {
      if (os_variant_has_internal_diagnostics())
      {
        long long v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Text", &_updateTraitsForCustomTextRenderer____s_category) + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          long long v11 = v10;
          [v6 contentsScale];
          uint64_t v13 = v12;
          [v4 displayScale];
          int v15 = 134349570;
          uint64_t v16 = v13;
          __int16 v17 = 2050;
          uint64_t v18 = v14;
          __int16 v19 = 2082;
          uint64_t v20 = "-[_UITextLayoutCanvasView _updateTraitsForCustomTextRenderer:]";
          _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Updating customRenderController.contentsScale ”%{public}.0f” with traitCollection.displayScale ”%{public}.0f” from %{public}s", (uint8_t *)&v15, 0x20u);
        }
      }
      [v4 displayScale];
      -[_UITextLayoutCanvasView _updateContentsScaleForCustomRenderController:](self, "_updateContentsScaleForCustomRenderController:");
    }
    if ((*(unsigned char *)&self->_canvasViewFlags & 2) != 0) {
      [v6 setNeedsDisplay];
    }
  }
}

- (void)_updateContentsScaleForCustomRenderController:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(_UITextLayoutCanvasView *)self customRenderController];
  uint64_t v6 = v5;
  if (v5)
  {
    if (*(unsigned char *)&self->_canvasViewFlags)
    {
      [v5 contentsScale];
      double v8 = v7;
      [v6 setContentsScale:a3];
      if (v8 != a3)
      {
        if (os_variant_has_internal_diagnostics())
        {
          double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Text", &_updateContentsScaleForCustomRenderController____s_category)+ 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            long long v10 = v9;
            [v6 contentsScale];
            int v12 = 134349056;
            uint64_t v13 = v11;
            _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Updated contents scale to %{public}.0f.", (uint8_t *)&v12, 0xCu);
          }
        }
      }
    }
  }
}

- (id)textRangeAtPoint:(CGPoint)a3
{
  return (id)-[NSTextViewportLayoutController locationAtPoint:](self->_viewportLayoutController, "locationAtPoint:", a3.x, a3.y);
}

- (void)isEditingDidChange
{
  hoverEffectsLayer = self->_hoverEffectsLayer;
  if (hoverEffectsLayer)
  {
    int v4 = [(_UITextLayoutCanvasViewHoverEffectContainerLayer *)hoverEffectsLayer isHidden];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    -[_UITextLayoutCanvasViewHoverEffectContainerLayer setHidden:](self->_hoverEffectsLayer, "setHidden:", [WeakRetained isEditing]);

    if (v4)
    {
      if (([(_UITextLayoutCanvasViewHoverEffectContainerLayer *)self->_hoverEffectsLayer isHidden] & 1) == 0)
      {
        [(_UITextLayoutCanvasView *)self setNeedsDisplay];
      }
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UITextLayoutCanvasView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (_UITextLayoutCanvasView *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5 == self) {
    uint64_t v5 = 0;
  }
  double v7 = v5;

  return v7;
}

- (void)invalidateTemporaryAttributesInRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UITextLayoutCanvasView *)self customRenderController];

  if (v5)
  {
    if ((*(unsigned char *)&self->_canvasViewFlags & 4) != 0)
    {
      double v7 = [v4 textKit2Ranges];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __64___UITextLayoutCanvasView_invalidateTemporaryAttributesInRange___block_invoke;
      v8[3] = &unk_1E52EF558;
      v8[4] = self;
      [v7 enumerateObjectsUsingBlock:v8];
    }
    else
    {
      uint64_t v6 = [(_UITextLayoutCanvasView *)self customRenderController];
      [v6 setNeedsDisplay];
    }
  }
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(_UITextLayoutCanvasView *)self context];
  [v8 textContainerOrigin];
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeTranslation(&v17, v10, v12);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v14);
  CGAffineTransform v16 = v17;
  CGContextConcatCTM(v14, &v16);
  int v15 = -[_UITextLayoutCanvasView textRangeForBounds:layoutIfNeeded:](self, "textRangeForBounds:layoutIfNeeded:", 1, x, y, width, height);
  _UITextLayoutDrawRangeInContext(self->_textLayoutManager, v15, (uint64_t)v14);
  CGContextRestoreGState(v14);
}

- (NSTextLayoutManager)textLayoutManager
{
  return self->_textLayoutManager;
}

- (BOOL)layoutFragmentViewsNeedDisplay
{
  return self->_layoutFragmentViewsNeedDisplay;
}

- (_UITextEmphasisBackgroundView)textEmphasisBackgroundView
{
  return self->_textEmphasisBackgroundView;
}

- (void)setUniqueWritingToolsAnimatedLayoutInfo:(id)a3
{
}

@end
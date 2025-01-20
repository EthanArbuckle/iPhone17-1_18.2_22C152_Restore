@interface _UITextCanvasView
+ (Class)layerClass;
- (BOOL)_drawsDebugBaselines;
- (BOOL)_enableAutoConstraining;
- (BOOL)isTilingEnabled;
- (BOOL)layoutFragmentViewsNeedDisplay;
- (_UITextCanvasView)initWithFrame:(CGRect)a3;
- (_UITextKit1CanvasContext)context;
- (double)maxTileHeight;
- (id)_textTiledLayer:(id)a3 maskedRectsInVisibleRect:(CGRect)a4;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_setDrawsDebugBaselines:(BOOL)a3;
- (void)_updateTilingViewportLayer;
- (void)addGhostedRange:(_NSRange)a3;
- (void)addInvisibleRange:(_NSRange)a3;
- (void)configureCustomTextRenderer;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)flushFragmentViews;
- (void)layoutSubviews;
- (void)removeAllGhostedRanges;
- (void)removeInvisibleRange:(_NSRange)a3;
- (void)resumeTiling;
- (void)setBounds:(CGRect)a3;
- (void)setContext:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayoutFragmentViewsNeedDisplay:(BOOL)a3;
- (void)setMaxTileHeight:(double)a3;
- (void)setNeedsLayout;
- (void)setTilingEnabled:(BOOL)a3;
- (void)suspendTiling;
@end

@implementation _UITextCanvasView

- (_UITextCanvasView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UITextCanvasView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    [(UIView *)v4 setContentMode:9];
    if ([(_UITextCanvasView *)v4 _enableAutoConstraining]) {
      -[UIView _addGeometryChangeObserver:](v4, v4);
    }
  }
  return v4;
}

- (void)dealloc
{
  if ([(_UITextCanvasView *)self _enableAutoConstraining]) {
    -[UIView _removeGeometryChangeObserver:](self, self);
  }
  v3.receiver = self;
  v3.super_class = (Class)_UITextCanvasView;
  [(UIView *)&v3 dealloc];
}

+ (Class)layerClass
{
  if (_MergedGlobals_7_9 != -1) {
    dispatch_once(&_MergedGlobals_7_9, &__block_literal_global_570);
  }
  v2 = (void *)qword_1EB25D5D0;
  return (Class)v2;
}

- (BOOL)_enableAutoConstraining
{
  return 1;
}

- (void)_updateTilingViewportLayer
{
  if ([(_UITextCanvasView *)self _enableAutoConstraining])
  {
    id v4 = [(UIView *)self layer];
    objc_super v3 = [(UIView *)self window];
    [v4 _updateTilingViewportWindow:v3];
  }
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextCanvasView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UITextCanvasView *)self _updateTilingViewportLayer];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextCanvasView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UITextCanvasView *)self _updateTilingViewportLayer];
}

- (void)setTilingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIView *)self layer];
  [v4 setUsesTiledLayers:v3];
}

- (BOOL)isTilingEnabled
{
  v2 = [(UIView *)self layer];
  char v3 = [v2 usesTiledLayers];

  return v3;
}

- (void)setMaxTileHeight:(double)a3
{
  id v4 = [(UIView *)self layer];
  [v4 setMaxTileHeight:a3];
}

- (double)maxTileHeight
{
  v2 = [(UIView *)self layer];
  [v2 maxTileHeight];
  double v4 = v3;

  return v4;
}

- (void)suspendTiling
{
  id v2 = [(UIView *)self layer];
  [v2 suspendTiling];
}

- (void)resumeTiling
{
  id v2 = [(UIView *)self layer];
  [v2 resumeTiling];
}

- (void)_setDrawsDebugBaselines:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(_UITextCanvasView *)self context];
  objc_super v6 = [v5 textLayoutController];
  [v6 setDrawsDebugBaselines:v3];

  [(UIView *)self setNeedsDisplay];
  [(UIView *)self _setNeedsContentsFormatUpdate];
}

- (BOOL)_drawsDebugBaselines
{
  id v2 = [(_UITextCanvasView *)self context];
  BOOL v3 = [v2 textLayoutController];
  char v4 = [v3 drawsDebugBaselines];

  return v4;
}

- (id)_textTiledLayer:(id)a3 maskedRectsInVisibleRect:(CGRect)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (!self->_maskedRects)
  {
    if ([(NSMutableSet *)self->_ghostedRanges count]|| [(NSMutableSet *)self->_invisibleRanges count])
    {
      v5 = [(_UITextCanvasView *)self context];
      objc_super v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableSet count](self->_invisibleRanges, "count")+ -[NSMutableSet count](self->_ghostedRanges, "count"));
      v60 = v5;
      v59 = [(NSArray *)v5 textContainer];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      obuint64_t j = self->_ghostedRanges;
      uint64_t v55 = [(NSMutableSet *)obj countByEnumeratingWithState:&v73 objects:v80 count:16];
      if (v55)
      {
        uint64_t v53 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v74 != v53) {
              objc_enumerationMutation(obj);
            }
            uint64_t v8 = [*(id *)(*((void *)&v73 + 1) + 8 * i) rangeValue];
            uint64_t v10 = v9;
            v11 = [(NSArray *)v60 textLayoutController];
            uint64_t v12 = objc_msgSend(v11, "textRangeForCharacterRange:", v8, v10);

            v57 = (void *)v12;
            v13 = [[_UIBoundingTextRectsSolver alloc] initWithTextContainer:v59 range:v12 unifyRects:0];
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            v14 = [(_UIBoundingTextRectsSolver *)v13 rects];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v69 objects:v79 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v70;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v70 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  [*(id *)(*((void *)&v69 + 1) + 8 * j) CGRectValue];
                  UIFloorToViewScale(self);
                  double v20 = v19;
                  UIFloorToViewScale(self);
                  double v22 = v21;
                  UIFloorToViewScale(self);
                  double v24 = v23;
                  UIFloorToViewScale(self);
                  v26 = +[_UITextTiledLayerMaskedRect ghostedRect:](_UITextTiledLayerMaskedRect, "ghostedRect:", v20, v22, v24, v25);
                  [(NSArray *)v6 addObject:v26];
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v69 objects:v79 count:16];
              }
              while (v16);
            }
          }
          uint64_t v55 = [(NSMutableSet *)obj countByEnumeratingWithState:&v73 objects:v80 count:16];
        }
        while (v55);
      }

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      obja = self->_invisibleRanges;
      uint64_t v56 = [(NSMutableSet *)obja countByEnumeratingWithState:&v65 objects:v78 count:16];
      if (v56)
      {
        uint64_t v54 = *(void *)v66;
        do
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v66 != v54) {
              objc_enumerationMutation(obja);
            }
            uint64_t v28 = [*(id *)(*((void *)&v65 + 1) + 8 * k) rangeValue];
            uint64_t v30 = v29;
            v31 = [(NSArray *)v60 textLayoutController];
            uint64_t v32 = objc_msgSend(v31, "textRangeForCharacterRange:", v28, v30);

            v58 = (void *)v32;
            v33 = [[_UIBoundingTextRectsSolver alloc] initWithTextContainer:v59 range:v32 unifyRects:0];
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            v34 = [(_UIBoundingTextRectsSolver *)v33 rects];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v77 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v62;
              do
              {
                for (uint64_t m = 0; m != v36; ++m)
                {
                  if (*(void *)v62 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  [*(id *)(*((void *)&v61 + 1) + 8 * m) CGRectValue];
                  UIFloorToViewScale(self);
                  double v40 = v39;
                  UIFloorToViewScale(self);
                  double v42 = v41;
                  UIFloorToViewScale(self);
                  double v44 = v43;
                  UIFloorToViewScale(self);
                  v46 = +[_UITextTiledLayerMaskedRect rect:alpha:](_UITextTiledLayerMaskedRect, "rect:alpha:", v40, v42, v44, v45, 0.0);
                  [(NSArray *)v6 addObject:v46];
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v61 objects:v77 count:16];
              }
              while (v36);
            }
          }
          uint64_t v56 = [(NSMutableSet *)obja countByEnumeratingWithState:&v65 objects:v78 count:16];
        }
        while (v56);
      }

      maskedRects = self->_maskedRects;
      self->_maskedRects = v6;

      v48 = v60;
    }
    else
    {
      v48 = self->_maskedRects;
      self->_maskedRects = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  v49 = self->_maskedRects;
  return v49;
}

- (void)addGhostedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  ghostedRanges = self->_ghostedRanges;
  if (!ghostedRanges)
  {
    v7 = (NSMutableSet *)objc_opt_new();
    uint64_t v8 = self->_ghostedRanges;
    self->_ghostedRanges = v7;

    ghostedRanges = self->_ghostedRanges;
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
  [(NSMutableSet *)ghostedRanges addObject:v9];

  [(_UITextCanvasView *)self setNeedsLayout];
  [(UIView *)self setNeedsDisplay];
}

- (void)removeAllGhostedRanges
{
  ghostedRanges = self->_ghostedRanges;
  if (ghostedRanges)
  {
    self->_ghostedRanges = 0;

    [(_UITextCanvasView *)self setNeedsLayout];
    [(UIView *)self setNeedsDisplay];
  }
}

- (void)addInvisibleRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  invisibleRanges = self->_invisibleRanges;
  if (!invisibleRanges)
  {
    v7 = (NSMutableSet *)objc_opt_new();
    uint64_t v8 = self->_invisibleRanges;
    self->_invisibleRanges = v7;

    invisibleRanges = self->_invisibleRanges;
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
  [(NSMutableSet *)invisibleRanges addObject:v9];

  [(_UITextCanvasView *)self setNeedsLayout];
  [(UIView *)self setNeedsDisplay];
}

- (void)removeInvisibleRange:(_NSRange)a3
{
  if (self->_invisibleRanges)
  {
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3.location, a3.length);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableSet containsObject:](self->_invisibleRanges, "containsObject:"))
    {
      [(NSMutableSet *)self->_invisibleRanges removeObject:v4];
      [(_UITextCanvasView *)self setNeedsLayout];
      [(UIView *)self setNeedsDisplay];
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UITextCanvasView;
  [(UIView *)&v3 layoutSubviews];
  [(_UITextCanvasView *)self _updateTilingViewportLayer];
}

- (void)setNeedsLayout
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextCanvasView;
  [(UIView *)&v4 setNeedsLayout];
  maskedRects = self->_maskedRects;
  self->_maskedRects = 0;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = [(_UITextCanvasView *)self context];
  [v8 drawingScale];
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  ContextStacuint64_t k = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v14 = 0;
  }
  else {
    v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v14);
  CGContextScaleCTM(v14, v10, v12);
  CGAffineTransformMakeScale(&v15, 1.0 / v10, 1.0 / v12);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGRect v17 = CGRectApplyAffineTransform(v16, &v15);
  -[_UITextCanvasView drawTextInRect:](self, "drawTextInRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  CGContextRestoreGState(v14);
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if ((a3->var0 & 0xE) != 0) {
    [(_UITextCanvasView *)self setNeedsLayout];
  }
}

- (void)configureCustomTextRenderer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Text", &configureCustomTextRenderer___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446466;
    v5 = "-[_UITextCanvasView configureCustomTextRenderer]";
    __int16 v6 = 2050;
    v7 = self;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Unexpected call to %{public}s on _UITextCanvasView %{public}p. This method is only expected to be called in a TextKit 2 context and is a no-op in TextKit 1.", (uint8_t *)&v4, 0x16u);
  }
}

- (void)flushFragmentViews
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Text", &flushFragmentViews___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446466;
    v5 = "-[_UITextCanvasView flushFragmentViews]";
    __int16 v6 = 2050;
    v7 = self;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Unexpected call to %{public}s on _UITextCanvasView %{public}p. This method is only expected to be called in a TextKit 2 context and is a no-op in TextKit 1.", (uint8_t *)&v4, 0x16u);
  }
}

- (_UITextKit1CanvasContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (_UITextKit1CanvasContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (BOOL)layoutFragmentViewsNeedDisplay
{
  return self->_layoutFragmentViewsNeedDisplay;
}

- (void)setLayoutFragmentViewsNeedDisplay:(BOOL)a3
{
  self->_layoutFragmentViewsNeedDisplaCGFloat y = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_maskedRects, 0);
  objc_storeStrong((id *)&self->_invisibleRanges, 0);
  objc_storeStrong((id *)&self->_ghostedRanges, 0);
}

@end
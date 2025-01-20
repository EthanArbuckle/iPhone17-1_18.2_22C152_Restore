@interface _UITextTiledLayer
- (BOOL)usesTiledLayers;
- (NSArray)tiles;
- (_UITextTiledLayer)init;
- (double)maxPrefetchedTiles;
- (double)maxTileHeight;
- (id)_prepareNonTiledGhostLayersForVisibleBounds:(CGRect)a3 inBounds:(CGRect)a4;
- (id)_prepareTilesForVisibleBounds:(CGRect)a3 inBounds:(CGRect)a4;
- (id)_preparedTileForFrame:(CGRect)a3 mask:(id)a4 opacity:(double)a5 deferred:(BOOL)a6;
- (void)_didSetDelegate;
- (void)_drawInContext:(CGContext *)a3 offset:(CGPoint)a4 clip:(CGPath *)a5;
- (void)_updateTilingViewportWindow:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)layerWillDraw:(id)a3;
- (void)layoutSublayers;
- (void)resumeTiling;
- (void)setContentsFormat:(id)a3;
- (void)setContentsMultiplyColor:(CGColor *)a3;
- (void)setContentsScale:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawsAsynchronously:(BOOL)a3;
- (void)setMaxPrefetchedTiles:(double)a3;
- (void)setMaxTileHeight:(double)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setRasterizationScale:(double)a3;
- (void)setUnsafeUnretainedDelegate:(id)a3;
- (void)setUsesTiledLayers:(BOOL)a3;
- (void)suspendTiling;
@end

@implementation _UITextTiledLayer

- (_UITextTiledLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UITextTiledLayer;
  v2 = [(_UITextTiledLayer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *((void *)v2 + 15) = 0x4060000000000000;
    *(_OWORD *)(v2 + 40) = xmmword_186B9D850;
    *((void *)v2 + 16) = 0x3FF0000000000000;
    objc_storeWeak((id *)v2 + 7, 0);
    *((void *)v3 + 8) = 0;
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v3 + 72) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v3 + 88) = v4;
  }
  return (_UITextTiledLayer *)v3;
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextTiledLayer;
  [(_UITextTiledLayer *)&v4 setDelegate:a3];
  [(_UITextTiledLayer *)self _didSetDelegate];
}

- (void)setUnsafeUnretainedDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextTiledLayer;
  [(_UITextTiledLayer *)&v4 setUnsafeUnretainedDelegate:a3];
  [(_UITextTiledLayer *)self _didSetDelegate];
}

- (void)_didSetDelegate
{
  v3 = [(_UITextTiledLayer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = 64;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&self->_tcTiledLayerFlags = *(unsigned char *)&self->_tcTiledLayerFlags & 0xBF | v4;

  id v6 = [(_UITextTiledLayer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = 0x80;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_tcTiledLayerFlags = v5 & 0x80 | *(unsigned char *)&self->_tcTiledLayerFlags & 0x7F;
}

- (void)layerWillDraw:(id)a3
{
  if ((*(unsigned char *)&self->_tcTiledLayerFlags & 0x80000000) != 0)
  {
    id v4 = [(_UITextTiledLayer *)self delegate];
    [v4 layerWillDraw:self];
  }
}

- (void)_drawInContext:(CGContext *)a3 offset:(CGPoint)a4 clip:(CGPath *)a5
{
  double y = a4.y;
  double x = a4.x;
  CGContextSaveGState(a3);
  if (a5)
  {
    CGContextAddPath(a3, a5);
    CGContextEOClip(a3);
  }
  CGContextTranslateCTM(a3, -x, -y);
  v10.receiver = self;
  v10.super_class = (Class)_UITextTiledLayer;
  [(_UITextTiledLayer *)&v10 drawInContext:a3];
  CGContextRestoreGState(a3);
}

- (void)drawInContext:(CGContext *)a3
{
  if ((*(unsigned char *)&self->_tcTiledLayerFlags & 1) != 0
    || self->_clip
    || ![(NSMutableArray *)self->_visibleTiles count])
  {
    if (self->_clip)
    {
      CGContextSaveGState(a3);
      CGContextAddPath(a3, [(UIBezierPath *)self->_clip CGPath]);
      CGContextEOClip(a3);
      v6.receiver = self;
      v6.super_class = (Class)_UITextTiledLayer;
      [(_UITextTiledLayer *)&v6 drawInContext:a3];
      CGContextRestoreGState(a3);
    }
    else
    {
      v5.receiver = self;
      v5.super_class = (Class)_UITextTiledLayer;
      [(_UITextTiledLayer *)&v5 drawInContext:a3];
    }
  }
}

- (void)setUsesTiledLayers:(BOOL)a3
{
  $C1BFBCCD4C07A2DD6B683D9DB619C5AB tcTiledLayerFlags = self->_tcTiledLayerFlags;
  if (((*(unsigned int *)&tcTiledLayerFlags ^ a3) & 1) == 0)
  {
    *(unsigned char *)&self->_$C1BFBCCD4C07A2DD6B683D9DB619C5AB tcTiledLayerFlags = *(unsigned char *)&tcTiledLayerFlags & 0xFE | !a3;
    if (a3)
    {
      [(_UITextTiledLayer *)self setContents:0];
    }
    else
    {
      [(NSMutableArray *)self->_visibleTiles makeObjectsPerformSelector:sel_removeFromSuperlayer];
      visibleTiles = self->_visibleTiles;
      self->_visibleTiles = 0;
    }
    [(_UITextTiledLayer *)self setNeedsDisplay];
  }
}

- (BOOL)usesTiledLayers
{
  return (*(unsigned char *)&self->_tcTiledLayerFlags & 1) == 0;
}

- (void)setMaxPrefetchedTiles:(double)a3
{
  self->_maxPrefetchedTiles = fmax(a3, 0.0);
}

- (NSArray)tiles
{
  v2 = (void *)[(NSMutableArray *)self->_visibleTiles copy];
  return (NSArray *)v2;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  CGRect v18 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_tcTiledLayerFlags & 1) != 0 || ![(NSMutableArray *)self->_visibleTiles count])
  {
    v19.receiver = self;
    v19.super_class = (Class)_UITextTiledLayer;
    -[_UITextTiledLayer setNeedsDisplayInRect:](&v19, sel_setNeedsDisplayInRect_, v18.origin.x, v18.origin.y, v18.size.width, v18.size.height, *(void *)&v18.origin.x, *(void *)&v18.origin.y, *(void *)&v18.size.width, *(void *)&v18.size.height);
  }
  else if ((*(unsigned char *)&self->_tcTiledLayerFlags & 0x3C) == 0)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = self->_visibleTiles;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      CGFloat v8 = *MEMORY[0x1E4F1DB28];
      CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "frame", *(void *)&v18.origin.x, *(void *)&v18.origin.y, *(void *)&v18.size.width, *(void *)&v18.size.height);
          CGRect v27 = CGRectIntersection(v26, v18);
          double x = v27.origin.x;
          double y = v27.origin.y;
          double width = v27.size.width;
          double height = v27.size.height;
          v28.origin.double x = v8;
          v28.origin.double y = v9;
          v28.size.double width = v10;
          v28.size.double height = v11;
          if (!CGRectEqualToRect(v27, v28))
          {
            objc_msgSend(v13, "convertRect:fromLayer:", self, x, y, width, height);
            objc_msgSend(v13, "setNeedsDisplayInRect:");
          }
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }
  }
}

- (id)_preparedTileForFrame:(CGRect)a3 mask:(id)a4 opacity:(double)a5 deferred:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v15 = self->_visibleTiles;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
LABEL_3:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v30 != v18) {
        objc_enumerationMutation(v15);
      }
      long long v20 = *(void **)(*((void *)&v29 + 1) + 8 * v19);
      objc_msgSend(v20, "frame", (void)v29);
      v37.origin.double x = x;
      v37.origin.double y = y;
      v37.size.double width = width;
      v37.size.double height = height;
      if (CGRectEqualToRect(v36, v37)) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v17) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    long long v22 = v20;
    long long v23 = (id *)v22;
    if (v6)
    {

      long long v21 = (void (**)(void *, id *))&__block_literal_global_571;
      if (!v23) {
        goto LABEL_14;
      }
    }
    else
    {
      unsigned __int8 v26 = atomic_load(v22 + 40);
      if (v26) {
        [v22 setNeedsDisplay];
      }

      long long v21 = (void (**)(void *, id *))&__block_literal_global_53_2;
    }
    [(NSMutableArray *)self->_visibleTiles removeObject:v23];
  }
  else
  {
LABEL_9:

    if (v6) {
      long long v21 = (void (**)(void *, id *))&__block_literal_global_571;
    }
    else {
      long long v21 = (void (**)(void *, id *))&__block_literal_global_53_2;
    }
LABEL_14:
    long long v23 = (id *)objc_opt_new();
    [v23 setDelegate:self];
    objc_msgSend(v23, "setFrame:", x, y, width, height);
    [(_UITextTiledLayer *)self contentsScale];
    objc_msgSend(v23, "setContentsScale:");
    [(_UITextTiledLayer *)self rasterizationScale];
    objc_msgSend(v23, "setRasterizationScale:");
    objc_msgSend(v23, "setDrawsAsynchronously:", -[_UITextTiledLayer drawsAsynchronously](self, "drawsAsynchronously"));
    v24 = [(_UITextTiledLayer *)self contentsFormat];
    [v23 setContentsFormat:v24];

    objc_msgSend(v23, "setContentsMultiplyColor:", -[_UITextTiledLayer contentsMultiplyColor](self, "contentsMultiplyColor"));
    [(_UITextTiledLayer *)self addSublayer:v23];
    v21[2](v21, v23);
  }
  id v27 = v23[4];
  if (!v14)
  {
    if (!v27) {
      goto LABEL_26;
    }
    v23[4] = 0;

    goto LABEL_25;
  }
  if (!v27 || ([v27 isEqual:v14] & 1) == 0)
  {
    objc_storeStrong(v23 + 4, a4);
LABEL_25:
    v21[2](v21, v23);
  }
LABEL_26:
  *(float *)&double v25 = a5;
  objc_msgSend(v23, "setOpacity:", v25, (void)v29);

  return v23;
}

- (void)setContentsScale:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer setContentsScale:](&v14, sel_setContentsScale_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_visibleTiles;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setContentsScale:", a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setRasterizationScale:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer setRasterizationScale:](&v14, sel_setRasterizationScale_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_visibleTiles;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setRasterizationScale:", a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setDrawsAsynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer setDrawsAsynchronously:](&v14, sel_setDrawsAsynchronously_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_visibleTiles;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setDrawsAsynchronously:", v3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setContentsFormat:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UITextTiledLayer;
  [(_UITextTiledLayer *)&v14 setContentsFormat:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_visibleTiles;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setContentsFormat:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setContentsMultiplyColor:(CGColor *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UITextTiledLayer;
  -[_UITextTiledLayer setContentsMultiplyColor:](&v14, sel_setContentsMultiplyColor_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_visibleTiles;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setContentsMultiplyColor:", a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_prepareTilesForVisibleBounds:(CGRect)a3 inBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (CGRectIsEmpty(a3))
  {
    id v13 = 0;
  }
  else
  {
    p_tileSize = &self->_tileSize;
    double v15 = v8;
    double v16 = v9;
    double v17 = v10;
    double v18 = v11;
    double v76 = v10;
    double rect = v9;
    double v75 = v11;
    if (self->_tileSize.height > 0.0)
    {
      double v15 = v8;
      double v16 = v9;
      double v17 = v10;
      double v18 = v11;
      if (v9 > 0.0)
      {
        double v15 = v8;
        double v16 = v9;
        double v17 = v10;
        double v18 = v11;
        if (v8 > 0.0)
        {
          [(_UITextTiledLayer *)self maxPrefetchedTiles];
          BOOL v20 = v19 <= 0.0;
          double v15 = v8;
          double v17 = v10;
          double v16 = v9;
          double v18 = v11;
          if (!v20)
          {
            CGFloat v21 = self->_tileSize.height * -2.0;
            [(_UITextTiledLayer *)self maxPrefetchedTiles];
            CGFloat v23 = v21 * v22;
            v93.origin.double x = v11;
            v93.origin.double y = v10;
            v93.size.CGFloat width = rect;
            v93.size.CGFloat height = v8;
            CGRect v114 = CGRectInset(v93, 0.0, v23);
            v94.origin.double x = x;
            v94.origin.double y = y;
            v94.size.CGFloat width = width;
            v94.size.CGFloat height = height;
            *(CGRect *)&double v18 = CGRectIntersection(v94, v114);
          }
        }
      }
    }
    CGFloat v85 = height;
    double rect2 = v8;
    CGRect v95 = CGRectOffset(*(CGRect *)&v18, -x, -y);
    CGFloat v24 = v95.origin.x;
    CGFloat v25 = v95.origin.y;
    CGFloat v26 = v95.size.width;
    CGFloat v27 = v95.size.height;
    double v28 = p_tileSize->width;
    double v84 = self->_tileSize.height;
    uint64_t v71 = vcvtmd_s64_f64(CGRectGetMinX(v95) / p_tileSize->width);
    v96.origin.double x = v24;
    v96.origin.double y = v25;
    v96.size.CGFloat width = v26;
    v96.size.CGFloat height = v27;
    double MinY = CGRectGetMinY(v96);
    v97.origin.double x = v24;
    v97.origin.double y = v25;
    v97.size.CGFloat width = v26;
    v97.size.CGFloat height = v27;
    int64_t v69 = vcvtpd_s64_f64(CGRectGetMaxX(v97) / v28);
    v98.origin.double x = v24;
    v98.origin.double y = v25;
    v98.size.CGFloat width = v26;
    v98.size.CGFloat height = v27;
    double MaxY = CGRectGetMaxY(v98);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ((*(unsigned char *)&self->_tcTiledLayerFlags & 0x40) != 0)
    {
      long long v31 = [(_UITextTiledLayer *)self delegate];
      long long v30 = objc_msgSend(v31, "_textTiledLayer:maskedRectsInVisibleRect:", self, v75, v76, rect, rect2);
    }
    else
    {
      long long v30 = 0;
    }
    v99.origin.double x = x;
    v99.origin.double y = y;
    v99.size.CGFloat width = width;
    v99.size.CGFloat height = v85;
    double MinX = CGRectGetMinX(v99);
    v100.origin.double x = x;
    v100.origin.double y = y;
    v100.size.CGFloat width = width;
    v100.size.CGFloat height = v85;
    double v81 = CGRectGetMinY(v100);
    v101.origin.double x = x;
    v101.origin.double y = y;
    v101.size.CGFloat width = width;
    v101.size.CGFloat height = v85;
    double MaxX = CGRectGetMaxX(v101);
    v102.origin.double x = x;
    v102.origin.double y = y;
    v102.size.CGFloat width = width;
    v102.size.CGFloat height = v85;
    double v79 = CGRectGetMaxY(v102);
    if (v71 < v69)
    {
      int64_t v70 = vcvtmd_s64_f64(MinY / v84);
      int64_t v32 = vcvtpd_s64_f64(MaxY / v84);
      v73 = v30;
      int64_t v72 = v32;
      do
      {
        if (v70 < v32)
        {
          uint64_t v33 = v70;
          do
          {
            double v35 = p_tileSize->width;
            double v34 = p_tileSize->height;
            double v36 = MinX + p_tileSize->width * (double)v71;
            double v37 = v81 + v34 * (double)v33;
            v103.origin.double x = v36;
            v103.origin.double y = v37;
            v103.size.CGFloat width = p_tileSize->width;
            v103.size.CGFloat height = v34;
            if (CGRectGetMaxX(v103) > MaxX)
            {
              v104.origin.double x = v36;
              v104.origin.double y = v81 + v34 * (double)v33;
              v104.size.CGFloat width = v35;
              v104.size.CGFloat height = v34;
              double v35 = MaxX - CGRectGetMinX(v104);
            }
            v105.origin.double x = v36;
            v105.origin.double y = v81 + v34 * (double)v33;
            v105.size.CGFloat width = v35;
            v105.size.CGFloat height = v34;
            if (CGRectGetMaxY(v105) > v79)
            {
              v106.origin.double x = v36;
              v106.origin.double y = v81 + v34 * (double)v33;
              v106.size.CGFloat width = v35;
              v106.size.CGFloat height = v34;
              double v34 = v79 - CGRectGetMinY(v106);
            }
            v107.origin.double x = v36;
            v107.origin.double y = v37;
            v107.size.CGFloat width = v35;
            v107.size.CGFloat height = v34;
            if (!CGRectIsEmpty(v107))
            {
              v108.origin.double x = v36;
              v108.origin.double y = v37;
              v108.size.CGFloat width = v35;
              v108.size.CGFloat height = v34;
              v115.origin.double x = v75;
              v115.origin.double y = v76;
              v115.size.CGFloat width = rect;
              v115.size.CGFloat height = rect2;
              BOOL v38 = !CGRectIntersectsRect(v108, v115);
              if ([v30 count])
              {
                uint64_t v78 = v33;
                long long v88 = 0u;
                long long v89 = 0u;
                long long v86 = 0u;
                long long v87 = 0u;
                id v39 = v30;
                uint64_t v40 = [v39 countByEnumeratingWithState:&v86 objects:v90 count:16];
                if (v40)
                {
                  uint64_t v41 = v40;
                  v42 = 0;
                  uint64_t v43 = *(void *)v87;
                  do
                  {
                    for (uint64_t i = 0; i != v41; ++i)
                    {
                      if (*(void *)v87 != v43) {
                        objc_enumerationMutation(v39);
                      }
                      v45 = *(void **)(*((void *)&v86 + 1) + 8 * i);
                      objc_msgSend(v45, "boundingRect", v69);
                      CGFloat v47 = v46;
                      CGFloat v49 = v48;
                      CGFloat v51 = v50;
                      CGFloat v53 = v52;
                      [v45 alpha];
                      if (v54 < 1.0)
                      {
                        v109.origin.double x = v47;
                        v109.origin.double y = v49;
                        v109.size.CGFloat width = v51;
                        v109.size.CGFloat height = v53;
                        v116.origin.double x = v36;
                        v116.origin.double y = v37;
                        v116.size.CGFloat width = v35;
                        v116.size.CGFloat height = v34;
                        if (CGRectIntersectsRect(v109, v116))
                        {
                          v110.origin.double x = v47;
                          v110.origin.double y = v49;
                          v110.size.CGFloat width = v51;
                          v110.size.CGFloat height = v53;
                          v117.origin.double x = v36;
                          v117.origin.double y = v37;
                          v117.size.CGFloat width = v35;
                          v117.size.CGFloat height = v34;
                          CGRect v111 = CGRectIntersection(v110, v117);
                          double v55 = v111.origin.x;
                          double v56 = v111.origin.y;
                          double v57 = v111.size.width;
                          double v58 = v111.size.height;
                          [v45 alpha];
                          if (v59 > 0.0)
                          {
                            [v45 alpha];
                            v61 = -[_UITextTiledLayer _preparedTileForFrame:mask:opacity:deferred:](self, "_preparedTileForFrame:mask:opacity:deferred:", 0, v38, v55, v56, v57, v58, v60);
                            [v13 addObject:v61];
                          }
                          v112.origin.double x = v55;
                          v112.origin.double y = v56;
                          v112.size.CGFloat width = v57;
                          v112.size.CGFloat height = v58;
                          CGRect v113 = CGRectOffset(v112, -v36, -v37);
                          double v62 = v113.origin.x;
                          double v63 = v113.origin.y;
                          double v64 = v113.size.width;
                          double v65 = v113.size.height;
                          if (!v42)
                          {
                            v42 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, v35, v34);
                          }
                          v66 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v62, v63, v64, v65);
                          [v42 appendPath:v66];
                        }
                      }
                    }
                    uint64_t v41 = [v39 countByEnumeratingWithState:&v86 objects:v90 count:16];
                  }
                  while (v41);
                }
                else
                {
                  v42 = 0;
                }

                long long v30 = v73;
                p_tileSize = &self->_tileSize;
                int64_t v32 = v72;
                uint64_t v33 = v78;
              }
              else
              {
                v42 = 0;
              }
              v67 = -[_UITextTiledLayer _preparedTileForFrame:mask:opacity:deferred:](self, "_preparedTileForFrame:mask:opacity:deferred:", v42, v38, v36, v37, v35, v34, 1.0, v69);
              [v13 addObject:v67];
            }
            ++v33;
          }
          while (v33 != v32);
        }
        ++v71;
      }
      while (v71 != v69);
    }
  }
  return v13;
}

- (id)_prepareNonTiledGhostLayersForVisibleBounds:(CGRect)a3 inBounds:(CGRect)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  rect2[0] = a3.origin.x;
  double y = a3.origin.y;
  double width = a3.size.width;
  double height = a3.size.height;
  if (CGRectIsEmpty(a3))
  {
    double v8 = 0;
    id v9 = 0;
  }
  else
  {
    double v10 = [(_UITextTiledLayer *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      long long v12 = [(_UITextTiledLayer *)self delegate];
      id v13 = objc_msgSend(v12, "_textTiledLayer:maskedRectsInVisibleRect:", self, rect2[0], y, width, height);
    }
    else
    {
      id v13 = 0;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v13 count])
    {
      long long v42 = 0u;
      long long v43 = 0u;
      memset(&rect2[1], 0, 32);
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&rect2[1] objects:v44 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        double v8 = 0;
        uint64_t v17 = **(void **)&rect2[3];
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (**(void **)&rect2[3] != v17) {
              objc_enumerationMutation(v14);
            }
            double v19 = *(void **)(*(void *)&rect2[2] + 8 * i);
            [v19 boundingRect];
            CGFloat v21 = v20;
            CGFloat v23 = v22;
            CGFloat v25 = v24;
            CGFloat v27 = v26;
            [v19 alpha];
            if (v28 < 1.0)
            {
              v47.origin.double x = v21;
              v47.origin.double y = v23;
              v47.size.double width = v25;
              v47.size.double height = v27;
              v50.origin.double x = rect2[0];
              v50.origin.double y = y;
              v50.size.double width = width;
              v50.size.double height = height;
              if (CGRectIntersectsRect(v47, v50))
              {
                v48.origin.double x = v21;
                v48.origin.double y = v23;
                v48.size.double width = v25;
                v48.size.double height = v27;
                CGRect v49 = CGRectIntersection(v48, a4);
                double x = v49.origin.x;
                double v30 = v49.origin.y;
                double v31 = v49.size.width;
                double v32 = v49.size.height;
                [v19 alpha];
                if (v33 > 0.0)
                {
                  [v19 alpha];
                  double v35 = -[_UITextTiledLayer _preparedTileForFrame:mask:opacity:deferred:](self, "_preparedTileForFrame:mask:opacity:deferred:", 0, 0, x, v30, v31, v32, v34);
                  [v9 addObject:v35];
                }
                if (!v8)
                {
                  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, a4.size.width, a4.size.height);
                  double v8 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
                }
                double v36 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, v30, v31, v32);
                [(UIBezierPath *)v8 appendPath:v36];
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&rect2[1] objects:v44 count:16];
        }
        while (v16);
      }
      else
      {
        double v8 = 0;
      }
    }
    else
    {
      double v8 = 0;
    }
  }
  clip = self->_clip;
  self->_clip = v8;
  BOOL v38 = v8;

  return v9;
}

- (void)_updateTilingViewportWindow:(id)a3
{
  id obj = [a3 layer];
  char tcTiledLayerFlags = (char)self->_tcTiledLayerFlags;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewportLayer);

  if (tcTiledLayerFlags)
  {
    objc_storeWeak((id *)&self->_viewportLayer, 0);
    self->_viewportLayerExtraWidthFactor = 0.0;
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_visibleViewportBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_visibleViewportBounds.size = v9;
    if (WeakRetained)
    {
LABEL_7:
      [(_UITextTiledLayer *)self setNeedsLayout];
      id v10 = objc_loadWeakRetained((id *)&self->_viewportLayer);
      [v10 bounds];
      objc_msgSend(v10, "convertRect:toLayer:", self);
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      double v16 = v15;
      CGFloat v18 = v17;

      v51.origin.CGFloat x = v12;
      v51.origin.CGFloat y = v14;
      v51.size.CGFloat width = v16;
      v51.size.CGFloat height = v18;
      CGRect v52 = CGRectInset(v51, -(v16 * self->_viewportLayerExtraWidthFactor), 0.0);
      CGFloat x = v52.origin.x;
      CGFloat y = v52.origin.y;
      CGFloat width = v52.size.width;
      CGFloat height = v52.size.height;
      [(_UITextTiledLayer *)self bounds];
      v58.origin.CGFloat x = v23;
      v58.origin.CGFloat y = v24;
      v58.size.CGFloat width = v25;
      v58.size.CGFloat height = v26;
      v53.origin.CGFloat x = x;
      v53.origin.CGFloat y = y;
      v53.size.CGFloat width = width;
      v53.size.CGFloat height = height;
      self->_visibleViewportBounds = CGRectIntersection(v53, v58);
      goto LABEL_8;
    }
  }
  else if (obj != WeakRetained)
  {
    id v6 = objc_storeWeak((id *)&self->_viewportLayer, obj);

    double v7 = 1.0;
    if (!obj)
    {
      CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      self->_visibleViewportBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      self->_visibleViewportBounds.size = v8;
      double v7 = 0.0;
    }
    self->_viewportLayerExtraWidthFactor = v7;
    goto LABEL_7;
  }
  id v27 = objc_loadWeakRetained((id *)&self->_viewportLayer);

  if (v27)
  {
    id v28 = objc_loadWeakRetained((id *)&self->_viewportLayer);
    [v28 bounds];
    objc_msgSend(v28, "convertRect:toLayer:", self);
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    double v34 = v33;
    CGFloat v36 = v35;

    v54.origin.CGFloat x = v30;
    v54.origin.CGFloat y = v32;
    v54.size.CGFloat width = v34;
    v54.size.CGFloat height = v36;
    CGRect v55 = CGRectInset(v54, -(v34 * self->_viewportLayerExtraWidthFactor), 0.0);
    CGFloat v37 = v55.origin.x;
    CGFloat v38 = v55.origin.y;
    CGFloat v39 = v55.size.width;
    CGFloat v40 = v55.size.height;
    [(_UITextTiledLayer *)self bounds];
    v59.origin.CGFloat x = v41;
    v59.origin.CGFloat y = v42;
    v59.size.CGFloat width = v43;
    v59.size.CGFloat height = v44;
    v56.origin.CGFloat x = v37;
    v56.origin.CGFloat y = v38;
    v56.size.CGFloat width = v39;
    v56.size.CGFloat height = v40;
    CGRect v57 = CGRectIntersection(v56, v59);
    CGFloat v45 = v57.origin.x;
    CGFloat v46 = v57.origin.y;
    CGFloat v47 = v57.size.width;
    CGFloat v48 = v57.size.height;
    if (!CGRectEqualToRect(self->_visibleViewportBounds, v57))
    {
      [(_UITextTiledLayer *)self setNeedsLayout];
      self->_visibleViewportBounds.origin.CGFloat x = v45;
      self->_visibleViewportBounds.origin.CGFloat y = v46;
      self->_visibleViewportBounds.size.CGFloat width = v47;
      self->_visibleViewportBounds.size.CGFloat height = v48;
    }
  }
LABEL_8:
}

- (void)layoutSublayers
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_tcTiledLayerFlags & 0x3C) != 0) {
    goto LABEL_44;
  }
  [(_UITextTiledLayer *)self maxTileHeight];
  double v75 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewportLayer);

  [(_UITextTiledLayer *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double height = v11;
  double width = v9;
  double y = v7;
  double x = v5;
  if (WeakRetained)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_viewportLayer);
    [v17 bounds];
    objc_msgSend(v17, "convertRect:toLayer:", self);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    double v23 = v22;
    CGFloat v25 = v24;

    v85.origin.double x = v19;
    v85.origin.double y = v21;
    v85.size.double width = v23;
    v85.size.double height = v25;
    CGRect v86 = CGRectInset(v85, -(v23 * self->_viewportLayerExtraWidthFactor), 0.0);
    v99.origin.double x = v6;
    v99.origin.double y = v8;
    v99.size.double width = v10;
    v99.size.double height = v12;
    CGRect v87 = CGRectIntersection(v86, v99);
    double x = v87.origin.x;
    double y = v87.origin.y;
    double width = v87.size.width;
    double height = v87.size.height;
  }
  self->_visibleViewportBounds.origin.double x = x;
  self->_visibleViewportBounds.origin.double y = y;
  self->_visibleViewportBounds.size.double width = width;
  self->_visibleViewportBounds.size.double height = height;
  CGFloat v26 = self->_clip;
  if (width <= 0.0) {
    goto LABEL_12;
  }
  double v27 = 256.0;
  if (v75 <= 256.0) {
    double v27 = v75;
  }
  if ((*(unsigned char *)&self->_tcTiledLayerFlags & 1) != 0 || v27 >= v12)
  {
LABEL_12:
    if (WeakRetained)
    {
      v89.origin.double x = x;
      v89.origin.double y = y;
      v89.size.double width = width;
      v89.size.double height = height;
      if (CGRectIsEmpty(v89))
      {
        char v32 = 0;
        id WeakRetained = 0;
        goto LABEL_19;
      }
      id WeakRetained = -[_UITextTiledLayer _prepareNonTiledGhostLayersForVisibleBounds:inBounds:](self, "_prepareNonTiledGhostLayersForVisibleBounds:inBounds:", x, y, width, height, v6, v8, v10, v12);
    }
    goto LABEL_16;
  }
  p_tileSize = &self->_tileSize;
  self->_tileSize.double width = width;
  self->_tileSize.double height = v27;
  if (!WeakRetained)
  {
LABEL_16:
    char v32 = 0;
    goto LABEL_19;
  }
  v88.origin.double x = x;
  v88.origin.double y = y;
  v88.size.double width = width;
  v88.size.double height = height;
  CGFloat v76 = height;
  double v29 = v6;
  v100.origin.double x = v6;
  double v30 = v8;
  v100.origin.double y = v8;
  v100.size.double width = v10;
  v100.size.double height = v12;
  if (CGRectEqualToRect(v88, v100))
  {
    double v31 = v76;
  }
  else
  {
    CGFloat v74 = y;
    CGFloat v33 = v29;
    CGFloat v34 = x;
    CGFloat v35 = v30;
    double v36 = p_tileSize->width;
    double v37 = self->_tileSize.height;
    v90.origin.double x = v33;
    v90.origin.double y = v35;
    v90.size.double width = v10;
    v90.size.double height = v12;
    double v38 = CGRectGetMinX(v90) / v36;
    double v72 = floor(v38);
    unint64_t v39 = vcvtmd_s64_f64(v38);
    v91.origin.double x = v33;
    v91.origin.double y = v35;
    v91.size.double width = v10;
    v91.size.double height = v12;
    double v40 = CGRectGetMinY(v91) / v37;
    double v71 = floor(v40);
    unint64_t v41 = vcvtmd_s64_f64(v40);
    v92.origin.double x = v33;
    v92.origin.double y = v35;
    v92.size.double width = v10;
    v92.size.double height = v12;
    unint64_t v42 = vcvtpd_s64_f64(CGRectGetMaxX(v92) / v36);
    v93.origin.double x = v33;
    v93.origin.double y = v35;
    v93.size.double width = v10;
    v93.size.double height = v12;
    unint64_t v43 = vcvtpd_s64_f64(CGRectGetMaxY(v93) / v37);
    double v44 = p_tileSize->width;
    double v45 = self->_tileSize.height;
    double v46 = p_tileSize->width * (double)(uint64_t)v72;
    double v73 = p_tileSize->width * (double)(uint64_t)(v42 - v39);
    double v12 = v45 * (double)(uint64_t)(v43 - v41);
    v94.origin.double x = v34;
    v94.origin.double y = v74;
    v94.size.double width = width;
    v94.size.double height = v76;
    double v47 = CGRectGetMinX(v94) / v44;
    double v70 = floor(v47);
    unint64_t v48 = vcvtmd_s64_f64(v47);
    v95.origin.double x = v34;
    v95.origin.double y = v74;
    v95.size.double width = width;
    v95.size.double height = v76;
    double v49 = CGRectGetMinY(v95) / v45;
    double v69 = floor(v49);
    unint64_t v50 = vcvtmd_s64_f64(v49);
    v96.origin.double x = v34;
    v96.origin.double y = v74;
    v96.size.double width = width;
    v96.size.double height = v76;
    double v51 = CGRectGetMaxX(v96) / v44;
    double v29 = v46;
    unint64_t v52 = vcvtpd_s64_f64(v51);
    v97.origin.double x = v34;
    v97.origin.double y = v74;
    v97.size.double width = width;
    v97.size.double height = v76;
    double v53 = CGRectGetMaxY(v97) / v45;
    double v30 = v45 * (double)(uint64_t)v71;
    double v10 = v73;
    double v54 = self->_tileSize.height;
    double x = p_tileSize->width * (double)(uint64_t)v70;
    double y = v54 * (double)(uint64_t)v69;
    double width = p_tileSize->width * (double)(uint64_t)(v52 - v48);
    double v31 = v54 * (double)(uint64_t)(vcvtpd_s64_f64(v53) - v50);
  }
  id WeakRetained = -[_UITextTiledLayer _prepareTilesForVisibleBounds:inBounds:](self, "_prepareTilesForVisibleBounds:inBounds:", x, y, width, v31, v29, v30, v10, v12);
  char v32 = 1;
  double height = v31;
LABEL_19:
  if ([(NSMutableArray *)self->_visibleTiles count])
  {
    CGRect v55 = v26;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    CGRect v56 = self->_visibleTiles;
    uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v79 objects:v83 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v80 != v59) {
            objc_enumerationMutation(v56);
          }
          [*(id *)(*((void *)&v79 + 1) + 8 * i) removeFromSuperlayer];
        }
        uint64_t v58 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v79 objects:v83 count:16];
      }
      while (v58);
    }

    CGFloat v26 = v55;
  }
  if (v32)
  {
    [(_UITextTiledLayer *)self setContents:0];
  }
  else
  {
    v98.origin.double x = x;
    v98.origin.double y = y;
    v98.size.double width = width;
    v98.size.double height = height;
    if (!CGRectIsEmpty(v98))
    {
      uint64_t v61 = [(_UITextTiledLayer *)self contents];
      if (v61)
      {
        double v62 = (void *)v61;
        clip = self->_clip;
        double v64 = v26;
        double v65 = clip;
        if (v64 == v65)
        {

          goto LABEL_40;
        }
        v66 = v65;
        if (v64 && v65)
        {
          BOOL v67 = [(UIBezierPath *)v64 isEqual:v65];

          if (v67) {
            goto LABEL_40;
          }
        }
        else
        {
        }
      }
      v78.receiver = self;
      v78.super_class = (Class)_UITextTiledLayer;
      -[_UITextTiledLayer setNeedsDisplayInRect:](&v78, sel_setNeedsDisplayInRect_, x, y, width, height);
    }
  }
LABEL_40:
  if ([WeakRetained count]) {
    v68 = WeakRetained;
  }
  else {
    v68 = 0;
  }
  objc_storeStrong((id *)&self->_visibleTiles, v68);

LABEL_44:
  v77.receiver = self;
  v77.super_class = (Class)_UITextTiledLayer;
  [(_UITextTiledLayer *)&v77 layoutSublayers];
}

- (void)suspendTiling
{
  *(unsigned char *)&self->_char tcTiledLayerFlags = (*(unsigned char *)&self->_tcTiledLayerFlags + 4) & 0x3C | *(unsigned char *)&self->_tcTiledLayerFlags & 0xC3;
}

- (void)resumeTiling
{
  char tcTiledLayerFlags = (char)self->_tcTiledLayerFlags;
  if ((tcTiledLayerFlags & 0x3C) == 0)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UITextTiledLayer.m" lineNumber:776 description:@"suspendLayout underflow!"];

    char tcTiledLayerFlags = (char)self->_tcTiledLayerFlags;
  }
  *(unsigned char *)&self->_char tcTiledLayerFlags = (tcTiledLayerFlags + 60) & 0x3C | tcTiledLayerFlags & 0xC3;
  if (!((tcTiledLayerFlags + 60) & 0x3C | tcTiledLayerFlags & 1))
  {
    [(_UITextTiledLayer *)self setNeedsLayout];
  }
}

- (double)maxTileHeight
{
  return self->_maxTileHeight;
}

- (void)setMaxTileHeight:(double)a3
{
  self->_maxTileHeight = a3;
}

- (double)maxPrefetchedTiles
{
  return self->_maxPrefetchedTiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clip, 0);
  objc_destroyWeak((id *)&self->_viewportLayer);
  objc_storeStrong((id *)&self->_visibleTiles, 0);
}

@end
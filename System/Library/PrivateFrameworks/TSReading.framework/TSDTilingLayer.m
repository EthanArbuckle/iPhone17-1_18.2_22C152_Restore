@interface TSDTilingLayer
+ (CGImage)p_newCheckerboardImage;
+ (CGImage)p_newGeneratedCheckerboardImage;
+ (CGSize)defaultTileSize;
- (BOOL)drawsInBackground;
- (BOOL)enableContext;
- (BOOL)forceTiling;
- (BOOL)p_updateTileSizeWithLayerSize:(CGSize)a3;
- (BOOL)tilingSafeHasContents;
- (TSDTileGeometryProviding)geometryProvider;
- (TSDTilingLayer)init;
- (id)p_nonTileAndContentLayers;
- (id)p_tileAndContentLayers;
- (id)p_tileLayers;
- (int)tilingMode;
- (unint64_t)p_tilesHigh;
- (unint64_t)p_tilesWide;
- (void)dealloc;
- (void)display;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)i_drawRect:(CGRect)a3 inContext:(CGContext *)a4 inBackground:(BOOL)a5;
- (void)i_drawTile:(id)a3 inContext:(CGContext *)a4;
- (void)i_drawTileInBackground:(id)a3 inRect:(CGRect)a4;
- (void)i_setNeedsTileDisplayForTile:(id)a3;
- (void)layoutSublayers;
- (void)p_updateTileIndexes:(id)a3 visibleBounds:(CGRect)a4;
- (void)setContents:(id)a3;
- (void)setContentsScale:(double)a3;
- (void)setDrawsInBackground:(BOOL)a3;
- (void)setEnableContext:(BOOL)a3;
- (void)setForceTiling:(BOOL)a3;
- (void)setGeometryProvider:(id)a3;
- (void)setNeedsDisplayForDirtyTiles:(id)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNeedsLayout;
- (void)setNeedsLayoutForTilingLayers;
- (void)setTileContents:(id)a3;
- (void)setTilingMode:(int)a3;
- (void)tilingSafeSetSublayers:(id)a3;
@end

@implementation TSDTilingLayer

- (TSDTilingLayer)init
{
  v9.receiver = self;
  v9.super_class = (Class)TSDTilingLayer;
  v2 = [(TSDTilingLayer *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->mTilingMode = 0;
    objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
    *(float *)&double v4 = v4 * 0.25;
    double v5 = fmaxf(*(float *)&v4, 640.0);
    [(TSDTilingLayer *)v3 contentsScale];
    CGFloat v7 = v5 / v6;
    v3->mTileSize.width = v7;
    v3->mTileSize.height = v7;
    *(unsigned char *)&v3->mFlags |= 2u;
    v3->mDirtyTiles = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v3->mHasEverHadTileLayout = 0;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingLayer;
  [(TSDTilingLayer *)&v3 dealloc];
}

- (void)setContentsScale:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(TSDTilingLayer *)self contentsScale];
  if (v5 != a3)
  {
    objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
    *(float *)&double v6 = v6 * 0.25;
    CGFloat v7 = fmaxf(*(float *)&v6, 640.0) / a3;
    self->mTileSize.width = v7;
    self->mTileSize.height = v7;
    [(TSDTilingLayer *)self setNeedsLayout];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [(TSDTilingLayer *)self p_tileLayers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v12++) setContentsScale:a3];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)TSDTilingLayer;
  [(TSDTilingLayer *)&v13 setContentsScale:a3];
}

- (void)setContents:(id)a3
{
  id v5 = (id)[(TSDTilingLayer *)self contents];
  v7.receiver = self;
  v7.super_class = (Class)TSDTilingLayer;
  [(TSDTilingLayer *)&v7 setContents:a3];
  if (v5 != a3)
  {
    char mFlags = (char)self->mFlags;
    *(unsigned char *)&self->char mFlags = mFlags & 0x9D | 2;
    if (mFlags) {
      [(TSDTilingLayer *)self setNeedsLayout];
    }
  }
}

- (void)setTileContents:(id)a3
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!a3 || (isKindOfClass & 1) != 0)
  {
    if (a3) {
      [a3 setZPosition:-10000.0];
    }
    -[TSDTilingLayer setContents:](&v7, sel_setContents_, 0, v6.receiver, v6.super_class, self, TSDTilingLayer);
  }
  else
  {
    -[TSDTilingLayer setContents:](&v6, sel_setContents_, a3, self, TSDTilingLayer, v7.receiver, v7.super_class);
  }
}

- (void)display
{
  if (*(unsigned char *)&self->mFlags)
  {
    if ([(TSDTilingLayer *)self contents])
    {
      v4.receiver = self;
      v4.super_class = (Class)TSDTilingLayer;
      [(TSDTilingLayer *)&v4 setContents:0];
    }
  }
  else if (![(TSDTilingLayer *)self drawsInBackground] {
         && ![(TSDTilingLayer *)self forceTiling]
  }
         && !self->_geometryProvider)
  {
    v3.receiver = self;
    v3.super_class = (Class)TSDTilingLayer;
    [(TSDTilingLayer *)&v3 display];
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v25 = *MEMORY[0x263EF8340];
  [(TSDTilingLayer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)-[TSDTilingLayer delegate](self, "delegate"), "tilingLayerWillSetNeedsDisplay:", self);
  }
  if ((*(unsigned char *)&self->mFlags & 2) != 0)
  {
    *(unsigned char *)&self->mFlags &= ~2u;
    [(TSDTilingLayer *)self setNeedsLayout];
    CGSize v8 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    self->mLastVisibleBounds.origin = (CGPoint)*MEMORY[0x263F001A0];
    self->mLastVisibleBounds.size = v8;
    self->mLastBoundsSize = (CGSize)*MEMORY[0x263F001B0];
  }
  v23.receiver = self;
  v23.super_class = (Class)TSDTilingLayer;
  -[TSDTilingLayer setNeedsDisplayInRect:](&v23, sel_setNeedsDisplayInRect_, x, y, width, height);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [(TSDTilingLayer *)self p_tileLayers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v14 frame];
        v27.origin.double x = v15;
        v27.origin.double y = v16;
        v27.size.double width = v17;
        v27.size.double height = v18;
        v26.origin.double x = x;
        v26.origin.double y = y;
        v26.size.double width = width;
        v26.size.double height = height;
        if (CGRectIntersectsRect(v26, v27))
        {
          -[TSDTilingLayer convertRect:toLayer:](self, "convertRect:toLayer:", v14, x, y, width, height);
          objc_msgSend(v14, "setNeedsDisplayInRect:");
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v11);
  }
}

- (void)setNeedsLayoutForTilingLayers
{
  [(TSDTilingLayer *)self setNeedsLayout];
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingLayer;
  [(CALayer *)&v3 setNeedsLayoutForTilingLayers];
}

- (void)setNeedsLayout
{
  *(unsigned char *)&self->mFlags |= 0x10u;
  [(TSDTilingLayer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)-[TSDTilingLayer delegate](self, "delegate"), "tilingLayerWillSetNeedsLayout:", self);
  }
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingLayer;
  [(TSDTilingLayer *)&v3 setNeedsLayout];
}

- (unint64_t)p_tilesWide
{
  if (self->_geometryProvider) {
    return 1;
  }
  [(TSDTilingLayer *)self bounds];
  return vcvtpd_u64_f64(v4 / self->mTileSize.width);
}

- (unint64_t)p_tilesHigh
{
  geometryProvider = self->_geometryProvider;
  if (geometryProvider)
  {
    return (unint64_t)(double)(unint64_t)[(TSDTileGeometryProviding *)geometryProvider tileGeometryCountWithLayer:self];
  }
  else
  {
    [(TSDTilingLayer *)self bounds];
    return (unint64_t)ceil(v5 / self->mTileSize.height);
  }
}

- (void)p_updateTileIndexes:(id)a3 visibleBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  geometryProvider = self->_geometryProvider;
  if (geometryProvider)
  {
    -[TSDTileGeometryProviding tileGeometryAddVisibileIndices:withLayer:visibleBounds:](geometryProvider, "tileGeometryAddVisibileIndices:withLayer:visibleBounds:", a3, self);
  }
  else
  {
    unint64_t v11 = [(TSDTilingLayer *)self p_tilesWide];
    [(TSDTilingLayer *)self bounds];
    double v13 = v12;
    double v15 = v14;
    double v16 = TSDSubtractPoints(x, y, v12);
    p_mTileSize = &self->mTileSize;
    v28.size.CGFloat width = p_mTileSize->width;
    v28.size.CGFloat height = p_mTileSize->height;
    *(float *)&double v16 = v16 / p_mTileSize->width;
    *(float *)&double v18 = v18 / v28.size.height;
    unint64_t v19 = (unint64_t)(float)(floorf(*(float *)&v16) + (float)(floorf(*(float *)&v18) * (float)v11));
    v28.origin.double x = v13 + p_mTileSize->width * (double)(v19 % v11);
    v28.origin.double y = v15 + v28.size.height * (double)(v19 / v11);
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGRect v27 = CGRectUnion(v26, v28);
    unint64_t v20 = vcvtpd_u64_f64(v27.size.height / p_mTileSize->height);
    if (v20)
    {
      uint64_t v21 = 0;
      unint64_t v22 = vcvtpd_u64_f64(v27.size.width / p_mTileSize->width);
      do
      {
        if (v22)
        {
          unint64_t v23 = v19;
          unint64_t v24 = v22;
          do
          {
            [a3 addIndex:v23++];
            --v24;
          }
          while (v24);
        }
        ++v21;
        v19 += v11;
      }
      while (v21 != v20);
    }
  }
}

- (void)setEnableContext:(BOOL)a3
{
  if (self->_enableContext != a3)
  {
    self->_enableContext = a3;
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:");
    [(TSDTilingLayer *)self setValue:v4 forKeyPath:@"separatedOptions.enableContext"];
  }
}

- (void)layoutSublayers
{
  v2 = self;
  uint64_t v87 = *MEMORY[0x263EF8340];
  uint64_t v3 = 56;
  if ((*(unsigned char *)&self->mFlags & 0x10) == 0) {
    goto LABEL_65;
  }
  [(TSDTilingLayer *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend((id)-[TSDTilingLayer delegate](v2, "delegate"), "shouldLayoutTilingLayer:", v2))
  {
    goto LABEL_65;
  }
  v84.receiver = v2;
  v84.super_class = (Class)TSDTilingLayer;
  [(TSDTilingLayer *)&v84 layoutSublayers];
  v2->mHasEverHadTileLayout = 1;
  [(TSDTilingLayer *)v2 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(TSDTilingLayer *)v2 superlayer])
  {
    [(TSDTilingLayer *)v2 delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend((id)-[TSDTilingLayer delegate](v2, "delegate"), "visibleBoundsForTilingLayer:", v2);
    }
    else
    {
      unint64_t v20 = (TSDTilingLayer *)[(TSDTilingLayer *)v2 superlayer];
      BOOL v21 = v11 > 0.0;
      BOOL v22 = v9 > 0.0;
      if (v20 && v11 > 0.0)
      {
        unint64_t v23 = v2;
        double height = v11;
        double width = v9;
        double y = v7;
        double x = v5;
        if (v9 > 0.0)
        {
          double x = v5;
          double y = v7;
          double width = v9;
          double height = v11;
          unint64_t v24 = v2;
          do
          {
            unint64_t v23 = v20;
            -[TSDTilingLayer convertRect:fromLayer:](v20, "convertRect:fromLayer:", v24, x, y, width, height);
            double x = v25;
            double y = v26;
            double width = v27;
            double height = v28;
            if ([(TSDTilingLayer *)v23 masksToBounds])
            {
              [(TSDTilingLayer *)v23 bounds];
              v94.origin.double x = v29;
              v94.origin.double y = v30;
              v94.size.double width = v31;
              v94.size.double height = v32;
              v88.origin.double x = x;
              v88.origin.double y = y;
              v88.size.double width = width;
              v88.size.double height = height;
              CGRect v89 = CGRectIntersection(v88, v94);
              double x = v89.origin.x;
              double y = v89.origin.y;
              double width = v89.size.width;
              double height = v89.size.height;
            }
            unint64_t v20 = (TSDTilingLayer *)[(TSDTilingLayer *)v23 superlayer];
            BOOL v21 = height > 0.0;
            BOOL v22 = width > 0.0;
            if (!v20) {
              break;
            }
            if (height <= 0.0) {
              break;
            }
            unint64_t v24 = v23;
          }
          while (width > 0.0);
        }
      }
      else
      {
        unint64_t v23 = v2;
        double height = v11;
        double width = v9;
        double y = v7;
        double x = v5;
      }
      if (!v21 || !v22) {
        goto LABEL_25;
      }
      -[TSDTilingLayer convertRect:fromLayer:](v2, "convertRect:fromLayer:", v23, x, y, width, height);
    }
    double x = v12;
    double y = v13;
    double width = v14;
    double height = v15;
  }
  else
  {
    double x = *MEMORY[0x263F001A0];
    double y = *(double *)(MEMORY[0x263F001A0] + 8);
    double width = *(double *)(MEMORY[0x263F001A0] + 16);
    double height = *(double *)(MEMORY[0x263F001A0] + 24);
  }
LABEL_25:
  v90.origin.double x = x;
  v90.origin.double y = y;
  v90.size.double width = width;
  v90.size.double height = height;
  v95.origin.double x = v5;
  v95.origin.double y = v7;
  v95.size.double width = v9;
  v95.size.double height = v11;
  CGRect v91 = CGRectIntersection(v90, v95);
  double v34 = v91.origin.x;
  double v35 = v91.origin.y;
  double v36 = v91.size.width;
  double v37 = v91.size.height;
  BOOL v38 = -[TSDTilingLayer p_updateTileSizeWithLayerSize:](v2, "p_updateTileSizeWithLayerSize:", v9, v11);
  unint64_t v39 = [(TSDTilingLayer *)v2 p_tilesWide];
  unint64_t v40 = [(TSDTilingLayer *)v2 p_tilesHigh];
  unint64_t v41 = v40;
  char mFlags = (char)v2->mFlags;
  BOOL v43 = 1;
  unint64_t v73 = v39;
  if (v39 <= 1 && v40 <= 1) {
    BOOL v43 = [(TSDTilingLayer *)v2 drawsInBackground]
  }
       || [(TSDTilingLayer *)v2 forceTiling]
       || v2->_geometryProvider != 0;
  char v44 = (char)v2->mFlags;
  *(unsigned char *)&v2->char mFlags = v44 & 0xEE | v43;
  BOOL v45 = (v44 & 2) != 0 && objc_msgSend(-[TSDTilingLayer p_tileLayers](v2, "p_tileLayers"), "count") != 0;
  geometryProvider = v2->_geometryProvider;
  if (geometryProvider) {
    int v72 = [(TSDTileGeometryProviding *)geometryProvider tileGeometryDirty];
  }
  else {
    int v72 = 0;
  }
  int v47 = mFlags & 1;
  p_double x = &v2->mLastVisibleBounds.origin.x;
  if (!TSDNearlyEqualRects(v34, v35, v36, v37, v2->mLastVisibleBounds.origin.x, v2->mLastVisibleBounds.origin.y, v2->mLastVisibleBounds.size.width, v2->mLastVisibleBounds.size.height)|| v47 != (*(unsigned char *)&v2->mFlags & 1)|| (!TSDNearlyEqualSizes(v2->mLastBoundsSize.width, v2->mLastBoundsSize.height, v9, v11) | v45 | v72) == 1)
  {
    [(TSDTileGeometryProviding *)v2->_geometryProvider setTileGeometryDirty:0];
    char v49 = (char)v2->mFlags;
    if (v47 != (v49 & 1) && (*(unsigned char *)&v2->mFlags & 2) == 0)
    {
      if (*(unsigned char *)&v2->mFlags)
      {
        [(TSDTilingLayer *)v2 setTileContents:0];
      }
      else if ((*(unsigned char *)&v2->mFlags & 0x20) == 0)
      {
        *(unsigned char *)&v2->char mFlags = v49 | 0x20;
      }
    }
    v92.origin.double x = *p_x;
    v92.origin.double y = v2->mLastVisibleBounds.origin.y;
    v92.size.double width = v2->mLastVisibleBounds.size.width;
    v92.size.double height = v2->mLastVisibleBounds.size.height;
    BOOL IsNull = CGRectIsNull(v92);
    *p_double x = v34;
    v2->mLastVisibleBounds.origin.double y = v35;
    v2->mLastVisibleBounds.size.double width = v36;
    v2->mLastVisibleBounds.size.double height = v37;
    v2->mLastBoundsSize.double width = v9;
    v2->mLastBoundsSize.double height = v11;
    id v51 = objc_alloc_init(MEMORY[0x263F089C8]);
    v93.origin.double x = v34;
    v93.origin.double y = v35;
    v93.size.double width = v36;
    v93.size.double height = v37;
    BOOL v52 = CGRectIsNull(v93);
    uint64_t v70 = 56;
    if ((*(unsigned char *)&v2->mFlags & 3) == 1 && !v52 && v37 > 0.0 && v36 > 0.0) {
      -[TSDTilingLayer p_updateTileIndexes:visibleBounds:](v2, "p_updateTileIndexes:visibleBounds:", v51, v34, v35, v36, v37);
    }
    id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v74 = v2;
    id v54 = [(TSDTilingLayer *)v2 p_tileLayers];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v80 objects:v86 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v81;
      BOOL v58 = IsNull || v38;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v81 != v57) {
            objc_enumerationMutation(v54);
          }
          v60 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          uint64_t v61 = objc_msgSend(v60, "index", v70);
          if (v58 || (unint64_t v62 = v61, ([v51 containsIndex:v61] & 1) == 0))
          {
            [v53 addObject:v60];
          }
          else
          {
            [v51 removeIndex:v62];
            if (v72) {
              [(TSDTileGeometryProviding *)v74->_geometryProvider tileGeometryConfigureWithLayer:v74 tileLayer:v60 atIndex:v62];
            }
            objc_msgSend(v60, "updateFrameWithTileSize:tilesWide:tilesHigh:geometryProvider:", v73, v41, v74->_geometryProvider, v74->mTileSize.width, v74->mTileSize.height);
            [v60 setLocation:v62 % v73];
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v80 objects:v86 count:16];
      }
      while (v56);
    }
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __33__TSDTilingLayer_layoutSublayers__block_invoke;
    v79[3] = &unk_2646B1D78;
    v2 = v74;
    v79[6] = v73;
    v79[7] = v41;
    *(CGFloat *)&v79[8] = v5;
    *(CGFloat *)&v79[9] = v7;
    *(double *)&v79[10] = v9;
    *(double *)&v79[11] = v11;
    v79[4] = v74;
    v79[5] = v53;
    objc_msgSend(v51, "enumerateIndexesUsingBlock:", v79, v70);
    [v53 makeObjectsPerformSelector:sel_removeFromSuperlayer];

    uint64_t v3 = v71;
  }
LABEL_65:
  if ((*((unsigned char *)&v2->super.super.isa + v3) & 0x20) != 0 && v2->mHasEverHadTileLayout)
  {
    if (*((unsigned char *)&v2->super.super.isa + v3))
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v63 = [(TSDTilingLayer *)v2 p_tileLayers];
      uint64_t v64 = [v63 countByEnumeratingWithState:&v75 objects:v85 count:16];
      if (!v64) {
        goto LABEL_80;
      }
      uint64_t v65 = v64;
      char v66 = 0;
      uint64_t v67 = *(void *)v76;
      do
      {
        for (uint64_t j = 0; j != v65; ++j)
        {
          if (*(void *)v76 != v67) {
            objc_enumerationMutation(v63);
          }
          v69 = *(void **)(*((void *)&v75 + 1) + 8 * j);
          if ([v69 needsTileDisplay])
          {
            [(NSMutableArray *)v2->mDirtyTiles addObject:v69];
            char v66 = 1;
          }
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v75 objects:v85 count:16];
      }
      while (v65);
      if ((v66 & 1) == 0) {
        goto LABEL_80;
      }
    }
    else
    {
      *((unsigned char *)&v2->super.super.isa + v3) |= 0x40u;
    }
    [(TSDTilingLayer *)v2 setNeedsDisplayForDirtyTiles:v2];
LABEL_80:
    *((unsigned char *)&v2->super.super.isa + v3) &= ~0x20u;
  }
}

uint64_t __33__TSDTilingLayer_layoutSublayers__block_invoke(uint64_t a1, unint64_t a2, double a3, double a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void *)(a1 + 48);
  unint64_t v8 = a2 / v7;
  unint64_t v9 = a2 % v7;
  double v10 = *(void **)(v6 + 136);
  if (v10)
  {
    objc_msgSend(v10, "tileGeometryRectWithLayer:atIndex:mask:");
LABEL_6:
    double v13 = v11;
    double v14 = v12;
    goto LABEL_7;
  }
  double v13 = *(double *)(v6 + 40);
  double v14 = *(double *)(v6 + 48);
  if (v9 == v7 - 1 || v8 == *(void *)(a1 + 56) - 1)
  {
    CGRect v29 = *(CGRect *)(a1 + 64);
    v28.origin.double x = v29.origin.x + v13 * (double)v9;
    v28.origin.double y = v29.origin.y + v14 * (double)v8;
    v28.size.double width = *(CGFloat *)(v6 + 40);
    v28.size.double height = *(CGFloat *)(v6 + 48);
    *(CGRect *)&a3 = CGRectIntersection(v28, v29);
    goto LABEL_6;
  }
LABEL_7:
  if ((objc_msgSend(*(id *)(a1 + 32), "drawsInBackground", a3, a4) & 1) == 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "isMainThread"))
  {
    uint64_t v15 = [*(id *)(a1 + 40) count];
    while (v15)
    {
      double v16 = (TSDTilingTileLayer *)[*(id *)(a1 + 40) objectAtIndex:--v15];
      [(TSDTilingTileLayer *)v16 bounds];
      if (v18 == v13 && v17 == v14)
      {
        [*(id *)(a1 + 40) removeObjectAtIndex:v15];
        if (!v16) {
          break;
        }
        char v20 = 0;
        goto LABEL_19;
      }
    }
  }
  double v16 = objc_alloc_init(TSDTilingTileLayer);
  [(TSDTilingTileLayer *)v16 setZPosition:-10000.0];
  -[TSDTilingTileLayer setOpaque:](v16, "setOpaque:", [*(id *)(a1 + 32) isOpaque]);
  -[TSDTilingTileLayer setAnchorPoint:](v16, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [*(id *)(a1 + 32) contentsScale];
  -[TSDTilingTileLayer setContentsScale:](v16, "setContentsScale:");
  -[TSDTilingTileLayer setDrawsAsynchronously:](v16, "setDrawsAsynchronously:", [*(id *)(a1 + 32) drawsAsynchronously]);
  [*(id *)(a1 + 32) insertSublayer:v16 atIndex:0];

  char v20 = 1;
LABEL_19:
  [(TSDTilingTileLayer *)v16 setIndex:a2];
  -[TSDTilingTileLayer setLocation:](v16, "setLocation:", v9, v8);
  [(TSDTilingTileLayer *)v16 setNeedsTileDisplay:0];
  -[TSDTilingTileLayer setValue:forKeyPath:](v16, "setValue:forKeyPath:", [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 129)], @"separatedOptions.enableContext");
  uint64_t v21 = *(void *)(a1 + 32);
  BOOL v22 = *(void **)(v21 + 136);
  if (v22)
  {
    objc_msgSend(v22, "tileGeometryConfigureWithLayer:tileLayer:atIndex:");
    uint64_t v21 = *(void *)(a1 + 32);
  }
  if ((*(unsigned char *)(v21 + 56) & 4) != 0)
  {
    unint64_t v23 = (CGImage *)objc_msgSend((id)objc_opt_class(), "p_newCheckerboardImage");
    uint64_t v24 = [MEMORY[0x263F158F8] disableActions];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [(TSDTilingTileLayer *)v16 setContents:v23];
    [(TSDTilingTileLayer *)v16 setContentsGravity:*MEMORY[0x263F15E38]];
    [(TSDTilingTileLayer *)v16 setMasksToBounds:1];
    [MEMORY[0x263F158F8] setDisableActions:v24];
    CGImageRelease(v23);
    uint64_t v21 = *(void *)(a1 + 32);
  }
  uint64_t result = -[TSDTilingTileLayer updateFrameWithTileSize:tilesWide:tilesHigh:geometryProvider:](v16, "updateFrameWithTileSize:tilesWide:tilesHigh:geometryProvider:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(v21 + 136), *(double *)(v21 + 40), *(double *)(v21 + 48));
  if ((v20 & 1) == 0)
  {
    double v26 = *(void **)(a1 + 32);
    return objc_msgSend(v26, "i_setNeedsTileDisplayForTile:", v16);
  }
  return result;
}

- (void)setNeedsDisplayForDirtyTiles:(id)a3
{
  [(TSDTilingLayer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)-[TSDTilingLayer delegate](self, "delegate"), "tilingLayerWillSetNeedsDisplayForDirtyTiles:", self);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDTilingLayer;
  [(CALayer *)&v5 setNeedsDisplayForDirtyTiles:a3];
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  [a3 superlayer];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  unint64_t v8 = (TSDTilingLayer *)[a3 superlayer];
  if (v6 == v7)
  {
    if ((TSDTilingLayer *)[(TSDTilingLayer *)v8 superlayer] != self)
    {
      double v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSDTilingLayer drawLayer:inContext:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 620, @"This tiling layer is not responsible for the layer asking to be drawn");
    }
    objc_msgSend((id)objc_msgSend(a3, "superlayer"), "frame");
    -[TSDTilingLayer setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
  }
  else
  {
    if (v8 != self)
    {
      unint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSDTilingLayer drawLayer:inContext:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 623, @"This tiling layer is not responsible for the layer asking to be drawn");
    }
    [(TSDTilingLayer *)self setNeedsDisplay];
  }
}

- (void)setTilingMode:(int)a3
{
  if (self->mTilingMode != a3)
  {
    self->mTilingMode = a3;
    if ((*(unsigned char *)&self->mFlags & 2) == 0)
    {
      CGSize v4 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
      self->mLastVisibleBounds.origin = (CGPoint)*MEMORY[0x263F001A0];
      self->mLastVisibleBounds.size = v4;
      self->mLastBoundsSize = (CGSize)*MEMORY[0x263F001B0];
      [(TSDTilingLayer *)self setNeedsDisplay];
      [(TSDTilingLayer *)self setNeedsLayout];
    }
  }
}

- (BOOL)drawsInBackground
{
  return (*(unsigned char *)&self->mFlags >> 2) & 1;
}

- (void)setDrawsInBackground:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->char mFlags = *(unsigned char *)&self->mFlags & 0xFB | v3;
}

- (BOOL)forceTiling
{
  return (*(unsigned char *)&self->mFlags >> 3) & 1;
}

- (void)setForceTiling:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->char mFlags = *(unsigned char *)&self->mFlags & 0xF7 | v3;
}

- (void)tilingSafeSetSublayers:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToArray:", -[TSDTilingLayer p_nonTileAndContentLayers](self, "p_nonTileAndContentLayers")) & 1) == 0)
  {
    uint64_t v5 = objc_msgSend(-[TSDTilingLayer p_tileAndContentLayers](self, "p_tileAndContentLayers"), "arrayByAddingObjectsFromArray:", a3);
    [(TSDTilingLayer *)self setSublayers:v5];
  }
}

- (BOOL)tilingSafeHasContents
{
  if (*(unsigned char *)&self->mFlags) {
    return objc_msgSend(-[TSDTilingLayer p_tileLayers](self, "p_tileLayers"), "count") != 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingLayer;
  return [(CALayer *)&v3 tilingSafeHasContents];
}

- (void)i_drawTile:(id)a3 inContext:(CGContext *)a4
{
  if (CGRectIsNull(self->mLastVisibleBounds))
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDTilingLayer i_drawTile:inContext:]"];
    [v7 handleFailureInFunction:v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTilingLayer.m"), 696, @"Shouldn't be drawing tiles for an hidden layer %p, tile %p index %ld", self, a3, objc_msgSend(a3, "index") file lineNumber description];
  }
  [a3 frame];

  -[TSDTilingLayer i_drawRect:inContext:inBackground:](self, "i_drawRect:inContext:inBackground:", a4, 0);
}

- (void)i_drawRect:(CGRect)a3 inContext:(CGContext *)a4 inBackground:(BOOL)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGContextSaveGState(a4);
  CGContextTranslateCTM(a4, -x, -y);
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGContextClipToRect(a4, v12);
  [(TSDTilingLayer *)self drawInContext:a4];

  CGContextRestoreGState(a4);
}

- (void)i_drawTileInBackground:(id)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v10 = [a3 index];
  id v19 = 0;
  uint64_t v20 = 0;
  [(TSDTilingLayer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v11 = objc_msgSend((id)-[TSDTilingLayer delegate](self, "delegate"), "shouldBeginDrawingTilingLayerInBackground:returningToken:andQueue:", self, &v20, &v19);
    uint64_t v12 = v20;
  }
  else
  {
    uint64_t v12 = 0;
    int v11 = 1;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  uint64_t v15 = __48__TSDTilingLayer_i_drawTileInBackground_inRect___block_invoke;
  double v16 = &unk_2646B0750;
  double v17 = self;
  uint64_t v18 = v12;
  if (v11)
  {
    if ([v19 isShuttingDown])
    {
      v15((uint64_t)v14);
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __48__TSDTilingLayer_i_drawTileInBackground_inRect___block_invoke_2;
      v13[3] = &unk_2646B1DA0;
      v13[4] = a3;
      v13[5] = v19;
      *(CGFloat *)&v13[8] = x;
      *(CGFloat *)&v13[9] = y;
      *(CGFloat *)&v13[10] = width;
      *(CGFloat *)&v13[11] = height;
      v13[6] = v14;
      v13[7] = v10;
      [v19 performAsync:v13];
    }
  }
}

uint64_t __48__TSDTilingLayer_i_drawTileInBackground_inRect___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    objc_super v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 didEndDrawingTilingLayerInBackground:v4 withToken:v5];
  }
  return result;
}

uint64_t __48__TSDTilingLayer_i_drawTileInBackground_inRect___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) superlayer]
    && [*(id *)(a1 + 32) index] == *(void *)(a1 + 56)
    && ([*(id *)(a1 + 40) isShuttingDown] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplayInRectIgnoringBackground:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
    [*(id *)(a1 + 32) display];
    [*(id *)(a1 + 32) setMasksToBounds:0];
    [MEMORY[0x263F158F8] flush];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)i_setNeedsTileDisplayForTile:(id)a3
{
}

- (BOOL)p_updateTileSizeWithLayerSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(TSDTilingLayer *)self contentsScale];
  double v7 = v6;
  objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
  double v9 = v8 / v7;
  objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
  *(float *)&double v10 = v10 * 0.25;
  double v11 = fmaxf(*(float *)&v10, 640.0) / v7;
  BOOL v12 = width > v9;
  if (height > v9) {
    BOOL v12 = 1;
  }
  double v13 = width * height;
  double v14 = v11 * v11;
  double v15 = v9 * v9 * 0.25;
  switch(self->mTilingMode)
  {
    case 1:
      if (v13 > v14) {
        BOOL v12 = 1;
      }
      goto LABEL_6;
    case 2:
      if (v13 > v14) {
        BOOL v12 = 1;
      }
      if (v12)
      {
        double width = v11 + v11;
        double height = v11 * 0.5;
      }
      break;
    case 3:
      if (v13 > v14) {
        BOOL v12 = 1;
      }
      if (v12)
      {
        double width = v11 * 0.5;
        double height = v11 + v11;
      }
      break;
    case 4:
      if (v13 > v15) {
        BOOL v12 = 1;
      }
      if (v12)
      {
        double height = v11 + v11;
        double width = v9;
      }
      break;
    case 5:
      if (v13 > v15) {
        BOOL v12 = 1;
      }
      if (v12)
      {
        double height = v9;
        double width = v11 + v11;
      }
      break;
    case 6:
      if (v13 > v14) {
        BOOL v12 = 1;
      }
      if (v12)
      {
        double v16 = TSDCeilSize(width);
        float v17 = v16 / v11;
        *(float *)&double v16 = v16 / ceilf(v17);
        double width = (float)(floorf(*(float *)&v16) + 1.0);
        *(float *)&double v16 = v18 / v11;
        *(float *)&double v16 = v18 / ceilf(*(float *)&v16);
        double height = (float)(floorf(*(float *)&v16) + 1.0);
      }
      break;
    default:
LABEL_6:
      if (v12)
      {
        double height = v11;
        double width = v11;
      }
      break;
  }
  BOOL v19 = height != self->mTileSize.height || width != self->mTileSize.width;
  if (v19)
  {
    self->mTileSize.double width = width;
    self->mTileSize.double height = height;
  }
  return v19;
}

+ (CGSize)defaultTileSize
{
  objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
  *(float *)&double v2 = v2 * 0.25;
  double v3 = fmaxf(*(float *)&v2, 640.0);
  double v4 = v3;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)p_tileLayers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v3 = (void *)[MEMORY[0x263EFF980] array];
  objc_opt_class();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = (void *)[(TSDTilingLayer *)self sublayers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)p_tileAndContentLayers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v3 = (void *)[MEMORY[0x263EFF980] array];
  objc_opt_class();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = (void *)[(TSDTilingLayer *)self sublayers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)p_nonTileAndContentLayers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v3 = (void *)[MEMORY[0x263EFF980] array];
  objc_opt_class();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = (void *)[(TSDTilingLayer *)self sublayers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v3) {
            double v3 = (void *)[MEMORY[0x263EFF980] array];
          }
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

+ (CGImage)p_newCheckerboardImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__TSDTilingLayer_p_newCheckerboardImage__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = a1;
  if (p_newCheckerboardImage_s_checkerboardImageOnce != -1) {
    dispatch_once(&p_newCheckerboardImage_s_checkerboardImageOnce, block);
  }
  return (CGImage *)[(id)p_newCheckerboardImage_s_checkerboardImage newImage];
}

uint64_t __40__TSDTilingLayer_p_newCheckerboardImage__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(MEMORY[0x263F7C838]) initWithDelegate:*(void *)(a1 + 32) createImageSelector:sel_p_newGeneratedCheckerboardImage];
  p_newCheckerboardImage_s_checkerboardImage = result;
  return result;
}

+ (CGImage)p_newGeneratedCheckerboardImage
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "whiteColor"), "CGColor");
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithWhite:alpha:", 0.85, 1.0), "CGColor");
  double v2 = (CGColor *)TSUCreateCheckerBoardColor();
  objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
  float64_t v15 = v3;
  objc_msgSend(+[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities"), "maximumTextureSize");
  v4.f64[0] = v15;
  v4.f64[1] = v5;
  __asm { FMOV            V0.2D, #0.25 }
  float64x2_t v11 = vcvtq_f64_f32(vmaxnm_f32(vcvt_f32_f64(vmulq_f64(v4, _Q0)), (float32x2_t)vdup_n_s32(0x44200000u)));
  long long v12 = TSDBitmapContextCreate(11, vaddq_f64(v11, v11).f64[0]);
  CGContextSetFillColorWithColor(v12, v2);
  v16.origin.CGFloat x = TSDRectWithSize();
  CGContextFillRect(v12, v16);
  Image = CGBitmapContextCreateImage(v12);
  CGContextRelease(v12);
  CGColorRelease(v2);
  return Image;
}

- (TSDTileGeometryProviding)geometryProvider
{
  return self->_geometryProvider;
}

- (void)setGeometryProvider:(id)a3
{
}

- (BOOL)enableContext
{
  return self->_enableContext;
}

- (int)tilingMode
{
  return self->mTilingMode;
}

@end
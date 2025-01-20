@interface CRLTilingLayer
+ (Class)crl_renderableClass;
- (BOOL)crl_tilingSafeHasContents;
- (BOOL)forceTiled;
- (BOOL)p_updateTileSizeWithLayerSize:(CGSize)a3;
- (CRLTilingLayer)init;
- (id)p_deferredTileBlocksForCurrentThread;
- (id)p_nonTileAndContentLayers;
- (id)p_tileAndContentLayers;
- (id)p_tileLayers;
- (int64_t)tilingMode;
- (void)crl_cancelLayoutForTilingLayers;
- (void)crl_setNeedsLayoutForTilingLayers;
- (void)crl_tilingSafeSetSublayers:(id)a3;
- (void)display;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)i_drawRect:(CGRect)a3 inContext:(CGContext *)a4 inBackground:(BOOL)a5;
- (void)i_drawTile:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSublayers;
- (void)setContents:(id)a3;
- (void)setContentsScale:(double)a3;
- (void)setForceTiled:(BOOL)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNeedsLayout;
- (void)setTileContents:(id)a3;
- (void)setTilingMode:(int64_t)a3;
@end

@implementation CRLTilingLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class();
}

- (CRLTilingLayer)init
{
  v11.receiver = self;
  v11.super_class = (Class)CRLTilingLayer;
  v2 = [(CRLTilingLayer *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_tilingMode = 0;
    [(CRLTilingLayer *)v2 contentsScale];
    CGFloat v5 = 640.0 / v4;
    v3->_tileSize.width = v5;
    v3->_tileSize.height = v5;
    *(unsigned char *)&v3->_flags |= 2u;
    v6 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:0];
    deferredTileBlocks = v3->_deferredTileBlocks;
    v3->_deferredTileBlocks = v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    deferredTileBlocksLock = v3->_deferredTileBlocksLock;
    v3->_deferredTileBlocksLock = (OS_dispatch_semaphore *)v8;

    __dmb(0xBu);
  }
  return v3;
}

- (void)setContentsScale:(double)a3
{
  [(CRLTilingLayer *)self contentsScale];
  if (v5 != a3)
  {
    self->_tileSize.width = 640.0 / a3;
    self->_tileSize.height = 640.0 / a3;
    [(CRLTilingLayer *)self setNeedsLayout];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = [(CRLTilingLayer *)self p_tileLayers];
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) setContentsScale:a3];
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CRLTilingLayer;
  [(CRLTilingLayer *)&v11 setContentsScale:a3];
}

- (void)setContents:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLTilingLayer;
  [(CRLTilingLayer *)&v5 setContents:a3];
  char flags = (char)self->_flags;
  *(unsigned char *)&self->_char flags = flags | 2;
  if (flags) {
    [(CRLTilingLayer *)self setNeedsLayout];
  }
}

- (void)setTileContents:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v4 || (isKindOfClass & 1) != 0)
  {
    if (v4) {
      [v4 setZPosition:-10000.0];
    }
    -[CRLTilingLayer setContents:](&v7, "setContents:", 0, v6.receiver, v6.super_class, self, CRLTilingLayer);
  }
  else
  {
    -[CRLTilingLayer setContents:](&v6, "setContents:", v4, self, CRLTilingLayer, v7.receiver, v7.super_class);
  }
}

- (void)display
{
  if (*(unsigned char *)&self->_flags)
  {
    v3 = [(CRLTilingLayer *)self contents];

    if (v3)
    {
      v5.receiver = self;
      v5.super_class = (Class)CRLTilingLayer;
      [(CRLTilingLayer *)&v5 setContents:0];
    }
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CRLTilingLayer;
    [(CRLTilingLayer *)&v4 display];
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)&self->_flags &= ~2u;
    [(CRLTilingLayer *)self setNeedsLayout];
    CGSize size = CGRectNull.size;
    self->_lastVisibleBounds.origin = CGRectNull.origin;
    self->_lastVisibleBounds.CGSize size = size;
    self->_lastBoundsSize = CGSizeZero;
  }
  v32.receiver = self;
  v32.super_class = (Class)CRLTilingLayer;
  -[CRLTilingLayer setNeedsDisplayInRect:](&v32, "setNeedsDisplayInRect:", x, y, width, height);
  uint64_t v9 = [(CRLTilingLayer *)self p_deferredTileBlocksForCurrentThread];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v10 = [(CRLTilingLayer *)self p_tileLayers];
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v15 frame];
        v35.origin.double x = v16;
        v35.origin.double y = v17;
        v35.size.double width = v18;
        v35.size.double height = v19;
        v34.origin.double x = x;
        v34.origin.double y = y;
        v34.size.double width = width;
        v34.size.double height = height;
        if (CGRectIntersectsRect(v34, v35))
        {
          -[CRLTilingLayer convertRect:toLayer:](self, "convertRect:toLayer:", v15, x, y, width, height);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10044B568;
          v27[3] = &unk_1014CE288;
          v27[4] = v15;
          v27[5] = v20;
          v27[6] = v21;
          v27[7] = v22;
          v27[8] = v23;
          id v24 = [v27 copy];
          id v25 = objc_retainBlock(v24);
          [v9 addObject:v25];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    v26.receiver = self;
    v26.super_class = (Class)CRLTilingLayer;
    [(CRLTilingLayer *)&v26 setNeedsLayout];
  }
}

- (void)setNeedsLayout
{
  *(unsigned char *)&self->_flags |= 8u;
  v2.receiver = self;
  v2.super_class = (Class)CRLTilingLayer;
  [(CRLTilingLayer *)&v2 setNeedsLayout];
}

- (void)crl_setNeedsLayoutForTilingLayers
{
  [(CRLTilingLayer *)self setNeedsLayout];
  v3.receiver = self;
  v3.super_class = (Class)CRLTilingLayer;
  [(CRLTilingLayer *)&v3 crl_setNeedsLayoutForTilingLayers];
}

- (void)crl_cancelLayoutForTilingLayers
{
  *(unsigned char *)&self->_flags &= ~8u;
  v2.receiver = self;
  v2.super_class = (Class)CRLTilingLayer;
  [(CRLTilingLayer *)&v2 crl_cancelLayoutForTilingLayers];
}

- (void)layoutSublayers
{
  objc_super v3 = [(CRLTilingLayer *)self p_deferredTileBlocksForCurrentThread];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v105 objects:v110 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v106;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v106 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v105 + 1) + 8 * i) + 16))();
      }
      id v5 = [v3 countByEnumeratingWithState:&v105 objects:v110 count:16];
    }
    while (v5);
  }
  [v3 removeAllObjects];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    id v8 = [(CRLTilingLayer *)self delegate];
    uint64_t v9 = self;
    if (objc_opt_respondsToSelector())
    {
      v10 = [(CRLTilingLayer *)self delegate];
      unsigned int v11 = [v10 shouldLayoutTilingLayer:self];

      if (!v11) {
        goto LABEL_71;
      }
    }
    else
    {
    }
    v104.receiver = v9;
    v104.super_class = (Class)CRLTilingLayer;
    [(CRLTilingLayer *)&v104 layoutSublayers];
    [(CRLTilingLayer *)v9 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    uint64_t v20 = [(CRLTilingLayer *)v9 superlayer];

    if (v20)
    {
      uint64_t v21 = [(CRLTilingLayer *)v9 delegate];
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        uint64_t v23 = [(CRLTilingLayer *)v9 delegate];
        [v23 visibleBoundsForTilingLayer:v9];
        double x = v24;
        double y = v26;
        double width = v28;
        double height = v30;
      }
      else
      {
        objc_super v32 = v9;
        v33 = [(CRLTilingLayer *)v32 superlayer];
        BOOL v34 = v19 > 0.0;
        BOOL v35 = v17 > 0.0;
        if (v33 && v19 > 0.0 && v17 > 0.0)
        {
          double x = v13;
          double y = v15;
          double width = v17;
          double height = v19;
          v36 = v32;
          do
          {
            [v33 convertRect:v36 fromLayer:x, y, width, height];
            double x = v37;
            double y = v38;
            double width = v39;
            double height = v40;
            if ([v33 masksToBounds])
            {
              [v33 bounds];
              v119.origin.double x = v41;
              v119.origin.double y = v42;
              v119.size.double width = v43;
              v119.size.double height = v44;
              v111.origin.double x = x;
              v111.origin.double y = y;
              v111.size.double width = width;
              v111.size.double height = height;
              CGRect v112 = CGRectIntersection(v111, v119);
              double x = v112.origin.x;
              double y = v112.origin.y;
              double width = v112.size.width;
              double height = v112.size.height;
            }
            v45 = v33;

            v33 = [(CRLTilingLayer *)v45 superlayer];

            BOOL v34 = height > 0.0;
            BOOL v35 = width > 0.0;
            if (!v33) {
              break;
            }
            if (height <= 0.0) {
              break;
            }
            v36 = v45;
          }
          while (width > 0.0);
        }
        else
        {
          v45 = v32;
          double height = v19;
          double width = v17;
          double y = v15;
          double x = v13;
        }
        if (v34 && v35)
        {
          -[CRLTilingLayer convertRect:fromLayer:](v32, "convertRect:fromLayer:", v45, x, y, width, height);
          double x = v46;
          double y = v47;
          double width = v48;
          double height = v49;
        }
      }
    }
    else
    {
      double x = CGRectNull.origin.x;
      double y = CGRectNull.origin.y;
      double width = CGRectNull.size.width;
      double height = CGRectNull.size.height;
    }
    v113.origin.double x = x;
    v113.origin.double y = y;
    v113.size.double width = width;
    v113.size.double height = height;
    v120.origin.double x = v13;
    v120.origin.double y = v15;
    v120.size.double width = v17;
    v120.size.double height = v19;
    CGRect v114 = CGRectIntersection(v113, v120);
    double v50 = v114.origin.x;
    double v51 = v114.origin.y;
    double v52 = v114.size.width;
    double v53 = v114.size.height;
    unsigned __int8 v86 = -[CRLTilingLayer p_updateTileSizeWithLayerSize:](v9, "p_updateTileSizeWithLayerSize:", v17, v19);
    p_double width = &v9->_tileSize.width;
    unint64_t v54 = vcvtpd_u64_f64(v19 / v9->_tileSize.height);
    $B7AE2DEE8DBEC4513AEAA069074B9715 flags = v9->_flags;
    unint64_t v89 = v54;
    unint64_t v90 = vcvtpd_u64_f64(v17 / v9->_tileSize.width);
    if (v90 > 1 || v54 > 1) {
      LOBYTE(v57) = 1;
    }
    else {
      int v57 = (*(unsigned int *)&flags >> 2) & 1;
    }
    char v58 = *(unsigned char *)&flags & 0xF6 | v57;
    *(unsigned char *)&v9->_$B7AE2DEE8DBEC4513AEAA069074B9715 flags = v58;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      v60 = [(CRLTilingLayer *)v9 p_tileLayers];
      BOOL v59 = [v60 count] != 0;

      char v58 = (char)v9->_flags;
    }
    else
    {
      BOOL v59 = 0;
    }
    int v61 = *(unsigned char *)&flags & 1;
    p_double x = &v9->_lastVisibleBounds.origin.x;
    int v63 = v58 & 1;
    if (!sub_100064208(v50, v51, v52, v53, v9->_lastVisibleBounds.origin.x, v9->_lastVisibleBounds.origin.y, v9->_lastVisibleBounds.size.width, v9->_lastVisibleBounds.size.height)|| v61 != v63|| !sub_100064084(v9->_lastBoundsSize.width, v9->_lastBoundsSize.height, v17, v19)|| v59)
    {
      v87 = v9;
      if (v61 != v63 && (v58 & 2) == 0)
      {
        if (v58)
        {
          [(CRLTilingLayer *)v9 setTileContents:0];
        }
        else
        {
          v103.receiver = v9;
          v103.super_class = (Class)CRLTilingLayer;
          -[CRLTilingLayer setNeedsDisplayInRect:](&v103, "setNeedsDisplayInRect:", CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
        }
      }
      v115.origin.double x = *p_x;
      v115.origin.double y = v9->_lastVisibleBounds.origin.y;
      v115.size.double width = v9->_lastVisibleBounds.size.width;
      v115.size.double height = v9->_lastVisibleBounds.size.height;
      BOOL IsNull = CGRectIsNull(v115);
      *p_double x = v50;
      v9->_lastVisibleBounds.origin.double y = v51;
      v9->_lastVisibleBounds.size.double width = v52;
      v9->_lastVisibleBounds.size.double height = v53;
      v9->_lastBoundsSize.double width = v17;
      v9->_lastBoundsSize.double height = v19;
      id v65 = objc_alloc_init((Class)NSMutableIndexSet);
      v116.origin.double x = v50;
      v116.origin.double y = v51;
      v116.size.double width = v52;
      v116.size.double height = v53;
      BOOL v66 = CGRectIsNull(v116);
      if ((*(unsigned char *)&v9->_flags & 3) == 1 && !v66 && v53 > 0.0 && v52 > 0.0)
      {
        double v67 = sub_100064680(v50, v51, v13);
        v121.size.double width = *p_width;
        v121.size.double height = v9->_tileSize.height;
        *(float *)&double v67 = v67 / *p_width;
        *(float *)&double v68 = v68 / v121.size.height;
        unint64_t v69 = (unint64_t)(float)(floorf(*(float *)&v67) + (float)(floorf(*(float *)&v68) * (float)v90));
        v121.origin.double x = v13 + *p_width * (double)(v69 % v90);
        v121.origin.double y = v15 + v121.size.height * (double)(v69 / v90);
        v117.origin.double x = v50;
        v117.origin.double y = v51;
        v117.size.double width = v52;
        v117.size.double height = v53;
        CGRect v118 = CGRectUnion(v117, v121);
        unint64_t v70 = vcvtpd_u64_f64(v118.size.height / v9->_tileSize.height);
        if (v70)
        {
          uint64_t v71 = 0;
          unint64_t v72 = vcvtpd_u64_f64(v118.size.width / *p_width);
          do
          {
            if (v72)
            {
              unint64_t v73 = v69;
              unint64_t v74 = v72;
              do
              {
                [v65 addIndex:v73++];
                --v74;
              }
              while (v74);
            }
            ++v71;
            v69 += v90;
          }
          while (v71 != v70);
        }
      }
      id v75 = objc_alloc_init((Class)NSMutableArray);
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      v76 = [(CRLTilingLayer *)v87 p_tileLayers];
      id v77 = [v76 countByEnumeratingWithState:&v99 objects:v109 count:16];
      if (v77)
      {
        id v78 = v77;
        uint64_t v79 = *(void *)v100;
        char v80 = IsNull | v86;
        do
        {
          for (j = 0; j != v78; j = (char *)j + 1)
          {
            if (*(void *)v100 != v79) {
              objc_enumerationMutation(v76);
            }
            v82 = *(void **)(*((void *)&v99 + 1) + 8 * (void)j);
            id v83 = [v82 index];
            if ((v80 & 1) != 0 || (id v84 = v83, ([v65 containsIndex:v83] & 1) == 0))
            {
              [v75 addObject:v82];
            }
            else
            {
              [v65 removeIndex:v84];
              [v82 updateFrameWithTileSize:v90 tilesWide:v89 tilesHigh:*p_width p_width[1]];
            }
          }
          id v78 = [v76 countByEnumeratingWithState:&v99 objects:v109 count:16];
        }
        while (v78);
      }

      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472;
      v91[2] = sub_10044BE4C;
      v91[3] = &unk_1014FA5E0;
      unint64_t v93 = v90;
      unint64_t v94 = v89;
      double v95 = v13;
      double v96 = v15;
      double v97 = v17;
      double v98 = v19;
      v91[4] = v87;
      id v92 = v75;
      id v85 = v75;
      [v65 enumerateIndexesUsingBlock:v91];
      [v85 makeObjectsPerformSelector:"removeFromSuperlayer"];
    }
  }
LABEL_71:
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 superlayer];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();

  uint64_t v9 = [v5 superlayer];
  v10 = v9;
  if (v7 == v8)
  {
    double v14 = [(CRLTilingLayer *)v9 superlayer];

    if (v14 != self)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA600);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B368C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA620);
      }
      double v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v15);
      }
      double v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTilingLayer drawLayer:inContext:]");
      double v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTilingLayer.m"];
      +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:378 isFatal:0 description:"This tiling layer is not responsible for the layer asking to be drawn"];
    }
    double v18 = [v5 superlayer];
    [v18 frame];
    -[CRLTilingLayer setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
  }
  else
  {

    if (v10 != self)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA640);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B3720();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA660);
      }
      unsigned int v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v11);
      }
      double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTilingLayer drawLayer:inContext:]");
      double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTilingLayer.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:381 isFatal:0 description:"This tiling layer is not responsible for the layer asking to be drawn"];
    }
    [(CRLTilingLayer *)self setNeedsDisplay];
  }
}

- (void)setTilingMode:(int64_t)a3
{
  if (self->_tilingMode != a3)
  {
    self->_tilingMode = a3;
    if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      CGSize size = CGRectNull.size;
      self->_lastVisibleBounds.origin = CGRectNull.origin;
      self->_lastVisibleBounds.CGSize size = size;
      self->_lastBoundsSize = CGSizeZero;
      [(CRLTilingLayer *)self setNeedsDisplay];
      [(CRLTilingLayer *)self setNeedsLayout];
    }
  }
}

- (BOOL)forceTiled
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)setForceTiled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$B7AE2DEE8DBEC4513AEAA069074B9715 flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (void)crl_tilingSafeSetSublayers:(id)a3
{
  id v8 = a3;
  id v4 = [(CRLTilingLayer *)self p_nonTileAndContentLayers];
  unsigned __int8 v5 = [v8 isEqualToArray:v4];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(CRLTilingLayer *)self p_tileAndContentLayers];
    uint64_t v7 = [v6 arrayByAddingObjectsFromArray:v8];
    [(CRLTilingLayer *)self setSublayers:v7];
  }
}

- (BOOL)crl_tilingSafeHasContents
{
  if (*(unsigned char *)&self->_flags)
  {
    char v3 = [(CRLTilingLayer *)self p_tileLayers];
    BOOL v2 = [v3 count] != 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLTilingLayer;
    return [(CRLTilingLayer *)&v5 crl_tilingSafeHasContents];
  }
  return v2;
}

- (void)i_drawTile:(id)a3 inContext:(CGContext *)a4
{
  id v6 = a3;
  if (CGRectIsNull(self->_lastVisibleBounds))
  {
    unsigned int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA680);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      double v12 = v8;
      *(_DWORD *)buf = 67110658;
      unsigned int v14 = v7;
      __int16 v15 = 2082;
      double v16 = "-[CRLTilingLayer i_drawTile:inContext:]";
      __int16 v17 = 2082;
      double v18 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTilingLayer.m";
      __int16 v19 = 1024;
      int v20 = 434;
      __int16 v21 = 2048;
      char v22 = self;
      __int16 v23 = 2048;
      id v24 = v6;
      __int16 v25 = 2048;
      id v26 = [v6 index];
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Shouldn't be drawing tiles for an hidden layer %p, tile %p index %ld", buf, 0x40u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA6A0);
    }
    uint64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTilingLayer i_drawTile:inContext:]");
    unsigned int v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTilingLayer.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 434, 0, "Shouldn't be drawing tiles for an hidden layer %p, tile %p index %ld", self, v6, [v6 index]);
  }
  [v6 frame];
  -[CRLTilingLayer i_drawRect:inContext:inBackground:](self, "i_drawRect:inContext:inBackground:", a4, 0);
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
  [(CRLTilingLayer *)self drawInContext:a4];

  CGContextRestoreGState(a4);
}

- (BOOL)p_updateTileSizeWithLayerSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CRLTilingLayer *)self contentsScale];
  double v7 = 2048.0 / v6;
  double v8 = 640.0 / v6;
  BOOL v9 = width > 2048.0 / v6;
  if (height > 2048.0 / v6) {
    BOOL v9 = 1;
  }
  double v10 = width * height;
  double v11 = v8 * v8;
  double v12 = v7 * v7 * 0.25;
  switch(self->_tilingMode)
  {
    case 1:
      if (v10 > v11) {
        BOOL v9 = 1;
      }
      goto LABEL_6;
    case 2:
      if (v10 > v11) {
        BOOL v9 = 1;
      }
      BOOL v13 = v9;
      double v14 = v8 + v8;
      double v15 = v8 * 0.5;
      goto LABEL_15;
    case 3:
      if (v10 > v11) {
        BOOL v9 = 1;
      }
      BOOL v13 = v9;
      double v14 = v8 * 0.5;
      double v15 = v8 + v8;
LABEL_15:
      if (v13) {
        double height = v15;
      }
      if (v13) {
        double width = v14;
      }
      break;
    case 4:
      if (v10 > v12) {
        BOOL v9 = 1;
      }
      if (v9)
      {
        double height = v8 + v8;
        double width = v7;
      }
      break;
    case 5:
      if (v10 > v12) {
        BOOL v9 = 1;
      }
      if (v9)
      {
        double height = v7;
        double width = v8 + v8;
      }
      break;
    case 6:
      if (v10 > v11) {
        BOOL v9 = 1;
      }
      if (v9)
      {
        double v16 = sub_1000674B8(width);
        float v17 = v16 / v8;
        *(float *)&double v16 = v16 / ceilf(v17);
        double width = (float)(floorf(*(float *)&v16) + 1.0);
        *(float *)&double v16 = v18 / v8;
        *(float *)&double v16 = v18 / ceilf(*(float *)&v16);
        double height = (float)(floorf(*(float *)&v16) + 1.0);
      }
      break;
    default:
LABEL_6:
      if (v9)
      {
        double height = v8;
        double width = v8;
      }
      break;
  }
  BOOL v19 = height != self->_tileSize.height || width != self->_tileSize.width;
  if (v19)
  {
    self->_tileSize.double width = width;
    self->_tileSize.double height = height;
  }
  return v19;
}

- (id)p_tileLayers
{
  char v3 = +[NSMutableArray array];
  objc_opt_class();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CRLTilingLayer *)self sublayers];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)p_tileAndContentLayers
{
  char v3 = +[NSMutableArray array];
  objc_opt_class();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CRLTilingLayer *)self sublayers];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)p_nonTileAndContentLayers
{
  char v3 = +[NSMutableArray array];
  objc_opt_class();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CRLTilingLayer *)self sublayers];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v3)
          {
            char v3 = +[NSMutableArray array];
          }
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)p_deferredTileBlocksForCurrentThread
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_deferredTileBlocksLock, 0xFFFFFFFFFFFFFFFFLL);
  char v3 = +[NSThread currentThread];
  id v4 = [(NSMapTable *)self->_deferredTileBlocks objectForKey:v3];
  if (!v4)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    [(NSMapTable *)self->_deferredTileBlocks setObject:v4 forKey:v3];
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_deferredTileBlocksLock);

  return v4;
}

- (int64_t)tilingMode
{
  return self->_tilingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredTileBlocks, 0);

  objc_storeStrong((id *)&self->_deferredTileBlocksLock, 0);
}

@end
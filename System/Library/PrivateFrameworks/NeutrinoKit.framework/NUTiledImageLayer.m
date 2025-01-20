@interface NUTiledImageLayer
+ (id)defaultActionForKey:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)validRegionInsets;
- (BOOL)nu_contentsAreFlipped;
- (CGColor)debugColor;
- (NSMutableArray)_tileLayers;
- (NSString)debugDescription;
- (NUImageGeometry)_geometry;
- (NUPurgeableTextureImage)_image;
- (NUTiledImageLayer)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)snapshotImage;
- (void)_recycleTiles;
- (void)_updateSublayers;
- (void)dealloc;
- (void)removeFromSuperlayer;
- (void)setDebugColor:(CGColor *)a3;
- (void)setGeometry:(id)a3;
- (void)setImage:(id)a3;
- (void)setValidRegionInsets:(id)a3;
- (void)set_geometry:(id)a3;
- (void)set_image:(id)a3;
- (void)set_tileLayers:(id)a3;
@end

@implementation NUTiledImageLayer

- (void)_updateSublayers
{
  v3 = [(NUTiledImageLayer *)self superlayer];

  if (v3)
  {
    [(NUTiledImageLayer *)self _recycleTiles];
    v4 = [(NUTiledImageLayer *)self image];
    if (v4)
    {
      v5 = [(NUTiledImageLayer *)self geometry];

      if (v5)
      {
        [(NUTiledImageLayer *)self position];
        [(NUTiledImageLayer *)self anchorPoint];
        [(NUTiledImageLayer *)self bounds];
        NUAbsolutePointInRect();
        v6 = [(NUTiledImageLayer *)self geometry];
        [v6 renderScale];
        NUScaleToDouble();

        [(NUTiledImageLayer *)self bounds];
        long long v33 = 0u;
        long long v34 = 0u;
        NUPixelRectFromCGRect();
        if ([(NUTiledImageLayer *)self isGeometryFlipped])
        {
          uint64_t v27 = 0;
          uint64_t v28 = 0;
          uint64_t v29 = [v4 size];
          uint64_t v30 = v7;
          long long v25 = v33;
          long long v26 = v34;
          NUPixelRectFlipYOrigin();
          long long v33 = v31;
          long long v34 = v32;
        }
        long long v31 = v33;
        long long v32 = v34;
        v8 = [MEMORY[0x263F58678] regionWithRect:&v31];
        v9 = [v4 validRegion];
        uint64_t v10 = [(NUTiledImageLayer *)self validRegionInsets];
        v12 = objc_msgSend(v9, "regionByShrinkingBy:", v10, v11);

        v13 = [v12 regionByClippingToRegion:v8];
        if (([v13 isEmpty] & 1) == 0)
        {
          v14 = [v4 colorSpace];
          if ([v14 isHDR]) {
            char v15 = 1;
          }
          else {
            char v15 = [v14 isExtended];
          }
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __37__NUTiledImageLayer__updateSublayers__block_invoke;
          v17[3] = &unk_2642C2F68;
          id v18 = v14;
          id v19 = v13;
          v20 = self;
          long long v22 = v33;
          long long v23 = v34;
          id v21 = v4;
          char v24 = v15;
          id v16 = v14;
          [v21 readSurfaceRegion:v19 withBlock:v17];
        }
      }
    }
  }
}

- (NSMutableArray)_tileLayers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (NUImageGeometry)_geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 56, 1);
}

- (NUPurgeableTextureImage)_image
{
  return (NUPurgeableTextureImage *)objc_getProperty(self, a2, 48, 1);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)validRegionInsets
{
  p_validRegionInsets = &self->_validRegionInsets;
  int64_t x = self->_validRegionInsets.x;
  int64_t y = p_validRegionInsets->y;
  result.var1 = y;
  result.var0 = x;
  return result;
}

void __37__NUTiledImageLayer__updateSublayers__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__NUTiledImageLayer__updateSublayers__block_invoke_3;
  v8[3] = &unk_2642C2F18;
  long long v3 = *(_OWORD *)(a1 + 88);
  long long v13 = *(_OWORD *)(a1 + 72);
  long long v14 = v3;
  long long v4 = *(_OWORD *)(a1 + 120);
  long long v15 = *(_OWORD *)(a1 + 104);
  long long v16 = v4;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 152);
  long long v17 = *(_OWORD *)(a1 + 136);
  long long v18 = v5;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  char v19 = *(unsigned char *)(a1 + 168);
  [v2 enumerateRects:v8];
}

- (BOOL)nu_contentsAreFlipped
{
  return 1;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  long long v5 = [(NUTiledImageLayer *)self _image];
  [v5 endAccess];

  [(NUTiledImageLayer *)self set_image:v4];
  id v6 = [(NUTiledImageLayer *)self _image];
  [v6 beginAccess];

  [(NUTiledImageLayer *)self setNeedsLayout];
}

- (void)setGeometry:(id)a3
{
  id v4 = a3;
  long long v5 = [(NUTiledImageLayer *)self _geometry];
  [(NUTiledImageLayer *)self set_geometry:v4];
  if (!v5 || ([v4 renderScale], objc_msgSend(v5, "renderScale"), (NUScaleEqual() & 1) == 0))
  {
    [v4 renderScale];
    NUScaleInvert();
    NUScaleToDouble();
    CATransform3DMakeScale(&v8, v6, v6, 1.0);
    CATransform3D v7 = v8;
    [(NUTiledImageLayer *)self setTransform:&v7];
    [(NUTiledImageLayer *)self setNeedsLayout];
  }
}

- (void)set_image:(id)a3
{
}

- (void)set_geometry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tileLayers, 0);
  objc_storeStrong((id *)&self->__geometry, 0);
  objc_storeStrong((id *)&self->__image, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)set_tileLayers:(id)a3
{
}

- (void)setValidRegionInsets:(id)a3
{
  self->_validRegionInsets = ($86B46DF249C2B4242DBB096758D29184)a3;
}

- (void)setDebugColor:(CGColor *)a3
{
}

- (CGColor)debugColor
{
  return (CGColor *)objc_getProperty(self, a2, 40, 1);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4);
}

- (NSString)debugDescription
{
  long long v3 = [MEMORY[0x263F089D8] string];
  id v4 = [(NUTiledImageLayer *)self name];
  [v3 appendFormat:@"<%@ - name:%@\n", self, v4];

  long long v5 = [(NUTiledImageLayer *)self delegate];
  [v3 appendFormat:@"\tdelegate:%@\n", v5];

  [(NUTiledImageLayer *)self position];
  CGFloat v6 = NSStringFromPoint(v23);
  [v3 appendFormat:@"\tposition:%@\n", v6];

  [(NUTiledImageLayer *)self bounds];
  CATransform3D v7 = NSStringFromRect(v25);
  [v3 appendFormat:@"\tbounds:%@\n", v7];

  [(NUTiledImageLayer *)self contentsScale];
  objc_msgSend(v3, "appendFormat:", @"\tcontentScale:%f\n", v8);
  [(NUTiledImageLayer *)self anchorPoint];
  id v9 = NSStringFromPoint(v24);
  [v3 appendFormat:@"\tanchorPoint:%@\n", v9];

  [(NUTiledImageLayer *)self transform];
  id v10 = [NSString stringWithFormat:@"{%.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g}", v13, v14, v15, v16, v17, v18, v19, v20, v21];
  [v3 appendFormat:@"\ttransform:%@\n", v10];

  id v11 = [(NUTiledImageLayer *)self image];
  [v3 appendFormat:@"\timage:%@\n", v11];

  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (id)snapshotImage
{
  [(NUTiledImageLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__273;
  long long v22 = __Block_byref_object_dispose__274;
  id v11 = objc_alloc(MEMORY[0x263F00650]);
  uint64_t v12 = [MEMORY[0x263F00608] redColor];
  long long v13 = (void *)[v11 initWithColor:v12];
  objc_msgSend(v13, "imageByCroppingToRect:", v4, v6, v8, v10);
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  accessQueue = self->_accessQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __34__NUTiledImageLayer_snapshotImage__block_invoke;
  v17[3] = &unk_2642C2F90;
  *(double *)&v17[6] = v4;
  *(double *)&v17[7] = v6;
  *(double *)&v17[8] = v8;
  *(double *)&v17[9] = v10;
  void v17[4] = self;
  v17[5] = &v18;
  dispatch_sync(accessQueue, v17);
  id v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v15;
}

void __34__NUTiledImageLayer_snapshotImage__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v2 = [*(id *)(a1 + 32) sublayers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v8 = [v7 contents];

        double v9 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithIOSurface:v8];
        [v7 position];
        CGFloat v11 = v10;
        double v13 = v12;
        double v14 = *(double *)(a1 + 72);
        [v9 extent];
        CGAffineTransformMakeTranslation(&v20, v11, v14 - (v13 + v15));
        long long v16 = [v9 imageByApplyingTransform:&v20];

        if (v16)
        {
          uint64_t v17 = [v16 imageByCompositingOverImage:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
          uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
          long long v19 = *(void **)(v18 + 40);
          *(void *)(v18 + 40) = v17;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }
}

void __37__NUTiledImageLayer__updateSublayers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  long long v37 = 0u;
  long long v38 = 0u;
  if (v3) {
    [v3 frameRect];
  }
  uint64_t v5 = [v4 surface];
  double v6 = [v4 surface];
  uint64_t v7 = [v6 size];
  double v8 = [v4 surface];
  [v8 size];
  uint64_t v10 = v9;

  objc_msgSend(v5, "setColorSpace:", objc_msgSend(*(id *)(a1 + 32), "CGColorSpace"));
  CGFloat v11 = *(void **)(a1 + 40);
  if (v4) {
    [v4 contentRect];
  }
  else {
    memset(v36, 0, sizeof(v36));
  }
  double v12 = (double)v7;
  double v13 = (double)v10;
  double v14 = [v11 regionByClippingToRect:v36];
  double v15 = *(NSObject **)(*(void *)(a1 + 48) + 32);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  long long v28 = v38;
  long long v27 = v37;
  long long v16 = *(_OWORD *)(a1 + 64);
  long long v30 = *(_OWORD *)(a1 + 80);
  v21[2] = __37__NUTiledImageLayer__updateSublayers__block_invoke_2;
  v21[3] = &unk_2642C2F40;
  id v22 = v14;
  long long v29 = v16;
  id v23 = *(id *)(a1 + 56);
  id v24 = v4;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  double v33 = v12;
  double v34 = v13;
  uint64_t v17 = *(void *)(a1 + 48);
  id v25 = v5;
  uint64_t v26 = v17;
  char v35 = *(unsigned char *)(a1 + 96);
  id v18 = v5;
  id v19 = v4;
  id v20 = v14;
  dispatch_sync(v15, v21);
}

void __37__NUTiledImageLayer__updateSublayers__block_invoke_3(uint64_t a1, long long *a2)
{
  NUPixelRectOffset();
  long long v7 = *a2;
  long long v8 = a2[1];
  NUPixelRectOffset();
  uint64_t v4 = -[NUTileLayer initWithImage:tile:]([NUTileLayer alloc], "initWithImage:tile:", *(void *)(a1 + 32), *(void *)(a1 + 40), v7, v8, 0, 0);
  -[NUTileLayer setAnchorPoint:](v4, "setAnchorPoint:", 0.0, 0.0);
  NUPixelPointToCGPoint();
  -[NUTileLayer setPosition:](v4, "setPosition:");
  -[NUTileLayer setBounds:](v4, "setBounds:", 0.0, 0.0, (double)0, (double)0);
  NUPixelRectToCGRect();
  CGRectInset(v9, 0.0, 0.0);
  NURectNormalize();
  -[NUTileLayer setContentsRect:](v4, "setContentsRect:", 0, 0, 0, 0);
  uint64_t v5 = [*(id *)(a1 + 48) IOSurface];
  [(NUTileLayer *)v4 setContents:v5];

  [(NUTileLayer *)v4 setDelegate:*(void *)(a1 + 56)];
  [(NUTileLayer *)v4 setAllowsEdgeAntialiasing:0];
  [(NUTileLayer *)v4 setWantsExtendedDynamicRangeContent:*(unsigned __int8 *)(a1 + 160)];
  [*(id *)(a1 + 56) addSublayer:v4];
  double v6 = [*(id *)(a1 + 56) _tileLayers];
  [v6 addObject:v4];
}

- (void)_recycleTiles
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__NUTiledImageLayer__recycleTiles__block_invoke;
  block[3] = &unk_2642C2FC0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __34__NUTiledImageLayer__recycleTiles__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_tileLayers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) removeFromSuperlayer];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  long long v7 = [*(id *)(a1 + 32) _tileLayers];
  [v7 removeAllObjects];
}

- (void)removeFromSuperlayer
{
  [(NUTiledImageLayer *)self _recycleTiles];
  v3.receiver = self;
  v3.super_class = (Class)NUTiledImageLayer;
  [(NUTiledImageLayer *)&v3 removeFromSuperlayer];
}

- (void)dealloc
{
  objc_super v3 = [(NUTiledImageLayer *)self _image];
  [v3 endAccess];

  [(NUTiledImageLayer *)self set_image:0];
  [(NUTiledImageLayer *)self _recycleTiles];
  v4.receiver = self;
  v4.super_class = (Class)NUTiledImageLayer;
  [(NUTiledImageLayer *)&v4 dealloc];
}

- (NUTiledImageLayer)init
{
  v9.receiver = self;
  v9.super_class = (Class)NUTiledImageLayer;
  v2 = [(NUTiledImageLayer *)&v9 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(NUTiledImageLayer *)v2 setGeometryFlipped:[(NUTiledImageLayer *)v2 nu_contentsAreFlipped] ^ 1];
    [(NUTiledImageLayer *)v3 setAllowsEdgeAntialiasing:0];
    objc_super v4 = objc_opt_new();
    [(NUTiledImageLayer *)v3 set_tileLayers:v4];

    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.neutrinokit.mediaview", v5);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

+ (id)defaultActionForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3);
}

@end
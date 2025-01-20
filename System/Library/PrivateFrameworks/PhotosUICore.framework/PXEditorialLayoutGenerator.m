@interface PXEditorialLayoutGenerator
- (CGSize)estimatedSize;
- (CGSize)size;
- (PXEditorialLayoutGenerator)initWithMetrics:(id)a3;
- (_PXLayoutGeometry)_geometryFromFrame:(SEL)a3 index:(CGRect)a4;
- (id)geometryKinds;
- (unint64_t)numberOfGeometriesWithKind:(int64_t)a3;
- (void)_getContentGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4;
- (void)_getHeaderGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4;
- (void)_prepareBuffersForCount:(unint64_t)a3;
- (void)_prepareIfNeeded;
- (void)dealloc;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
- (void)invalidate;
@end

@implementation PXEditorialLayoutGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometrySet, 0);
  objc_storeStrong((id *)&self->_tileMaker, 0);
}

- (_PXLayoutGeometry)_geometryFromFrame:(SEL)a3 index:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v12 = [(PXEditorialLayoutGenerator *)self metrics];
  [v12 padding];
  double v14 = v13;
  CGFloat v16 = v15;

  v17 = [(PXEditorialLayoutGenerator *)self metrics];
  [v17 headerHeight];
  double v19 = v18;

  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRectOffset(v21, v16, v14 + v19);
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3.a = 0u;
  *(_OWORD *)&retstr->var3.c = 0u;
  *(_OWORD *)&retstr->var3.tCGFloat x = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  retstr->var6.origin = 0u;
  retstr->var6.size = 0u;
  retstr->var7 = 0u;
  retstr->var0 = a5;
  PXRectGetCenter();
}

- (void)_prepareIfNeeded
{
  if (!self->_isPrepared)
  {
    self->_isPrepared = 1;
    unint64_t v4 = [(PXEditorialLayoutGenerator *)self itemCount];
    v5 = [(PXEditorialLayoutGenerator *)self metrics];
    int v6 = [v5 useSaliency];
    [v5 referenceSize];
    if (v7 <= 0.0)
    {
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      [v42 handleFailureInMethod:a2 object:self file:@"PXEditorialLayoutGenerator.m" lineNumber:200 description:@"The reference size.width must be > 0"];
    }
    [(PXEditorialLayoutGenerator *)self _prepareBuffersForCount:v4];
    uint64_t v56 = 0;
    v57 = (double *)&v56;
    uint64_t v58 = 0x2020000000;
    uint64_t v59 = 0;
    if (v4)
    {
      if (v4 <= [v5 lowerItemCountThreshold])
      {
        v8 = objc_alloc_init(PXVerticalFeedLayoutGenerator);
        [(PXFeedLayoutGenerator *)v8 setTileCount:v4];
        [v5 interTileSpacing];
        double v32 = v31;
        [v5 interTileSpacing];
        -[PXFeedLayoutGenerator setInterTileSpacing:](v8, "setInterTileSpacing:", v32, v33);
        [v5 referenceSize];
        -[PXVerticalFeedLayoutGenerator setReferenceWidth:](v8, "setReferenceWidth:");
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __46__PXEditorialLayoutGenerator__prepareIfNeeded__block_invoke;
        v54[3] = &unk_1E5DD1D28;
        v54[4] = self;
        char v55 = v6;
        [(PXFeedLayoutGenerator *)v8 setTileImageSizeBlock:v54];
        [(PXFeedLayoutGenerator *)v8 setNumberOfMagneticGuidelines:5];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __46__PXEditorialLayoutGenerator__prepareIfNeeded__block_invoke_2;
        v53[3] = &unk_1E5DD1D50;
        v53[4] = self;
        v53[5] = &v56;
        [(PXFeedLayoutGenerator *)v8 enumerateFramesWithBlock:v53];
      }
      else
      {
        v8 = [MEMORY[0x1E4F1CA48] array];
        for (uint64_t i = 0; i != v4; ++i)
        {
          v10 = [(PXEditorialLayoutGenerator *)self itemLayoutInfoBlock];
          v11 = v10[2](v10, i);

          [v11 preferredCropRect];
          if (v6 && (double v16 = v14, v17 = v15, !CGRectIsNull(*(CGRect *)&v12)))
          {
            [v11 size];
            double v19 = v18;
            [v11 size];
            double v21 = v20;
            id v22 = objc_alloc((Class)off_1E5DA6FF0);
            [v11 weight];
            v24 = objc_msgSend(v22, "initWithSize:weight:", v16 * v19, v17 * v21, v23);
            [(PXVerticalFeedLayoutGenerator *)v8 addObject:v24];
          }
          else
          {
            [(PXVerticalFeedLayoutGenerator *)v8 addObject:v11];
          }
        }
        [(PXMagazineLayoutTileMaker *)self->_tileMaker getFrames:self->_rects withInputs:v8];
        uint64_t v25 = 0;
        uint64_t v26 = 0;
        for (uint64_t j = 0; j != v4; ++j)
        {
          geometries = self->_geometries;
          -[PXEditorialLayoutGenerator _geometryFromFrame:index:](self, "_geometryFromFrame:index:", j, self->_rects[v25].origin.x, self->_rects[v25].origin.y, self->_rects[v25].size.width, self->_rects[v25].size.height);
          v29 = &geometries[v26];
          *(_OWORD *)&v29->var0 = v43;
          *(_OWORD *)&v29->var1.CGFloat y = v44;
          *(_OWORD *)&v29->var3.d = v47;
          *(_OWORD *)&v29->var3.tCGFloat y = v48;
          *(_OWORD *)&v29->var2.CGFloat height = v45;
          *(_OWORD *)&v29->var3.b = v46;
          v29->var7.CGFloat height = v52;
          *(_OWORD *)&v29->var6.origin.CGFloat y = v50;
          *(_OWORD *)&v29->var6.size.CGFloat height = v51;
          *(_OWORD *)&v29->var5 = v49;
          ++v26;
          ++v25;
        }
        [(PXMagazineLayoutTileMaker *)self->_tileMaker height];
        *((void *)v57 + 3) = v30;
      }
    }
    [v5 padding];
    double v35 = v34;
    double v37 = v36;
    [v5 headerHeight];
    double v39 = v38;
    [v5 referenceSize];
    CGFloat v40 = v37 + v35 + v39 + v57[3];
    self->_actualSize.CGFloat width = v41;
    self->_actualSize.CGFloat height = v40;
    _Block_object_dispose(&v56, 8);
  }
}

double __46__PXEditorialLayoutGenerator__prepareIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = [*(id *)(a1 + 32) itemLayoutInfoBlock];
  v5 = v4[2](v4, a2);

  [v5 preferredCropRect];
  if (*(unsigned char *)(a1 + 40) && (double v10 = v8, !CGRectIsNull(*(CGRect *)&v6)))
  {
    [v5 size];
    double v12 = v10 * v13;
    [v5 size];
  }
  else
  {
    [v5 size];
    double v12 = v11;
  }

  return v12;
}

void __46__PXEditorialLayoutGenerator__prepareIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  if (!a3)
  {
    double v12 = *(void **)(a1 + 32);
    uint64_t v13 = v12[9] + 152 * a2;
    objc_msgSend(v12, "_geometryFromFrame:index:", a2);
    *(_OWORD *)uint64_t v13 = v16;
    *(_OWORD *)(v13 + 16) = v17;
    *(_OWORD *)(v13 + 64) = v20;
    *(_OWORD *)(v13 + 80) = v21;
    *(_OWORD *)(v13 + 32) = v18;
    *(_OWORD *)(v13 + 48) = v19;
    *(void *)(v13 + 144) = v25;
    *(_OWORD *)(v13 + 112) = v23;
    *(_OWORD *)(v13 + 128) = v24;
    *(_OWORD *)(v13 + 96) = v22;
    double v14 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    v26.origin.CGFloat x = a4;
    v26.origin.CGFloat y = a5;
    v26.size.CGFloat width = a6;
    v26.size.CGFloat height = a7;
    double MaxY = CGRectGetMaxY(v26);
    if (v14 >= MaxY) {
      double MaxY = v14;
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MaxY;
  }
}

- (void)_prepareBuffersForCount:(unint64_t)a3
{
  if (self->_geometriesCount < a3)
  {
    self->_geometries = (_PXLayoutGeometry *)malloc_type_realloc(self->_geometries, 152 * a3, 0x100004050011849uLL);
    self->_rects = (CGRect *)malloc_type_realloc(self->_rects, 32 * a3, 0x1000040E0EAB150uLL);
    self->_geometriesCount = a3;
  }
}

- (CGSize)size
{
  [(PXEditorialLayoutGenerator *)self _prepareIfNeeded];
  double width = self->_actualSize.width;
  double height = self->_actualSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)estimatedSize
{
  [(PXMagazineLayoutTileMaker *)self->_tileMaker defaultTileSize];
  double v4 = v3;
  unint64_t v5 = [(PXMagazineLayoutTileMaker *)self->_tileMaker maxTilesInFrame];
  if ([(PXEditorialLayoutGenerator *)self itemCount]) {
    double v6 = (double)[(PXEditorialLayoutGenerator *)self itemCount];
  }
  else {
    double v6 = 10.0;
  }
  double v7 = [(PXEditorialLayoutGenerator *)self metrics];
  unint64_t v8 = [v7 numberOfColumns];

  v9 = [(PXEditorialLayoutGenerator *)self metrics];
  [v9 referenceSize];
  double v11 = v10;

  double v12 = [(PXEditorialLayoutGenerator *)self metrics];
  [v12 headerHeight];
  double v14 = v13;

  double v15 = v14 + v6 * (v4 * (double)(v5 / v8)) / (double)v8;
  double v16 = v11;
  result.double height = v15;
  result.double width = v16;
  return result;
}

- (void)_getHeaderGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4
{
  if (a4.length != 1)
  {
    long long v18 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4.location);
    [v18 handleFailureInMethod:a2, self, @"PXEditorialLayoutGenerator.m", 148, @"Invalid parameter not satisfying: %@", @"range.length == 1" object file lineNumber description];
  }
  double v6 = [(PXEditorialLayoutGenerator *)self metrics];
  [v6 headerHeight];
  CGFloat v8 = v7;

  v9 = [(PXEditorialLayoutGenerator *)self metrics];
  [v9 referenceSize];
  double v11 = v10;

  double v12 = [(PXEditorialLayoutGenerator *)self metrics];
  [v12 padding];
  double v14 = v13;
  double v16 = v15;

  a3->var2.double width = v16 + v11 + v14;
  a3->var2.double height = v8;
  a3->var0 = 0;
  PXRectGetCenter();
}

- (void)_getContentGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v9 = a4.location + a4.length;
  if (a4.location + a4.length > [(PXEditorialLayoutGenerator *)self itemCount])
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PXEditorialLayoutGenerator.m" lineNumber:137 description:@"the range must be <= to the number of itemCount"];
  }
  [(PXEditorialLayoutGenerator *)self _prepareIfNeeded];
  if (location < v9)
  {
    NSUInteger v10 = location;
    do
    {
      double v11 = &a3[v10];
      double v12 = &self->_geometries[v10];
      long long v14 = *(_OWORD *)&v12->var6.origin.y;
      long long v13 = *(_OWORD *)&v12->var6.size.height;
      CGFloat height = v12->var7.height;
      *(_OWORD *)&v11->var5 = *(_OWORD *)&v12->var5;
      long long v16 = *(_OWORD *)&v12->var1.y;
      *(_OWORD *)&v11->var0 = *(_OWORD *)&v12->var0;
      *(_OWORD *)&v11->var1.CGFloat y = v16;
      long long v17 = *(_OWORD *)&v12->var2.height;
      long long v18 = *(_OWORD *)&v12->var3.b;
      long long v19 = *(_OWORD *)&v12->var3.ty;
      *(_OWORD *)&v11->var3.d = *(_OWORD *)&v12->var3.d;
      *(_OWORD *)&v11->var3.tCGFloat y = v19;
      *(_OWORD *)&v11->var2.CGFloat height = v17;
      *(_OWORD *)&v11->var3.b = v18;
      v11->var7.CGFloat height = height;
      *(_OWORD *)&v11->var6.origin.CGFloat y = v14;
      *(_OWORD *)&v11->var6.size.CGFloat height = v13;
      v11->var5 = 0;
      ++v10;
      --length;
    }
    while (length);
  }
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  if (a5 == 1)
  {
    -[PXEditorialLayoutGenerator _getHeaderGeometries:inRange:](self, "_getHeaderGeometries:inRange:", a3, a4.location, a4.length);
  }
  else
  {
    if (a5)
    {
      uint64_t v14 = v6;
      uint64_t v15 = v5;
      long long v13 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4.location, a4.length, v8, v7, v14, v15, v9, v10);
      [v13 handleFailureInMethod:a2 object:self file:@"PXEditorialLayoutGenerator.m" lineNumber:130 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    -[PXEditorialLayoutGenerator _getContentGeometries:inRange:](self, "_getContentGeometries:inRange:", a3, a4.location, a4.length);
  }
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)PXEditorialLayoutGenerator;
  [(PXEditorialLayoutGenerator *)&v3 invalidate];
  self->_isPrepared = 0;
}

- (unint64_t)numberOfGeometriesWithKind:(int64_t)a3
{
  if (a3 == 1)
  {
    double v4 = [(PXEditorialLayoutGenerator *)self metrics];
    [v4 headerHeight];
    unint64_t v3 = v5 > 0.0;
  }
  else
  {
    if (a3)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXEditorialLayoutGenerator.m" lineNumber:106 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v10.receiver = self;
    v10.super_class = (Class)PXEditorialLayoutGenerator;
    return -[PXEditorialLayoutGenerator numberOfGeometriesWithKind:](&v10, sel_numberOfGeometriesWithKind_);
  }
  return v3;
}

- (id)geometryKinds
{
  return self->_geometrySet;
}

- (void)dealloc
{
  free(self->_geometries);
  free(self->_rects);
  v3.receiver = self;
  v3.super_class = (Class)PXEditorialLayoutGenerator;
  [(PXEditorialLayoutGenerator *)&v3 dealloc];
}

- (PXEditorialLayoutGenerator)initWithMetrics:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXEditorialLayoutGenerator;
  if ([(PXEditorialLayoutGenerator *)&v6 initWithMetrics:v4])
  {
    [v4 referenceSize];
    [v4 padding];
    PXEdgeInsetsInsetSize();
  }

  return 0;
}

@end
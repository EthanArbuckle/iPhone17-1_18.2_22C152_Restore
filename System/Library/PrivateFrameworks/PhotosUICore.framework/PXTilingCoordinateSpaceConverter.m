@interface PXTilingCoordinateSpaceConverter
+ (BOOL)_canConvertBetweenCoordinateSpace:(id)a3 andCoordinateSpace:(id)a4;
+ (BOOL)canConvertBetweenCoordinateSpaceIdentifier:(void *)a3 andCoordinateSpaceIdentifier:(void *)a4;
+ (id)defaultConverter;
- (BOOL)shouldCache;
- (CGAffineTransform)_transformOfCoordinateSpace:(SEL)a3 relativeToCoordinateSpace:(id)a4;
- (CGAffineTransform)_transformOfCoordinateSpaceIdentifier:(SEL)a3 relativeToCoordinateSpaceIdentifier:(void *)a4;
- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpaceIdentifier:(void *)a4 toCoordinateSpaceIdentifier:(void *)a5;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpaceIdentifier:(void *)a4 toCoordinateSpaceIdentifier:(void *)a5;
- (PXTileGeometry)convertTileGeometry:(SEL)a3 toCoordinateSpaceIdentifier:(PXTileGeometry *)a4;
- (void)setShouldCache:(BOOL)a3;
@end

@implementation PXTilingCoordinateSpaceConverter

- (void)setShouldCache:(BOOL)a3
{
  self->_shouldCache = a3;
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

- (CGAffineTransform)_transformOfCoordinateSpace:(SEL)a3 relativeToCoordinateSpace:(id)a4
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MEMORY[0x1E4F1DAB8];
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v11 + 32);
  if (v9 != v10)
  {
    uint64_t v13 = [v9 parentSpace];
    if (v13)
    {
      v14 = (void *)v13;
      [(PXTilingCoordinateSpaceConverter *)self _transformOfCoordinateSpace:v13 relativeToCoordinateSpace:v10];
      long long v15 = *(_OWORD *)&t1.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
      *(_OWORD *)&retstr->c = v15;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
      if (v9) {
        [v9 transform];
      }
      else {
        memset(v26, 0, sizeof(v26));
      }
      long long v18 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t1.c = v18;
      *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
      v19 = (CGAffineTransform *)v26;
      p_CGAffineTransform t1 = &t1;
LABEL_13:
      CGAffineTransformConcat(retstr, v19, p_t1);

      goto LABEL_14;
    }
    uint64_t v16 = [v10 parentSpace];
    if (v16)
    {
      v14 = (void *)v16;
      [(PXTilingCoordinateSpaceConverter *)self _transformOfCoordinateSpace:v9 relativeToCoordinateSpace:v16];
      long long v17 = *(_OWORD *)&t1.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
      *(_OWORD *)&retstr->c = v17;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
      if (v10) {
        [v10 transform];
      }
      else {
        memset(&v24, 0, sizeof(v24));
      }
      CGAffineTransformInvert(&t2, &v24);
      long long v22 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t1.c = v22;
      *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
      v19 = &t1;
      p_CGAffineTransform t1 = &t2;
      goto LABEL_13;
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a3 object:self file:@"PXTilingCoordinateSpaceConverter.m" lineNumber:80 description:@"coordinate spaces don't have a common ancestor"];
  }
LABEL_14:

  return result;
}

- (CGAffineTransform)_transformOfCoordinateSpaceIdentifier:(SEL)a3 relativeToCoordinateSpaceIdentifier:(void *)a4
{
  id v10 = a4;
  v8 = a5;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  [(PXTilingCoordinateSpaceConverter *)self _transformOfCoordinateSpace:v10 relativeToCoordinateSpace:v8];

  return result;
}

- (PXTileGeometry)convertTileGeometry:(SEL)a3 toCoordinateSpaceIdentifier:(PXTileGeometry *)a4
{
  long long v6 = *(_OWORD *)&a4->contentSize.height;
  *(_OWORD *)&retstr->hidden = *(_OWORD *)&a4->hidden;
  *(_OWORD *)&retstr->contentSize.height = v6;
  long long v7 = *(_OWORD *)&a4->contentsRect.size.height;
  *(_OWORD *)&retstr->contentsRect.origin.y = *(_OWORD *)&a4->contentsRect.origin.y;
  *(_OWORD *)&retstr->contentsRect.size.height = v7;
  long long v8 = *(_OWORD *)&a4->transform.c;
  *(_OWORD *)&retstr->transform.a = *(_OWORD *)&a4->transform.a;
  *(_OWORD *)&retstr->transform.c = v8;
  long long v9 = *(_OWORD *)&a4->alpha;
  *(_OWORD *)&retstr->transform.tx = *(_OWORD *)&a4->transform.tx;
  *(_OWORD *)&retstr->alpha = v9;
  CGSize size = a4->frame.size;
  retstr->frame.origin = a4->frame.origin;
  retstr->frame.CGSize size = size;
  CGSize v11 = a4->size;
  retstr->center = a4->center;
  retstr->CGSize size = v11;
  if (retstr->coordinateSpaceIdentifier != a5)
  {
    v14 = self;
    -[PXTileGeometry convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:](self, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", a4->coordinateSpaceIdentifier, a4->frame.origin.x, a4->frame.origin.y, a4->frame.size.width, a4->frame.size.height);
    retstr->frame.origin.x = v15;
    retstr->frame.origin.y = v16;
    retstr->frame.size.width = v17;
    retstr->frame.size.height = v18;
    self = (PXTileGeometry *)-[PXTileGeometry convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:](v14, "convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", a4->coordinateSpaceIdentifier, a5, a4->center.x, a4->center.y);
    retstr->center.x = v19;
    retstr->center.y = v20;
    retstr->coordinateSpaceIdentifier = a5;
  }
  return self;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpaceIdentifier:(void *)a4 toCoordinateSpaceIdentifier:(void *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (a4 != a5)
  {
    memset(&v13[1], 0, sizeof(CGAffineTransform));
    -[PXTilingCoordinateSpaceConverter _transformOfCoordinateSpaceIdentifier:relativeToCoordinateSpaceIdentifier:](self, "_transformOfCoordinateSpaceIdentifier:relativeToCoordinateSpaceIdentifier:");
    v13[0] = v13[1];
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    CGRect v15 = CGRectApplyAffineTransform(v14, v13);
    CGFloat x = v15.origin.x;
    CGFloat y = v15.origin.y;
    CGFloat width = v15.size.width;
    CGFloat height = v15.size.height;
  }
  double v9 = x;
  double v10 = y;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpaceIdentifier:(void *)a4 toCoordinateSpaceIdentifier:(void *)a5
{
  double y = a3.y;
  double x = a3.x;
  if (a4 != a5)
  {
    -[PXTilingCoordinateSpaceConverter _transformOfCoordinateSpaceIdentifier:relativeToCoordinateSpaceIdentifier:](self, "_transformOfCoordinateSpaceIdentifier:relativeToCoordinateSpaceIdentifier:");
    double v7 = y * 0.0 + 0.0 * x;
    double x = v7 + 0.0;
    double y = v7 + 0.0;
  }
  double v8 = x;
  double v9 = y;
  result.double y = v9;
  result.double x = v8;
  return result;
}

+ (BOOL)_canConvertBetweenCoordinateSpace:(id)a3 andCoordinateSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 == v7)
  {
    char v13 = 1;
  }
  else
  {
    uint64_t v8 = [v6 parentSpace];
    if (v8)
    {
      double v9 = (void *)v8;
      id v10 = a1;
      id v11 = v9;
      id v12 = v7;
    }
    else
    {
      uint64_t v14 = [v7 parentSpace];
      if (!v14)
      {
        char v13 = 0;
        goto LABEL_8;
      }
      double v9 = (void *)v14;
      id v10 = a1;
      id v11 = v6;
      id v12 = v9;
    }
    char v13 = [v10 _canConvertBetweenCoordinateSpace:v11 andCoordinateSpace:v12];
  }
LABEL_8:

  return v13;
}

+ (BOOL)canConvertBetweenCoordinateSpaceIdentifier:(void *)a3 andCoordinateSpaceIdentifier:(void *)a4
{
  id v6 = a3;
  id v7 = a4;
  LOBYTE(a1) = [a1 _canConvertBetweenCoordinateSpace:v6 andCoordinateSpace:v7];

  return (char)a1;
}

+ (id)defaultConverter
{
  if (defaultConverter_onceToken != -1) {
    dispatch_once(&defaultConverter_onceToken, &__block_literal_global_154780);
  }
  v2 = (void *)defaultConverter_defaultConverter;
  return v2;
}

void __52__PXTilingCoordinateSpaceConverter_defaultConverter__block_invoke()
{
  v0 = objc_alloc_init(PXTilingCoordinateSpaceConverter);
  v1 = (void *)defaultConverter_defaultConverter;
  defaultConverter_defaultConverter = (uint64_t)v0;
}

@end
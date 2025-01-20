@interface MNRouteDivergenceFinderBoundingSection
- ($377CF2390FDF0262336A0B78E33E12FE)boundingRect;
- (BOOL)containsCoordinate:(id)a3;
- (BOOL)isLeaf;
- (GEOPolylineCoordinateRange)range;
- (MNRouteDivergenceFinderBoundingSection)left;
- (MNRouteDivergenceFinderBoundingSection)right;
- (double)length;
- (id).cxx_construct;
- (id)boundsDescription;
- (id)description;
- (id)leafSectionsIntersectingSection:(id)a3 paddingMapPoints:(double)a4;
- (id)treeDescription;
- (unint64_t)leafIndex;
- (void)_appendDescription:(id)a3 indent:(unint64_t)a4;
- (void)setBoundingRect:(id)a3;
- (void)setLeafIndex:(unint64_t)a3;
- (void)setLeft:(id)a3;
- (void)setLength:(double)a3;
- (void)setRange:(GEOPolylineCoordinateRange)a3;
- (void)setRight:(id)a3;
- (void)traverseWithHandler:(id)a3;
@end

@implementation MNRouteDivergenceFinderBoundingSection

- (BOOL)isLeaf
{
  return !self->_left && self->_right == 0;
}

- (id)leafSectionsIntersectingSection:(id)a3 paddingMapPoints:(double)a4
{
  id v6 = a3;
  [v6 boundingRect];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__MNRouteDivergenceFinderBoundingSection_leafSectionsIntersectingSection_paddingMapPoints___block_invoke;
  v13[3] = &unk_1E60FADB0;
  *(double *)&v13[5] = v7 - a4;
  *(double *)&v13[6] = v8 - a4;
  *(double *)&v13[7] = v9 + a4 * 2.0;
  *(double *)&v13[8] = v10 + a4 * 2.0;
  v13[4] = &v14;
  [(MNRouteDivergenceFinderBoundingSection *)self traverseWithHandler:v13];
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __91__MNRouteDivergenceFinderBoundingSection_leafSectionsIntersectingSection_paddingMapPoints___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  [v9 boundingRect];
  if (GEOMapRectIntersectsRect())
  {
    if ([v9 isLeaf])
    {
      v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      if (!v5)
      {
        uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
        double v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;

        v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      }
      [v5 addObject:v9];
    }
  }
  else
  {
    *a3 = 0;
  }
}

- (void)traverseWithHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    char v6 = 1;
    (*((void (**)(id, MNRouteDivergenceFinderBoundingSection *, char *))v4 + 2))(v4, self, &v6);
    if (v6)
    {
      [(MNRouteDivergenceFinderBoundingSection *)self->_left traverseWithHandler:v5];
      [(MNRouteDivergenceFinderBoundingSection *)self->_right traverseWithHandler:v5];
    }
  }
}

- (BOOL)containsCoordinate:(id)a3
{
  uint64_t v4 = GEOMapPointForCoordinate();
  v5.n128_u64[0] = v7.n128_u64[0];
  v6.n128_u64[0] = v8.n128_u64[0];
  v7.n128_u64[0] = *(void *)&self->_boundingRect.origin.x;
  v8.n128_u64[0] = *(void *)&self->_boundingRect.origin.y;
  v9.n128_u64[0] = *(void *)&self->_boundingRect.size.width;
  v10.n128_u64[0] = *(void *)&self->_boundingRect.size.height;
  return MEMORY[0x1F411C200](v4, v7, v8, v9, v10, v5, v6);
}

- (id)treeDescription
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(MNRouteDivergenceFinderBoundingSection *)self _appendDescription:v3 indent:0];
  return v3;
}

- (id)boundsDescription
{
  GEOCoordinate2DForMapPoint();
  uint64_t v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%f, %f\n", v2, v3];
  GEOCoordinate2DForMapPoint();
  [v4 appendFormat:@"%f, %f\n", v5, v6];
  GEOCoordinate2DForMapPoint();
  [v4 appendFormat:@"%f, %f\n", v7, v8];
  GEOCoordinate2DForMapPoint();
  [v4 appendFormat:@"%f, %f", v9, v10];
  return v4;
}

- (id)description
{
  GEOCoordinate2DForMapPoint();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  GEOCoordinate2DForMapPoint();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  if ([(MNRouteDivergenceFinderBoundingSection *)self isLeaf])
  {
    id v11 = [NSString stringWithFormat:@", leafIndex: %d", self->_leafIndex];
  }
  else
  {
    id v11 = &stru_1F0E08010;
  }
  v12 = NSString;
  v13 = GEOPolylineCoordinateRangeAsString();
  uint64_t v14 = [v12 stringWithFormat:@"[%@] (%f, %f) (%f, %f) %d meters%@\n", v13, v4, v6, v8, v10, (int)self->_length, v11];

  return v14;
}

- (void)_appendDescription:(id)a3 indent:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v6 = [(MNRouteDivergenceFinderBoundingSection *)self description];
  [v7 appendFormat:@"%*s%@", (2 * a4), "", v6];

  [(MNRouteDivergenceFinderBoundingSection *)self->_left _appendDescription:v7 indent:++a4];
  [(MNRouteDivergenceFinderBoundingSection *)self->_right _appendDescription:v7 indent:a4];
}

- (GEOPolylineCoordinateRange)range
{
  PolylineCoordinate end = self->_range.end;
  PolylineCoordinate start = self->_range.start;
  result.PolylineCoordinate end = end;
  result.PolylineCoordinate start = start;
  return result;
}

- (void)setRange:(GEOPolylineCoordinateRange)a3
{
  self->_range = a3;
}

- ($377CF2390FDF0262336A0B78E33E12FE)boundingRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setBoundingRect:(id)a3
{
  self->_boundingRect = ($133AF03B2F213449098C280654CC0A06)a3;
}

- (MNRouteDivergenceFinderBoundingSection)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
}

- (MNRouteDivergenceFinderBoundingSection)right
{
  return self->_right;
}

- (void)setRight:(id)a3
{
}

- (unint64_t)leafIndex
{
  return self->_leafIndex;
}

- (void)setLeafIndex:(unint64_t)a3
{
  self->_leafIndedouble x = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0xBF80000000000000;
  *((void *)self + 6) = 0xBF80000000000000;
  return self;
}

@end
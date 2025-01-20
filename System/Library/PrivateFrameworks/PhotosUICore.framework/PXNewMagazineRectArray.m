@interface PXNewMagazineRectArray
- (BOOL)isEqualToRectArray:(id)a3;
- (BOOL)isGoodEnding;
- (BOOL)isPerfectEnding;
- (BOOL)nextEmptyTileX:(int64_t *)a3 Y:(int64_t *)a4 maxWidth:(int64_t *)a5;
- (PXMagazineRect)rectAtIndex:(SEL)a3;
- (PXMagazineRect)rects;
- (PXNewMagazineRectArray)initWithSize:(unint64_t)a3 tileGrid:(id)a4;
- (double)score;
- (double)tileDensity;
- (id)immutableCopyForCurrentRectsCount;
- (unint64_t)count;
- (unint64_t)endingType;
- (unint64_t)rowsUsed;
- (void)addRect:(PXMagazineRect *)a3;
- (void)dealloc;
- (void)removeLastRect;
- (void)reset;
- (void)setEndingType:(unint64_t)a3;
- (void)setScore:(double)a3;
@end

@implementation PXNewMagazineRectArray

- (void).cxx_destruct
{
}

- (PXMagazineRect)rects
{
  return self->_rects;
}

- (void)setEndingType:(unint64_t)a3
{
  self->_endingType = a3;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (BOOL)isEqualToRectArray:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PXNewMagazineRectArray *)self count];
  BOOL v6 = v5 == [v4 count]
    && !memcmp((const void *)[v4 rects], -[PXNewMagazineRectArray rects](objc_retainAutorelease(self), "rects"), 32 * v5);

  return v6;
}

- (unint64_t)endingType
{
  return [(PXNewMagazineGrid *)self->_tileGrid endingType];
}

- (BOOL)nextEmptyTileX:(int64_t *)a3 Y:(int64_t *)a4 maxWidth:(int64_t *)a5
{
  return [(PXNewMagazineGrid *)self->_tileGrid nextEmptyTileX:a3 Y:a4 maxWidth:a5];
}

- (BOOL)isGoodEnding
{
  return [(PXNewMagazineGrid *)self->_tileGrid isGoodEnding];
}

- (BOOL)isPerfectEnding
{
  tileGrid = self->_tileGrid;
  if (tileGrid) {
    LOBYTE(v4) = [(PXNewMagazineGrid *)tileGrid isPerfectEnding];
  }
  else {
    return self->_endingType == 2;
  }
  return v4;
}

- (double)tileDensity
{
  unint64_t v3 = [(PXNewMagazineGrid *)self->_tileGrid numberOfColumns];
  double v4 = (double)([(PXNewMagazineGrid *)self->_tileGrid currentRowsUsed] * v3);
  return v4 / (double)(4 * [(PXNewMagazineRectArray *)self count]);
}

- (unint64_t)count
{
  return self->_currentIndex;
}

- (PXMagazineRect)rectAtIndex:(SEL)a3
{
  unint64_t v4 = self[1].var1.var1 + 32 * a4;
  PXMagazineSize v5 = *(PXMagazineSize *)(v4 + 16);
  retstr->var0 = *(PXMagazineOrigin *)v4;
  retstr->var1 = v5;
  return self;
}

- (void)removeLastRect
{
  if ([(PXNewMagazineRectArray *)self count])
  {
    unint64_t v3 = self->_currentIndex - 1;
    self->_currentIndex = v3;
    unint64_t v4 = &self->_rects[v3];
    PXMagazineSize var1 = v4->var1;
    PXMagazineOrigin var0 = v4->var0;
    PXMagazineSize v10 = var1;
    tileGrid = self->_tileGrid;
    v8[0] = var0;
    v8[1] = var1;
    [(PXNewMagazineGrid *)tileGrid clearArea:v8];
    v7 = &self->_rects[self->_currentIndex];
    v7->PXMagazineOrigin var0 = 0u;
    v7->PXMagazineSize var1 = 0u;
  }
}

- (void)addRect:(PXMagazineRect *)a3
{
  unint64_t currentIndex = self->_currentIndex;
  unint64_t size = self->_size;
  if (currentIndex >= size)
  {
    unint64_t v8 = 2 * size + 2;
    self->_unint64_t size = v8;
    rects = (PXMagazineRect *)malloc_type_realloc(self->_rects, 32 * v8, 0x1000040E0EAB150uLL);
    self->_rects = rects;
    unint64_t currentIndex = self->_currentIndex;
  }
  else
  {
    rects = self->_rects;
  }
  v9 = &rects[currentIndex];
  PXMagazineSize var1 = a3->var1;
  v9->PXMagazineOrigin var0 = a3->var0;
  v9->PXMagazineSize var1 = var1;
  tileGrid = self->_tileGrid;
  unint64_t v12 = self->_currentIndex;
  PXMagazineSize v13 = a3->var1;
  v14[0] = a3->var0;
  v14[1] = v13;
  [(PXNewMagazineGrid *)tileGrid setTileIdentifier:v12 forArea:v14];
  ++self->_currentIndex;
}

- (unint64_t)rowsUsed
{
  if (![(PXNewMagazineRectArray *)self count]) {
    return 0;
  }
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  unint64_t v5 = 0;
  do
  {
    if (self->_rects[v3].var1.var1 + self->_rects[v3].var0.var1 > v5) {
      unint64_t v5 = self->_rects[v3].var1.var1 + self->_rects[v3].var0.var1;
    }
    ++v4;
    ++v3;
  }
  while (v4 < [(PXNewMagazineRectArray *)self count]);
  return v5;
}

- (void)reset
{
  self->_unint64_t currentIndex = 0;
  self->_endingType = 0;
}

- (id)immutableCopyForCurrentRectsCount
{
  uint64_t v3 = [[PXNewMagazineRectArray alloc] initWithSize:[(PXNewMagazineRectArray *)self count] tileGrid:0];
  memcpy(v3->_rects, self->_rects, 32 * v3->_size);
  v3->_unint64_t currentIndex = self->_currentIndex;
  tileGrid = self->_tileGrid;
  if (tileGrid) {
    unint64_t endingType = [(PXNewMagazineGrid *)tileGrid endingType];
  }
  else {
    unint64_t endingType = self->_endingType;
  }
  v3->_unint64_t endingType = endingType;
  return v3;
}

- (void)dealloc
{
  free(self->_rects);
  v3.receiver = self;
  v3.super_class = (Class)PXNewMagazineRectArray;
  [(PXNewMagazineRectArray *)&v3 dealloc];
}

- (PXNewMagazineRectArray)initWithSize:(unint64_t)a3 tileGrid:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXNewMagazineRectArray;
  unint64_t v8 = [(PXNewMagazineRectArray *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_unint64_t size = a3;
    v8->_rects = (PXMagazineRect *)malloc_type_calloc(a3, 0x20uLL, 0x1000040E0EAB150uLL);
    objc_storeStrong((id *)&v9->_tileGrid, a4);
  }

  return v9;
}

@end
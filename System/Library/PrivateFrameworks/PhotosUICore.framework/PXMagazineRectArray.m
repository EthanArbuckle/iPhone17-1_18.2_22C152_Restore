@interface PXMagazineRectArray
- (PXMagazineRect)rectAtIndex:(SEL)a3;
- (PXMagazineRectArray)initWithSize:(unint64_t)a3;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)rowsUsed;
- (void)addRect:(PXMagazineRect *)a3;
- (void)dealloc;
- (void)removeLastRect;
- (void)setScore:(double)a3;
@end

@implementation PXMagazineRectArray

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (unint64_t)count
{
  return self->_currentIndex;
}

- (PXMagazineRect)rectAtIndex:(SEL)a3
{
  unint64_t v4 = self->var0.var1 + 32 * a4;
  PXMagazineSize v5 = *(PXMagazineSize *)(v4 + 16);
  retstr->var0 = *(PXMagazineOrigin *)v4;
  retstr->var1 = v5;
  return self;
}

- (void)removeLastRect
{
  if ([(PXMagazineRectArray *)self count])
  {
    rects = self->_rects;
    unint64_t v4 = self->_currentIndex - 1;
    self->_currentIndex = v4;
    PXMagazineSize v5 = &rects[v4];
    v5->var0 = 0u;
    v5->var1 = 0u;
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
  v9->var0 = a3->var0;
  v9->PXMagazineSize var1 = var1;
  ++self->_currentIndex;
}

- (unint64_t)rowsUsed
{
  if (![(PXMagazineRectArray *)self count]) {
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
  while (v4 < [(PXMagazineRectArray *)self count]);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [[PXMagazineRectArray alloc] initWithSize:self->_size];
  memcpy(v4->_rects, self->_rects, 32 * v4->_size);
  v4->_unint64_t currentIndex = self->_currentIndex;
  return v4;
}

- (void)dealloc
{
  rects = self->_rects;
  if (rects)
  {
    free(rects);
    self->_rects = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXMagazineRectArray;
  [(PXMagazineRectArray *)&v4 dealloc];
}

- (PXMagazineRectArray)initWithSize:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXMagazineRectArray;
  objc_super v4 = [(PXMagazineRectArray *)&v7 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_unint64_t size = a3;
    v4->_rects = (PXMagazineRect *)malloc_type_calloc(a3, 0x20uLL, 0x1000040E0EAB150uLL);
  }
  return v5;
}

@end
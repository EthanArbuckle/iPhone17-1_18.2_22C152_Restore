@interface PXCachingLayoutGenerator
- (CGSize)size;
- (void)_updateIfNeeded;
- (void)dealloc;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
- (void)invalidate;
- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4;
- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5;
- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5 zPositions:(float *)a6;
@end

@implementation PXCachingLayoutGenerator

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5 zPositions:(float *)a6
{
  uint64_t v11 = [(PXCachingLayoutGenerator *)self itemCount];
  if (v11 >= 1) {
    bzero(a6, 4 * v11);
  }
  [(PXCachingLayoutGenerator *)self updateContentSize:a3 itemRects:a4 itemKinds:a5];
}

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5
{
  uint64_t v9 = [(PXCachingLayoutGenerator *)self itemCount];
  if (v9 >= 1) {
    bzero(a5, 8 * v9);
  }
  [(PXCachingLayoutGenerator *)self updateContentSize:a3 itemRects:a4];
}

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXCachingLayoutGenerator.m", 74, @"Method %s is a responsibility of subclass %@", "-[PXCachingLayoutGenerator updateContentSize:itemRects:]", v8 object file lineNumber description];

  abort();
}

- (void)_updateIfNeeded
{
  if (!self->_isValid)
  {
    uint64_t v3 = [(PXCachingLayoutGenerator *)self itemCount];
    int64_t itemCapacity = self->_itemCapacity;
    if (v3 > itemCapacity)
    {
      if (itemCapacity)
      {
        do
          itemCapacity *= 2;
        while (itemCapacity < v3);
      }
      else
      {
        int64_t itemCapacity = v3;
      }
      self->_int64_t itemCapacity = itemCapacity;
      _PXGArrayResize();
    }
    [(PXCachingLayoutGenerator *)self updateContentSize:&self->_contentSize itemRects:self->_itemRects itemKinds:self->_itemKinds zPositions:self->_zPositions];
    self->_isValid = 1;
  }
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)PXCachingLayoutGenerator;
  [(PXCachingLayoutGenerator *)&v3 invalidate];
  self->_isValid = 0;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length = a4.length;
  [(PXCachingLayoutGenerator *)self _updateIfNeeded];
  if (length) {
    PXRectGetCenter();
  }
}

- (CGSize)size
{
  [(PXCachingLayoutGenerator *)self _updateIfNeeded];
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)dealloc
{
  free(self->_itemRects);
  free(self->_itemKinds);
  free(self->_zPositions);
  v3.receiver = self;
  v3.super_class = (Class)PXCachingLayoutGenerator;
  [(PXCachingLayoutGenerator *)&v3 dealloc];
}

@end
@interface _IntArray2D
+ (id)arrayWithISize:(unint64_t)a3 jSize:(unint64_t)a4;
- (BOOL)inBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4;
- (BOOL)shouldBoundsCheck;
- (_IntArray2D)initWithISize:(unint64_t)a3 jSize:(unint64_t)a4;
- (id)description;
- (int64_t):(unint64_t)a3 :(unint64_t)a4;
- (int64_t):(unint64_t)a3 :(unint64_t)a4 outOfBoundsReturnValue:(int64_t)a5;
- (unint64_t)iSize;
- (unint64_t)jSize;
- (void):(unint64_t)a3 :(unint64_t)a4 newValue:(int64_t)a5;
- (void)assertBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4;
- (void)dealloc;
- (void)setShouldBoundsCheck:(BOOL)a3;
@end

@implementation _IntArray2D

+ (id)arrayWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  v4 = [[_IntArray2D alloc] initWithISize:a3 jSize:a4];
  return v4;
}

- (void)dealloc
{
  free(self->_arrayData);
  v3.receiver = self;
  v3.super_class = (Class)_IntArray2D;
  [(_IntArray2D *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:3 * self->_iSize + 3 + (3 * self->_iSize + 3) * self->_jSize];
  unint64_t jSize = self->_jSize;
  if (jSize)
  {
    if (self->_iSize + 1 <= jSize + 1) {
      unint64_t v5 = jSize + 1;
    }
    else {
      unint64_t v5 = self->_iSize + 1;
    }
    unint64_t v6 = 0;
    uint64_t v7 = (uint64_t)(log10((double)v5) + 1.0);
    do
    {
      if (self->_iSize)
      {
        unint64_t v8 = 0;
        do
          objc_msgSend(v3, "appendFormat:", @"%0*ld ", v7, -[_IntArray2D ::](self, "::", v8++, v6));
        while (v8 < self->_iSize);
      }
      [v3 appendString:@"\n"];
      ++v6;
    }
    while (v6 < self->_jSize);
  }
  return v3;
}

- (_IntArray2D)initWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_IntArray2D;
  uint64_t v7 = [(_IntArray2D *)&v12 init];
  unint64_t v8 = v7;
  if (v7)
  {
    v7->_iSize = a3;
    v7->_unint64_t jSize = a4;
    v9 = (int64_t *)malloc_type_calloc(a4 * a3, 8uLL, 0x100004000313F17uLL);
    v8->_arrayData = v9;
    if (!v9)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, @"_IntArray2D.m", 52, @"IntArray2D : Not enough memory to allocate an array with size:%lu x %lu", a3, a4);
    }
  }
  return v8;
}

- (BOOL)inBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4
{
  return self->_iSize > a3 && self->_jSize > a4;
}

- (void)assertBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4
{
  if (self->_shouldBoundsCheck && !-[_IntArray2D inBoundsForIIndex:jIndex:](self, "inBoundsForIIndex:jIndex:"))
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_IntArray2D.m", 73, @"IntArray2D : Out of bounds with indices:%lu %lu on array size:%lu %lu", a3, a4, self->_iSize, self->_jSize);
  }
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4
{
  return self->_arrayData[a3 + self->_iSize * a4];
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4 outOfBoundsReturnValue:(int64_t)a5
{
  if (!-[_IntArray2D inBoundsForIIndex:jIndex:](self, "inBoundsForIIndex:jIndex:")) {
    return a5;
  }
  return [(_IntArray2D *)self :a3 :a4];
}

- (void):(unint64_t)a3 :(unint64_t)a4 newValue:(int64_t)a5
{
  self->_arrayData[a3 + self->_iSize * a4] = a5;
}

- (unint64_t)iSize
{
  return self->_iSize;
}

- (unint64_t)jSize
{
  return self->_jSize;
}

- (BOOL)shouldBoundsCheck
{
  return self->_shouldBoundsCheck;
}

- (void)setShouldBoundsCheck:(BOOL)a3
{
  self->_shouldBoundsCheck = a3;
}

@end
@interface _SUICIntArray2D
+ (id)arrayWithISize:(unint64_t)a3 jSize:(unint64_t)a4;
- (BOOL)inBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4;
- (BOOL)shouldBoundsCheck;
- (_SUICIntArray2D)initWithISize:(unint64_t)a3 jSize:(unint64_t)a4;
- (id)description;
- (int64_t):(unint64_t)a3 :(unint64_t)a4;
- (int64_t):(unint64_t)a3 :(unint64_t)a4 outOfBoundsReturnValue:(int64_t)a5;
- (unint64_t)iSize;
- (unint64_t)jSize;
- (void):(unint64_t)a3 :(unint64_t)a4 newValue:(int64_t)a5;
- (void)dealloc;
- (void)setShouldBoundsCheck:(BOOL)a3;
@end

@implementation _SUICIntArray2D

+ (id)arrayWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  v4 = [[_SUICIntArray2D alloc] initWithISize:a3 jSize:a4];

  return v4;
}

- (void)dealloc
{
  free(self->_arrayData);
  v3.receiver = self;
  v3.super_class = (Class)_SUICIntArray2D;
  [(_SUICIntArray2D *)&v3 dealloc];
}

- (id)description
{
  return &stru_1EFB44F78;
}

- (_SUICIntArray2D)initWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_SUICIntArray2D;
  v6 = [(_SUICIntArray2D *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_iSize = a3;
    v6->_jSize = a4;
    v6->_arrayData = (int64_t *)malloc_type_calloc(a4 * a3, 8uLL, 0x100004000313F17uLL);
  }
  return v7;
}

- (BOOL)inBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4
{
  return self->_iSize > a3 && self->_jSize > a4;
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4
{
  return self->_arrayData[a3 + self->_iSize * a4];
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4 outOfBoundsReturnValue:(int64_t)a5
{
  if (!-[_SUICIntArray2D inBoundsForIIndex:jIndex:](self, "inBoundsForIIndex:jIndex:")) {
    return a5;
  }

  return [(_SUICIntArray2D *)self :a3 :a4];
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
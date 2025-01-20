@interface MutableFloatArray
- (MutableFloatArray)initWithCount:(unint64_t)a3;
- (MutableFloatArray)initWithCount:(unint64_t)a3 capacity:(unint64_t)a4;
- (MutableFloatArray)initWithFloat:(float)a3 repeatCount:(unint64_t)a4 capacity:(unint64_t)a5;
- (MutableFloatArray)initWithZeros:(unint64_t)a3;
- (MutableFloatArray)initWithZeros:(unint64_t)a3 capacity:(unint64_t)a4;
- (const)floats;
- (float)floatAtIndex:(unint64_t)a3;
- (float)mutableFloats;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addConstant:(float)a3;
- (void)appendFloat:(float)a3;
- (void)removeFromStart:(unint64_t)a3;
- (void)setFloat:(float)a3 atIndex:(unint64_t)a4;
- (void)setFloat:(float)a3 inRange:(_NSRange)a4;
- (void)setFloats:(const float *)a3 inRange:(_NSRange)a4;
@end

@implementation MutableFloatArray

- (MutableFloatArray)initWithCount:(unint64_t)a3
{
  return [(MutableFloatArray *)self initWithCount:a3 capacity:a3];
}

- (MutableFloatArray)initWithCount:(unint64_t)a3 capacity:(unint64_t)a4
{
  if (a4 <= a3) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = a4;
  }
  if (v5 <= 0x10) {
    unint64_t v6 = 16;
  }
  else {
    unint64_t v6 = v5;
  }
  v8.receiver = self;
  v8.super_class = (Class)MutableFloatArray;
  result = [(FloatArray *)&v8 initWithCount:v6];
  result->_start = result->super._buffer;
  result->super._count = a3;
  result->_capacity = v6;
  return result;
}

- (MutableFloatArray)initWithZeros:(unint64_t)a3
{
  return [(MutableFloatArray *)self initWithZeros:a3 capacity:a3];
}

- (MutableFloatArray)initWithZeros:(unint64_t)a3 capacity:(unint64_t)a4
{
  if (a4 <= a3) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = a4;
  }
  if (v5 <= 0x10) {
    unint64_t v6 = 16;
  }
  else {
    unint64_t v6 = v5;
  }
  v8.receiver = self;
  v8.super_class = (Class)MutableFloatArray;
  result = [(FloatArray *)&v8 initWithZeros:v6];
  result->_start = result->super._buffer;
  result->super._count = a3;
  result->_capacity = v6;
  return result;
}

- (MutableFloatArray)initWithFloat:(float)a3 repeatCount:(unint64_t)a4 capacity:(unint64_t)a5
{
  float __A = a3;
  unint64_t v6 = [(MutableFloatArray *)self initWithCount:a4 capacity:a5];
  v7 = v6;
  if (v6) {
    vDSP_vfill(&__A, v6->super._buffer, 1, a4);
  }
  return v7;
}

- (float)floatAtIndex:(unint64_t)a3
{
  if (self->super._count <= a3) {
    -[MutableFloatArray floatAtIndex:]();
  }
  return self->_start[a3];
}

- (const)floats
{
  return self->_start;
}

- (float)mutableFloats
{
  return self->_start;
}

- (void)setFloat:(float)a3 atIndex:(unint64_t)a4
{
  if (self->super._count <= a4) {
    -[MutableFloatArray setFloat:atIndex:]();
  }
  self->_start[a4] = a3;
}

- (void)setFloat:(float)a3 inRange:(_NSRange)a4
{
  float __A = a3;
  if (a4.location + a4.length > self->super._count) {
    -[MutableFloatArray setFloat:inRange:]();
  }
  vDSP_vfill(&__A, &self->_start[a4.location], 1, a4.length);
}

- (void)setFloats:(const float *)a3 inRange:(_NSRange)a4
{
  if (a4.location + a4.length > self->super._count) {
    -[MutableFloatArray setFloats:inRange:]();
  }
  v4 = &self->_start[a4.location];

  memcpy(v4, a3, 4 * a4.length);
}

- (void)appendFloat:(float)a3
{
  start = self->_start;
  p_buffer = &self->super._buffer;
  buffer = self->super._buffer;
  v7 = p_buffer[1];
  unint64_t capacity = self->_capacity;
  if (&start[(void)v7] >= &buffer[capacity])
  {
    if (buffer >= start)
    {
      self->_unint64_t capacity = 2 * capacity;
      v10 = (float *)malloc_type_realloc(buffer, 8 * capacity, 0x100004052888210uLL);
      if (!v10) {
        -[MutableFloatArray appendFloat:]();
      }
      start = v10;
      self->super._buffer = v10;
    }
    else
    {
      memmove(buffer, start, 4 * (void)v7);
      start = self->super._buffer;
    }
    self->_start = start;
  }
  unint64_t count = self->super._count;
  self->super._unint64_t count = count + 1;
  start[count] = a3;
}

- (void)removeFromStart:(unint64_t)a3
{
  unint64_t count = self->super._count;
  if (count >= a3) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = self->super._count;
  }
  self->_start += v4;
  self->super._unint64_t count = count - v4;
}

- (void)addConstant:(float)a3
{
  float __B = a3;
  v3 = self;
  unint64_t v4 = [(MutableFloatArray *)v3 floats];
  unint64_t v5 = v3;
  vDSP_vsadd(v4, 1, &__B, [(MutableFloatArray *)v5 mutableFloats], 1, [(FloatArray *)v5 count]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [FloatArray alloc];

  return [(FloatArray *)v4 initWithFloatArray:self];
}

- (void)floatAtIndex:.cold.1()
{
}

- (void)setFloat:atIndex:.cold.1()
{
}

- (void)setFloat:inRange:.cold.1()
{
  __assert_rtn("-[MutableFloatArray setFloat:inRange:]", "FloatArray.m", 248, "NSMaxRange(range) <= _count");
}

- (void)setFloats:inRange:.cold.1()
{
  __assert_rtn("-[MutableFloatArray setFloats:inRange:]", "FloatArray.m", 253, "NSMaxRange(range) <= _count");
}

- (void)appendFloat:.cold.1()
{
}

@end
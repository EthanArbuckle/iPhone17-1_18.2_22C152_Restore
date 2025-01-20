@interface _UIPointVector
- (_UIPointVector)init;
- (__n128)lastVector;
- (__n128)vectorAtIndex:(uint64_t)a3;
- (uint64_t)vectors;
- (unint64_t)capacity;
- (unint64_t)count;
- (void)addVector:(_UIPointVector *)self;
- (void)clear;
- (void)dealloc;
- (void)removeVectorAtIndex:(unint64_t)a3;
- (void)reset;
- (void)setCapacity:(unint64_t)a3;
- (void)setCount:(unint64_t)a3;
- (void)setVectors:(_UIPointVector *)self;
@end

@implementation _UIPointVector

- (_UIPointVector)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPointVector;
  result = [(_UIPointVector *)&v3 init];
  if (result)
  {
    result->_count = 0;
    result->_capacity = 0;
    *(void *)result->_vectors = 0;
  }
  return result;
}

- (void)addVector:(_UIPointVector *)self
{
  long long v9 = v2;
  unint64_t v4 = [(_UIPointVector *)self count] + 1;
  if (v4 >= [(_UIPointVector *)self capacity])
  {
    [(_UIPointVector *)self setCapacity:2 * [(_UIPointVector *)self capacity]];
    unint64_t v5 = [(_UIPointVector *)self capacity];
    if (v5 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    [(_UIPointVector *)self setCapacity:v6];
    [(_UIPointVector *)self setVectors:malloc_type_realloc((void *)[(_UIPointVector *)self vectors], 16 * [(_UIPointVector *)self capacity], 0x1000040451B5BE8uLL)];
  }
  uint64_t v7 = [(_UIPointVector *)self vectors];
  *(_OWORD *)(v7 + 16 * [(_UIPointVector *)self count]) = v9;
  unint64_t v8 = [(_UIPointVector *)self count] + 1;

  [(_UIPointVector *)self setCount:v8];
}

- (void)removeVectorAtIndex:(unint64_t)a3
{
  if ([(_UIPointVector *)self count] > a3)
  {
    memmove((void *)([(_UIPointVector *)self vectors] + 16 * a3), (const void *)([(_UIPointVector *)self vectors] + 16 * a3 + 16), 16 * ([(_UIPointVector *)self count] + ~a3));
    unint64_t v5 = [(_UIPointVector *)self count] - 1;
    [(_UIPointVector *)self setCount:v5];
  }
}

- (__n128)vectorAtIndex:(uint64_t)a3
{
  return *(__n128 *)([a1 vectors] + 16 * a3);
}

- (__n128)lastVector
{
  uint64_t v2 = [a1 vectors];
  return *(__n128 *)(v2 + 16 * [a1 count] - 16);
}

- (void)clear
{
}

- (void)reset
{
  if ([(_UIPointVector *)self vectors])
  {
    free((void *)[(_UIPointVector *)self vectors]);
    [(_UIPointVector *)self setVectors:0];
  }
  [(_UIPointVector *)self setCapacity:0];

  [(_UIPointVector *)self setCount:0];
}

- (void)dealloc
{
  [(_UIPointVector *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)_UIPointVector;
  [(_UIPointVector *)&v3 dealloc];
}

- (uint64_t)vectors
{
  return *(void *)(a1 + 24);
}

- (void)setVectors:(_UIPointVector *)self
{
  *(void *)self->_vectors = v2;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

@end
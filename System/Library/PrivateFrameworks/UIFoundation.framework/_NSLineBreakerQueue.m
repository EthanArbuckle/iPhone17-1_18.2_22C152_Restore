@interface _NSLineBreakerQueue
- (_NSLineBreakerQueue)init;
- (_NSLineBreakerQueue)initWithCapacity:(unint64_t)a3;
- (const)valueAtIndex:(unint64_t)a3;
- (id)description;
- (unint64_t)count;
- (void)_ensureCapacity:(unint64_t)a3;
- (void)appendValue:(const void *)a3;
- (void)dealloc;
- (void)enumerateValuesWithBlock:(id)a3;
- (void)removeAllValues;
- (void)removeValuesBeforeIndex:(unint64_t)a3;
@end

@implementation _NSLineBreakerQueue

- (void)enumerateValuesWithBlock:(id)a3
{
  v4 = (void (**)(id, const void *, unsigned char *))a3;
  unint64_t v5 = 0;
  char v6 = 0;
  do
  {
    if (v5 >= self->_count) {
      break;
    }
    v4[2](v4, [(_NSLineBreakerQueue *)self valueAtIndex:v5++], &v6);
  }
  while (!v6);
}

- (unint64_t)count
{
  return self->_count;
}

- (const)valueAtIndex:(unint64_t)a3
{
  if (self->_count <= a3) {
    -[_NSLineBreakerQueue valueAtIndex:]();
  }
  unint64_t capacity = self->_capacity;
  unint64_t v4 = self->_start + a3;
  if (v4 < capacity) {
    unint64_t capacity = 0;
  }
  return self->_buf[v4 - capacity];
}

- (void)appendValue:(const void *)a3
{
  [(_NSLineBreakerQueue *)self _ensureCapacity:self->_count + 1];
  unint64_t count = self->_count;
  if (self->_end == self->_capacity) {
    unint64_t end = 0;
  }
  else {
    unint64_t end = self->_end;
  }
  self->_buf[end] = a3;
  self->_unint64_t end = end + 1;
  self->_unint64_t count = count + 1;
}

- (void)_ensureCapacity:(unint64_t)a3
{
  unint64_t capacity = self->_capacity;
  if (capacity < a3)
  {
    unint64_t v5 = self->_capacity;
    do
    {
      unint64_t v6 = v5;
      v5 *= 2;
    }
    while (v6 < a3);
    v7 = (const void **)malloc_type_realloc(self->_buf, 8 * v6, 0xC0040B8AA526DuLL);
    self->_buf = v7;
    self->_unint64_t capacity = v6;
    unint64_t start = self->_start;
    if (self->_count + start > capacity)
    {
      unint64_t v9 = start + v6 - capacity;
      memmove(&v7[v9], &v7[start], 8 * (capacity - start));
      self->_unint64_t start = v9;
    }
  }
}

- (void)removeValuesBeforeIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  BOOL v4 = count >= a3;
  unint64_t v5 = count - a3;
  if (!v4) {
    -[_NSLineBreakerQueue removeValuesBeforeIndex:]();
  }
  unint64_t capacity = self->_capacity;
  unint64_t v7 = self->_start + a3;
  self->_unint64_t start = v7;
  BOOL v4 = v7 >= capacity;
  unint64_t v8 = v7 - capacity;
  if (v4) {
    self->_unint64_t start = v8;
  }
  self->_unint64_t count = v5;
}

- (_NSLineBreakerQueue)init
{
  return [(_NSLineBreakerQueue *)self initWithCapacity:8];
}

- (_NSLineBreakerQueue)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NSLineBreakerQueue;
  BOOL v4 = [(_NSLineBreakerQueue *)&v6 init];
  if (v4)
  {
    v4->_buf = (const void **)malloc_type_malloc(8 * a3, 0xC0040B8AA526DuLL);
    v4->_unint64_t capacity = a3;
    v4->_unint64_t end = 0;
    v4->_unint64_t count = 0;
    v4->_unint64_t start = 0;
  }
  return v4;
}

- (void)dealloc
{
  free(self->_buf);
  v3.receiver = self;
  v3.super_class = (Class)_NSLineBreakerQueue;
  [(_NSLineBreakerQueue *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p: %lu items>", objc_opt_class(), self, self->_count];
}

- (void)removeAllValues
{
  self->_unint64_t start = 0;
  self->_unint64_t end = 0;
  self->_unint64_t count = 0;
}

- (void)valueAtIndex:.cold.1()
{
}

- (void)removeValuesBeforeIndex:.cold.1()
{
  __assert_rtn("-[_NSLineBreakerQueue removeValuesBeforeIndex:]", "NSLineBreakerQueue.m", 94, "index <= _count");
}

@end
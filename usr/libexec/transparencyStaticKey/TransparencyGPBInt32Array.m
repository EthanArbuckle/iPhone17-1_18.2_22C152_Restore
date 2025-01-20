@interface TransparencyGPBInt32Array
+ (id)array;
+ (id)arrayWithCapacity:(unint64_t)a3;
+ (id)arrayWithValue:(int)a3;
+ (id)arrayWithValueArray:(id)a3;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBInt32Array)init;
- (TransparencyGPBInt32Array)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBInt32Array)initWithValueArray:(id)a3;
- (TransparencyGPBInt32Array)initWithValues:(const int *)a3 count:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)valueAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addValue:(int)a3;
- (void)addValues:(const int *)a3 count:(unint64_t)a4;
- (void)addValuesFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateValuesWithBlock:(id)a3;
- (void)enumerateValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)exchangeValueAtIndex:(unint64_t)a3 withValueAtIndex:(unint64_t)a4;
- (void)insertValue:(int)a3 atIndex:(unint64_t)a4;
- (void)internalResizeToCapacity:(unint64_t)a3;
- (void)removeAll;
- (void)removeValueAtIndex:(unint64_t)a3;
- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(int)a4;
@end

@implementation TransparencyGPBInt32Array

+ (id)array
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)arrayWithValue:(int)a3
{
  int v4 = a3;
  return [objc_alloc((Class)a1) initWithValues:&v4 count:1];
}

+ (id)arrayWithValueArray:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithValueArray:a3];

  return v3;
}

+ (id)arrayWithCapacity:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCapacity:a3];

  return v3;
}

- (TransparencyGPBInt32Array)init
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt32Array;
  return [(TransparencyGPBInt32Array *)&v3 init];
}

- (TransparencyGPBInt32Array)initWithValueArray:(id)a3
{
  return [(TransparencyGPBInt32Array *)self initWithValues:*((void *)a3 + 2) count:*((void *)a3 + 3)];
}

- (TransparencyGPBInt32Array)initWithValues:(const int *)a3 count:(unint64_t)a4
{
  v6 = [(TransparencyGPBInt32Array *)self init];
  v7 = v6;
  if (v6 && a3 && a4)
  {
    v8 = (int *)reallocf(v6->_values, 4 * a4);
    v7->_values = v8;
    if (v8)
    {
      v7->_capacity = a4;
      memcpy(v8, a3, 4 * a4);
      v7->_count = a4;
    }
    else
    {

      +[NSException raise:NSMallocException, @"Failed to allocate %lu bytes", 4 * a4 format];
    }
  }
  return v7;
}

- (TransparencyGPBInt32Array)initWithCapacity:(unint64_t)a3
{
  int v4 = [(TransparencyGPBInt32Array *)self initWithValues:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(TransparencyGPBInt32Array *)v4 internalResizeToCapacity:a3];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = +[TransparencyGPBInt32Array allocWithZone:a3];
  values = self->_values;
  unint64_t count = self->_count;

  return [(TransparencyGPBInt32Array *)v4 initWithValues:values count:count];
}

- (void)dealloc
{
  free(self->_values);
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt32Array;
  [(TransparencyGPBInt32Array *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  BOOL result = (objc_opt_isKindOfClass() & 1) != 0
        && (unint64_t count = self->_count, count == *((void *)a3 + 3))
        && memcmp(self->_values, *((const void **)a3 + 2), 4 * count) == 0;
  return result;
}

- (unint64_t)hash
{
  return self->_count;
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithFormat:@"<%@ %p> { ", objc_opt_class(), self];
  unint64_t count = self->_count;
  if (count)
  {
    for (uint64_t i = 0; i != count; ++i)
    {
      if (i) {
        CFStringRef v6 = @", %d";
      }
      else {
        CFStringRef v6 = @"%d";
      }
      -[NSMutableString appendFormat:](v3, "appendFormat:", v6, self->_values[i]);
    }
  }
  [(NSMutableString *)v3 appendFormat:@" }"];
  return v3;
}

- (void)enumerateValuesWithBlock:(id)a3
{
}

- (void)enumerateValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v11 = 0;
  unint64_t count = self->_count;
  if ((a3 & 2) != 0)
  {
    if (count)
    {
      unint64_t v10 = count - 1;
      do
      {
        if (v10 == -1) {
          break;
        }
        (*((void (**)(id, void, unint64_t, char *))a4 + 2))(a4, self->_values[v10], v10, &v11);
        --v10;
      }
      while (!v11);
    }
  }
  else if (count)
  {
    uint64_t v7 = 0;
    unint64_t v8 = count - 1;
    do
    {
      (*((void (**)(id, void, uint64_t, char *))a4 + 2))(a4, self->_values[v7], v7, &v11);
      if (v11) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v8 == v7;
      }
      ++v7;
    }
    while (!v9);
  }
}

- (int)valueAtIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count <= a3) {
    +[NSException raise:NSRangeException, @"Index (%lu) beyond bounds (%lu)", a3, count format];
  }
  return self->_values[a3];
}

- (void)internalResizeToCapacity:(unint64_t)a3
{
  unint64_t v5 = 4 * a3;
  CFStringRef v6 = (int *)reallocf(self->_values, 4 * a3);
  self->_values = v6;
  if (!v6)
  {
    self->_unint64_t count = 0;
    self->_capacity = 0;
    +[NSException raise:NSMallocException, @"Failed to allocate %lu bytes", v5 format];
  }
  self->_capacity = a3;
}

- (void)addValue:(int)a3
{
  int v3 = a3;
  [(TransparencyGPBInt32Array *)self addValues:&v3 count:1];
}

- (void)addValues:(const int *)a3 count:(unint64_t)a4
{
  if (a3 && a4)
  {
    unint64_t count = self->_count;
    unint64_t v8 = count + a4;
    if (count + a4 > self->_capacity) {
      [(TransparencyGPBInt32Array *)self internalResizeToCapacity:(v8 & 0xFFFFFFFFFFFFFFF0) + 16];
    }
    self->_unint64_t count = v8;
    memcpy(&self->_values[count], a3, 4 * a4);
    autocreator = self->_autocreator;
    if (autocreator)
    {
      sub_10002DA80(autocreator, (uint64_t)self);
    }
  }
}

- (void)insertValue:(int)a3 atIndex:(unint64_t)a4
{
  unint64_t count = self->_count;
  unint64_t v8 = count + 1;
  if (count + 1 <= a4)
  {
    +[NSException raise:NSRangeException, @"Index (%lu) beyond bounds (%lu)", a4, count + 1 format];
    unint64_t count = self->_count;
    unint64_t v8 = count + 1;
  }
  if (v8 > self->_capacity) {
    [(TransparencyGPBInt32Array *)self internalResizeToCapacity:(v8 & 0xFFFFFFFFFFFFFFF0) + 16];
  }
  self->_unint64_t count = v8;
  if (count != a4) {
    memmove(&self->_values[a4 + 1], &self->_values[a4], 4 * (count - a4));
  }
  self->_values[a4] = a3;
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_10002DA80(autocreator, (uint64_t)self);
  }
}

- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(int)a4
{
  unint64_t count = self->_count;
  if (count <= a3) {
    +[NSException raise:NSRangeException, @"Index (%lu) beyond bounds (%lu)", a3, count format];
  }
  self->_values[a3] = a4;
}

- (void)addValuesFromArray:(id)a3
{
}

- (void)removeValueAtIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count <= a3)
  {
    +[NSException raise:NSRangeException, @"Index (%lu) beyond bounds (%lu)", a3, count format];
    unint64_t count = self->_count;
  }
  unint64_t v6 = count - 1;
  if (count - 1 != a3) {
    memmove(&self->_values[a3], &self->_values[a3 + 1], 4 * (count - 1 - a3));
  }
  self->_unint64_t count = v6;
  if (count + 31 < self->_capacity)
  {
    [(TransparencyGPBInt32Array *)self internalResizeToCapacity:(v6 & 0xFFFFFFFFFFFFFFF0) + 16];
  }
}

- (void)removeAll
{
  self->_unint64_t count = 0;
  if (self->_capacity >= 0x21) {
    [(TransparencyGPBInt32Array *)self internalResizeToCapacity:16];
  }
}

- (void)exchangeValueAtIndex:(unint64_t)a3 withValueAtIndex:(unint64_t)a4
{
  unint64_t count = self->_count;
  if (count <= a3)
  {
    +[NSException raise:NSRangeException, @"Index (%lu) beyond bounds (%lu)", a3, count format];
    unint64_t count = self->_count;
  }
  if (count <= a4) {
    +[NSException raise:NSRangeException, @"Index (%lu) beyond bounds (%lu)", a4, count format];
  }
  values = self->_values;
  int v9 = values[a3];
  values[a3] = values[a4];
  values[a4] = v9;
}

- (unint64_t)count
{
  return self->_count;
}

@end
@interface GPBBoolArray
+ (id)array;
+ (id)arrayWithCapacity:(unint64_t)a3;
+ (id)arrayWithValue:(BOOL)a3;
+ (id)arrayWithValueArray:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)valueAtIndex:(unint64_t)a3;
- (GPBBoolArray)init;
- (GPBBoolArray)initWithCapacity:(unint64_t)a3;
- (GPBBoolArray)initWithValueArray:(id)a3;
- (GPBBoolArray)initWithValues:(const BOOL *)a3 count:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addValue:(BOOL)a3;
- (void)addValues:(const BOOL *)a3 count:(unint64_t)a4;
- (void)addValuesFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateValuesWithBlock:(id)a3;
- (void)enumerateValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)exchangeValueAtIndex:(unint64_t)a3 withValueAtIndex:(unint64_t)a4;
- (void)insertValue:(BOOL)a3 atIndex:(unint64_t)a4;
- (void)internalResizeToCapacity:(unint64_t)a3;
- (void)removeAll;
- (void)removeValueAtIndex:(unint64_t)a3;
- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(BOOL)a4;
@end

@implementation GPBBoolArray

+ (id)array
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)arrayWithValue:(BOOL)a3
{
  BOOL v4 = a3;
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

- (GPBBoolArray)init
{
  v3.receiver = self;
  v3.super_class = (Class)GPBBoolArray;
  return [(GPBBoolArray *)&v3 init];
}

- (GPBBoolArray)initWithValueArray:(id)a3
{
  return [(GPBBoolArray *)self initWithValues:*((void *)a3 + 2) count:*((void *)a3 + 3)];
}

- (GPBBoolArray)initWithValues:(const BOOL *)a3 count:(unint64_t)a4
{
  v6 = [(GPBBoolArray *)self init];
  v7 = v6;
  if (v6 && a3 && a4)
  {
    v8 = (BOOL *)reallocf(v6->_values, a4);
    v7->_values = v8;
    if (v8)
    {
      v7->_capacity = a4;
      memcpy(v8, a3, a4);
      v7->_count = a4;
    }
    else
    {

      +[NSException raise:NSMallocException, @"Failed to allocate %lu bytes", a4 format];
    }
  }
  return v7;
}

- (GPBBoolArray)initWithCapacity:(unint64_t)a3
{
  BOOL v4 = [(GPBBoolArray *)self initWithValues:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(GPBBoolArray *)v4 internalResizeToCapacity:a3];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = +[GPBBoolArray allocWithZone:a3];
  values = self->_values;
  unint64_t count = self->_count;

  return [(GPBBoolArray *)v4 initWithValues:values count:count];
}

- (void)dealloc
{
  if (self->_autocreator) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBArray.m", 1874, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator object file lineNumber description];
  }
  free(self->_values);
  v3.receiver = self;
  v3.super_class = (Class)GPBBoolArray;
  [(GPBBoolArray *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  BOOL result = (objc_opt_isKindOfClass() & 1) != 0
        && (size_t count = self->_count, count == *((void *)a3 + 3))
        && memcmp(self->_values, *((const void **)a3 + 2), count) == 0;
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
        (*((void (**)(id, BOOL, unint64_t, char *))a4 + 2))(a4, self->_values[v10], v10, &v11);
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
      (*((void (**)(id, BOOL, uint64_t, char *))a4 + 2))(a4, self->_values[v7], v7, &v11);
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

- (BOOL)valueAtIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count <= a3) {
    +[NSException raise:NSRangeException, @"Index (%lu) beyond bounds (%lu)", a3, count format];
  }
  return self->_values[a3];
}

- (void)internalResizeToCapacity:(unint64_t)a3
{
  v5 = (BOOL *)reallocf(self->_values, a3);
  self->_values = v5;
  if (!v5)
  {
    self->_unint64_t count = 0;
    self->_capacity = 0;
    +[NSException raise:NSMallocException, @"Failed to allocate %lu bytes", a3 format];
  }
  self->_capacity = a3;
}

- (void)addValue:(BOOL)a3
{
  BOOL v3 = a3;
  [(GPBBoolArray *)self addValues:&v3 count:1];
}

- (void)addValues:(const BOOL *)a3 count:(unint64_t)a4
{
  if (a3 && a4)
  {
    unint64_t count = self->_count;
    unint64_t v8 = count + a4;
    if (count + a4 > self->_capacity) {
      [(GPBBoolArray *)self internalResizeToCapacity:(v8 & 0xFFFFFFFFFFFFFFF0) + 16];
    }
    self->_unint64_t count = v8;
    memcpy(&self->_values[count], a3, a4);
    autocreator = self->_autocreator;
    if (autocreator)
    {
      GPBAutocreatedArrayModified(autocreator, (uint64_t)self);
    }
  }
}

- (void)insertValue:(BOOL)a3 atIndex:(unint64_t)a4
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
    [(GPBBoolArray *)self internalResizeToCapacity:(v8 & 0xFFFFFFFFFFFFFFF0) + 16];
  }
  self->_unint64_t count = v8;
  if (count != a4) {
    memmove(&self->_values[a4 + 1], &self->_values[a4], count - a4);
  }
  self->_values[a4] = a3;
  autocreator = self->_autocreator;
  if (autocreator)
  {
    GPBAutocreatedArrayModified(autocreator, (uint64_t)self);
  }
}

- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(BOOL)a4
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
    memmove(&self->_values[a3], &self->_values[a3 + 1], count - 1 - a3);
  }
  self->_unint64_t count = v6;
  if (count + 31 < self->_capacity)
  {
    [(GPBBoolArray *)self internalResizeToCapacity:(v6 & 0xFFFFFFFFFFFFFFF0) + 16];
  }
}

- (void)removeAll
{
  self->_unint64_t count = 0;
  if (self->_capacity >= 0x21) {
    [(GPBBoolArray *)self internalResizeToCapacity:16];
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
  BOOL v9 = values[a3];
  values[a3] = values[a4];
  values[a4] = v9;
}

- (unint64_t)count
{
  return self->_count;
}

@end
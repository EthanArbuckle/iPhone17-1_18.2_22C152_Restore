@interface TRIPBFloatArray
+ (id)array;
+ (id)arrayWithCapacity:(unint64_t)a3;
+ (id)arrayWithValue:(float)a3;
+ (id)arrayWithValueArray:(id)a3;
- (BOOL)isEqual:(id)a3;
- (TRIPBFloatArray)init;
- (TRIPBFloatArray)initWithCapacity:(unint64_t)a3;
- (TRIPBFloatArray)initWithValueArray:(id)a3;
- (TRIPBFloatArray)initWithValues:(const float *)a3 count:(unint64_t)a4;
- (float)valueAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addValue:(float)a3;
- (void)addValues:(const float *)a3 count:(unint64_t)a4;
- (void)addValuesFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateValuesWithBlock:(id)a3;
- (void)enumerateValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)exchangeValueAtIndex:(unint64_t)a3 withValueAtIndex:(unint64_t)a4;
- (void)insertValue:(float)a3 atIndex:(unint64_t)a4;
- (void)internalResizeToCapacity:(unint64_t)a3;
- (void)removeAll;
- (void)removeValueAtIndex:(unint64_t)a3;
- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(float)a4;
@end

@implementation TRIPBFloatArray

+ (id)array
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)arrayWithValue:(float)a3
{
  float v4 = a3;
  return (id)[objc_alloc((Class)a1) initWithValues:&v4 count:1];
}

+ (id)arrayWithValueArray:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithValueArray:a3];
  return v3;
}

+ (id)arrayWithCapacity:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCapacity:a3];
  return v3;
}

- (TRIPBFloatArray)init
{
  v3.receiver = self;
  v3.super_class = (Class)TRIPBFloatArray;
  return [(TRIPBFloatArray *)&v3 init];
}

- (TRIPBFloatArray)initWithValueArray:(id)a3
{
  return [(TRIPBFloatArray *)self initWithValues:*((void *)a3 + 2) count:*((void *)a3 + 3)];
}

- (TRIPBFloatArray)initWithValues:(const float *)a3 count:(unint64_t)a4
{
  v6 = [(TRIPBFloatArray *)self init];
  v7 = v6;
  if (v6 && a3 && a4)
  {
    v8 = (float *)reallocf(v6->_values, 4 * a4);
    v7->_values = v8;
    if (v8)
    {
      v7->_capacity = a4;
      memcpy(v8, a3, 4 * a4);
      v7->_count = a4;
    }
    else
    {

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A0], @"Failed to allocate %lu bytes", 4 * a4);
    }
  }
  return v7;
}

- (TRIPBFloatArray)initWithCapacity:(unint64_t)a3
{
  float v4 = [(TRIPBFloatArray *)self initWithValues:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(TRIPBFloatArray *)v4 internalResizeToCapacity:a3];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  float v4 = +[TRIPBFloatArray allocWithZone:a3];
  values = self->_values;
  unint64_t count = self->_count;
  return [(TRIPBFloatArray *)v4 initWithValues:values count:count];
}

- (void)dealloc
{
  if (self->_autocreator) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBArray.m", 1365, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator);
  }
  free(self->_values);
  v3.receiver = self;
  v3.super_class = (Class)TRIPBFloatArray;
  [(TRIPBFloatArray *)&v3 dealloc];
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
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p> { ", objc_opt_class(), self];
  unint64_t count = self->_count;
  if (count)
  {
    for (uint64_t i = 0; i != count; ++i)
    {
      if (i) {
        v6 = @", %f";
      }
      else {
        v6 = @"%f";
      }
      objc_msgSend(v3, "appendFormat:", v6, self->_values[i]);
    }
  }
  [v3 appendFormat:@" }"];
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
        (*((void (**)(id, unint64_t, char *, float))a4 + 2))(a4, v10, &v11, self->_values[v10]);
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
      (*((void (**)(id, uint64_t, char *, float))a4 + 2))(a4, v7, &v11, self->_values[v7]);
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

- (float)valueAtIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count <= a3) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Index (%lu) beyond bounds (%lu)", a3, count);
  }
  return self->_values[a3];
}

- (void)internalResizeToCapacity:(unint64_t)a3
{
  unint64_t v5 = 4 * a3;
  v6 = (float *)reallocf(self->_values, 4 * a3);
  self->_values = v6;
  if (!v6)
  {
    self->_unint64_t count = 0;
    self->_capacity = 0;
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A0], @"Failed to allocate %lu bytes", v5);
  }
  self->_capacity = a3;
}

- (void)addValue:(float)a3
{
  float v3 = a3;
  [(TRIPBFloatArray *)self addValues:&v3 count:1];
}

- (void)addValues:(const float *)a3 count:(unint64_t)a4
{
  if (a3 && a4)
  {
    unint64_t count = self->_count;
    unint64_t v8 = count + a4;
    if (count + a4 > self->_capacity) {
      [(TRIPBFloatArray *)self internalResizeToCapacity:(v8 & 0xFFFFFFFFFFFFFFF0) + 16];
    }
    self->_unint64_t count = v8;
    memcpy(&self->_values[count], a3, 4 * a4);
    autocreator = self->_autocreator;
    if (autocreator)
    {
      TRIPBAutocreatedArrayModified(autocreator, (uint64_t)self);
    }
  }
}

- (void)insertValue:(float)a3 atIndex:(unint64_t)a4
{
  unint64_t count = self->_count;
  unint64_t v8 = count + 1;
  if (count + 1 <= a4)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Index (%lu) beyond bounds (%lu)", a4, count + 1);
    unint64_t count = self->_count;
    unint64_t v8 = count + 1;
  }
  if (v8 > self->_capacity) {
    [(TRIPBFloatArray *)self internalResizeToCapacity:(v8 & 0xFFFFFFFFFFFFFFF0) + 16];
  }
  self->_unint64_t count = v8;
  if (count != a4) {
    memmove(&self->_values[a4 + 1], &self->_values[a4], 4 * (count - a4));
  }
  self->_values[a4] = a3;
  autocreator = self->_autocreator;
  if (autocreator)
  {
    TRIPBAutocreatedArrayModified(autocreator, (uint64_t)self);
  }
}

- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(float)a4
{
  unint64_t count = self->_count;
  if (count <= a3) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Index (%lu) beyond bounds (%lu)", a3, count);
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
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Index (%lu) beyond bounds (%lu)", a3, count);
    unint64_t count = self->_count;
  }
  unint64_t v6 = count - 1;
  if (count - 1 != a3) {
    memmove(&self->_values[a3], &self->_values[a3 + 1], 4 * (count - 1 - a3));
  }
  self->_unint64_t count = v6;
  if (count + 31 < self->_capacity)
  {
    [(TRIPBFloatArray *)self internalResizeToCapacity:(v6 & 0xFFFFFFFFFFFFFFF0) + 16];
  }
}

- (void)removeAll
{
  self->_unint64_t count = 0;
  if (self->_capacity >= 0x21) {
    [(TRIPBFloatArray *)self internalResizeToCapacity:16];
  }
}

- (void)exchangeValueAtIndex:(unint64_t)a3 withValueAtIndex:(unint64_t)a4
{
  unint64_t count = self->_count;
  unint64_t v8 = (void *)MEMORY[0x1E4F1C4A8];
  if (count <= a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Index (%lu) beyond bounds (%lu)", a3, count);
    unint64_t count = self->_count;
  }
  if (count <= a4) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v8, @"Index (%lu) beyond bounds (%lu)", a4, count);
  }
  values = self->_values;
  float v10 = values[a3];
  values[a3] = values[a4];
  values[a4] = v10;
}

- (unint64_t)count
{
  return self->_count;
}

@end
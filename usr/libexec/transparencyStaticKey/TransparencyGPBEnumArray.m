@interface TransparencyGPBEnumArray
+ (id)array;
+ (id)arrayWithValidationFunction:(void *)a3;
+ (id)arrayWithValidationFunction:(void *)a3 capacity:(unint64_t)a4;
+ (id)arrayWithValidationFunction:(void *)a3 rawValue:(int)a4;
+ (id)arrayWithValueArray:(id)a3;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBEnumArray)init;
- (TransparencyGPBEnumArray)initWithValidationFunction:(void *)a3;
- (TransparencyGPBEnumArray)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4;
- (TransparencyGPBEnumArray)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 count:(unint64_t)a5;
- (TransparencyGPBEnumArray)initWithValueArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)rawValueAtIndex:(unint64_t)a3;
- (int)valueAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addRawValue:(int)a3;
- (void)addRawValues:(const int *)a3 count:(unint64_t)a4;
- (void)addRawValuesFromArray:(id)a3;
- (void)addValue:(int)a3;
- (void)addValues:(const int *)a3 count:(unint64_t)a4;
- (void)dealloc;
- (void)enumerateRawValuesWithBlock:(id)a3;
- (void)enumerateRawValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateValuesWithBlock:(id)a3;
- (void)enumerateValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)exchangeValueAtIndex:(unint64_t)a3 withValueAtIndex:(unint64_t)a4;
- (void)insertRawValue:(int)a3 atIndex:(unint64_t)a4;
- (void)insertValue:(int)a3 atIndex:(unint64_t)a4;
- (void)internalResizeToCapacity:(unint64_t)a3;
- (void)removeAll;
- (void)removeValueAtIndex:(unint64_t)a3;
- (void)replaceValueAtIndex:(unint64_t)a3 withRawValue:(int)a4;
- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(int)a4;
- (void)validationFunc;
@end

@implementation TransparencyGPBEnumArray

+ (id)array
{
  id v2 = [objc_alloc((Class)a1) initWithValidationFunction:0];

  return v2;
}

+ (id)arrayWithValidationFunction:(void *)a3
{
  id v3 = [objc_alloc((Class)a1) initWithValidationFunction:a3];

  return v3;
}

+ (id)arrayWithValidationFunction:(void *)a3 rawValue:(int)a4
{
  int v5 = a4;
  return [objc_alloc((Class)a1) initWithValidationFunction:a3 rawValues:&v5 count:1];
}

+ (id)arrayWithValueArray:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithValueArray:a3];

  return v3;
}

+ (id)arrayWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) initWithValidationFunction:a3 capacity:a4];

  return v4;
}

- (TransparencyGPBEnumArray)init
{
  return [(TransparencyGPBEnumArray *)self initWithValidationFunction:0];
}

- (TransparencyGPBEnumArray)initWithValueArray:(id)a3
{
  return [(TransparencyGPBEnumArray *)self initWithValidationFunction:*((void *)a3 + 2) rawValues:*((void *)a3 + 3) count:*((void *)a3 + 4)];
}

- (TransparencyGPBEnumArray)initWithValidationFunction:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransparencyGPBEnumArray;
  result = [(TransparencyGPBEnumArray *)&v6 init];
  if (result)
  {
    if (a3) {
      int v5 = a3;
    }
    else {
      int v5 = sub_1000105E8;
    }
    result->_validationFunc = v5;
  }
  return result;
}

- (TransparencyGPBEnumArray)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 count:(unint64_t)a5
{
  v7 = [(TransparencyGPBEnumArray *)self initWithValidationFunction:a3];
  v8 = v7;
  if (v7 && a4 && a5)
  {
    v9 = (int *)reallocf(v7->_values, 4 * a5);
    v8->_values = v9;
    if (v9)
    {
      v8->_capacity = a5;
      memcpy(v9, a4, 4 * a5);
      v8->_count = a5;
    }
    else
    {

      +[NSException raise:NSMallocException, @"Failed to allocate %lu bytes", 4 * a5 format];
    }
  }
  return v8;
}

- (TransparencyGPBEnumArray)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  int v5 = [(TransparencyGPBEnumArray *)self initWithValidationFunction:a3];
  objc_super v6 = v5;
  if (a4 && v5) {
    [(TransparencyGPBEnumArray *)v5 internalResizeToCapacity:a4];
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TransparencyGPBEnumArray allocWithZone:a3];
  validationFunc = self->_validationFunc;
  values = self->_values;
  unint64_t count = self->_count;

  return [(TransparencyGPBEnumArray *)v4 initWithValidationFunction:validationFunc rawValues:values count:count];
}

- (void)dealloc
{
  free(self->_values);
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBEnumArray;
  [(TransparencyGPBEnumArray *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  BOOL result = (objc_opt_isKindOfClass() & 1) != 0
        && (unint64_t count = self->_count, count == *((void *)a3 + 4))
        && memcmp(self->_values, *((const void **)a3 + 3), 4 * count) == 0;
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

- (void)enumerateRawValuesWithBlock:(id)a3
{
}

- (void)enumerateRawValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4
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
  uint64_t v6 = self->_values[a3];
  if (((unsigned int (*)(uint64_t))self->_validationFunc)(v6)) {
    return v6;
  }
  else {
    return -72499473;
  }
}

- (int)rawValueAtIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count <= a3) {
    +[NSException raise:NSRangeException, @"Index (%lu) beyond bounds (%lu)", a3, count format];
  }
  return self->_values[a3];
}

- (void)enumerateValuesWithBlock:(id)a3
{
}

- (void)enumerateValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v21 = 0;
  validationFunc = (unsigned int (*)(void, SEL))self->_validationFunc;
  if ((a3 & 2) != 0)
  {
    unint64_t count = self->_count;
    if (count)
    {
      unint64_t v15 = count - 1;
      if ((uint64_t)(count - 1) >= 0)
      {
        values = self->_values;
        unint64_t v17 = (unint64_t)&values[count - 2];
        do
        {
          unsigned int v18 = *(_DWORD *)(v17 + 4);
          if (validationFunc(v18, a2)) {
            uint64_t v19 = v18;
          }
          else {
            uint64_t v19 = 4222467823;
          }
          (*((void (**)(id, uint64_t, unint64_t, char *))a4 + 2))(a4, v19, v15--, &v21);
          if (v21) {
            BOOL v20 = 0;
          }
          else {
            BOOL v20 = v17 >= (unint64_t)values;
          }
          v17 -= 4;
        }
        while (v20);
      }
    }
  }
  else
  {
    int64_t v6 = self->_count;
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      unint64_t v8 = self->_values;
      BOOL v9 = &v8[v6];
      unint64_t v10 = v8 + 1;
      do
      {
        unsigned int v11 = *(v10 - 1);
        if (validationFunc(v11, a2)) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 4222467823;
        }
        (*((void (**)(id, uint64_t, uint64_t, char *))a4 + 2))(a4, v12, v7++, &v21);
        if (v21) {
          BOOL v13 = 1;
        }
        else {
          BOOL v13 = v10 >= v9;
        }
        ++v10;
      }
      while (!v13);
    }
  }
}

- (void)internalResizeToCapacity:(unint64_t)a3
{
  unint64_t v5 = 4 * a3;
  int64_t v6 = (int *)reallocf(self->_values, 4 * a3);
  self->_values = v6;
  if (!v6)
  {
    self->_unint64_t count = 0;
    self->_capacity = 0;
    +[NSException raise:NSMallocException, @"Failed to allocate %lu bytes", v5 format];
  }
  self->_capacity = a3;
}

- (void)addRawValue:(int)a3
{
  int v3 = a3;
  [(TransparencyGPBEnumArray *)self addRawValues:&v3 count:1];
}

- (void)addRawValues:(const int *)a3 count:(unint64_t)a4
{
  if (a3 && a4)
  {
    unint64_t count = self->_count;
    unint64_t v8 = count + a4;
    if (count + a4 > self->_capacity) {
      [(TransparencyGPBEnumArray *)self internalResizeToCapacity:(v8 & 0xFFFFFFFFFFFFFFF0) + 16];
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

- (void)insertRawValue:(int)a3 atIndex:(unint64_t)a4
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
    [(TransparencyGPBEnumArray *)self internalResizeToCapacity:(v8 & 0xFFFFFFFFFFFFFFF0) + 16];
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

- (void)replaceValueAtIndex:(unint64_t)a3 withRawValue:(int)a4
{
  unint64_t count = self->_count;
  if (count <= a3) {
    +[NSException raise:NSRangeException, @"Index (%lu) beyond bounds (%lu)", a3, count format];
  }
  self->_values[a3] = a4;
}

- (void)addRawValuesFromArray:(id)a3
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
    [(TransparencyGPBEnumArray *)self internalResizeToCapacity:(v6 & 0xFFFFFFFFFFFFFFF0) + 16];
  }
}

- (void)removeAll
{
  self->_unint64_t count = 0;
  if (self->_capacity >= 0x21) {
    [(TransparencyGPBEnumArray *)self internalResizeToCapacity:16];
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

- (void)addValue:(int)a3
{
  int v3 = a3;
  [(TransparencyGPBEnumArray *)self addValues:&v3 count:1];
}

- (void)addValues:(const int *)a3 count:(unint64_t)a4
{
  if (a3 && a4)
  {
    uint64_t v7 = 0;
    validationFunc = (uint64_t (*)(void, SEL))self->_validationFunc;
    do
    {
      if ((validationFunc(a3[v7], a2) & 1) == 0) {
        +[NSException raise:NSInvalidArgumentException, @"%@: Attempt to set an unknown enum value (%d)", objc_opt_class(), a3[v7] format];
      }
      ++v7;
    }
    while (a4 != v7);
    unint64_t count = self->_count;
    unint64_t v10 = count + a4;
    if (count + a4 > self->_capacity) {
      [(TransparencyGPBEnumArray *)self internalResizeToCapacity:(v10 & 0xFFFFFFFFFFFFFFF0) + 16];
    }
    self->_unint64_t count = v10;
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
  uint64_t v5 = *(void *)&a3;
  unint64_t v7 = self->_count + 1;
  if (v7 <= a4) {
    +[NSException raise:NSRangeException, @"Index (%lu) beyond bounds (%lu)", a4, v7 format];
  }
  if ((((uint64_t (*)(uint64_t))self->_validationFunc)(v5) & 1) == 0) {
    +[NSException raise:NSInvalidArgumentException, @"%@: Attempt to set an unknown enum value (%d)", objc_opt_class(), v5 format];
  }
  unint64_t count = self->_count;
  unint64_t v9 = count + 1;
  if (count + 1 > self->_capacity) {
    [(TransparencyGPBEnumArray *)self internalResizeToCapacity:(v9 & 0xFFFFFFFFFFFFFFF0) + 16];
  }
  self->_unint64_t count = v9;
  if (count != a4) {
    memmove(&self->_values[a4 + 1], &self->_values[a4], 4 * (count - a4));
  }
  self->_values[a4] = v5;
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_10002DA80(autocreator, (uint64_t)self);
  }
}

- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  unint64_t count = self->_count;
  if (count <= a3) {
    +[NSException raise:NSRangeException, @"Index (%lu) beyond bounds (%lu)", a3, count format];
  }
  if ((((uint64_t (*)(uint64_t))self->_validationFunc)(v4) & 1) == 0) {
    +[NSException raise:NSInvalidArgumentException, @"%@: Attempt to set an unknown enum value (%d)", objc_opt_class(), v4 format];
  }
  self->_values[a3] = v4;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)validationFunc
{
  return self->_validationFunc;
}

@end
@interface TransparencyGPBBoolInt64Dictionary
- (BOOL)getInt64:(int64_t *)a3 forKey:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBBoolInt64Dictionary)init;
- (TransparencyGPBBoolInt64Dictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBBoolInt64Dictionary)initWithDictionary:(id)a3;
- (TransparencyGPBBoolInt64Dictionary)initWithInt64s:(const int64_t *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndInt64sUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeInt64ForKey:(BOOL)a3;
- (void)setInt64:(int64_t)a3 forKey:(BOOL)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBBoolInt64Dictionary

- (TransparencyGPBBoolInt64Dictionary)init
{
  return [(TransparencyGPBBoolInt64Dictionary *)self initWithInt64s:0 forKeys:0 count:0];
}

- (TransparencyGPBBoolInt64Dictionary)initWithInt64s:(const int64_t *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)TransparencyGPBBoolInt64Dictionary;
  result = [(TransparencyGPBBoolInt64Dictionary *)&v13 init];
  if (result) {
    BOOL v9 = a5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    do
    {
      unsigned int v11 = *(unsigned __int8 *)a4++;
      uint64_t v10 = v11;
      int64_t v12 = *a3++;
      result->_values[v10] = v12;
      result->_valueSet[v10] = 1;
      --a5;
    }
    while (a5);
  }
  return result;
}

- (TransparencyGPBBoolInt64Dictionary)initWithDictionary:(id)a3
{
  result = [(TransparencyGPBBoolInt64Dictionary *)self initWithInt64s:0 forKeys:0 count:0];
  if (a3 && result)
  {
    uint64_t v5 = 0;
    char v6 = 1;
    do
    {
      char v7 = v6;
      if (*((unsigned char *)a3 + v5 + 32))
      {
        result->_values[v5] = *((void *)a3 + v5 + 2);
        result->_valueSet[v5] = 1;
      }
      char v6 = 0;
      uint64_t v5 = 1;
    }
    while ((v7 & 1) != 0);
  }
  return result;
}

- (TransparencyGPBBoolInt64Dictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBBoolInt64Dictionary *)self initWithInt64s:0 forKeys:0 count:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBBoolInt64Dictionary allocWithZone:a3];

  return [(TransparencyGPBBoolInt64Dictionary *)v4 initWithDictionary:self];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_valueSet[0] == *((unsigned __int8 *)a3 + 32)
      && self->_valueSet[1] == *((unsigned __int8 *)a3 + 33)
      && (!self->_valueSet[0] || self->_values[0] == *((void *)a3 + 2))
      && (!self->_valueSet[1] || self->_values[1] == *((void *)a3 + 3));
}

- (unint64_t)hash
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p> {", objc_opt_class(), self];
  v4 = v3;
  if (self->_valueSet[0]) {
    [(NSMutableString *)v3 appendFormat:@"NO: %lld", self->_values[0]];
  }
  if (self->_valueSet[1]) {
    [(NSMutableString *)v4 appendFormat:@"YES: %lld", self->_values[1]];
  }
  [(NSMutableString *)v4 appendString:@" }"];
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getInt64:(int64_t *)a3 forKey:(BOOL)a4
{
  BOOL v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4]) {
    *a3 = self->_values[a4];
  }
  return v4;
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  BOOL var0 = a4->var0;
  self->_values[var0] = a3->var2;
  self->_valueSet[var0] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0]) {
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(a3, @"false", +[NSString stringWithFormat:@"%lld", self->_values[0]]);
  }
  if (self->_valueSet[1])
  {
    uint64_t v5 = +[NSString stringWithFormat:@"%lld", self->_values[1]];
    char v6 = (void (*)(id, const __CFString *, NSString *))*((void *)a3 + 2);
    v6(a3, @"true", v5);
  }
}

- (void)enumerateKeysAndInt64sUsingBlock:(id)a3
{
  char v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, void, int64_t, char *))a3 + 2))(a3, 0, self->_values[0], &v5), !v5))
  {
    if (self->_valueSet[1]) {
      (*((void (**)(id, uint64_t, int64_t, char *))a3 + 2))(a3, 1, self->_values[1], &v5);
    }
  }
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = *((void *)a3 + 1);
  int v7 = *(unsigned __int8 *)(v6 + 30);
  valueSet = self->_valueSet;
  values = self->_values;
  char v10 = 1;
  do
  {
    char v11 = v10;
    if (valueSet[v3])
    {
      ++v4;
      uint64_t v12 = sub_10013B310(1);
      uint64_t v13 = sub_1001405DC(values[v3], 2, v7) + v12;
      v5 += v13 + sub_100139664(v13);
    }
    char v10 = 0;
    uint64_t v3 = 1;
  }
  while ((v11 & 1) != 0);
  return v5 + sub_10013B86C(*(_DWORD *)(v6 + 16), 15) * v4;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6 = *((void *)a4 + 1);
  int v7 = *(unsigned __int8 *)(v6 + 30);
  uint64_t v8 = sub_10016B9DC(*(_DWORD *)(v6 + 16), 2);
  char v9 = 0;
  uint64_t v10 = 0;
  valueSet = self->_valueSet;
  values = self->_values;
  char v13 = 1;
  do
  {
    char v14 = v13;
    if (valueSet[v10])
    {
      [a3 writeInt32NoTag:v8];
      uint64_t v15 = v9 & 1;
      int v16 = sub_10013B310(1);
      [a3 writeInt32NoTag:sub_1001405DC(values[v10], 2, v7) + v16];
      [a3 writeBool:1 value:v15];
      sub_10014077C(a3, values[v10], 2, v7);
    }
    char v13 = 0;
    char v9 = 1;
    uint64_t v10 = 1;
  }
  while ((v14 & 1) != 0);
}

- (void)addEntriesFromDictionary:(id)a3
{
  if (a3)
  {
    uint64_t v4 = 0;
    char v5 = 1;
    do
    {
      char v6 = v5;
      if (*((unsigned char *)a3 + v4 + 32))
      {
        self->_valueSet[v4] = 1;
        self->_values[v4] = *((void *)a3 + v4 + 2);
      }
      char v5 = 0;
      uint64_t v4 = 1;
    }
    while ((v6 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator) {
      sub_10015C920(autocreator, (uint64_t)self);
    }
  }
}

- (void)setInt64:(int64_t)a3 forKey:(BOOL)a4
{
  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10015C920(autocreator, (uint64_t)self);
  }
}

- (void)removeInt64ForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end
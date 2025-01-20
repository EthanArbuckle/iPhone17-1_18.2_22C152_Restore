@interface TransparencyGPBBoolEnumDictionary
- (BOOL)getEnum:(int *)a3 forKey:(BOOL)a4;
- (BOOL)getRawValue:(int *)a3 forKey:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBBoolEnumDictionary)init;
- (TransparencyGPBBoolEnumDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBBoolEnumDictionary)initWithValidationFunction:(void *)a3;
- (TransparencyGPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4;
- (TransparencyGPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const BOOL *)a5 count:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addRawEntriesFromDictionary:(id)a3;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndEnumsUsingBlock:(id)a3;
- (void)enumerateKeysAndRawValuesUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeEnumForKey:(BOOL)a3;
- (void)setEnum:(int)a3 forKey:(BOOL)a4;
- (void)setRawValue:(int)a3 forKey:(BOOL)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)validationFunc;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBBoolEnumDictionary

- (TransparencyGPBBoolEnumDictionary)init
{
  return [(TransparencyGPBBoolEnumDictionary *)self initWithValidationFunction:0 rawValues:0 forKeys:0 count:0];
}

- (TransparencyGPBBoolEnumDictionary)initWithValidationFunction:(void *)a3
{
  return [(TransparencyGPBBoolEnumDictionary *)self initWithValidationFunction:a3 rawValues:0 forKeys:0 count:0];
}

- (TransparencyGPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const BOOL *)a5 count:(unint64_t)a6
{
  v15.receiver = self;
  v15.super_class = (Class)TransparencyGPBBoolEnumDictionary;
  result = [(TransparencyGPBBoolEnumDictionary *)&v15 init];
  if (result)
  {
    if (a3) {
      v11 = a3;
    }
    else {
      v11 = sub_1000D1220;
    }
    for (result->_validationFunc = v11; a6; --a6)
    {
      unsigned int v13 = *(unsigned __int8 *)a5++;
      uint64_t v12 = v13;
      int v14 = *a4++;
      result->_values[v12] = v14;
      result->_valueSet[v12] = 1;
    }
  }
  return result;
}

- (TransparencyGPBBoolEnumDictionary)initWithDictionary:(id)a3
{
  result = -[TransparencyGPBBoolEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", [a3 validationFunc], 0, 0, 0);
  if (a3 && result)
  {
    uint64_t v5 = 0;
    char v6 = 1;
    do
    {
      char v7 = v6;
      if (*((unsigned char *)a3 + v5 + 32))
      {
        result->_values[v5] = *((_DWORD *)a3 + v5 + 6);
        result->_valueSet[v5] = 1;
      }
      char v6 = 0;
      uint64_t v5 = 1;
    }
    while ((v7 & 1) != 0);
  }
  return result;
}

- (TransparencyGPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return [(TransparencyGPBBoolEnumDictionary *)self initWithValidationFunction:a3 rawValues:0 forKeys:0 count:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBBoolEnumDictionary allocWithZone:a3];

  return [(TransparencyGPBBoolEnumDictionary *)v4 initWithDictionary:self];
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
      && (!self->_valueSet[0] || self->_values[0] == *((_DWORD *)a3 + 6))
      && (!self->_valueSet[1] || self->_values[1] == *((_DWORD *)a3 + 7));
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
    [(NSMutableString *)v3 appendFormat:@"NO: %d", self->_values[0]];
  }
  if (self->_valueSet[1]) {
    [(NSMutableString *)v4 appendFormat:@"YES: %d", self->_values[1]];
  }
  [(NSMutableString *)v4 appendString:@" }"];
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getEnum:(int *)a3 forKey:(BOOL)a4
{
  BOOL v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4])
  {
    unsigned int v6 = self->_values[a4];
    if (((unsigned int (*)(void, SEL))self->_validationFunc)(v6, a2)) {
      int v7 = v6;
    }
    else {
      int v7 = -72499473;
    }
    *a3 = v7;
  }
  return v4;
}

- (BOOL)getRawValue:(int *)a3 forKey:(BOOL)a4
{
  BOOL v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4]) {
    *a3 = self->_values[a4];
  }
  return v4;
}

- (void)enumerateKeysAndRawValuesUsingBlock:(id)a3
{
  char v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, void, void, char *))a3 + 2))(a3, 0, self->_values[0], &v5), !v5))
  {
    if (self->_valueSet[1]) {
      (*((void (**)(id, uint64_t, void, char *))a3 + 2))(a3, 1, self->_values[1], &v5);
    }
  }
}

- (void)enumerateKeysAndEnumsUsingBlock:(id)a3
{
  char v10 = 0;
  validationFunc = (unsigned int (*)(uint64_t, SEL))self->_validationFunc;
  if (!self->_valueSet[0]
    || ((unsigned int v6 = self->_values[0], !validationFunc(v6, a2)) ? (v7 = 4222467823) : (v7 = v6),
        (*((void (**)(id, void, uint64_t, char *))a3 + 2))(a3, 0, v7, &v10),
        !v10))
  {
    if (self->_valueSet[1])
    {
      uint64_t v8 = self->_values[1];
      if (validationFunc(v8, a2)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 4222467823;
      }
      (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, 1, v9, &v10);
    }
  }
}

- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v7 = sub_1000CA038(1);
  uint64_t v8 = +[NSMutableData dataWithLength:sub_1000C9F98(2, v6) + v7];
  uint64_t v9 = [[TransparencyGPBCodedOutputStream alloc] initWithData:v8];
  [(TransparencyGPBCodedOutputStream *)v9 writeBool:1 value:a4->var0];
  [(TransparencyGPBCodedOutputStream *)v9 writeEnum:2 value:v6];

  return v8;
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
      uint64_t v12 = sub_1000CA038(1);
      uint64_t v13 = sub_1000CE104(values[v3], 2, v7) + v12;
      v5 += v13 + sub_1000C838C(v13);
    }
    char v10 = 0;
    uint64_t v3 = 1;
  }
  while ((v11 & 1) != 0);
  return v5 + sub_1000CA594(*(_DWORD *)(v6 + 16), 15) * v4;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6 = *((void *)a4 + 1);
  int v7 = *(unsigned __int8 *)(v6 + 30);
  uint64_t v8 = sub_1000FA704(*(_DWORD *)(v6 + 16), 2);
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
      int v16 = sub_1000CA038(1);
      [a3 writeInt32NoTag:sub_1000CE104(values[v10], 2, v7) + v16];
      [a3 writeBool:1 value:v15];
      sub_1000CE2A4(a3, values[v10], 2, v7);
    }
    char v13 = 0;
    char v9 = 1;
    uint64_t v10 = 1;
  }
  while ((v14 & 1) != 0);
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0]) {
    (*((void (**)(id, const __CFString *, NSNumber *))a3 + 2))(a3, @"false", +[NSNumber numberWithInt:self->_values[0]]);
  }
  if (self->_valueSet[1])
  {
    uint64_t v5 = +[NSNumber numberWithInt:self->_values[1]];
    uint64_t v6 = (void (*)(id, const __CFString *, NSNumber *))*((void *)a3 + 2);
    v6(a3, @"true", v5);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  BOOL var0 = a4->var0;
  self->_values[var0] = a3->var1;
  self->_valueSet[var0] = 1;
}

- (void)addRawEntriesFromDictionary:(id)a3
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
        self->_values[v4] = *((_DWORD *)a3 + v4 + 6);
      }
      char v5 = 0;
      uint64_t v4 = 1;
    }
    while ((v6 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator) {
      sub_1000EB648(autocreator, (uint64_t)self);
    }
  }
}

- (void)setEnum:(int)a3 forKey:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if ((((uint64_t (*)(void, SEL))self->_validationFunc)(*(void *)&a3, a2) & 1) == 0) {
    +[NSException raise:NSInvalidArgumentException, @"TransparencyGPBBoolEnumDictionary: Attempt to set an unknown enum value (%d)", v5 format];
  }
  self->_values[v4] = v5;
  self->_valueSet[v4] = 1;
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_1000EB648(autocreator, (uint64_t)self);
  }
}

- (void)setRawValue:(int)a3 forKey:(BOOL)a4
{
  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_1000EB648(autocreator, (uint64_t)self);
  }
}

- (void)removeEnumForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

- (void)validationFunc
{
  return self->_validationFunc;
}

@end
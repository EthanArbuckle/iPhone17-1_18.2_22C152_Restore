@interface TRIPBBoolEnumDictionary
- (BOOL)getEnum:(int *)a3 forKey:(BOOL)a4;
- (BOOL)getRawValue:(int *)a3 forKey:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (TRIPBBoolEnumDictionary)init;
- (TRIPBBoolEnumDictionary)initWithDictionary:(id)a3;
- (TRIPBBoolEnumDictionary)initWithValidationFunction:(void *)a3;
- (TRIPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4;
- (TRIPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const BOOL *)a5 count:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addRawEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndEnumsUsingBlock:(id)a3;
- (void)enumerateKeysAndRawValuesUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeEnumForKey:(BOOL)a3;
- (void)setEnum:(int)a3 forKey:(BOOL)a4;
- (void)setRawValue:(int)a3 forKey:(BOOL)a4;
- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4;
- (void)validationFunc;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TRIPBBoolEnumDictionary

- (TRIPBBoolEnumDictionary)init
{
  return [(TRIPBBoolEnumDictionary *)self initWithValidationFunction:0 rawValues:0 forKeys:0 count:0];
}

- (TRIPBBoolEnumDictionary)initWithValidationFunction:(void *)a3
{
  return [(TRIPBBoolEnumDictionary *)self initWithValidationFunction:a3 rawValues:0 forKeys:0 count:0];
}

- (TRIPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const BOOL *)a5 count:(unint64_t)a6
{
  v15.receiver = self;
  v15.super_class = (Class)TRIPBBoolEnumDictionary;
  result = [(TRIPBBoolEnumDictionary *)&v15 init];
  if (result)
  {
    if (a3) {
      v11 = a3;
    }
    else {
      v11 = DictDefault_IsValidValue;
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

- (TRIPBBoolEnumDictionary)initWithDictionary:(id)a3
{
  result = -[TRIPBBoolEnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", [a3 validationFunc], 0, 0, 0);
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

- (TRIPBBoolEnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return [(TRIPBBoolEnumDictionary *)self initWithValidationFunction:a3 rawValues:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDictionary.m", 11785, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator);
  }
  v3.receiver = self;
  v3.super_class = (Class)TRIPBBoolEnumDictionary;
  [(TRIPBBoolEnumDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRIPBBoolEnumDictionary allocWithZone:a3];
  return [(TRIPBBoolEnumDictionary *)v4 initWithDictionary:self];
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
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p> {", objc_opt_class(), self];
  v4 = v3;
  if (self->_valueSet[0]) {
    objc_msgSend(v3, "appendFormat:", @"NO: %d", self->_values[0]);
  }
  if (self->_valueSet[1]) {
    objc_msgSend(v4, "appendFormat:", @"YES: %d", self->_values[1]);
  }
  [v4 appendString:@" }"];
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
  unsigned int v5 = a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = ComputeDictBoolFieldSize(1, a5);
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  uint64_t v12 = 5;
  if (v7 >> 28) {
    uint64_t v12 = 6;
  }
  if (v7 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (v7 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (v7 >= 0x80) {
    uint64_t v9 = v10;
  }
  unsigned int v13 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v9 + v8];
  int v14 = [[TRIPBCodedOutputStream alloc] initWithData:v13];
  WriteDictBoolField(v14, a4->var0, 1, v5);
  [(TRIPBCodedOutputStream *)v14 writeEnum:2 value:v7];

  return v13;
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  unsigned int v6 = *(unsigned __int8 *)(*((void *)a3 + 1) + 30);
  valueSet = self->_valueSet;
  values = self->_values;
  char v9 = 1;
  do
  {
    char v10 = v9;
    if (valueSet[v3])
    {
      ++v4;
      uint64_t v11 = ComputeDictInt32FieldSize(values[v3], 2, v6);
      uint64_t v12 = v11 + 2;
      if ((v11 + 2) >> 28) {
        uint64_t v13 = 5;
      }
      else {
        uint64_t v13 = 4;
      }
      if (v12 < 0x200000) {
        uint64_t v13 = 3;
      }
      if (v12 < 0x4000) {
        uint64_t v13 = 2;
      }
      if (v12 < 0x80) {
        uint64_t v13 = 1;
      }
      v5 += v12 + v13;
    }
    char v9 = 0;
    uint64_t v3 = 1;
  }
  while ((v10 & 1) != 0);
  unsigned int v14 = 8 * *(_DWORD *)(*((void *)a3 + 1) + 16);
  if (v14 >= 0x80)
  {
    if (v14 >= 0x4000)
    {
      if (v14 >= 0x200000)
      {
        BOOL v16 = v14 >> 28 == 0;
        uint64_t v15 = 4;
        if (!v16) {
          uint64_t v15 = 5;
        }
      }
      else
      {
        uint64_t v15 = 3;
      }
    }
    else
    {
      uint64_t v15 = 2;
    }
  }
  else
  {
    uint64_t v15 = 1;
  }
  return v5 + v15 * v4;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  char v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = *((void *)a4 + 1);
  unsigned int v8 = *(unsigned __int8 *)(v7 + 30);
  uint64_t v9 = (8 * *(_DWORD *)(v7 + 16)) | 2u;
  valueSet = self->_valueSet;
  values = self->_values;
  char v12 = 1;
  do
  {
    char v13 = v12;
    if (valueSet[v6])
    {
      [a3 writeInt32NoTag:v9];
      objc_msgSend(a3, "writeInt32NoTag:", ComputeDictInt32FieldSize(values[v6], 2, v8) + 2);
      [a3 writeBool:1 value:v5 & 1];
      WriteDictInt32Field(a3, values[v6], 2, v8);
    }
    char v12 = 0;
    char v5 = 1;
    uint64_t v6 = 1;
  }
  while ((v13 & 1) != 0);
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0]) {
    (*((void (**)(id, __CFString *, uint64_t))a3 + 2))(a3, @"false", [NSNumber numberWithInt:self->_values[0]]);
  }
  if (self->_valueSet[1])
  {
    uint64_t v5 = [NSNumber numberWithInt:self->_values[1]];
    uint64_t v6 = (void (*)(id, __CFString *, uint64_t))*((void *)a3 + 2);
    v6(a3, @"true", v5);
  }
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
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
      TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
    }
  }
}

- (void)setEnum:(int)a3 forKey:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if ((((uint64_t (*)(void, SEL))self->_validationFunc)(*(void *)&a3, a2) & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"TRIPBBoolEnumDictionary: Attempt to set an unknown enum value (%d)", v5);
  }
  self->_values[v4] = v5;
  self->_valueSet[v4] = 1;
  autocreator = self->_autocreator;
  if (autocreator)
  {
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)setRawValue:(int)a3 forKey:(BOOL)a4
{
  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator) {
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
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
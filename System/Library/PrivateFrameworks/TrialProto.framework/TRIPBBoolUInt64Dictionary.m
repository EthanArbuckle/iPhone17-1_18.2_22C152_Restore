@interface TRIPBBoolUInt64Dictionary
- (BOOL)getUInt64:(unint64_t *)a3 forKey:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (TRIPBBoolUInt64Dictionary)init;
- (TRIPBBoolUInt64Dictionary)initWithCapacity:(unint64_t)a3;
- (TRIPBBoolUInt64Dictionary)initWithDictionary:(id)a3;
- (TRIPBBoolUInt64Dictionary)initWithUInt64s:(const unint64_t *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndUInt64sUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeUInt64ForKey:(BOOL)a3;
- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4;
- (void)setUInt64:(unint64_t)a3 forKey:(BOOL)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TRIPBBoolUInt64Dictionary

- (TRIPBBoolUInt64Dictionary)init
{
  return [(TRIPBBoolUInt64Dictionary *)self initWithUInt64s:0 forKeys:0 count:0];
}

- (TRIPBBoolUInt64Dictionary)initWithUInt64s:(const unint64_t *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)TRIPBBoolUInt64Dictionary;
  result = [(TRIPBBoolUInt64Dictionary *)&v12 init];
  if (a5 && result)
  {
    do
    {
      unsigned int v10 = *(unsigned __int8 *)a4++;
      uint64_t v9 = v10;
      unint64_t v11 = *a3++;
      result->_values[v9] = v11;
      result->_valueSet[v9] = 1;
      --a5;
    }
    while (a5);
  }
  return result;
}

- (TRIPBBoolUInt64Dictionary)initWithDictionary:(id)a3
{
  result = [(TRIPBBoolUInt64Dictionary *)self initWithUInt64s:0 forKeys:0 count:0];
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

- (TRIPBBoolUInt64Dictionary)initWithCapacity:(unint64_t)a3
{
  return [(TRIPBBoolUInt64Dictionary *)self initWithUInt64s:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDictionary.m", 10498, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator);
  }
  v3.receiver = self;
  v3.super_class = (Class)TRIPBBoolUInt64Dictionary;
  [(TRIPBBoolUInt64Dictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRIPBBoolUInt64Dictionary allocWithZone:a3];
  return [(TRIPBBoolUInt64Dictionary *)v4 initWithDictionary:self];
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
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p> {", objc_opt_class(), self];
  v4 = v3;
  if (self->_valueSet[0]) {
    objc_msgSend(v3, "appendFormat:", @"NO: %llu", self->_values[0]);
  }
  if (self->_valueSet[1]) {
    objc_msgSend(v4, "appendFormat:", @"YES: %llu", self->_values[1]);
  }
  [v4 appendString:@" }"];
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getUInt64:(unint64_t *)a3 forKey:(BOOL)a4
{
  BOOL v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4]) {
    *a3 = self->_values[a4];
  }
  return v4;
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
{
  BOOL var0 = a4->var0;
  self->_values[var0] = a3->var4;
  self->_valueSet[var0] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0]) {
    (*((void (**)(id, __CFString *, uint64_t))a3 + 2))(a3, @"false", objc_msgSend(NSString, "stringWithFormat:", @"%llu", self->_values[0]));
  }
  if (self->_valueSet[1])
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", self->_values[1]);
    char v6 = (void (*)(id, __CFString *, uint64_t))*((void *)a3 + 2);
    v6(a3, @"true", v5);
  }
}

- (void)enumerateKeysAndUInt64sUsingBlock:(id)a3
{
  char v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, void, unint64_t, char *))a3 + 2))(a3, 0, self->_values[0], &v5), !v5))
  {
    if (self->_valueSet[1]) {
      (*((void (**)(id, uint64_t, unint64_t, char *))a3 + 2))(a3, 1, self->_values[1], &v5);
    }
  }
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
      uint64_t v11 = ComputeDictUInt64FieldSize(values[v3], 2, v6);
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
      objc_msgSend(a3, "writeInt32NoTag:", ComputeDictUInt64FieldSize(values[v6], 2, v8) + 2);
      [a3 writeBool:1 value:v5 & 1];
      WriteDictUInt64Field(a3, values[v6], 2, v8);
    }
    char v12 = 0;
    char v5 = 1;
    uint64_t v6 = 1;
  }
  while ((v13 & 1) != 0);
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
      TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
    }
  }
}

- (void)setUInt64:(unint64_t)a3 forKey:(BOOL)a4
{
  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator) {
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeUInt64ForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end
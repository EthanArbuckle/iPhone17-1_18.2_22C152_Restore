@interface TRIPBBoolObjectDictionary
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitialized;
- (TRIPBBoolObjectDictionary)init;
- (TRIPBBoolObjectDictionary)initWithCapacity:(unint64_t)a3;
- (TRIPBBoolObjectDictionary)initWithDictionary:(id)a3;
- (TRIPBBoolObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForKey:(BOOL)a3;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeObjectForKey:(BOOL)a3;
- (void)setObject:(id)a3 forKey:(BOOL)a4;
- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TRIPBBoolObjectDictionary

- (TRIPBBoolObjectDictionary)init
{
  return [(TRIPBBoolObjectDictionary *)self initWithObjects:0 forKeys:0 count:0];
}

- (TRIPBBoolObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  v16.receiver = self;
  v16.super_class = (Class)TRIPBBoolObjectDictionary;
  v8 = [(TRIPBBoolObjectDictionary *)&v16 init];
  v9 = v8;
  if (a5 && v8)
  {
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    values = v8->_values;
    do
    {
      if (!*a3) {
        [MEMORY[0x1E4F1CA00] raise:v10 format:@"Attempting to add nil object to a Dictionary"];
      }
      unsigned int v13 = *(unsigned __int8 *)a4++;
      uint64_t v12 = v13;

      v14 = (void *)*a3++;
      values[v12] = v14;
      --a5;
    }
    while (a5);
  }
  return v9;
}

- (TRIPBBoolObjectDictionary)initWithDictionary:(id)a3
{
  v4 = [(TRIPBBoolObjectDictionary *)self initWithObjects:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4)
  {
    v4->_values[0] = *((id *)a3 + 2);
    v5->_values[1] = *((id *)a3 + 3);
  }
  return v5;
}

- (TRIPBBoolObjectDictionary)initWithCapacity:(unint64_t)a3
{
  return [(TRIPBBoolObjectDictionary *)self initWithObjects:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDictionary.m", 11541, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator);
  }

  v3.receiver = self;
  v3.super_class = (Class)TRIPBBoolObjectDictionary;
  [(TRIPBBoolObjectDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRIPBBoolObjectDictionary allocWithZone:a3];
  return [(TRIPBBoolObjectDictionary *)v4 initWithDictionary:self];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (id v5 = self->_values[0], (v5 != 0) == (*((void *)a3 + 2) == 0))
      || (id v6 = self->_values[1], (v6 == 0) == (*((void *)a3 + 3) != 0)))
    {
      LOBYTE(v7) = 0;
      return v7;
    }
    if (v5)
    {
      int v7 = objc_msgSend(self->_values[0], "isEqual:");
      if (!v7) {
        return v7;
      }
      id v6 = self->_values[1];
    }
    if (!v6 || (int v7 = [v6 isEqual:*((void *)a3 + 3)]) != 0) {
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (unint64_t)hash
{
  if (self->_values[0]) {
    return (self->_values[1] != 0) + 1;
  }
  else {
    return self->_values[1] != 0;
  }
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p> {", objc_opt_class(), self];
  v4 = v3;
  if (self->_values[0]) {
    [v3 appendFormat:@"NO: %@", self->_values[0]];
  }
  if (self->_values[1]) {
    [v4 appendFormat:@"YES: %@", self->_values[1]];
  }
  [v4 appendString:@" }"];
  return v4;
}

- (unint64_t)count
{
  if (self->_values[0]) {
    return (self->_values[1] != 0) + 1;
  }
  else {
    return self->_values[1] != 0;
  }
}

- (id)objectForKey:(BOOL)a3
{
  return self->_values[a3];
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
{
  id v5 = (id *)(&self->super.isa + a4->var0);

  v5[2] = a3->var7;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_values[0]) {
    (*((void (**)(id, __CFString *))a3 + 2))(a3, @"false");
  }
  if (self->_values[1])
  {
    id v5 = (void (*)(id, __CFString *))*((void *)a3 + 2);
    v5(a3, @"true");
  }
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  char v7 = 0;
  id v5 = self->_values[0];
  if (!v5 || ((*((void (**)(id, void, id, char *))a3 + 2))(a3, 0, v5, &v7), !v7))
  {
    id v6 = self->_values[1];
    if (v6) {
      (*((void (**)(id, uint64_t, id, char *))a3 + 2))(a3, 1, v6, &v7);
    }
  }
}

- (BOOL)isInitialized
{
  id v3 = self->_values[0];
  if (!v3 || (int v4 = [v3 isInitialized]) != 0)
  {
    id v5 = self->_values[1];
    if (!v5 || (int v4 = [v5 isInitialized]) != 0) {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(TRIPBBoolObjectDictionary);
  uint64_t v6 = 0;
  values = self->_values;
  char v8 = 1;
  do
  {
    char v9 = v8;
    id v10 = values[v6];
    if (v10) {
      v5->_values[v6] = (id)[v10 copyWithZone:a3];
    }
    char v8 = 0;
    uint64_t v6 = 1;
  }
  while ((v9 & 1) != 0);
  return v5;
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  unsigned int v7 = *(unsigned __int8 *)(*((void *)a3 + 1) + 30);
  values = self->_values;
  char v9 = 1;
  do
  {
    char v10 = v9;
    id v11 = values[v4];
    if (v11)
    {
      ++v5;
      uint64_t v12 = ComputeDictObjectFieldSize(v11, v7);
      uint64_t v13 = v12 + 2;
      if ((v12 + 2) >> 28) {
        uint64_t v14 = 5;
      }
      else {
        uint64_t v14 = 4;
      }
      if (v13 < 0x200000) {
        uint64_t v14 = 3;
      }
      if (v13 < 0x4000) {
        uint64_t v14 = 2;
      }
      if (v13 < 0x80) {
        uint64_t v14 = 1;
      }
      v6 += v13 + v14;
    }
    char v9 = 0;
    uint64_t v4 = 1;
  }
  while ((v10 & 1) != 0);
  unsigned int v15 = 8 * *(_DWORD *)(*((void *)a3 + 1) + 16);
  if (v15 >= 0x80)
  {
    if (v15 >= 0x4000)
    {
      if (v15 >= 0x200000)
      {
        BOOL v17 = v15 >> 28 == 0;
        uint64_t v16 = 4;
        if (!v17) {
          uint64_t v16 = 5;
        }
      }
      else
      {
        uint64_t v16 = 3;
      }
    }
    else
    {
      uint64_t v16 = 2;
    }
  }
  else
  {
    uint64_t v16 = 1;
  }
  return v6 + v16 * v5;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  char v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = *((void *)a4 + 1);
  unsigned int v8 = *(unsigned __int8 *)(v7 + 30);
  uint64_t v9 = (8 * *(_DWORD *)(v7 + 16)) | 2u;
  values = self->_values;
  char v11 = 1;
  do
  {
    char v12 = v11;
    if (values[v6])
    {
      [a3 writeInt32NoTag:v9];
      objc_msgSend(a3, "writeInt32NoTag:", ComputeDictObjectFieldSize(values[v6], v8) + 2);
      [a3 writeBool:1 value:v5 & 1];
      WriteDictObjectField(a3, (uint64_t)values[v6], v8);
    }
    char v11 = 0;
    char v5 = 1;
    uint64_t v6 = 1;
  }
  while ((v12 & 1) != 0);
}

- (void)addEntriesFromDictionary:(id)a3
{
  if (a3)
  {
    uint64_t v4 = 0;
    char v5 = (char *)a3 + 16;
    values = self->_values;
    char v7 = 1;
    do
    {
      char v8 = v7;
      if (*(void *)&v5[8 * v4])
      {

        values[v4] = *(id *)&v5[8 * v4];
      }
      char v7 = 0;
      uint64_t v4 = 1;
    }
    while ((v8 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator)
    {
      TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
    }
  }
}

- (void)setObject:(id)a3 forKey:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Attempting to add nil object to a Dictionary"];
  }
  char v7 = (id *)(&self->super.isa + v4);

  v7[2] = a3;
  autocreator = self->_autocreator;
  if (autocreator)
  {
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeObjectForKey:(BOOL)a3
{
  id v3 = (id *)(&self->super.isa + a3);

  v3[2] = 0;
}

- (void)removeAll
{
  self->_values[0] = 0;
  self->_values[1] = 0;
}

@end
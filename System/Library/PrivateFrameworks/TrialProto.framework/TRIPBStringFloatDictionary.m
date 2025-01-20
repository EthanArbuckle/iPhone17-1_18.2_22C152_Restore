@interface TRIPBStringFloatDictionary
- (BOOL)getFloat:(float *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (TRIPBStringFloatDictionary)init;
- (TRIPBStringFloatDictionary)initWithCapacity:(unint64_t)a3;
- (TRIPBStringFloatDictionary)initWithDictionary:(id)a3;
- (TRIPBStringFloatDictionary)initWithFloats:(const float *)a3 forKeys:(id *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndFloatsUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeFloatForKey:(id)a3;
- (void)setFloat:(float)a3 forKey:(id)a4;
- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TRIPBStringFloatDictionary

- (TRIPBStringFloatDictionary)init
{
  return [(TRIPBStringFloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
}

- (TRIPBStringFloatDictionary)initWithFloats:(const float *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  v16.receiver = self;
  v16.super_class = (Class)TRIPBStringFloatDictionary;
  v8 = [(TRIPBStringFloatDictionary *)&v16 init];
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a4)
    {
      if (a3 && a5)
      {
        uint64_t v10 = *MEMORY[0x1E4F1C3C8];
        do
        {
          if (!*a4) {
            [MEMORY[0x1E4F1CA00] raise:v10 format:@"Attempting to add nil key to a Dictionary"];
          }
          dictionary = v8->_dictionary;
          int v12 = *(_DWORD *)a3++;
          LODWORD(v9) = v12;
          uint64_t v13 = [NSNumber numberWithFloat:v9];
          uint64_t v14 = (uint64_t)*a4++;
          [(NSMutableDictionary *)dictionary setObject:v13 forKey:v14];
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TRIPBStringFloatDictionary)initWithDictionary:(id)a3
{
  v4 = [(TRIPBStringFloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TRIPBStringFloatDictionary)initWithCapacity:(unint64_t)a3
{
  return [(TRIPBStringFloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDictionary.m", 9426, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator);
  }

  v3.receiver = self;
  v3.super_class = (Class)TRIPBStringFloatDictionary;
  [(TRIPBStringFloatDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRIPBStringFloatDictionary allocWithZone:a3];
  return [(TRIPBStringFloatDictionary *)v4 initWithDictionary:self];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  dictionary = self->_dictionary;
  uint64_t v6 = *((void *)a3 + 2);
  return [(NSMutableDictionary *)dictionary isEqual:v6];
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_dictionary count];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p> { %@ }", objc_opt_class(), self, self->_dictionary];
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_dictionary count];
}

- (void)enumerateKeysAndFloatsUsingBlock:(id)a3
{
  char v8 = 0;
  dictionary = self->_dictionary;
  v5 = (void *)[(NSMutableDictionary *)dictionary keyEnumerator];
  do
  {
    uint64_t v6 = [v5 nextObject];
    if (!v6) {
      break;
    }
    uint64_t v7 = v6;
    objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "floatValue");
    (*((void (**)(id, uint64_t, char *))a3 + 2))(a3, v7, &v8);
  }
  while (!v8);
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  dictionary = self->_dictionary;
  unint64_t result = [(NSMutableDictionary *)dictionary count];
  if (result)
  {
    unint64_t v21 = result;
    unsigned int v6 = *(unsigned __int8 *)(*((void *)a3 + 1) + 30);
    unsigned int v7 = [a3 mapKeyDataType];
    char v8 = (void *)[(NSMutableDictionary *)dictionary keyEnumerator];
    uint64_t v9 = [v8 nextObject];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = 0;
      do
      {
        int v12 = (void *)[(NSMutableDictionary *)dictionary objectForKeyedSubscript:v10];
        uint64_t v13 = ComputeDictStringFieldSize(v10, v7);
        [v12 floatValue];
        uint64_t v14 = ComputeDictFloatFieldSize(v6);
        uint64_t v15 = v14 + v13;
        if ((v14 + v13) >> 28) {
          uint64_t v16 = 5;
        }
        else {
          uint64_t v16 = 4;
        }
        if (v15 < 0x200000) {
          uint64_t v16 = 3;
        }
        if (v15 < 0x4000) {
          uint64_t v16 = 2;
        }
        if (v15 < 0x80) {
          uint64_t v16 = 1;
        }
        v11 += v15 + v16;
        uint64_t v10 = (void *)[v8 nextObject];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    unsigned int v17 = 8 * *(_DWORD *)(*((void *)a3 + 1) + 16);
    if (v17 >= 0x80)
    {
      unint64_t v19 = v21;
      if (v17 >= 0x4000)
      {
        uint64_t v20 = 4;
        if (v17 >> 28) {
          uint64_t v20 = 5;
        }
        if (v17 >= 0x200000) {
          uint64_t v18 = v20;
        }
        else {
          uint64_t v18 = 3;
        }
      }
      else
      {
        uint64_t v18 = 2;
      }
    }
    else
    {
      uint64_t v18 = 1;
      unint64_t v19 = v21;
    }
    return v11 + v18 * v19;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  unsigned int v7 = *(unsigned __int8 *)(*((void *)a4 + 1) + 30);
  unsigned int v8 = [a4 mapKeyDataType];
  int v9 = *(_DWORD *)(*((void *)a4 + 1) + 16);
  dictionary = self->_dictionary;
  uint64_t v11 = (void *)[(NSMutableDictionary *)dictionary keyEnumerator];
  uint64_t v12 = [v11 nextObject];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = (8 * v9) | 2u;
    do
    {
      uint64_t v15 = (void *)[(NSMutableDictionary *)dictionary objectForKeyedSubscript:v13];
      [a3 writeInt32NoTag:v14];
      [v15 floatValue];
      int v17 = v16;
      LODWORD(v15) = ComputeDictStringFieldSize(v13, v8);
      [a3 writeInt32NoTag:ComputeDictFloatFieldSize(v7) + v15];
      WriteDictStringField(a3, (uint64_t)v13, v8);
      LODWORD(v18) = v17;
      WriteDictFloatField(a3, v7, v18);
      uint64_t v13 = (void *)[v11 nextObject];
    }
    while (v13);
  }
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  LODWORD(v4) = a3->var1;
  uint64_t v7 = [NSNumber numberWithFloat:v4];
  int64_t var2 = a4->var2;
  [(NSMutableDictionary *)dictionary setObject:v7 forKey:var2];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__TRIPBStringFloatDictionary_enumerateForTextFormat___block_invoke;
  v3[3] = &unk_1E576C5F8;
  v3[4] = a3;
  [(TRIPBStringFloatDictionary *)self enumerateKeysAndFloatsUsingBlock:v3];
}

uint64_t __53__TRIPBStringFloatDictionary_enumerateForTextFormat___block_invoke(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%.*g", 6, a3);
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v6(v4, a2, v5);
}

- (BOOL)getFloat:(float *)a3 forKey:(id)a4
{
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:a4];
  unsigned int v6 = v5;
  if (a3 && v5)
  {
    [v5 floatValue];
    *(_DWORD *)a3 = v7;
  }
  return v6 != 0;
}

- (void)addEntriesFromDictionary:(id)a3
{
  if (a3)
  {
    [(NSMutableDictionary *)self->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
    autocreator = self->_autocreator;
    if (autocreator)
    {
      TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
    }
  }
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  if (!a4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Attempting to add nil key to a Dictionary"];
  }
  *(float *)&double v7 = a3;
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", [NSNumber numberWithFloat:v7], a4);
  autocreator = self->_autocreator;
  if (autocreator)
  {
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeFloatForKey:(id)a3
{
}

- (void)removeAll
{
}

@end
@interface TRIPBUInt32ObjectDictionary
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitialized;
- (TRIPBUInt32ObjectDictionary)init;
- (TRIPBUInt32ObjectDictionary)initWithCapacity:(unint64_t)a3;
- (TRIPBUInt32ObjectDictionary)initWithDictionary:(id)a3;
- (TRIPBUInt32ObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForKey:(unsigned int)a3;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeObjectForKey:(unsigned int)a3;
- (void)setObject:(id)a3 forKey:(unsigned int)a4;
- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TRIPBUInt32ObjectDictionary

- (TRIPBUInt32ObjectDictionary)init
{
  return [(TRIPBUInt32ObjectDictionary *)self initWithObjects:0 forKeys:0 count:0];
}

- (TRIPBUInt32ObjectDictionary)initWithObjects:(const void *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)TRIPBUInt32ObjectDictionary;
  v8 = [(TRIPBUInt32ObjectDictionary *)&v13 init];
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a4)
    {
      if (a3 && a5)
      {
        uint64_t v9 = *MEMORY[0x1E4F1C3C8];
        do
        {
          v10 = *a3;
          if (!*a3)
          {
            [MEMORY[0x1E4F1CA00] raise:v9 format:@"Attempting to add nil object to a Dictionary"];
            v10 = *a3;
          }
          unsigned int v11 = *a4++;
          -[NSMutableDictionary setObject:forKey:](v8->_dictionary, "setObject:forKey:", v10, [NSNumber numberWithUnsignedInt:v11]);
          ++a3;
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TRIPBUInt32ObjectDictionary)initWithDictionary:(id)a3
{
  v4 = [(TRIPBUInt32ObjectDictionary *)self initWithObjects:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TRIPBUInt32ObjectDictionary)initWithCapacity:(unint64_t)a3
{
  return [(TRIPBUInt32ObjectDictionary *)self initWithObjects:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDictionary.m", 3012, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator);
  }

  v3.receiver = self;
  v3.super_class = (Class)TRIPBUInt32ObjectDictionary;
  [(TRIPBUInt32ObjectDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRIPBUInt32ObjectDictionary allocWithZone:a3];
  return [(TRIPBUInt32ObjectDictionary *)v4 initWithDictionary:self];
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

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  char v7 = 0;
  dictionary = self->_dictionary;
  v5 = (void *)[(NSMutableDictionary *)dictionary keyEnumerator];
  do
  {
    uint64_t v6 = (void *)[v5 nextObject];
    if (!v6) {
      break;
    }
    (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, [v6 unsignedIntValue], -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), &v7);
  }
  while (!v7);
}

- (BOOL)isInitialized
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = (void *)[(NSMutableDictionary *)self->_dictionary objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      int v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) isInitialized];
      if (!v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init(TRIPBUInt32ObjectDictionary);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_dictionary keyEnumerator];
  dictionary = v5->_dictionary;
  uint64_t v8 = [v6 nextObject];
  if (v8)
  {
    uint64_t v9 = v8;
    do
    {
      long long v10 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v9), "copyWithZone:", a3);
      [(NSMutableDictionary *)dictionary setObject:v10 forKey:v9];

      uint64_t v9 = [v6 nextObject];
    }
    while (v9);
  }
  return v5;
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
    uint64_t v8 = (void *)[(NSMutableDictionary *)dictionary keyEnumerator];
    uint64_t v9 = [v8 nextObject];
    if (v9)
    {
      long long v10 = (void *)v9;
      uint64_t v11 = 0;
      do
      {
        long long v12 = (void *)[(NSMutableDictionary *)dictionary objectForKeyedSubscript:v10];
        uint64_t v13 = ComputeDictUInt32FieldSize([v10 unsignedIntValue], 1, v7);
        uint64_t v14 = ComputeDictObjectFieldSize(v12, v6);
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
        long long v10 = (void *)[v8 nextObject];
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
      uint64_t v16 = [v13 unsignedIntValue];
      int v17 = ComputeDictUInt32FieldSize(v16, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", ComputeDictObjectFieldSize(v15, v7) + v17);
      WriteDictUInt32Field(a3, v16, 1, v8);
      WriteDictObjectField(a3, (uint64_t)v15, v7);
      uint64_t v13 = (void *)[v11 nextObject];
    }
    while (v13);
  }
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  int64_t var2 = a3->var2;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:a4->var3];
  [(NSMutableDictionary *)dictionary setObject:var2 forKey:v6];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__TRIPBUInt32ObjectDictionary_enumerateForTextFormat___block_invoke;
  v3[3] = &unk_1E576C148;
  v3[4] = a3;
  [(TRIPBUInt32ObjectDictionary *)self enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __54__TRIPBUInt32ObjectDictionary_enumerateForTextFormat___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%u", a2);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v6(v4, v5, a3);
}

- (id)objectForKey:(unsigned int)a3
{
  dictionary = self->_dictionary;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  return (id)[(NSMutableDictionary *)dictionary objectForKey:v4];
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

- (void)setObject:(id)a3 forKey:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Attempting to add nil object to a Dictionary"];
  }
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", a3, [NSNumber numberWithUnsignedInt:v4]);
  autocreator = self->_autocreator;
  if (autocreator)
  {
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeObjectForKey:(unsigned int)a3
{
  dictionary = self->_dictionary;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

@end
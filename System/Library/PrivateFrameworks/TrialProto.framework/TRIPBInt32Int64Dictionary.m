@interface TRIPBInt32Int64Dictionary
- (BOOL)getInt64:(int64_t *)a3 forKey:(int)a4;
- (BOOL)isEqual:(id)a3;
- (TRIPBInt32Int64Dictionary)init;
- (TRIPBInt32Int64Dictionary)initWithCapacity:(unint64_t)a3;
- (TRIPBInt32Int64Dictionary)initWithDictionary:(id)a3;
- (TRIPBInt32Int64Dictionary)initWithInt64s:(const int64_t *)a3 forKeys:(const int *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndInt64sUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeInt64ForKey:(int)a3;
- (void)setInt64:(int64_t)a3 forKey:(int)a4;
- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TRIPBInt32Int64Dictionary

- (TRIPBInt32Int64Dictionary)init
{
  return [(TRIPBInt32Int64Dictionary *)self initWithInt64s:0 forKeys:0 count:0];
}

- (TRIPBInt32Int64Dictionary)initWithInt64s:(const int64_t *)a3 forKeys:(const int *)a4 count:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)TRIPBInt32Int64Dictionary;
  v8 = [(TRIPBInt32Int64Dictionary *)&v13 init];
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          dictionary = v8->_dictionary;
          uint64_t v10 = *a3++;
          uint64_t v11 = [NSNumber numberWithLongLong:v10];
          LODWORD(v10) = *a4++;
          -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v11, [NSNumber numberWithInt:v10]);
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TRIPBInt32Int64Dictionary)initWithDictionary:(id)a3
{
  v4 = [(TRIPBInt32Int64Dictionary *)self initWithInt64s:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TRIPBInt32Int64Dictionary)initWithCapacity:(unint64_t)a3
{
  return [(TRIPBInt32Int64Dictionary *)self initWithInt64s:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDictionary.m", 3772, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator);
  }

  v3.receiver = self;
  v3.super_class = (Class)TRIPBInt32Int64Dictionary;
  [(TRIPBInt32Int64Dictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRIPBInt32Int64Dictionary allocWithZone:a3];
  return [(TRIPBInt32Int64Dictionary *)v4 initWithDictionary:self];
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

- (void)enumerateKeysAndInt64sUsingBlock:(id)a3
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
    (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, [v6 intValue], objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "longLongValue"), &v7);
  }
  while (!v7);
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
    v8 = (void *)[(NSMutableDictionary *)dictionary keyEnumerator];
    uint64_t v9 = [v8 nextObject];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = 0;
      do
      {
        v12 = (void *)[(NSMutableDictionary *)dictionary objectForKeyedSubscript:v10];
        uint64_t v13 = ComputeDictInt32FieldSize([v10 intValue], 1, v7);
        uint64_t v14 = ComputeDictInt64FieldSize([v12 longLongValue], 2, v6);
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
      uint64_t v16 = [v13 intValue];
      uint64_t v17 = [v15 longLongValue];
      int v18 = ComputeDictInt32FieldSize(v16, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", ComputeDictInt64FieldSize(v17, 2, v7) + v18);
      WriteDictInt32Field(a3, v16, 1, v8);
      WriteDictInt64Field(a3, v17, 2, v7);
      uint64_t v13 = (void *)[v11 nextObject];
    }
    while (v13);
  }
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  uint64_t v6 = [NSNumber numberWithLongLong:a3->var2];
  uint64_t v7 = [NSNumber numberWithInt:a4->var3];
  [(NSMutableDictionary *)dictionary setObject:v6 forKey:v7];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__TRIPBInt32Int64Dictionary_enumerateForTextFormat___block_invoke;
  v3[3] = &unk_1E576C1E8;
  v3[4] = a3;
  [(TRIPBInt32Int64Dictionary *)self enumerateKeysAndInt64sUsingBlock:v3];
}

uint64_t __52__TRIPBInt32Int64Dictionary_enumerateForTextFormat___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a2);
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v7(v4, v5, v6);
}

- (BOOL)getInt64:(int64_t *)a3 forKey:(int)a4
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", [NSNumber numberWithInt:*(void *)&a4]);
  uint64_t v6 = v5;
  if (a3 && v5) {
    *a3 = [v5 longLongValue];
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

- (void)setInt64:(int64_t)a3 forKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  dictionary = self->_dictionary;
  uint64_t v7 = [NSNumber numberWithLongLong:a3];
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v7, [NSNumber numberWithInt:v4]);
  autocreator = self->_autocreator;
  if (autocreator)
  {
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeInt64ForKey:(int)a3
{
  dictionary = self->_dictionary;
  uint64_t v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

@end
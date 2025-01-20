@interface TRIPBInt64EnumDictionary
- (BOOL)getEnum:(int *)a3 forKey:(int64_t)a4;
- (BOOL)getRawValue:(int *)a3 forKey:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (TRIPBInt64EnumDictionary)init;
- (TRIPBInt64EnumDictionary)initWithDictionary:(id)a3;
- (TRIPBInt64EnumDictionary)initWithValidationFunction:(void *)a3;
- (TRIPBInt64EnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4;
- (TRIPBInt64EnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const int64_t *)a5 count:(unint64_t)a6;
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
- (void)removeEnumForKey:(int64_t)a3;
- (void)setEnum:(int)a3 forKey:(int64_t)a4;
- (void)setRawValue:(int)a3 forKey:(int64_t)a4;
- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4;
- (void)validationFunc;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TRIPBInt64EnumDictionary

- (TRIPBInt64EnumDictionary)init
{
  return [(TRIPBInt64EnumDictionary *)self initWithValidationFunction:0 rawValues:0 forKeys:0 count:0];
}

- (TRIPBInt64EnumDictionary)initWithValidationFunction:(void *)a3
{
  return [(TRIPBInt64EnumDictionary *)self initWithValidationFunction:a3 rawValues:0 forKeys:0 count:0];
}

- (TRIPBInt64EnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const int64_t *)a5 count:(unint64_t)a6
{
  v18.receiver = self;
  v18.super_class = (Class)TRIPBInt64EnumDictionary;
  v10 = [(TRIPBInt64EnumDictionary *)&v18 init];
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a3) {
      v12 = a3;
    }
    else {
      v12 = DictDefault_IsValidValue;
    }
    v10->_dictionary = v11;
    v10->_validationFunc = v12;
    if (a5 && a4 && a6)
    {
      do
      {
        dictionary = v10->_dictionary;
        unsigned int v14 = *a4++;
        uint64_t v15 = [NSNumber numberWithInt:v14];
        uint64_t v16 = *a5++;
        -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v15, [NSNumber numberWithLongLong:v16]);
        --a6;
      }
      while (a6);
    }
  }
  return v10;
}

- (TRIPBInt64EnumDictionary)initWithDictionary:(id)a3
{
  v4 = -[TRIPBInt64EnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", [a3 validationFunc], 0, 0, 0);
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TRIPBInt64EnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return [(TRIPBInt64EnumDictionary *)self initWithValidationFunction:a3 rawValues:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDictionary.m", 8013, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator);
  }

  v3.receiver = self;
  v3.super_class = (Class)TRIPBInt64EnumDictionary;
  [(TRIPBInt64EnumDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TRIPBInt64EnumDictionary allocWithZone:a3];
  return [(TRIPBInt64EnumDictionary *)v4 initWithDictionary:self];
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

- (void)enumerateKeysAndRawValuesUsingBlock:(id)a3
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
    (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, [v6 longLongValue], objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "intValue"), &v7);
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
      v10 = (void *)v9;
      uint64_t v11 = 0;
      do
      {
        v12 = (void *)[(NSMutableDictionary *)dictionary objectForKeyedSubscript:v10];
        uint64_t v13 = ComputeDictInt64FieldSize([v10 longLongValue], 1, v7);
        uint64_t v14 = ComputeDictEnumFieldSize([v12 intValue], v6);
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
        v10 = (void *)[v8 nextObject];
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
      uint64_t v16 = [v13 longLongValue];
      uint64_t v17 = [v15 intValue];
      int v18 = ComputeDictInt64FieldSize(v16, 1, v8);
      objc_msgSend(a3, "writeInt32NoTag:", ComputeDictEnumFieldSize(v17, v7) + v18);
      WriteDictInt64Field(a3, v16, 1, v8);
      WriteDictEnumField(a3, v17, v7);
      uint64_t v13 = (void *)[v11 nextObject];
    }
    while (v13);
  }
}

- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = ComputeDictInt64FieldSize(a4->var2, 1, a5);
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
  uint64_t v13 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v9 + v8];
  uint64_t v14 = [[TRIPBCodedOutputStream alloc] initWithData:v13];
  WriteDictInt64Field(v14, a4->var2, 1, v5);
  [(TRIPBCodedOutputStream *)v14 writeEnum:2 value:v7];

  return v13;
}

- (void)setTRIPBGenericValue:(id *)a3 forTRIPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  uint64_t v6 = [NSNumber numberWithInt:a3->var3];
  uint64_t v7 = [NSNumber numberWithLongLong:a4->var2];
  [(NSMutableDictionary *)dictionary setObject:v6 forKey:v7];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__TRIPBInt64EnumDictionary_enumerateForTextFormat___block_invoke;
  v3[3] = &unk_1E576C418;
  v3[4] = a3;
  [(TRIPBInt64EnumDictionary *)self enumerateKeysAndRawValuesUsingBlock:v3];
}

uint64_t __51__TRIPBInt64EnumDictionary_enumerateForTextFormat___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a2);
  uint64_t v6 = [NSNumber numberWithInt:a3];
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v7(v4, v5, v6);
}

- (BOOL)getEnum:(int *)a3 forKey:(int64_t)a4
{
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", [NSNumber numberWithLongLong:a4]);
  uint64_t v7 = v6;
  if (a3 && v6)
  {
    int v8 = [v6 intValue];
    if (((unsigned int (*)(void))self->_validationFunc)()) {
      int v9 = v8;
    }
    else {
      int v9 = -72499473;
    }
    *a3 = v9;
  }
  return v7 != 0;
}

- (BOOL)getRawValue:(int *)a3 forKey:(int64_t)a4
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", [NSNumber numberWithLongLong:a4]);
  uint64_t v6 = v5;
  if (a3 && v5) {
    *a3 = [v5 intValue];
  }
  return v6 != 0;
}

- (void)enumerateKeysAndEnumsUsingBlock:(id)a3
{
  char v10 = 0;
  validationFunc = (unsigned int (*)(void))self->_validationFunc;
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_dictionary keyEnumerator];
  do
  {
    uint64_t v7 = [v6 nextObject];
    if (!v7) {
      break;
    }
    int v8 = (void *)v7;
    LODWORD(v9) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v7), "intValue");
    uint64_t v9 = validationFunc() ? v9 : 4222467823;
    (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, [v8 longLongValue], v9, &v10);
  }
  while (!v10);
}

- (void)addRawEntriesFromDictionary:(id)a3
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

- (void)setRawValue:(int)a3 forKey:(int64_t)a4
{
  dictionary = self->_dictionary;
  uint64_t v7 = [NSNumber numberWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v7, [NSNumber numberWithLongLong:a4]);
  autocreator = self->_autocreator;
  if (autocreator)
  {
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeEnumForKey:(int64_t)a3
{
  dictionary = self->_dictionary;
  uint64_t v4 = [NSNumber numberWithLongLong:a3];
  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

- (void)setEnum:(int)a3 forKey:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if ((((uint64_t (*)(void, SEL))self->_validationFunc)(*(void *)&a3, a2) & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"TRIPBInt64EnumDictionary: Attempt to set an unknown enum value (%d)", v5);
  }
  dictionary = self->_dictionary;
  uint64_t v8 = [NSNumber numberWithInt:v5];
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v8, [NSNumber numberWithLongLong:a4]);
  autocreator = self->_autocreator;
  if (autocreator)
  {
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)validationFunc
{
  return self->_validationFunc;
}

@end
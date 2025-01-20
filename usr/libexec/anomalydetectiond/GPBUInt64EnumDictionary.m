@interface GPBUInt64EnumDictionary
- (BOOL)getEnum:(int *)a3 forKey:(unint64_t)a4;
- (BOOL)getRawValue:(int *)a3 forKey:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (GPBUInt64EnumDictionary)init;
- (GPBUInt64EnumDictionary)initWithDictionary:(id)a3;
- (GPBUInt64EnumDictionary)initWithValidationFunction:(void *)a3;
- (GPBUInt64EnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4;
- (GPBUInt64EnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const unint64_t *)a5 count:(unint64_t)a6;
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
- (void)removeEnumForKey:(unint64_t)a3;
- (void)setEnum:(int)a3 forKey:(unint64_t)a4;
- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4;
- (void)setRawValue:(int)a3 forKey:(unint64_t)a4;
- (void)validationFunc;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation GPBUInt64EnumDictionary

- (GPBUInt64EnumDictionary)init
{
  return [(GPBUInt64EnumDictionary *)self initWithValidationFunction:0 rawValues:0 forKeys:0 count:0];
}

- (GPBUInt64EnumDictionary)initWithValidationFunction:(void *)a3
{
  return [(GPBUInt64EnumDictionary *)self initWithValidationFunction:a3 rawValues:0 forKeys:0 count:0];
}

- (GPBUInt64EnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const unint64_t *)a5 count:(unint64_t)a6
{
  v18.receiver = self;
  v18.super_class = (Class)GPBUInt64EnumDictionary;
  v10 = [(GPBUInt64EnumDictionary *)&v18 init];
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (a3) {
      v12 = a3;
    }
    else {
      v12 = sub_1002F011C;
    }
    v10->_dictionary = v11;
    v10->_validationFunc = v12;
    if (a5 && a4 && a6)
    {
      do
      {
        dictionary = v10->_dictionary;
        unsigned int v14 = *a4++;
        v15 = +[NSNumber numberWithInt:v14];
        uint64_t v16 = *a5++;
        [(NSMutableDictionary *)dictionary setObject:v15 forKey:+[NSNumber numberWithUnsignedLongLong:v16]];
        --a6;
      }
      while (a6);
    }
  }
  return v10;
}

- (GPBUInt64EnumDictionary)initWithDictionary:(id)a3
{
  v4 = -[GPBUInt64EnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", [a3 validationFunc], 0, 0, 0);
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (GPBUInt64EnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return [(GPBUInt64EnumDictionary *)self initWithValidationFunction:a3 rawValues:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDictionary.m", 6272, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator object file lineNumber description];
  }

  v3.receiver = self;
  v3.super_class = (Class)GPBUInt64EnumDictionary;
  [(GPBUInt64EnumDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[GPBUInt64EnumDictionary allocWithZone:a3];

  return [(GPBUInt64EnumDictionary *)v4 initWithDictionary:self];
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
  return (unint64_t)[(NSMutableDictionary *)self->_dictionary count];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p> { %@ }", objc_opt_class(), self, self->_dictionary];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableDictionary *)self->_dictionary count];
}

- (void)enumerateKeysAndRawValuesUsingBlock:(id)a3
{
  char v7 = 0;
  dictionary = self->_dictionary;
  id v5 = [(NSMutableDictionary *)dictionary keyEnumerator];
  do
  {
    id v6 = [v5 nextObject];
    if (!v6) {
      break;
    }
    (*((void (**)(id, id, id, char *))a3 + 2))(a3, [v6 unsignedLongLongValue], [objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "intValue") unsignedIntValue], &v7);
  }
  while (!v7);
}

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  dictionary = self->_dictionary;
  unint64_t result = (unint64_t)[(NSMutableDictionary *)dictionary count];
  if (result)
  {
    unint64_t v6 = result;
    unsigned int v7 = *(unsigned __int8 *)(*((void *)a3 + 1) + 30);
    unsigned int v8 = [a3 mapKeyDataType];
    id v9 = [(NSMutableDictionary *)dictionary keyEnumerator];
    id v10 = [v9 nextObject];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0;
      do
      {
        id v13 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v11];
        uint64_t v14 = sub_1002ED0F0((unint64_t)[v11 unsignedLongLongValue], 1, v8);
        uint64_t v15 = sub_1002F0510([v13 intValue], v7) + v14;
        v12 += v15 + GPBComputeRawVarint32SizeForInteger(v15);
        id v11 = [v9 nextObject];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    return v12 + GPBComputeWireFormatTagSize(*(_DWORD *)(*((void *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  unsigned int v7 = *(unsigned __int8 *)(*((void *)a4 + 1) + 30);
  unsigned int v8 = [a4 mapKeyDataType];
  uint64_t Tag = GPBWireFormatMakeTag(*(_DWORD *)(*((void *)a4 + 1) + 16), 2);
  dictionary = self->_dictionary;
  id v11 = [(NSMutableDictionary *)dictionary keyEnumerator];
  id v12 = [v11 nextObject];
  if (v12)
  {
    id v13 = v12;
    do
    {
      id v14 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v13];
      [a3 writeInt32NoTag:Tag];
      id v15 = [v13 unsignedLongLongValue];
      id v16 = [v14 intValue];
      int v17 = sub_1002ED0F0((unint64_t)v15, 1, v8);
      [a3 writeInt32NoTag:sub_1002F0510(v16, v7) + v17];
      sub_1002ED304(a3, (uint64_t)v15, 1, v8);
      sub_1002F06E4(a3, (uint64_t)v16, v7);
      id v13 = [v11 nextObject];
    }
    while (v13);
  }
}

- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = sub_1002ED0F0(a4->var2, 1, a5);
  id v9 = +[NSMutableData dataWithLength:GPBComputeEnumSize(2, v7) + v8];
  id v10 = [[GPBCodedOutputStream alloc] initWithData:v9];
  sub_1002ED304(v10, a4->var2, 1, v5);
  [(GPBCodedOutputStream *)v10 writeEnum:2 value:v7];

  return v9;
}

- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithInt:a3->var3];
  uint64_t v7 = +[NSNumber numberWithUnsignedLongLong:a4->var2];

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:v7];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002FB0A8;
  v3[3] = &unk_1003BA840;
  v3[4] = a3;
  [(GPBUInt64EnumDictionary *)self enumerateKeysAndRawValuesUsingBlock:v3];
}

- (BOOL)getEnum:(int *)a3 forKey:(unint64_t)a4
{
  id v6 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithUnsignedLongLong:a4]];
  id v7 = v6;
  if (a3 && v6)
  {
    unsigned int v8 = [v6 intValue];
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

- (BOOL)getRawValue:(int *)a3 forKey:(unint64_t)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithUnsignedLongLong:a4]];
  id v6 = v5;
  if (a3 && v5) {
    *a3 = [v5 intValue];
  }
  return v6 != 0;
}

- (void)enumerateKeysAndEnumsUsingBlock:(id)a3
{
  char v10 = 0;
  validationFunc = (unsigned int (*)(void))self->_validationFunc;
  id v6 = [(NSMutableDictionary *)self->_dictionary keyEnumerator];
  do
  {
    id v7 = [v6 nextObject];
    if (!v7) {
      break;
    }
    unsigned int v8 = v7;
    LODWORD(v9) = [[self->_dictionary objectForKeyedSubscript:v7] intValue];
    uint64_t v9 = validationFunc() ? v9 : 4222467823;
    (*((void (**)(id, id, uint64_t, char *))a3 + 2))(a3, [v8 unsignedLongLongValue], v9, &v10);
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
      GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
    }
  }
}

- (void)setRawValue:(int)a3 forKey:(unint64_t)a4
{
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(void *)&a3) forKey:+[NSNumber numberWithUnsignedLongLong:a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeEnumForKey:(unint64_t)a3
{
  dictionary = self->_dictionary;
  v4 = +[NSNumber numberWithUnsignedLongLong:a3];

  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

- (void)setEnum:(int)a3 forKey:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if ((((uint64_t (*)(void, SEL))self->_validationFunc)(*(void *)&a3, a2) & 1) == 0) {
    +[NSException raise:NSInvalidArgumentException, @"GPBUInt64EnumDictionary: Attempt to set an unknown enum value (%d)", v5 format];
  }
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5) forKey:+[NSNumber numberWithUnsignedLongLong:a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)validationFunc
{
  return self->_validationFunc;
}

@end
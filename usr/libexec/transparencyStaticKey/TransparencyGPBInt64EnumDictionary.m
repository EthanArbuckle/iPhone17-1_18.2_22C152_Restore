@interface TransparencyGPBInt64EnumDictionary
- (BOOL)getEnum:(int *)a3 forKey:(int64_t)a4;
- (BOOL)getRawValue:(int *)a3 forKey:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBInt64EnumDictionary)init;
- (TransparencyGPBInt64EnumDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBInt64EnumDictionary)initWithValidationFunction:(void *)a3;
- (TransparencyGPBInt64EnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4;
- (TransparencyGPBInt64EnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const int64_t *)a5 count:(unint64_t)a6;
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
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)validationFunc;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBInt64EnumDictionary

- (TransparencyGPBInt64EnumDictionary)init
{
  return [(TransparencyGPBInt64EnumDictionary *)self initWithValidationFunction:0 rawValues:0 forKeys:0 count:0];
}

- (TransparencyGPBInt64EnumDictionary)initWithValidationFunction:(void *)a3
{
  return [(TransparencyGPBInt64EnumDictionary *)self initWithValidationFunction:a3 rawValues:0 forKeys:0 count:0];
}

- (TransparencyGPBInt64EnumDictionary)initWithValidationFunction:(void *)a3 rawValues:(const int *)a4 forKeys:(const int64_t *)a5 count:(unint64_t)a6
{
  v18.receiver = self;
  v18.super_class = (Class)TransparencyGPBInt64EnumDictionary;
  v10 = [(TransparencyGPBInt64EnumDictionary *)&v18 init];
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (a3) {
      v12 = a3;
    }
    else {
      v12 = sub_100040160;
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
        [(NSMutableDictionary *)dictionary setObject:v15 forKey:+[NSNumber numberWithLongLong:v16]];
        --a6;
      }
      while (a6);
    }
  }
  return v10;
}

- (TransparencyGPBInt64EnumDictionary)initWithDictionary:(id)a3
{
  v4 = -[TransparencyGPBInt64EnumDictionary initWithValidationFunction:rawValues:forKeys:count:](self, "initWithValidationFunction:rawValues:forKeys:count:", [a3 validationFunc], 0, 0, 0);
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TransparencyGPBInt64EnumDictionary)initWithValidationFunction:(void *)a3 capacity:(unint64_t)a4
{
  return [(TransparencyGPBInt64EnumDictionary *)self initWithValidationFunction:a3 rawValues:0 forKeys:0 count:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt64EnumDictionary;
  [(TransparencyGPBInt64EnumDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBInt64EnumDictionary allocWithZone:a3];

  return [(TransparencyGPBInt64EnumDictionary *)v4 initWithDictionary:self];
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
    [dictionary objectForKeyedSubscript:v6] = [v6 longLongValue];
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
    int v7 = [a3 mapKeyDataType];
    id v8 = [(NSMutableDictionary *)dictionary keyEnumerator];
    id v9 = [v8 nextObject];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = 0;
      do
      {
        id v12 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v10];
        uint64_t v13 = sub_10003E244((unint64_t)[v10 longLongValue], 1, v7);
        uint64_t v14 = sub_10001DA58(2, [v12 intValue]) + v13;
        v11 += v14 + sub_10001BE44(v14);
        id v10 = [v8 nextObject];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    return v11 + sub_10001E054(*(_DWORD *)(*((void *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  int v7 = [a4 mapKeyDataType];
  uint64_t v8 = sub_100027BFC(*(_DWORD *)(*((void *)a4 + 1) + 16), 2);
  dictionary = self->_dictionary;
  id v10 = [(NSMutableDictionary *)dictionary keyEnumerator];
  id v11 = [v10 nextObject];
  if (v11)
  {
    id v12 = v11;
    do
    {
      id v13 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v12];
      [a3 writeInt32NoTag:v8];
      id v14 = [v12 longLongValue];
      id v15 = [v13 intValue];
      int v16 = sub_10003E244((unint64_t)v14, 1, v7);
      [a3 writeInt32NoTag:sub_10001DA58(2, v15) + v16];
      sub_10003E3E4(a3, (uint64_t)v14, 1, v7);
      [a3 writeEnum:2 value:v15];
      id v12 = [v10 nextObject];
    }
    while (v12);
  }
}

- (id)serializedDataForUnknownValue:(int)a3 forKey:(id *)a4 keyDataType:(unsigned __int8)a5
{
  int v5 = a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = sub_10003E244(a4->var2, 1, a5);
  id v9 = +[NSMutableData dataWithLength:sub_10001DA58(2, v7) + v8];
  id v10 = [[TransparencyGPBCodedOutputStream alloc] initWithData:v9];
  sub_10003E3E4(v10, a4->var2, 1, v5);
  [(TransparencyGPBCodedOutputStream *)v10 writeEnum:2 value:v7];

  return v9;
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithInt:a3->var3];
  uint64_t v7 = +[NSNumber numberWithLongLong:a4->var2];

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:v7];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004F9D8;
  v3[3] = &unk_10008E510;
  v3[4] = a3;
  [(TransparencyGPBInt64EnumDictionary *)self enumerateKeysAndRawValuesUsingBlock:v3];
}

- (BOOL)getEnum:(int *)a3 forKey:(int64_t)a4
{
  id v6 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithLongLong:a4]];
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

- (BOOL)getRawValue:(int *)a3 forKey:(int64_t)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithLongLong:a4]];
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
    (*((void (**)(id, id, uint64_t, char *))a3 + 2))(a3, [v8 longLongValue], v9, &v10);
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
      sub_10002DBEC(autocreator, (uint64_t)self);
    }
  }
}

- (void)setRawValue:(int)a3 forKey:(int64_t)a4
{
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(void *)&a3) forKey:+[NSNumber numberWithLongLong:a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_10002DBEC(autocreator, (uint64_t)self);
  }
}

- (void)removeEnumForKey:(int64_t)a3
{
  dictionary = self->_dictionary;
  v4 = +[NSNumber numberWithLongLong:a3];

  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

- (void)setEnum:(int)a3 forKey:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if ((((uint64_t (*)(void, SEL))self->_validationFunc)(*(void *)&a3, a2) & 1) == 0) {
    +[NSException raise:NSInvalidArgumentException, @"TransparencyGPBInt64EnumDictionary: Attempt to set an unknown enum value (%d)", v5 format];
  }
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5) forKey:+[NSNumber numberWithLongLong:a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_10002DBEC(autocreator, (uint64_t)self);
  }
}

- (void)validationFunc
{
  return self->_validationFunc;
}

@end
@interface GPBUInt64BoolDictionary
- (BOOL)getBool:(BOOL *)a3 forKey:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (GPBUInt64BoolDictionary)init;
- (GPBUInt64BoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const unint64_t *)a4 count:(unint64_t)a5;
- (GPBUInt64BoolDictionary)initWithCapacity:(unint64_t)a3;
- (GPBUInt64BoolDictionary)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndBoolsUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeBoolForKey:(unint64_t)a3;
- (void)setBool:(BOOL)a3 forKey:(unint64_t)a4;
- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation GPBUInt64BoolDictionary

- (GPBUInt64BoolDictionary)init
{
  return [(GPBUInt64BoolDictionary *)self initWithBools:0 forKeys:0 count:0];
}

- (GPBUInt64BoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const unint64_t *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)GPBUInt64BoolDictionary;
  v8 = [(GPBUInt64BoolDictionary *)&v14 init];
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          dictionary = v8->_dictionary;
          unsigned int v10 = *(unsigned __int8 *)a3++;
          v11 = +[NSNumber numberWithBool:v10];
          uint64_t v12 = *a4++;
          [(NSMutableDictionary *)dictionary setObject:v11 forKey:+[NSNumber numberWithUnsignedLongLong:v12]];
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (GPBUInt64BoolDictionary)initWithDictionary:(id)a3
{
  v4 = [(GPBUInt64BoolDictionary *)self initWithBools:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (GPBUInt64BoolDictionary)initWithCapacity:(unint64_t)a3
{
  return [(GPBUInt64BoolDictionary *)self initWithBools:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDictionary.m", 5710, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator object file lineNumber description];
  }

  v3.receiver = self;
  v3.super_class = (Class)GPBUInt64BoolDictionary;
  [(GPBUInt64BoolDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[GPBUInt64BoolDictionary allocWithZone:a3];

  return [(GPBUInt64BoolDictionary *)v4 initWithDictionary:self];
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

- (void)enumerateKeysAndBoolsUsingBlock:(id)a3
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
    [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v6] ?: [dictionary objectForKeyedSubscript:v
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
        uint64_t v15 = sub_1002EE644((uint64_t)[v13 BOOLValue], 2, v7) + v14;
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
      id v16 = [v14 BOOLValue];
      int v17 = sub_1002ED0F0((unint64_t)v15, 1, v8);
      [a3 writeInt32NoTag:sub_1002EE644((uint64_t)v16, 2, v7) + v17];
      sub_1002ED304(a3, (uint64_t)v15, 1, v8);
      sub_1002EE820(a3, (uint64_t)v16, 2, v7);
      id v13 = [v11 nextObject];
    }
    while (v13);
  }
}

- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithBool:a3->var0];
  unsigned int v7 = +[NSNumber numberWithUnsignedLongLong:a4->var2];

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:v7];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002F9554;
  v3[3] = &unk_1003BA8B8;
  v3[4] = a3;
  [(GPBUInt64BoolDictionary *)self enumerateKeysAndBoolsUsingBlock:v3];
}

- (BOOL)getBool:(BOOL *)a3 forKey:(unint64_t)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithUnsignedLongLong:a4]];
  id v6 = v5;
  if (a3 && v5) {
    *a3 = [v5 BOOLValue];
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
      GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
    }
  }
}

- (void)setBool:(BOOL)a3 forKey:(unint64_t)a4
{
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3) forKey:+[NSNumber numberWithUnsignedLongLong:a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeBoolForKey:(unint64_t)a3
{
  dictionary = self->_dictionary;
  v4 = +[NSNumber numberWithUnsignedLongLong:a3];

  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

@end
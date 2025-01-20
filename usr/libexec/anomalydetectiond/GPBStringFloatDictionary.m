@interface GPBStringFloatDictionary
- (BOOL)getFloat:(float *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (GPBStringFloatDictionary)init;
- (GPBStringFloatDictionary)initWithCapacity:(unint64_t)a3;
- (GPBStringFloatDictionary)initWithDictionary:(id)a3;
- (GPBStringFloatDictionary)initWithFloats:(const float *)a3 forKeys:(id *)a4 count:(unint64_t)a5;
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
- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation GPBStringFloatDictionary

- (GPBStringFloatDictionary)init
{
  return [(GPBStringFloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
}

- (GPBStringFloatDictionary)initWithFloats:(const float *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)GPBStringFloatDictionary;
  v8 = [(GPBStringFloatDictionary *)&v15 init];
  if (v8)
  {
    v8->_dictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (a4)
    {
      if (a3 && a5)
      {
        do
        {
          if (!*a4) {
            +[NSException raise:NSInvalidArgumentException format:@"Attempting to add nil key to a Dictionary"];
          }
          dictionary = v8->_dictionary;
          int v11 = *(_DWORD *)a3++;
          LODWORD(v9) = v11;
          v12 = +[NSNumber numberWithFloat:v9];
          uint64_t v13 = (uint64_t)*a4++;
          [(NSMutableDictionary *)dictionary setObject:v12 forKey:v13];
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (GPBStringFloatDictionary)initWithDictionary:(id)a3
{
  v4 = [(GPBStringFloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (GPBStringFloatDictionary)initWithCapacity:(unint64_t)a3
{
  return [(GPBStringFloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
}

- (void)dealloc
{
  if (self->_autocreator) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"GPBDictionary.m", 9437, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator object file lineNumber description];
  }

  v3.receiver = self;
  v3.super_class = (Class)GPBStringFloatDictionary;
  [(GPBStringFloatDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[GPBStringFloatDictionary allocWithZone:a3];

  return [(GPBStringFloatDictionary *)v4 initWithDictionary:self];
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

- (void)enumerateKeysAndFloatsUsingBlock:(id)a3
{
  char v8 = 0;
  dictionary = self->_dictionary;
  id v5 = [(NSMutableDictionary *)dictionary keyEnumerator];
  do
  {
    id v6 = [v5 nextObject];
    if (!v6) {
      break;
    }
    id v7 = v6;
    [dictionary objectForKeyedSubscript:v6].floatValue;
    (*((void (**)(id, id, char *))a3 + 2))(a3, v7, &v8);
  }
  while (!v8);
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
        v14 = sub_100301794(v11, v8);
        [v13 floatValue];
        objc_super v15 = &v14[sub_1002EF05C(v7)];
        v12 += (uint64_t)&v15[GPBComputeRawVarint32SizeForInteger(v15)];
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
      [v14 floatValue];
      int v16 = v15;
      LODWORD(v14) = sub_100301794(v13, v8);
      [a3 writeInt32NoTag:sub_1002EF05C(v7) + v14];
      sub_10030195C(a3, (uint64_t)v13, v8);
      LODWORD(v17) = v16;
      sub_1002EF230(a3, v7, v17);
      id v13 = [v11 nextObject];
    }
    while (v13);
  }
}

- (void)setGPBGenericValue:(id *)a3 forGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  LODWORD(v4) = a3->var1;
  unsigned int v7 = +[NSNumber numberWithFloat:v4];
  int64_t var2 = a4->var2;

  [(NSMutableDictionary *)dictionary setObject:v7 forKey:var2];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100304418;
  v3[3] = &unk_1003BAB60;
  v3[4] = a3;
  [(GPBStringFloatDictionary *)self enumerateKeysAndFloatsUsingBlock:v3];
}

- (BOOL)getFloat:(float *)a3 forKey:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:a4];
  id v6 = v5;
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
      GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
    }
  }
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  if (!a4) {
    +[NSException raise:NSInvalidArgumentException format:@"Attempting to add nil key to a Dictionary"];
  }
  *(float *)&double v7 = a3;
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithFloat:v7] forKey:a4];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    GPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeFloatForKey:(id)a3
{
}

- (void)removeAll
{
}

@end
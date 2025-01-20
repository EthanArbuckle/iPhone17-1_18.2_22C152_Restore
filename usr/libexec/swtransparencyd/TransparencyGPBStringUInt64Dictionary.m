@interface TransparencyGPBStringUInt64Dictionary
- (BOOL)getUInt64:(unint64_t *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBStringUInt64Dictionary)init;
- (TransparencyGPBStringUInt64Dictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBStringUInt64Dictionary)initWithDictionary:(id)a3;
- (TransparencyGPBStringUInt64Dictionary)initWithUInt64s:(const unint64_t *)a3 forKeys:(id *)a4 count:(unint64_t)a5;
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
- (void)removeUInt64ForKey:(id)a3;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)setUInt64:(unint64_t)a3 forKey:(id)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBStringUInt64Dictionary

- (TransparencyGPBStringUInt64Dictionary)init
{
  return [(TransparencyGPBStringUInt64Dictionary *)self initWithUInt64s:0 forKeys:0 count:0];
}

- (TransparencyGPBStringUInt64Dictionary)initWithUInt64s:(const unint64_t *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBStringUInt64Dictionary;
  v8 = [(TransparencyGPBStringUInt64Dictionary *)&v14 init];
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
          uint64_t v10 = *a3++;
          v11 = +[NSNumber numberWithUnsignedLongLong:v10];
          uint64_t v12 = (uint64_t)*a4++;
          [(NSMutableDictionary *)dictionary setObject:v11 forKey:v12];
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBStringUInt64Dictionary)initWithDictionary:(id)a3
{
  v4 = [(TransparencyGPBStringUInt64Dictionary *)self initWithUInt64s:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TransparencyGPBStringUInt64Dictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBStringUInt64Dictionary *)self initWithUInt64s:0 forKeys:0 count:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBStringUInt64Dictionary;
  [(TransparencyGPBStringUInt64Dictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBStringUInt64Dictionary allocWithZone:a3];

  return [(TransparencyGPBStringUInt64Dictionary *)v4 initWithDictionary:self];
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

- (void)enumerateKeysAndUInt64sUsingBlock:(id)a3
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
    [dictionary objectForKeyedSubscript:v6] unsignedLongLongValue];
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
    int v7 = *(unsigned __int8 *)(*((void *)a3 + 1) + 30);
    [a3 mapKeyDataType];
    id v8 = [(NSMutableDictionary *)dictionary keyEnumerator];
    id v9 = [v8 nextObject];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = 0;
      do
      {
        id v12 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v10];
        v13 = sub_1000CA088(1, v10);
        objc_super v14 = &v13[sub_1000CEA18((unint64_t)[v12 unsignedLongLongValue], 2, v7)];
        v11 += (uint64_t)&v14[sub_1000C838C(v14)];
        id v10 = [v8 nextObject];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    return v11 + sub_1000CA594(*(_DWORD *)(*((void *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  int v7 = *(unsigned __int8 *)(*((void *)a4 + 1) + 30);
  [a4 mapKeyDataType];
  uint64_t v8 = sub_1000FA704(*(_DWORD *)(*((void *)a4 + 1) + 16), 2);
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
      id v14 = [v13 unsignedLongLongValue];
      unsigned int v15 = sub_1000CA088(1, v12);
      [a3 writeInt32NoTag:sub_1000CEA18((unint64_t)v14, 2, v7) + v15];
      [a3 writeString:1 value:v12];
      if (v7 == 4)
      {
        [a3 writeFixed64:2 value:v14];
      }
      else if (v7 == 12)
      {
        [a3 writeUInt64:2 value:v14];
      }
      id v12 = [v10 nextObject];
    }
    while (v12);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithUnsignedLongLong:a3->var2];
  int64_t var2 = a4->var2;

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:var2];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E2EE0;
  v3[3] = &unk_10013B440;
  v3[4] = a3;
  [(TransparencyGPBStringUInt64Dictionary *)self enumerateKeysAndUInt64sUsingBlock:v3];
}

- (BOOL)getUInt64:(unint64_t *)a3 forKey:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:a4];
  id v6 = v5;
  if (a3 && v5) {
    *a3 = (unint64_t)[v5 unsignedLongLongValue];
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
      sub_1000EB648(autocreator, (uint64_t)self);
    }
  }
}

- (void)setUInt64:(unint64_t)a3 forKey:(id)a4
{
  if (!a4) {
    +[NSException raise:NSInvalidArgumentException format:@"Attempting to add nil key to a Dictionary"];
  }
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithUnsignedLongLong:a3] forKey:a4];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_1000EB648(autocreator, (uint64_t)self);
  }
}

- (void)removeUInt64ForKey:(id)a3
{
}

- (void)removeAll
{
}

@end
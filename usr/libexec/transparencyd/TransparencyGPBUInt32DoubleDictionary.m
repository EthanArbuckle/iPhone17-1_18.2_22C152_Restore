@interface TransparencyGPBUInt32DoubleDictionary
- (BOOL)getDouble:(double *)a3 forKey:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBUInt32DoubleDictionary)init;
- (TransparencyGPBUInt32DoubleDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBUInt32DoubleDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBUInt32DoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndDoublesUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeDoubleForKey:(unsigned int)a3;
- (void)setDouble:(double)a3 forKey:(unsigned int)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBUInt32DoubleDictionary

- (TransparencyGPBUInt32DoubleDictionary)init
{
  return [(TransparencyGPBUInt32DoubleDictionary *)self initWithDoubles:0 forKeys:0 count:0];
}

- (TransparencyGPBUInt32DoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(const unsigned int *)a4 count:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)TransparencyGPBUInt32DoubleDictionary;
  v8 = [(TransparencyGPBUInt32DoubleDictionary *)&v13 init];
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
          double v10 = *a3++;
          v11 = +[NSNumber numberWithDouble:v10];
          LODWORD(v10) = *a4++;
          [(NSMutableDictionary *)dictionary setObject:v11 forKey:+[NSNumber numberWithUnsignedInt:LODWORD(v10)]];
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBUInt32DoubleDictionary)initWithDictionary:(id)a3
{
  v4 = [(TransparencyGPBUInt32DoubleDictionary *)self initWithDoubles:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TransparencyGPBUInt32DoubleDictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBUInt32DoubleDictionary *)self initWithDoubles:0 forKeys:0 count:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBUInt32DoubleDictionary;
  [(TransparencyGPBUInt32DoubleDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBUInt32DoubleDictionary allocWithZone:a3];

  return [(TransparencyGPBUInt32DoubleDictionary *)v4 initWithDictionary:self];
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

- (void)enumerateKeysAndDoublesUsingBlock:(id)a3
{
  char v10 = 0;
  dictionary = self->_dictionary;
  id v5 = [(NSMutableDictionary *)dictionary keyEnumerator];
  do
  {
    id v6 = [v5 nextObject];
    if (!v6) {
      break;
    }
    v7 = v6;
    id v8 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v6];
    id v9 = [v7 unsignedIntValue];
    [v8 doubleValue];
    (*((void (**)(id, id, char *))a3 + 2))(a3, v9, &v10);
  }
  while (!v10);
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
        uint64_t v13 = sub_10013EAE8([v10 unsignedIntValue], 1, v7);
        [v12 doubleValue];
        uint64_t v14 = sub_10013B118(2) + v13;
        v11 += v14 + sub_100139664(v14);
        id v10 = [v8 nextObject];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    return v11 + sub_10013B86C(*(_DWORD *)(*((void *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  int v7 = [a4 mapKeyDataType];
  uint64_t v8 = sub_10016B9DC(*(_DWORD *)(*((void *)a4 + 1) + 16), 2);
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
      id v14 = [v12 unsignedIntValue];
      [v13 doubleValue];
      double v16 = v15;
      LODWORD(v13) = sub_10013EAE8(v14, 1, v7);
      [a3 writeInt32NoTag:sub_10013B118(2) + v13];
      if (v7 == 1)
      {
        [a3 writeFixed32:1 value:v14];
      }
      else if (v7 == 11)
      {
        [a3 writeUInt32:1 value:v14];
      }
      [a3 writeDouble:2 value:v16];
      id v12 = [v10 nextObject];
    }
    while (v12);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithDouble:a3->var6];
  int v7 = +[NSNumber numberWithUnsignedInt:a4->var3];

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:v7];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001421C4;
  v3[3] = &unk_1002C2678;
  v3[4] = a3;
  [(TransparencyGPBUInt32DoubleDictionary *)self enumerateKeysAndDoublesUsingBlock:v3];
}

- (BOOL)getDouble:(double *)a3 forKey:(unsigned int)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithUnsignedInt:*(void *)&a4]];
  id v6 = v5;
  if (a3 && v5)
  {
    [v5 doubleValue];
    *(void *)a3 = v7;
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
      sub_10015C920(autocreator, (uint64_t)self);
    }
  }
}

- (void)setDouble:(double)a3 forKey:(unsigned int)a4
{
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3) forKey:+[NSNumber numberWithUnsignedInt:*(void *)&a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_10015C920(autocreator, (uint64_t)self);
  }
}

- (void)removeDoubleForKey:(unsigned int)a3
{
  dictionary = self->_dictionary;
  v4 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];

  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

@end
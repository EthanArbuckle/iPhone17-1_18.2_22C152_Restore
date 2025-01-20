@interface TransparencyGPBInt64FloatDictionary
- (BOOL)getFloat:(float *)a3 forKey:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBInt64FloatDictionary)init;
- (TransparencyGPBInt64FloatDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBInt64FloatDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBInt64FloatDictionary)initWithFloats:(const float *)a3 forKeys:(const int64_t *)a4 count:(unint64_t)a5;
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
- (void)removeFloatForKey:(int64_t)a3;
- (void)setFloat:(float)a3 forKey:(int64_t)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBInt64FloatDictionary

- (TransparencyGPBInt64FloatDictionary)init
{
  return [(TransparencyGPBInt64FloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
}

- (TransparencyGPBInt64FloatDictionary)initWithFloats:(const float *)a3 forKeys:(const int64_t *)a4 count:(unint64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)TransparencyGPBInt64FloatDictionary;
  v8 = [(TransparencyGPBInt64FloatDictionary *)&v15 init];
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
          int v11 = *(_DWORD *)a3++;
          LODWORD(v9) = v11;
          v12 = +[NSNumber numberWithFloat:v9];
          uint64_t v13 = *a4++;
          [(NSMutableDictionary *)dictionary setObject:v12 forKey:+[NSNumber numberWithLongLong:v13]];
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBInt64FloatDictionary)initWithDictionary:(id)a3
{
  v4 = [(TransparencyGPBInt64FloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TransparencyGPBInt64FloatDictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBInt64FloatDictionary *)self initWithFloats:0 forKeys:0 count:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt64FloatDictionary;
  [(TransparencyGPBInt64FloatDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBInt64FloatDictionary allocWithZone:a3];

  return [(TransparencyGPBInt64FloatDictionary *)v4 initWithDictionary:self];
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
    id v9 = [v7 longLongValue];
    [v8 floatValue];
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
        uint64_t v13 = sub_1001405DC((unint64_t)[v10 longLongValue], 1, v7);
        [v12 floatValue];
        uint64_t v14 = sub_10013B1B8(2) + v13;
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
      id v14 = [v12 longLongValue];
      [v13 floatValue];
      int v16 = v15;
      LODWORD(v13) = sub_1001405DC((unint64_t)v14, 1, v7);
      [a3 writeInt32NoTag:sub_10013B1B8(2) + v13];
      sub_10014077C(a3, (uint64_t)v14, 1, v7);
      LODWORD(v17) = v16;
      [a3 writeFloat:2 value:v17];
      id v12 = [v10 nextObject];
    }
    while (v12);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  LODWORD(v4) = a3->var1;
  int v7 = +[NSNumber numberWithFloat:v4];
  uint64_t v8 = +[NSNumber numberWithLongLong:a4->var2];

  [(NSMutableDictionary *)dictionary setObject:v7 forKey:v8];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100150BD0;
  v3[3] = &unk_1002C2A10;
  v3[4] = a3;
  [(TransparencyGPBInt64FloatDictionary *)self enumerateKeysAndFloatsUsingBlock:v3];
}

- (BOOL)getFloat:(float *)a3 forKey:(int64_t)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithLongLong:a4]];
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
      sub_10015C920(autocreator, (uint64_t)self);
    }
  }
}

- (void)setFloat:(float)a3 forKey:(int64_t)a4
{
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:") forKey:+[NSNumber numberWithLongLong:a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_10015C920(autocreator, (uint64_t)self);
  }
}

- (void)removeFloatForKey:(int64_t)a3
{
  dictionary = self->_dictionary;
  double v4 = +[NSNumber numberWithLongLong:a3];

  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

@end
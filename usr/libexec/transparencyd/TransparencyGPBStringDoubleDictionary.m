@interface TransparencyGPBStringDoubleDictionary
- (BOOL)getDouble:(double *)a3 forKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBStringDoubleDictionary)init;
- (TransparencyGPBStringDoubleDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBStringDoubleDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBStringDoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(id *)a4 count:(unint64_t)a5;
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
- (void)removeDoubleForKey:(id)a3;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBStringDoubleDictionary

- (TransparencyGPBStringDoubleDictionary)init
{
  return [(TransparencyGPBStringDoubleDictionary *)self initWithDoubles:0 forKeys:0 count:0];
}

- (TransparencyGPBStringDoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBStringDoubleDictionary;
  v8 = [(TransparencyGPBStringDoubleDictionary *)&v14 init];
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
          double v10 = *a3++;
          v11 = +[NSNumber numberWithDouble:v10];
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

- (TransparencyGPBStringDoubleDictionary)initWithDictionary:(id)a3
{
  v4 = [(TransparencyGPBStringDoubleDictionary *)self initWithDoubles:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TransparencyGPBStringDoubleDictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBStringDoubleDictionary *)self initWithDoubles:0 forKeys:0 count:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBStringDoubleDictionary;
  [(TransparencyGPBStringDoubleDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBStringDoubleDictionary allocWithZone:a3];

  return [(TransparencyGPBStringDoubleDictionary *)v4 initWithDictionary:self];
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
    [dictionary objectForKeyedSubscript:v6].doubleValue;
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
    [a3 mapKeyDataType];
    id v7 = [(NSMutableDictionary *)dictionary keyEnumerator];
    id v8 = [v7 nextObject];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = 0;
      do
      {
        id v11 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v9];
        uint64_t v12 = sub_10013B360(1, v9);
        [v11 doubleValue];
        v13 = &v12[sub_10013B118(2)];
        v10 += (uint64_t)&v13[sub_100139664(v13)];
        id v9 = [v7 nextObject];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
    }
    return v10 + sub_10013B86C(*(_DWORD *)(*((void *)a3 + 1) + 16), 15) * v6;
  }
  return result;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  [a4 mapKeyDataType];
  uint64_t v7 = sub_10016B9DC(*(_DWORD *)(*((void *)a4 + 1) + 16), 2);
  dictionary = self->_dictionary;
  id v9 = [(NSMutableDictionary *)dictionary keyEnumerator];
  id v10 = [v9 nextObject];
  if (v10)
  {
    id v11 = v10;
    do
    {
      id v12 = [(NSMutableDictionary *)dictionary objectForKeyedSubscript:v11];
      [a3 writeInt32NoTag:v7];
      [v12 doubleValue];
      double v14 = v13;
      LODWORD(v12) = sub_10013B360(1, v11);
      [a3 writeInt32NoTag:sub_10013B118(2) + v12];
      [a3 writeString:1 value:v11];
      [a3 writeDouble:2 value:v14];
      id v11 = [v9 nextObject];
    }
    while (v11);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithDouble:a3->var6];
  int64_t var2 = a4->var2;

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:var2];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001560A8;
  v3[3] = &unk_1002C2B78;
  v3[4] = a3;
  [(TransparencyGPBStringDoubleDictionary *)self enumerateKeysAndDoublesUsingBlock:v3];
}

- (BOOL)getDouble:(double *)a3 forKey:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:a4];
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

- (void)setDouble:(double)a3 forKey:(id)a4
{
  if (!a4) {
    +[NSException raise:NSInvalidArgumentException format:@"Attempting to add nil key to a Dictionary"];
  }
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithDouble:a3] forKey:a4];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_10015C920(autocreator, (uint64_t)self);
  }
}

- (void)removeDoubleForKey:(id)a3
{
}

- (void)removeAll
{
}

@end
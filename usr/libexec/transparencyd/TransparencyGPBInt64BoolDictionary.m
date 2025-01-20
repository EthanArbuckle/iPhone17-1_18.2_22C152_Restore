@interface TransparencyGPBInt64BoolDictionary
- (BOOL)getBool:(BOOL *)a3 forKey:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBInt64BoolDictionary)init;
- (TransparencyGPBInt64BoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const int64_t *)a4 count:(unint64_t)a5;
- (TransparencyGPBInt64BoolDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBInt64BoolDictionary)initWithDictionary:(id)a3;
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
- (void)removeBoolForKey:(int64_t)a3;
- (void)setBool:(BOOL)a3 forKey:(int64_t)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBInt64BoolDictionary

- (TransparencyGPBInt64BoolDictionary)init
{
  return [(TransparencyGPBInt64BoolDictionary *)self initWithBools:0 forKeys:0 count:0];
}

- (TransparencyGPBInt64BoolDictionary)initWithBools:(const BOOL *)a3 forKeys:(const int64_t *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)TransparencyGPBInt64BoolDictionary;
  v8 = [(TransparencyGPBInt64BoolDictionary *)&v14 init];
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
          [(NSMutableDictionary *)dictionary setObject:v11 forKey:+[NSNumber numberWithLongLong:v12]];
          --a5;
        }
        while (a5);
      }
    }
  }
  return v8;
}

- (TransparencyGPBInt64BoolDictionary)initWithDictionary:(id)a3
{
  v4 = [(TransparencyGPBInt64BoolDictionary *)self initWithBools:0 forKeys:0 count:0];
  v5 = v4;
  if (a3 && v4) {
    [(NSMutableDictionary *)v4->_dictionary addEntriesFromDictionary:*((void *)a3 + 2)];
  }
  return v5;
}

- (TransparencyGPBInt64BoolDictionary)initWithCapacity:(unint64_t)a3
{
  return [(TransparencyGPBInt64BoolDictionary *)self initWithBools:0 forKeys:0 count:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBInt64BoolDictionary;
  [(TransparencyGPBInt64BoolDictionary *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TransparencyGPBInt64BoolDictionary allocWithZone:a3];

  return [(TransparencyGPBInt64BoolDictionary *)v4 initWithDictionary:self];
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
    [dictionary objectForKeyedSubscript:v6] ?: [v6 longLongValue] ?: objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v6), "BOOLValue") ?: &v7;
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
        uint64_t v13 = sub_1001405DC((unint64_t)[v10 longLongValue], 1, v7);
        [v12 BOOLValue];
        uint64_t v14 = sub_10013B310(2) + v13;
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
      id v15 = [v13 BOOLValue];
      int v16 = sub_1001405DC((unint64_t)v14, 1, v7);
      [a3 writeInt32NoTag:sub_10013B310(2) + v16];
      sub_10014077C(a3, (uint64_t)v14, 1, v7);
      [a3 writeBool:2 value:v15];
      id v12 = [v10 nextObject];
    }
    while (v12);
  }
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  dictionary = self->_dictionary;
  unint64_t v6 = +[NSNumber numberWithBool:a3->var0];
  int v7 = +[NSNumber numberWithLongLong:a4->var2];

  [(NSMutableDictionary *)dictionary setObject:v6 forKey:v7];
}

- (void)enumerateForTextFormat:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100150394;
  v3[3] = &unk_1002C29E8;
  v3[4] = a3;
  [(TransparencyGPBInt64BoolDictionary *)self enumerateKeysAndBoolsUsingBlock:v3];
}

- (BOOL)getBool:(BOOL *)a3 forKey:(int64_t)a4
{
  id v5 = [(NSMutableDictionary *)self->_dictionary objectForKey:+[NSNumber numberWithLongLong:a4]];
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
      sub_10015C920(autocreator, (uint64_t)self);
    }
  }
}

- (void)setBool:(BOOL)a3 forKey:(int64_t)a4
{
  [(NSMutableDictionary *)self->_dictionary setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3) forKey:+[NSNumber numberWithLongLong:a4]];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    sub_10015C920(autocreator, (uint64_t)self);
  }
}

- (void)removeBoolForKey:(int64_t)a3
{
  dictionary = self->_dictionary;
  v4 = +[NSNumber numberWithLongLong:a3];

  [(NSMutableDictionary *)dictionary removeObjectForKey:v4];
}

- (void)removeAll
{
}

@end